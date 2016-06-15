__author__ = 'siavoosh'
import random
import itertools
import package_file

def gen_dummy_dict():
    new_dict = {}
    list_of_items =[]
    for i in range(1, package_file.number_of_checkers+1):
      list_of_items.append(i)

    for i in range(1, len(list_of_items)+1):
        all_items = list(itertools.combinations(list_of_items, i))

        for item in all_items:
            name_string = ""
            list_for_string = []
            for checker in item:
                list_for_string.append(str(checker))
            list_for_string = sorted(list_for_string)
            for k in sorted(list_for_string):
                name_string += str(k)+"_"
            name_string = name_string[:len(name_string)-1]
            # print name_string
            new_dict[name_string] = [random.randint(10, 100), random.randint(50, 80)]
    return new_dict