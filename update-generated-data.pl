#!/usr/bin/env perl

use strict;
use warnings;

package cfg;

use File::Basename;
use Cwd qw/abs_path/;
(our $script_path = abs_path($0)) =~ s|^(.*)(\[\/\])(.*)|$1$2|g;
our $script_dir = dirname($script_path);
mkdir("$script_dir/Temp") if !-d "$script_dir/Temp";

our $cachetime = 86400;
our $verbose   = 0;
${cfg::verbose} = 1 if(scalar(@ARGV) > 0 && $ARGV[0] eq "-v");

package common;

use Carp qw(confess);

sub header {
    my ($txt) = @_;
    print("\n\n\e[1;33m$txt\e[0m\n");
}

sub exec {
    my ($cmd, $getoutput, $allowfail) = @_;
    $getoutput = $getoutput || 0;
    $allowfail = $allowfail || 0;

    if(${cfg::verbose} == 1) {
        print("\e[1;30m \$ $cmd\e[0m\n");
    }

    if($getoutput == 0) {
        system($cmd);
        if($allowfail == 0) {
            confess("Non-zero exit code.") unless (($? >> 8) == 0);
        }
        return;
    }

    my $output = `$cmd`;
    if($allowfail == 0) {
        confess("Non-zero exit code.") unless (($? >> 8) == 0);
    }
    return $output;
}

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
        print("\e[1;30mGetting '$url'\n\e[0m");
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

my $last_branch = "";
if(-d ${directory}) {
    common::header("Getting current branch:");
    $last_branch = common::exec("cd '${directory}' && git rev-parse --abbrev-ref HEAD", 1);
    chomp $last_branch;
    print(" - ${last_branch}");
}

sub update {
    my ($requested_branch) = @_;
    $requested_branch = $requested_branch || ${simc::branch};

    common::header("Updating simulationcraft:");

    my $cloned = 0;
    if(!-d "${simc::directory}/.git") {
        common::exec("git clone --depth=1 https://github.com/simulationcraft/simc '${simc::directory}'");
        $cloned = 1;
    }
    else {
        common::exec("cd '${simc::directory}' && git pull");
    }

    if($requested_branch ne $last_branch) {
        common::exec("cd '${simc::directory}' && git reset --hard HEAD && git clean -xfd && git checkout '${requested_branch}' && git pull");
        $last_branch = common::exec("cd '${simc::directory}' && git rev-parse --abbrev-ref HEAD", 1);
        die unless (($cloned == 1) || ($last_branch eq $requested_branch));
    }

    common::exec("cd '${simc::directory}/engine' && make -j9 OS=UNIX");
}

package generator;

use File::Basename;
use Path::Class;
use JSON;

# Exported by /tj _est
my $exportedSpecData = {
    DeathKnight => {
        classID => 6,
        name    => 'Death Knight',
        specs   => {
            blood  => { specID => 1, name => "Blood" },
            frost  => { specID => 2, name => "Frost" },
            unholy => { specID => 3, name => "Unholy" }
        }
    },
    DemonHunter => {
        classID => 12,
        name    => 'Demon Hunter',
        specs   => {
            havoc     => { specID => 1, name => "Havoc" },
            vengeance => { specID => 2, name => "Vengeance" }
        }
    },
    Druid => {
        classID => 11,
        name    => 'Druid',
        specs   => {
            balance     => { specID => 1, name => "Balance" },
            feral       => { specID => 2, name => "Feral" },
            guardian    => { specID => 3, name => "Guardian" },
            restoration => { specID => 4, name => "Restoration" }
        }
    },
    Hunter => {
        classID => 3,
        name    => 'Hunter',
        specs   => {
            beast_mastery => { specID => 1, name => "Beast Mastery" },
            marksmanship  => { specID => 2, name => "Marksmanship" },
            survival      => { specID => 3, name => "Survival" }
        }
    },
    Mage => {
        classID => 8,
        name    => 'Mage',
        specs   => {
            arcane => { specID => 1, name => "Arcane" },
            fire   => { specID => 2, name => "Fire" },
            frost  => { specID => 3, name => "Frost" }
        }
    },
    Monk => {
        classID => 10,
        name    => 'Monk',
        specs   => {
            brewmaster => { specID => 1, name => "Brewmaster" },
            mistweaver => { specID => 2, name => "Mistweaver" },
            windwalker => { specID => 3, name => "Windwalker" }
        }
    },
    Paladin => {
        classID => 2,
        name    => 'Paladin',
        specs   => {
            holy        => { specID => 1, name => "Holy" },
            protection  => { specID => 2, name => "Protection" },
            retribution => { specID => 3, name => "Retribution" }
        }
    },
    Priest => {
        classID => 5,
        name    => 'Priest',
        specs   => {
            discipline => { specID => 1, name => "Discipline" },
            holy       => { specID => 2, name => "Holy" },
            shadow     => { specID => 3, name => "Shadow" }
        }
    },
    Rogue => {
        classID => 4,
        name    => 'Rogue',
        specs   => {
            assassination => { specID => 1, name => "Assassination" },
            outlaw        => { specID => 2, name => "Outlaw" },
            subtlety      => { specID => 3, name => "Subtlety" }
        }
    },
    Shaman => {
        classID => 7,
        name    => 'Shaman',
        specs   => {
            elemental   => { specID => 1, name => "Elemental" },
            enhancement => { specID => 2, name => "Enhancement" },
            restoration => { specID => 3, name => "Restoration" }
        }
    },
    Warlock => {
        classID => 9,
        name    => 'Warlock',
        specs   => {
            affliction  => { specID => 1, name => "Affliction" },
            demonology  => { specID => 2, name => "Demonology" },
            destruction => { specID => 3, name => "Destruction" }
        }
    },
    Warrior => {
        classID => 1,
        name    => 'Warrior',
        specs   => {
            arms       => { specID => 1, name => "Arms" },
            fury       => { specID => 2, name => "Fury" },
            protection => { specID => 3, name => "Protection" }
        }
    }
};

