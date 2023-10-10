
#Trail Number 07
def lambda_handler(event, context):
    try:
        # Extract 'a' and 'b' from the event dictionary
        a = event['a']
        b = event['b']

        # Perform the addition
        result = a * b

        # Create a successful response dictionary
        response = {
            "statusCode": 200,
            "body": f"addition: {a} + {b} = {result}"
        }

        # Print the result for debugging (visible in CloudWatch Logs)
        print('a + b =', result)

        return response
    except KeyError as e:
        # Handle missing 'a' or 'b' in the event
        error_message = f"Missing key in event: {e}"
        print(error_message)
        return {
            "statusCode": 400,
            "body": error_message
        }
    except Exception as e:
        # Handle other exceptions
        error_message = f"An error occurred: {e}"
        print(error_message)
        return {
            "statusCode": 500,
            "body": error_message
        }
