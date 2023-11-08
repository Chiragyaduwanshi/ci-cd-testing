# Use the official AWS Lambda Python runtime as a parent image
FROM public.ecr.aws/lambda/python:3.8

RUN yum install -y poppler-utils
RUN yum install -y cairo
RUN yum install -y cups

# Set the working directory in the container
WORKDIR /var/task

# Copy the Lambda function code from the 'app' directory into the image
COPY app/ /var/task/

# Define the Lambda function's entry point
CMD ["main.lambda_handler"]