my $customprofiles = {
    DeathKnight => ["blood"],
    Monk        => ["brewmaster"],
};

my $profiles = {
    DeathKnight => {
        blood  => { mainhand => 128402, artifact => "15:0:0:0:0:289:1" },
        frost  => { mainhand => 128292, offhand  => 128293, artifact => "12:0:0:0:0:122:1" },
        unholy => { mainhand => 128403, artifact => "16:0:0:0:0:149:1" },
    },
    DemonHunter => {
        vengeance => { mainhand => 128832, offhand => 128831, artifact => "60:0:0:0:0:1096:1" },
        havoc     => { mainhand => 127829, offhand => 127830, artifact => "3:0:0:0:0:1010:1" },
    },
    Druid => {
        balance  => { mainhand => 128858, artifact => "59:0:0:0:0:1049:1" },
        feral    => { mainhand => 128860, offhand  => 128859, artifact => "58:0:0:0:0:1153:1" },
        guardian => { mainhand => 128821, offhand  => 128822, artifact => "57:0:0:0:0:960:1" },
    },
    Hunter => {
        beast_mastery => { mainhand => 128861, artifact => "56:0:0:0:0:881:1" },
        marksmanship  => { mainhand => 128826, artifact => "55:0:0:0:0:307:1" },
        survival      => { mainhand => 128808, artifact => "34:0:0:0:0:1068:1" },
    },
    Mage => {
        arcane => { mainhand => 127857, artifact => "4:0:0:0:0:290:1" },
        fire   => { mainhand => 128820, offhand  => 133959, artifact => "54:0:0:0:0:748:1" },
        frost  => { mainhand => 128862, artifact => "53:0:0:0:0:783:1" },
    },
    Monk => {
        brewmaster => { mainhand => 128938, artifact => "52:0:0:0:0:1277:1" },
        windwalker => { mainhand => 128940, offhand  => 133948, artifact => "50:0:0:0:0:831:1" },
    },
    Paladin => {
        protection  => { mainhand => 128867, offhand  => 128866, artifact => "49:0:0:0:0:1120:1" },
        retribution => { mainhand => 120978, artifact => "2:0:0:0:0:40:1" },
    },
    Priest => {
        shadow => { mainhand => 128827, offhand => 133958, artifact => "47:0:0:0:0:764:1" },
    },
    Rogue => {
        assassination => { mainhand => 128870, offhand => 128869, artifact => "43:0:0:0:0:346:1" },
        outlaw        => { mainhand => 128872, offhand => 134552, artifact => "44:0:0:0:0:1052:1" },
        subtlety      => { mainhand => 128476, offhand => 128479, artifact => "17:0:0:0:0:851:1" },
    },
    Shaman => {
        enhancement => { mainhand => 128819, offhand => 128873, artifact => "41:0:0:0:0:899:1" },
        elemental   => { mainhand => 128935, offhand => 128936, artifact => "40:0:0:0:0:291:1" },
    },
    Warlock => {
        affliction  => { mainhand => 128942, artifact => "39:0:0:0:0:999:1" },
        demonology  => { mainhand => 137246, offhand  => 128943, artifact => "37:0:0:0:0:1170:1" },
        destruction => { mainhand => 128941, artifact => "38:0:0:0:0:803:1" },
    },
    Warrior => {
        arms       => { mainhand => 128910, artifact => "36:0:0:0:0:1136:1" },
        fury       => { mainhand => 128908, offhand  => 134553, artifact => "35:0:0:0:0:984:1" },
        protection => { mainhand => 128288, offhand  => 128289, artifact => "11:0:0:0:0:91:1" },
    }
};

