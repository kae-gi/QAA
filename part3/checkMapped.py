#!/usr/bin/env python

import argparse

# global variable flags
def get_args():
    parser = argparse.ArgumentParser(description="A program for understanding mean Qscores")
    parser.add_argument("-f", "--infile", help="Specify the input file name.", type=str, required=True)
    return parser.parse_args()	
args = get_args()

mapDict = {"mapped":0, "unmapped":0}
with open(args.infile, "r") as sam:
    for line in sam:
        line = line.strip()
        # if line DOES NOT begin with ^@
        if line[0] != "@":
            line = line.split("\t")
            flag = int(line[1])
            # is primary alignment if false 
            # (make sure not counting reads as aligned >1x)
            if((flag & 256) != 256):
                # is mapped if false
                if((flag & 4) != 4):
                    mapDict["mapped"] += 1
                # is unmapped if true
                elif((flag & 4) == 4):
                    mapDict["unmapped"] += 1

print(f"Mapped: {mapDict['mapped']}\nUnmapped: {mapDict['unmapped']}")
