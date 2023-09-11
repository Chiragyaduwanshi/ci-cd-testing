# This is a sample Python script.
# Granted Lambda access in sixteenth commit


def handler(handler_event):
    # Use a breakpoint in the code line below to debug your script.
    a = handler_event['a']
    b = handler_event['b']
    response = {
        "statusCode": 200,
        "body": f"addition : {a} + {b} = {a+b}"
    }
    print('a + b = ', a+b)
    return response


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    event = {
        'a': 2,
        'b': 3
    }
    handler(event)

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