sub create_action_lists {
    common::header("Pre-creating actions files:");
    for my $cls (sort keys %{$profiles}) {
        my $classID                = $exportedSpecData->{$cls}->{classID};
        my $ucls                   = uc $cls;
        my $class_lua_actions_file = "${cfg::script_dir}/ThousandJabs/Class_${cls}/Generated-Actions.lua";
        my $bn                     = basename($class_lua_actions_file);
        print(" - ${bn}\n");
        open(my $outfile, ">", $class_lua_actions_file);
        print {$outfile} "if select(3, UnitClass('player')) ~= ${classID} then return end\n\n";
        print {$outfile} "local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')\n\n";
        close($outfile);
    }

    common::header("Generating custom simc profile APLs:");
    for my $cls (sort keys %{$customprofiles}) {
        my $classID                = $exportedSpecData->{$cls}->{classID};
        my $className              = $exportedSpecData->{$cls}->{name};
        my $lcls                   = lc $cls;
        my $class_lua_actions_file = "${cfg::script_dir}/ThousandJabs/Class_${cls}/Generated-Actions.lua";
        open(my $outfile, ">>", $class_lua_actions_file);

        for my $spec (@{ $customprofiles->{$cls} }) {
            my $specID   = $exportedSpecData->{$cls}->{specs}->{$spec}->{specID};
            my $specName = $exportedSpecData->{$cls}->{specs}->{$spec}->{name};
            printf("%14s / %-20s (%2d-%d)\n", $lcls, $spec, $classID, $specID);

            print {$outfile} "TJ:RegisterActionProfileList('custom::${lcls}::${spec}', 'Custom ${className} Profile: ${specName}', ${classID}, ${specID}, [[\n";

            my $custom_simc_file = "${cfg::script_dir}/Support/CustomProfiles/${lcls}_${spec}.simc";
            open(my $infile, "<", $custom_simc_file);
            while(<$infile>) {
                chomp $_;
                print {$outfile} "$_\n" if $_ =~ /^action/;
            }
            close($infile);

            print {$outfile} "]])\n\n";
        }

        close($outfile);
    }

    common::header("Generating normal simc APLs:");
    for my $cls (sort keys %{$profiles}) {
        my $classID                = $exportedSpecData->{$cls}->{classID};
        my $className              = $exportedSpecData->{$cls}->{name};
        my $lcls                   = lc $cls;
        my $class_lua_actions_file = "${cfg::script_dir}/ThousandJabs/Class_${cls}/Generated-Actions.lua";
        open(my $outfile, ">>", $class_lua_actions_file);

        for my $spec (sort keys %{ $profiles->{$cls} }) {
            my $specID   = $exportedSpecData->{$cls}->{specs}->{$spec}->{specID};
            my $specName = $exportedSpecData->{$cls}->{specs}->{$spec}->{name};
            printf("%14s / %-20s (%2d-%d)\n", $lcls, $spec, $classID, $specID);

            print {$outfile} "TJ:RegisterActionProfileList('simc::${lcls}::${spec}', 'Simulationcraft ${className} Profile: ${specName}', ${classID}, ${specID}, [[\n";

            my $prefix_simc_file = "${cfg::script_dir}/Support/ActionProfilePrefix/${lcls}_${spec}.simc";
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

            my $new_simc_file = "${cfg::script_dir}/Temp/${simc::branch}-${lcls}_${spec}.simc";
            my $simc_cmd      = "'${simc::directory}/engine/simc' ${lcls}=${lcls}_${spec} default_actions=1 level=110 spec=${spec} ${mainhand} ${offhand} ${artifact} 'save=${new_simc_file}'";
            common::exec("{ $simc_cmd ;} >/dev/null 2>&1", undef, 1);

            open(my $infile, "<", $new_simc_file);
            while(<$infile>) {
                chomp $_;
                print {$outfile} "$_\n" if $_ =~ /^action/;
            }
            close($infile);

            my $suffix_simc_file = "${cfg::script_dir}/Support/ActionProfileSuffix/${lcls}_${spec}.simc";
            if(-f $suffix_simc_file) {
                open(my $infile, "<", $suffix_simc_file);
                while(<$infile>) {
                    chomp $_;
                    print {$outfile} "$_\n" if $_ =~ /^(--|action)/;
                }
                close($infile);
            }

            print {$outfile} "]])\n\n";
        }

        close($outfile);
    }
}

