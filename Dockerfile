FROM perl:5.22
MAINTAINER k <k@kdaye.com>
WORKDIR /root
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y unzip libssl-dev
RUN cpanm -vn --mirror http://mirrors.163.com/cpan/ Encode::Locale IO::Socket::SSL Mojolicious Mojo::SMTP::Client MIME::Lite
RUN wget -q https://github.com/sjdy521/Mojo-Webqq/archive/master.zip -OMojo-Webqq.zip \
    && unzip -qo Mojo-Webqq.zip \
    && cd Mojo-Webqq-master \
    && cpanm . \
    && cd .. \
    && rm -rf Mojo-Webqq-master Mojo-Webqq.zip
ADD login.pl .
RUN chmod 755 login.pl
