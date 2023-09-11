# This is a sample Python script.
#yes


def handler(handler_event):
    # Use a breakpoint in the code line below to debug your script.
    a = handler_event['a']
    b = handler_event['b']
    print(a + b)


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    event = {
        'a': 2,
        'b': 3
    }
    handler(event)

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