sub validate_actions_files {
    my ($searchpattern) = @_;

    common::header("Validating action files:");
    my @files = <"$searchpattern">;
    for my $file (sort @files) {
        my $bn = basename($file);
        my $dn = basename(dirname($file));
        my $tn = $file;
        $tn =~ s/\//_/g;
        print(" - ${dn}/${bn}\n");
        common::exec("{ cd '${cfg::script_dir}/ThousandJabs/' && lua Simc-Expressions.lua < '${file}' > '${cfg::script_dir}/Temp/${tn}.parsed' 2> '${cfg::script_dir}/Temp/${tn}.errors' ;}");
        unlink("${cfg::script_dir}/Temp/${tn}.errors") if -z "${cfg::script_dir}/Temp/${tn}.errors";
        if(-f "${cfg::script_dir}/Temp/${tn}.errors") {
            common::exec("cat '${cfg::script_dir}/Temp/${tn}.errors'");
            print("\n\nError parsing file '${file}'.");
            exit(1);
        }
    }
}

sub create_equipped_mapping {
    common::header("Generating equipped item mapping:");
    my $equipped_file = "${cfg::script_dir}/ThousandJabs/Generated-EquippedItems.lua";
    open(my $outfile, ">", $equipped_file);
    print {$outfile} "local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')\n";
    print {$outfile} "local Core = TJ:GetModule('Core')\n";
    print {$outfile} "TJ.Generated = TJ.Generated or {}\n";
    print {$outfile} "TJ.Generated.EquippedMapping = TJ.Generated.EquippedMapping or {}\n\n";

    my @files = <"${cfg::script_dir}/ThousandJabs/Class_*/Generated-Actions.lua">;
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
        my $url  = "http://ptr.wowhead.com/items/name:${urlitem}/slot:16:18:5:8:11:10:1:23:7:21:2:22:13:24:15:28:14:4:3:19:25:12:17:6:9";
        my $data = datacache::get_url($url);

        my %itemids;
        while($data =~ m/_\[(\d+)\]/g) {
            $itemids{$1} = 1;
        }

        print {$outfile} "TJ.Generated.EquippedMapping.${item} = { ";
        for my $itemid (sort keys %itemids) {
            print "       ID: $itemid\n";
            print {$outfile} "$itemid, ";
        }
        print {$outfile} "}\n";
    }

    close($outfile);
}

sub create_itemset_bonuses {
    common::header("Generating set bonus listing:");
    my $setbonus_file = "${cfg::script_dir}/ThousandJabs/Generated-ItemSets.lua";
    open(my $outfile, ">", $setbonus_file);
    print {$outfile} "local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')\n";
    print {$outfile} "local Core = TJ:GetModule('Core')\n";
    print {$outfile} "TJ.Generated = TJ.Generated or {}\n";
    print {$outfile} "TJ.Generated.ItemSets = TJ.Generated.ItemSets or {}\n\n";

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

        print {$outfile} "TJ.Generated.ItemSets.$bonus->{name} = {\n   ";

        my %items;
        for my $itemset (sort @{ $bonus->{bonuses} }) {
            my $url  = "http://ptr.wowhead.com/item-set=${itemset}";
            my $data = datacache::get_url($url);
            while($data =~ m/g_items\.add\((\d+)/g) {
                $items{$1} = 1;
            }
        }

        my $ctr = 1;
        for my $itemid (sort keys %items) {
            print {$outfile} " ${itemid},";
            if($ctr == 10) {
                $ctr = 0;
                print {$outfile} "\n   ";
            }
            $ctr++;
        }

        print {$outfile} "\n}\n\n";
    }

    close($outfile);
}

sub create_xml_wrapper {
    my ($outfilename, $searchpattern) = @_;

    common::header("Generating '${outfilename}'");
    open(my $out, ">", $outfilename);
    print {$out} "<Ui xmlns=\"http://www.blizzard.com/wow/ui/\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.blizzard.com/wow/ui/\n";
    print {$out} "..\\FrameXML\\UI.xsd\">\n";

    my @files = <"${searchpattern}">;
    for my $file (sort @files) {
        my $af = file($file);
        my $bn = $af->relative(dirname($outfilename));
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
generator::validate_actions_files("${cfg::script_dir}/Temp/*.simc");
generator::validate_actions_files("${cfg::script_dir}/ThousandJabs/Class_*/Generated-Actions.lua");
generator::create_xml_wrapper("${cfg::script_dir}/ThousandJabs/Generated-Actions.xml",  "${cfg::script_dir}/ThousandJabs/Class_*/Generated-Actions.lua");
generator::create_xml_wrapper("${cfg::script_dir}/ThousandJabs/Generated-Profiles.xml", "${cfg::script_dir}/ThousandJabs/Class_*/Profile*.lua");
