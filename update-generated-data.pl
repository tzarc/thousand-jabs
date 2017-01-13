#!/usr/bin/env perl

use strict;
use warnings;

package cfg;

use File::Basename;
use Cwd qw/abs_path/;
(our $script_path = abs_path($0)) =~ s|^(.*)(\[\/\])(.*)|$1$2|g;
our $script_dir = dirname($script_path);

our $cachetime = 86400;

package datacache;

use utf8;
use LWP::Simple;
use DBI;
use Digest::SHA1 qw(sha1 sha1_hex sha1_base64);

my $dbh = DBI->connect("dbi:SQLite:dbname=${cfg::script_dir}/datacache.sqlitedb", "", "", { RaiseError => 1 }) or die $DBI::errstr;
$dbh->do("CREATE TABLE IF NOT EXISTS cache (urlhash TEXT PRIMARY KEY, timestamp INTEGER, data TEXT)");
my $sth = $dbh->prepare("DELETE FROM cache WHERE timestamp < ?");
$sth->bind_param(1, time - ${cfg::cachetime});
$sth->execute();

sub get_url {
    my ($url)   = @_;
    my $urlhash = sha1_base64($url);
    my $sth     = $dbh->prepare("SELECT * FROM cache WHERE urlhash = ? AND timestamp > ?");
    $sth->bind_param(1, $urlhash);
    $sth->bind_param(2, time - ${cfg::cachetime});
    $sth->execute();

    my $row;
    if($row = $sth->fetchrow_hashref()) {
        $sth->finish();
        return $row->{data};
    }
    else {
        print "Getting '$url'...\n";
        $sth->finish();
        my $data = get($url);
        $sth = $dbh->prepare("INSERT OR REPLACE INTO cache (urlhash, timestamp, data) VALUES(?, ?, ?)");
        $sth->bind_param(1, $urlhash);
        $sth->bind_param(2, time);
        $sth->bind_param(3, $data);
        $sth->execute();
        $sth->finish();
        return $data;
    }
}

package simc;

our $branch    = "legion-dev";
our $directory = "${cfg::script_dir}/simc";

my $last_branch = `cd "${directory}" && git rev-parse --abbrev-ref HEAD`;
die unless (($? >> 8) == 0);
chomp $last_branch;

sub update {
    my ($requested_branch) = @_;
    $requested_branch = $requested_branch || ${simc::branch};

    if(!-d "${simc::directory}/.git") {
        system("git clone --depth=1 https://github.com/simulationcraft/simc \"${simc::directory}\"");
        die unless (($? >> 8) == 0);
    }
    else {
        system("cd \"${simc::directory}\" && git pull");
        die unless (($? >> 8) == 0);
    }

    if($requested_branch ne $last_branch) {
        system("cd \"${simc::directory}\" && git reset --hard HEAD && git clean -xfd && git checkout \"${requested_branch}\" && git pull");
        die unless (($? >> 8) == 0);
        $last_branch = `cd "${simc::directory}" && git rev-parse --abbrev-ref HEAD`;
        die unless (($? >> 8) == 0);
        die unless ($last_branch eq $requested_branch);
    }

    system("cd \"${simc::directory}/engine\" && make -j9 OS=UNIX");
    die unless (($? >> 8) == 0);
}

package generator;

use Data::Dumper;
use File::Basename;
use JSON;

my $customprofiles = {
    deathknight => ["blood"],
    monk        => ["brewmaster"],
};

