def load_transactions(filename):
    """
    Splits a .dat file into the format that fim can read
    """
    list(load_transactions_stream(filename))

def load_transactions_stream(filename):
    """
    returns a stream of transactions
    """
    with open(filename) as f:
        for x in f:
            yield x.split()

