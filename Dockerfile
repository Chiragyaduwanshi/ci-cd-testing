FROM public.ecr.aws/lambda/python:3.9

# Install LibreOffice
RUN yum install -y tar.x86_64
RUN yum install -y poppler-utils
COPY ./LibreOffice_7.3.4_Linux_x86-64_rpm.tar.gz .
RUN yum remove -y openoffice* libreoffice*
RUN tar zxvf LibreOffice_7.3.4_Linux_x86-64_rpm.tar.gz
RUN yum localinstall -y LibreOffice_7.3.4.2_Linux_x86-64_rpm/RPMS/*.rpm
RUN yum install -y cairo
RUN yum install -y cups
ENV PATH="$PATH:/opt/libreoffice7.3/program"
RUN yum install -y libXinerama.x86_64 cups-libs dbus-glib
RUN rm LibreOffice_7.3.4_Linux_x86-64_rpm.tar.gz

# Copy the Lambda function code from the 'app' directory into the image
COPY app/ /var/task/
COPY confidential.json ./
# Define the Lambda function's entry point
CMD ["main.lambda_handler"]
