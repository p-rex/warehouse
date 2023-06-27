FROM httpd:2.4.49-buster

RUN apt update
RUN apt-get install -y curl psmisc procps

#for cve-2021-42103
ADD https://raw.githubusercontent.com/p-rex/warehouse/main/apache_vulnerabilities/cve-2021-42013/httpd.conf /usr/local/apache2/conf/httpd.conf

#web page
ARG TMP_DIR=/tmp/html/
ARG GITHUB_URL=https://raw.githubusercontent.com/p-rex/warehouse/main/apache_vulnerabilities/cve-2021-42013/product_page/html/
RUN mkdir -p ${TMP_DIR}files && \
    curl -k -L ${GITHUB_URL}index.html -o ${TMP_DIR}index.html && \
    curl -k -L ${GITHUB_URL}files/bootstrap.min.css -o ${TMP_DIR}files/bootstrap.min.css && \
    curl -k -L ${GITHUB_URL}files/bootstrap.min.js -o ${TMP_DIR}files/bootstrap.min.js && \
    curl -k -L ${GITHUB_URL}files/favicon.ico -o ${TMP_DIR}files/favicon.ico && \
    curl -k -L ${GITHUB_URL}files/holder.min.js -o ${TMP_DIR}files/holder.min.js && \
    curl -k -L ${GITHUB_URL}files/jquery-3.2.1.slim.min.js -o ${TMP_DIR}files/jquery-3.2.1.slim.min.js && \
    curl -k -L ${GITHUB_URL}files/popper.min.js -o ${TMP_DIR}files/popper.min.js && \
    curl -k -L ${GITHUB_URL}files/product.css -o ${TMP_DIR}files/product.css && \
    mv ${TMP_DIR}* /usr/local/apache2/htdocs/ && \
    rm -rf ${TMP_DIR}


#install python for attack demo
RUN apt install -y python3 python3-distutils python3-pip tree less
RUN ln -s /usr/bin/python3 /usr/bin/python
