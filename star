#!/usr/bin/env python3

from operator import length_hint
import sys
import csv
import os


def createTable(entry):
    cols = (entry * 4) + (entry * 2) - 1
    rows = entry * 4 + 1
    map = []

    for i in range(rows):
        col = []
        for j in range(cols):
            col.append(' ')
        map.append(col)
    return map

def first_part(Table, entry):
    middle = int((entry * 2) + entry) - 1
    a = middle - 1
    b = middle + 1
    Table[0][middle] = '*'
    
    for i in range(1, (entry)):
        Table[i][a] = '*'
        Table[i][b] = '*'
        a -= 1
        b += 1


def second_part(Table, entry):
    middle = int((entry * 2) + entry) - 1
    lign1 = entry
    lign2 = int(len(Table)) - entry - 1
    col_length = len(Table[0])

    for i in range (col_length):
        if i in range(middle - (entry - 1) + 1 , middle + (entry - 1)):
            continue
        else:
            Table[lign1][i] = '*'
            Table[lign2][i] = '*'

def third_part(Table, entry):
    a = 1
    b = len(Table[0]) - 2
    count = 0

    for i in range (entry + 1, len(Table) - (entry + 1)):
        Table[i][a] = '*'
        Table[i][b] = '*'
        if (count < entry - 1):
            a += 1
            b -= 1
        else:
            a -= 1
            b += 1
        count += 1

def fourth_part(Table, entry):
    middle = int((entry * 2) + entry) - 1
    a = middle - 1
    b = middle + 1
    Table[0][middle] = '*'
    i = len(Table) - 2
    Table[i + 1][middle] = '*'
    while i > (len(Table) - 1 - entry):
        Table[i][a] = '*'
        Table[i][b] = '*'
        a -= 1
        b += 1
        i -= 1

def star_algorithm(Table, entry):
    first_part(Table, entry)
    second_part(Table, entry)
    third_part(Table, entry)
    fourth_part(Table, entry)
    return Table

def get_Line(line):
    i = len(line) - 1

    while line[i] != '*':
        i -= 1
    return (line[0:i+1])

def printing(Table):

    for i in range(len(Table)):
        line = get_Line(Table[i])
        for j in range (len(line)):
            print(line[j], end="")
        print(end="\n")

def special_case(i):
    if i == 0:
        Table = ""
    if i == 1:
        Table = "   *\n*** ***\n *   *\n*** ***\n   *\n"
    return Table

if __name__ == "__main__":
    Table = []

    if (len(sys.argv) != 2):
        exit(84)
    i = int(sys.argv[1])
    if (i == 0 or i == 1):
        ret = special_case(i)
        for i in range (len(ret)):
            print(ret[i], end="")
    else:
        Table = createTable(int(i))
        star_algorithm(Table, i)
        printing(Table)
    exit(0)