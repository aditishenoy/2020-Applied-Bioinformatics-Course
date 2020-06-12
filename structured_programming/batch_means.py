"""This script takes print average of values for batches"""

import sys
import argparse

def get_data(filename, data):
    with open(filename, 'r') as fname:
        for line in fname:
            four_vals = line.split(',')
            batch = four_vals[0]
            if not (batch in data):
                    data[batch] = []
                    data[batch] += [(float(four_vals[1]), float(four_vals[2]), float(four_vals[3]))]
    return data
            
def print_average(data):
    for batch, sample in data.items(): 
        if len(sample) > 0:
            average = get_average(sample)
            if average != None:
                print(batch, "\t", average)
            else:
                print(batch, "\t", "No data")

def get_average(sample):
    for (x, y, val) in sample:
        if x**2 + y**2 <= 1:
            all_sum = x+y+val
            num = len(sample)
            average = all_sum/num
            return average

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('Enter name of input file', type=str, help="")
    args = vars(parser.parse_args(sys.argv[1:]))
    filename = (args['Enter name of input file'])
    data = {}
    one_batch = get_data(filename, data)
    average_per_batch =  print_average(output)
    

if __name__ == "__main__":
    main()

