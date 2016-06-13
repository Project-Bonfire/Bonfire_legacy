# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand
import package_file
import matplotlib.pyplot as plt
import networkx


def draw_tree():

    position = {}
    labels={}

    plt.figure()
    tree = networkx.DiGraph()
    tree.add_node("start")
    x = len(package_file.list_of_checkers)/2
    y = len(package_file.list_of_checkers)/2
    position["start"] = [x,y]
    labels["start"] = "start"
    for item in package_file.list_of_checkers:
        index = package_file.list_of_checkers.index(item)

        for i in range(0, 2**(index)):
                string_0 = str(item)+"_0"+str(i)
                string_1 = str(item)+"_1"+str(i)
                tree.add_node(string_0)
                tree.add_node(string_1)
                labels[string_0] = item
                labels[string_1] = item
                position[string_0] = [x  + (i+1)*4, y-index-1]
                position[string_1] = [x  - (i+1)*4, y-index-1]


    for item in package_file.list_of_checkers:
        index = package_file.list_of_checkers.index(item)

        for i in range(0, 2**(index)):
                string_0 = str(item)+"_0"+str(i)
                string_1 = str(item)+"_1"+str(i)
                if index+1< len(package_file.list_of_checkers):
                    tree.add_edge(string_0,  str(package_file.list_of_checkers[index+1])+"_0"+str(2*i))
                    tree.add_edge(string_0,  str(package_file.list_of_checkers[index+1])+"_0"+str(2*i+1))
                if index+1< len(package_file.list_of_checkers):
                    tree.add_edge(string_1,  str(package_file.list_of_checkers[index+1])+"_1"+str(2*i))
                    tree.add_edge(string_1,  str(package_file.list_of_checkers[index+1])+"_1"+str(2*i+1))

    tree.add_edge("start", str(package_file.list_of_checkers[0])+"_0"+str(0))
    tree.add_edge("start", str(package_file.list_of_checkers[0])+"_1"+str(0))

    networkx.draw(tree, pos=position, with_labels=False, node_size=100, arrows=True, font_size=7, linewidths=1)
    networkx.nx.draw_networkx_labels(tree,pos=position,labels=labels ,font_size=8)
    plt.savefig("tree_format.png")
    plt.clf()
    return None
