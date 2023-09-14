# Use the official AWS Lambda Python runtime as a parent image
FROM public.ecr.aws/lambda/python:3.8

# Set the working directory in the container
WORKDIR /app

# Copy the "app" package into the container at /app
COPY my_lambda_function/app /app

# Define the Lambda function's entry point
CMD ["main.lambda_handler"]
