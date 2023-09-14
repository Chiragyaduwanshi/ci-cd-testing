# This is a sample Python script.
# Granted Lambda access in 32' commit


def lambda_handler(event, context):
    # Use a breakpoint in the code line below to debug your script.
    a = event['a']
    b = event['b']
    response = {
        "statusCode": 200,
        "body": f"addition : {a} + {b} = {a+b}"
    }
    print('a + b = ', a+b)
    return response

