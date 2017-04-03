from math import log, sqrt

import random

from data import load_transactions
from fim import apriori



def lower_by(n, mu):
    """
    Calculates how much we should lower the threshold
    for Toivonen sampling
    """
    return sqrt((1.0/(2.0*n))*(1.0/mu))

def calulcate_bound(epsilon, delta):
    """
    Hoeffding bound
    """
    return (1.0 / (2*epsilon*epsilon)) * log ( 2.0 / delta)


def generate_negative_border(items, transactions):
    result = []
    candidates = []
    while True:
        if not candidates:
            candidates = generate_singletons_pair(transactions)
        if len(items) < len(candidates[0]):
            break
        for candidate in candidates:
            pos = len(candidates) - 1
            if candidates not in items[pos]:
                result.append(candidates)
        frequent_candidates = frequent_items[len(candidates[0]) - 1]
        candidates = generate_pairs(frequent_candidates, transactions, len(frequent_candidates[0]) + 1)


def pass_one(transactions, support, epsilon, delta, mu):
    result = []
    n = calculate_bound(epsilon, delta)
    adjusted_support = support - lower_by(n, mu)

    sampled_transactions = random.sample(transactions, n) 

    # TODO why?
    result.append(len(sampled_transactions)*1./len(transactions))

    frequent_items =\
        [x[0] for x in\
                apriori(sampled_transactions, supp=adjusted_support*100)]

    result.append(frequent_items)

    negative_border_items = generate_negative_border(frequent_items, sampled_transactions)
        
