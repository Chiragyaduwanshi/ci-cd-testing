FROM public.ecr.aws/lambda/python:3.9

ENV LIBREOFFICE_VERSION=7.6.2
ENV LIBREOFFICE_PATH=/opt/libreoffice${LIBREOFFICE_VERSION}

RUN yum install -y tar.x86_64 poppler-utils cairo cups libXinerama.x86_64 cups-libs dbus-glib gcc && \
    yum remove -y openoffice* libreoffice* && \
    curl -L -o LibreOffice_${LIBREOFFICE_VERSION}_Linux_x86-64_rpm.tar.gz \
    https://www.libreoffice.org/donate/dl/rpm-x86_64/7.6.2/en-US/LibreOffice_7.3.4_Linux_x86-64_rpm.tar.gz && \
    tar zxvf LibreOffice_${LIBREOFFICE_VERSION}_Linux_x86-64_rpm.tar.gz && \
    yum localinstall -y ${LIBREOFFICE_PATH}/RPMS/*.rpm && \
    rm -f LibreOffice_${LIBREOFFICE_VERSION}_Linux_x86-64_rpm.tar.gz && \
    yum clean all

ENV PATH="${LIBREOFFICE_PATH}/program:${PATH}"

RUN yum remove -y openoffice* libreoffice* && \
    rm -rf ${LIBREOFFICE_PATH} && \
    yum
