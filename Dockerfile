FROM public.ecr.aws/lambda/python:3.9

ENV LIBREOFFICE_VERSION=7.6.2
ENV LIBREOFFICE_PATH=/opt/libreoffice${LIBREOFFICE_VERSION}

# Install dependencies
RUN yum install -y tar.x86_64 poppler-utils cairo cups libXinerama.x86_64 cups-libs dbus-glib gcc

# Download and verify LibreOffice
WORKDIR /opt
RUN curl -L -o LibreOffice.tar.gz https://download.documentfoundation.org/libreoffice/stable/7.6.2/rpm/x86_64/LibreOffice_7.6.2_Linux_x86-64_rpm.tar.gz \
    && ls -l \
    && echo "Creating target directory..." \
    && mkdir -p $LIBREOFFICE_PATH \
    && echo "Extracting and installing LibreOffice..." \
    && tar zxvf LibreOffice.tar.gz \
    && yum localinstall -y LibreOffice_${LIBREOFFICE_VERSION}_Linux_x86-64_rpm/RPMS/*.rpm \
    && rm -rf LibreOffice*

ENV PATH="${LIBREOFFICE_PATH}/program:${PATH}"

# Clean up
RUN yum remove -y tar.x86_64 gcc && \
    yum clean all