my $profiles = {
    deathknight => {
        blood  => { mainhand => 128402, artifact => "15:0:0:0:0:289:1" },
        frost  => { mainhand => 128292, offhand  => 128293, artifact => "12:0:0:0:0:122:1" },
        unholy => { mainhand => 128403, artifact => "16:0:0:0:0:149:1" },
    },
    demonhunter => {
        vengeance => { mainhand => 128832, offhand => 128831, artifact => "60:0:0:0:0:1096:1" },
        havoc     => { mainhand => 127829, offhand => 127830, artifact => "3:0:0:0:0:1010:1" },
    },
    druid => {
        balance  => { mainhand => 128858, artifact => "59:0:0:0:0:1049:1" },
        feral    => { mainhand => 128860, offhand  => 128859, artifact => "58:0:0:0:0:1153:1" },
        guardian => { mainhand => 128821, offhand  => 128822, artifact => "57:0:0:0:0:960:1" },
    },
    hunter => {
        beast_mastery => { mainhand => 128861, artifact => "56:0:0:0:0:881:1" },
        marksmanship  => { mainhand => 128826, artifact => "55:0:0:0:0:307:1" },
        survival      => { mainhand => 128808, artifact => "34:0:0:0:0:1068:1" },
    },
    mage => {
        arcane => { mainhand => 127857, artifact => "4:0:0:0:0:290:1" },
        fire   => { mainhand => 128820, offhand  => 133959, artifact => "54:0:0:0:0:748:1" },
        frost  => { mainhand => 128862, artifact => "53:0:0:0:0:783:1" },
    },
    monk => {
        brewmaster => { mainhand => 128938, artifact => "52:0:0:0:0:1277:1" },
        windwalker => { mainhand => 128940, offhand  => 133948, artifact => "50:0:0:0:0:831:1" },
    },
    paladin => {
        protection  => { mainhand => 128867, offhand  => 128866, artifact => "49:0:0:0:0:1120:1" },
        retribution => { mainhand => 120978, artifact => "2:0:0:0:0:40:1" },
    },
    priest => {
        shadow => { mainhand => 128827, offhand => 133958, artifact => "47:0:0:0:0:764:1" },
    },
    rogue => {
        assassination => { mainhand => 128870, offhand => 128869, artifact => "43:0:0:0:0:346:1" },
        outlaw        => { mainhand => 128872, offhand => 134552, artifact => "44:0:0:0:0:1052:1" },
        subtlety      => { mainhand => 128476, offhand => 128479, artifact => "17:0:0:0:0:851:1" },
    },
    shaman => {
        enhancement => { mainhand => 128819, offhand => 128873, artifact => "41:0:0:0:0:899:1" },
        elemental   => { mainhand => 128935, offhand => 128936, artifact => "40:0:0:0:0:291:1" },
    },
    warlock => {
        affliction  => { mainhand => 128942, artifact => "39:0:0:0:0:999:1" },
        demonology  => { mainhand => 137246, offhand  => 128943, artifact => "37:0:0:0:0:1170:1" },
        destruction => { mainhand => 128941, artifact => "38:0:0:0:0:803:1" },
    },
    warrior => {
        arms       => { mainhand => 128910, artifact => "36:0:0:0:0:1136:1" },
        fury       => { mainhand => 128908, offhand  => 134553, artifact => "35:0:0:0:0:984:1" },
        protection => { mainhand => 128288, offhand  => 128289, artifact => "11:0:0:0:0:91:1" },
    }
};

