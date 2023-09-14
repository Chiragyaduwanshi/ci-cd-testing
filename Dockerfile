# Use the official AWS Lambda Python runtime as a parent image
FROM public.ecr.aws/lambda/python:3.8

# Copy your Lambda function code into the image
COPY main.py /var/task/

# Define the Lambda function's entry point
CMD ["main.lambda_handler"]
