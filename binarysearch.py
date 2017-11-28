def search(l, num, low, high):
    if low > high:
        return 'not in the list'
    elif l == []:
        return 'empty list'
    else:
        mid = (high + low) / 2
        midnum = l[mid]
        if midnum == num:
            return "At index: {}".format(midnum)
        elif midnum > num:
            return search(l, num, low, mid - 1)
        else:
            return search(l, num, mid + 1, high)