sub create_action_lists {
    print("\nPre-creating actions files...\n");
    for my $cls (sort keys %{$profiles}) {
        my $class_lua_actions_file = "${cfg::script_dir}/ActionProfileLists/actions-${cls}.lua";
        my $bn                     = basename($class_lua_actions_file);
        print(" - ${bn}\n");
        open(my $outfile, ">", $class_lua_actions_file);
        print {$outfile} "local _, internal = ...\n";
        print {$outfile} "internal.apls = internal.apls or {}\n\n";
        close($outfile);
    }

    print("\nGenerating custom simc profile APLs:\n");
    for my $cls (sort keys %{$customprofiles}) {
        my $class_lua_actions_file = "${cfg::script_dir}/ActionProfileLists/actions-${cls}.lua";
        open(my $outfile, ">>", $class_lua_actions_file);

        for my $spec (@{ $customprofiles->{$cls} }) {
            printf("%14s / %s\n", $cls, $spec);

            print {$outfile} "internal.apls['custom::${cls}::${spec}'] = [[\n";

            my $custom_simc_file = "${cfg::script_dir}/CustomProfiles/${cls}_${spec}.simc";
            open(my $infile, "<", $custom_simc_file);
            while(<$infile>) {
                chomp $_;
                print {$outfile} "$_\n" if $_ =~ /^action/;
            }
            close($infile);

            print {$outfile} "]]\n\n";
        }

        close($outfile);
    }

    print("\nGenerating normal simc APLs:\n");
    for my $cls (sort keys %{$profiles}) {
        my $class_lua_actions_file = "${cfg::script_dir}/ActionProfileLists/actions-${cls}.lua";
        open(my $outfile, ">>", $class_lua_actions_file);

        for my $spec (sort keys %{ $profiles->{$cls} }) {
            printf("%14s / %s\n", $cls, $spec);

            print {$outfile} "internal.apls['${simc::branch}::${cls}::${spec}'] = [[\n";

            my $prefix_simc_file = "${cfg::script_dir}/ActionProfilePrefix/${cls}_${spec}.simc";
            if(-f $prefix_simc_file) {
                open(my $infile, "<", $prefix_simc_file);
                while(<$infile>) {
                    chomp $_;
                    print {$outfile} "$_\n" if $_ =~ /^(--|action)/;
                }
                close($infile);
            }

            my $specdata = $profiles->{$cls}->{$spec};

            my $mainhand = $specdata->{mainhand} || "";
            $mainhand = "main_hand=,id=${mainhand}" if $mainhand ne "";
            my $offhand = $specdata->{offhand} || "";
            $offhand = "off_hand=,id=${offhand}" if $offhand ne "";
            my $artifact = $specdata->{artifact} || "";
            $artifact = "artifact=${artifact}" if $artifact ne "";

            my $new_simc_file = "${cfg::script_dir}/Temp/${simc::branch}-${cls}_${spec}.simc";
            my $simc_cmd      = "\"${simc::directory}/engine/simc\" ${cls}=${cls}_${spec} default_actions=1 level=110 spec=${spec} ${mainhand} ${offhand} ${artifact} \"save=${new_simc_file}\"";
            system("{ $simc_cmd ;} >/dev/null 2>&1");
            die unless (($? >> 8) == 0);

            open(my $infile, "<", $new_simc_file);
            while(<$infile>) {
                chomp $_;
                print {$outfile} "$_\n" if $_ =~ /^action/;
            }
            close($infile);

            my $suffix_simc_file = "${cfg::script_dir}/ActionProfileSuffix/${cls}_${spec}.simc";
            if(-f $suffix_simc_file) {
                open(my $infile, "<", $suffix_simc_file);
                while(<$infile>) {
                    chomp $_;
                    print {$outfile} "$_\n" if $_ =~ /^(--|action)/;
                }
                close($infile);
            }

            print {$outfile} "]]\n\n";
        }

        close($outfile);
    }
}

sub validate_actions_files {
    my ($searchpattern) = @_;

    print("\nValidating action files:\n");
    my @files = <"$searchpattern">;
    for my $file (sort @files) {
        my $bn = basename($file);
        print(" - ${bn}\n");
        system("lua '${cfg::script_dir}/Simc-Expressions.lua' < '${file}' > '${cfg::script_dir}/Temp/${bn}.parsed' 2> '${cfg::script_dir}/Temp/${bn}.errors'");
        die unless (($? >> 8) == 0);
        unlink("${cfg::script_dir}/Temp/${bn}.errors") if -z "${cfg::script_dir}/Temp/${bn}.errors";
        if(-f "${cfg::script_dir}/Temp/${bn}.errors") {
            system("cat '${cfg::script_dir}/Temp/${bn}.errors'");
            print("\n\nError parsing file '${file}'.");
            exit(1);
        }
    }
}

