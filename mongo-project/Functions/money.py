def moneyRaise(value):
    dicc_coin = {'CAD': 1.3124497992,'RUB': 63.7561301828, 'EUR': 0.8916629514, 'GBP': 0.7991529202}
    values_money = {'K':1000, 'M':1000000, 'B': 100000000000}
    value_number = float(re.search('[+-]?([0-9]*[.])?[0-9]+', value)[0])
    if value.endswith('B'):
        exchange = value_number*(values_money['B'])
    elif value.endswith('K[k]'):
        exchange = value_number*(values_money['K'])
    elif value.endswith('M'):
        exchange = value_number*(values_money['M'])
    elif value.startswith("C"):
        exchange =  value_number*(dicc_coin['CAD'])
    elif value.startswith("$"):
        exchange =  value_number
    elif value.startswith("€"):
        exchange = value_number*(dicc_coin['EUR'])
    elif value.startswith("£"):
        exchange = value_number*(dicc_coin['GBP'])
    elif value.startswith("r"):
        exchange = value_number*(dicc_coin['RUB'])
    else:
        exchange = value_number
    return int(exchange)