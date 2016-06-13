# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand
import package_file
import matplotlib.pyplot as plt
import networkx


def draw_tree():

    position = {}

    plt.figure(num=None, dpi=350)
    tree = networkx.DiGraph()
    tree.add_node("start")
    x = len(package_file.list_of_checkers)/2
    y = len(package_file.list_of_checkers)
    position["start"] = [x,y]
    for item in package_file.list_of_checkers:
        index = package_file.list_of_checkers.index(item)
        # print "index", index
        for i in range(0, 2*index):
            string_0 = str(item)+"_0"+str(i)
            string_1 = str(item)+"_1"+str(i)

            tree.add_node(string_0)
            tree.add_node(string_1)

            position[string_0] = [x+(i+1)*2, 1-index]
            position[string_1] = [x-(i+1)*2, 1-index]

    print position
    tree.add_edge("start", str(package_file.list_of_checkers[0])+"_00")
    tree.add_edge("start", str(package_file.list_of_checkers[0])+"_10")

    print tree.nodes()
    networkx.draw(tree, pos=position, with_labels=True, node_size=400, arrows=True, font_size=7, linewidths=1)
    plt.savefig("tree_format.png")
    plt.clf()
    return None
