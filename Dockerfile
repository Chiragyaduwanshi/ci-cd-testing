FROM public.ecr.aws/lambda/python:3.9

ENV LIBREOFFICE_VERSION=7.6.2
ENV LIBREOFFICE_PATH=/opt/libreoffice${LIBREOFFICE_VERSION}
ENV LIBREOFFICE_TAR_URL=https://download.documentfoundation.org/libreoffice/stable/7.6.2/rpm/x86_64/LibreOffice_7.6.2_Linux_x86-64_rpm.tar.gz
ENV LIBREOFFICE_TAR_CHECKSUM=920d61dd9ee4263d0960fca8b14e95d36602c589720903120cfd0c2e41916462

# Install dependencies
RUN yum install -y tar.x86_64 poppler-utils cairo cups libXinerama.x86_64 cups-libs dbus-glib gcc

# Download and verify LibreOffice
WORKDIR /opt
RUN echo "Creating target directory..."
    && mkdir -p $LIBREOFFICE_PATH    
    && echo "Extracting and installing LibreOffice..."
    && tar zxvf LibreOffice_${LIBREOFFICE_VERSION}_Linux_x86-64_rpm.tar.gz -C $LIBREOFFICE_PATH
    && ls -l LibreOffice_${LIBREOFFICE_VERSION}_Linux_x86-64_rpm.tar.gz \
    && if [ ! -s LibreOffice_${LIBREOFFICE_VERSION}_Linux_x86-64_rpm.tar.gz ]; then exit 1; fi \
    && yum localinstall -y ${LIBREOFFICE_PATH}/RPMS/*.rpm || exit 1
    && rm -f LibreOffice_${LIBREOFFICE_VERSION}_Linux_x86-64_rpm.tar.gz   

ENV PATH="${LIBREOFFICE_PATH}/program:${PATH}"

# Clean up
RUN yum remove -y tar.x86_64 gcc && \
    yum clean all
