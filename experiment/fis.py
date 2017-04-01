import fim
import sys

def load_transactions(filename):
    with open(filename) as f:
        return [x.split() for x in f]


if __name__ == '__main__':
    filename = sys.argv[1]
    threshold = int (sys.argv[2])


    transactions = load_transactions(filename)
    fis = fim.apriori(transactions)

    print fis

