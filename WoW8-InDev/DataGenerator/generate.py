#!/usr/bin/env python3

import re
import csv
import argparse


def determine_column_type(rows, column_name):
    any_text_regex = re.compile(r"[^\-0-9\.]")
    period_regex = re.compile(r"[\.]")
    period_found = False

    header = True

    for row in rows:
        if header:
            header = False
            continue

        stripped = row[column_name].strip()
        if any_text_regex.match(stripped) is not None:
            return "string"
        if stripped.find('.') >= 0:
            period_found = True

    if period_found:
        return "real"
    return "int"


def convert():
    print("Importing '%s' => '%s'" % (args.input, args.output))
    newline_replacement = '<<<newline>>>'
    rows = []
    with open(args.input, newline='') as csvfile:
        data = csvfile.read().replace('\r\n', newline_replacement)
        row_strings = data.split('\n')
        data_reader = csv.DictReader(row_strings, delimiter='\x1F', quotechar='"')

        for row in data_reader:
            for k, v in row.items():
                row[k] = v.replace(newline_replacement, "\r\n")
            rows.append(row)

    for key in rows[0].keys():
        print("%40s: %s" % (key, determine_column_type(rows, key)))


def main():
    global args
    parser = argparse.ArgumentParser(description='SQLite database generator from CSV files')
    parser.add_argument('-i', '--input', type=str, required=True, help="The path to the input CSV file")
    parser.add_argument('-o', '--output', type=str, required=True, help="The path to the output database")
    args, unknown = parser.parse_known_args()

    convert()


if __name__ == "__main__":
    main()