sub create_equipped_mapping {
    print("\nGenerating equipped item mapping:\n");
    my $equipped_file = "${cfg::script_dir}/ActionProfileLists/equipped.lua";
    open(my $outfile, ">", $equipped_file);
    print {$outfile} "local _, internal = ...\n";
    print {$outfile} "internal.equipped_mapping = internal.equipped_mapping or {}\n\n";

    my @files = <"${cfg::script_dir}/ActionProfileLists/actions-*.lua">;
    my %items;
    for my $file (sort @files) {
        open(my $infile, "<", $file);
        while(<$infile>) {
            chomp $_;
            while($_ =~ m/equipped\.([a-zA-Z][[:alnum:]_]*)/g) {
                $items{$1} = 1;
            }
        }
        close($infile);
    }

    for my $item (sort keys %items) {
        print(" - Item: '${item}'\n");
        my $urlitem = $item;
        $urlitem =~ s/_/+/g;
        my $url  = "http://www.wowhead.com/items/name:${urlitem}/slot:16:18:5:8:11:10:1:23:7:21:2:22:13:24:15:28:14:4:3:19:25:12:17:6:9";
        my $data = datacache::get_url($url);

        my %itemids;
        while($data =~ m/_\[(\d+)\]/g) {
            $itemids{$1} = 1;
        }

        print {$outfile} "internal.equipped_mapping.${item} = { ";
        for my $itemid (sort keys %itemids) {
            print "       ID: $itemid\n";
            print {$outfile} "$itemid, ";
        }
        print {$outfile} "}\n";
    }

    close($outfile);
}

sub create_itemset_bonuses {
    print("\nGenerating set bonus listing:\n");
    my $setbonus_file = "${cfg::script_dir}/ActionProfileLists/itemsets.lua";
    open(my $outfile, ">", $setbonus_file);
    print {$outfile} "local _, internal = ...\n";
    print {$outfile} "internal.itemsets = internal.itemsets or {}\n\n";

    open(my $infile, "<", "${simc::directory}/dbc_extract3/dbc/generator.py");
    my $mode = 0;
    my $text = "";
    while(<$infile>) {
        chomp $_;
        next if $_ =~ /^\s*#/;
        $_ =~ s/#.*//g;
        $_ =~ s/'/"/g;
        if($mode == 0 && $_ =~ /\s*set_bonus_map/) {
            $mode = 1;
            $text .= "[\n";
        }
        elsif ($mode == 1 && $_ ne "") {
            $text .= $_ . "\n";
        }
        elsif ($mode == 1) {
            $mode = 2;
        }
    }

    # Fixup trailing commas before container terminators
    $text =~ s/,([\s\r\n]*[\}\]])/$1/gi;

    my $bonuses = from_json($text);
    for my $bonus (sort { $a->{name} cmp $b->{name} } @{$bonuses}) {
        print " - $bonus->{name}\n";

        print {$outfile} "internal.itemsets.$bonus->{name} = { ";

        for my $itemset (sort @{ $bonus->{bonuses} }) {
            my $url  = "http://www.wowhead.com/item-set=${itemset}";
            my $data = datacache::get_url($url);
            my %items;
            while($data =~ m/g_items\.add\((\d+)/g) {
                $items{$1} = 1;
            }
            for my $itemid (sort keys %items) {
                print {$outfile} "${itemid}, ";
            }
        }

        print {$outfile} "}\n";
    }

    close($outfile);
}

sub create_xml_wrapper {
    my ($searchdir) = @_;

    my $bn = basename($searchdir);
    print("\nGenerating '${bn}/all.xml'\n");
    open(my $out, ">", "${searchdir}/all.xml");
    print {$out} "<Ui xmlns=\"http://www.blizzard.com/wow/ui/\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.blizzard.com/wow/ui/\n";
    print {$out} "..\\FrameXML\\UI.xsd\">\n";

    my @files = <"${searchdir}/*.lua">;
    for my $file (sort @files) {
        $bn = basename($file);
        print(" - ${bn}\n");
        print {$out} "    <Script file=\"${bn}\"/>\n";
    }

    print {$out} "</Ui>\n";
    close($out);
}

package main;

simc::update();
generator::create_action_lists();
generator::create_equipped_mapping();
generator::create_itemset_bonuses();
generator::create_xml_wrapper("${cfg::script_dir}/ActionProfileLists");
generator::create_xml_wrapper("${cfg::script_dir}/Classes");
generator::validate_actions_files("${cfg::script_dir}/Temp/*.simc");
generator::validate_actions_files("${cfg::script_dir}/ActionProfileLists/actions-*.lua");
