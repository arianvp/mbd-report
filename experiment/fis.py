import fim
import sys

from data import load_transactions

if __name__ == '__main__':
    filename = sys.argv[1]
    threshold = int (sys.argv[2])


    transactions = load_transactions(filename)
    fis = fim.apriori(transactions)

    print fis

