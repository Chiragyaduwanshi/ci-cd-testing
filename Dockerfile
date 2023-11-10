# Use the official AWS Lambda Python runtime as a parent image
FROM public.ecr.aws/lambda/python:3.9

# Install RustUP and maturin
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN yum install -y gcc
ENV PATH="/root/.cargo/bin:${PATH}"
RUN pip install maturin
RUN pip install --upgrade pip

# Set the working directory in the container
WORKDIR /var/task

# Copy the Lambda function code from the 'app' directory into the image
COPY app/ /var/task/

# Define the Lambda function's entry point
CMD ["main.lambda_handler"]
