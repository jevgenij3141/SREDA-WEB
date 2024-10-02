FROM icomeraembedded/bullseye-base:latest
MAINTAINER Jevgenij Sreda <jevgenij3141@gmail.com>

ADD ./build /build
RUN bash /build/setup.sh && rm -Rf /build

EXPOSE 80
EXPOSE 443

CMD /usr/sbin/apache2ctl -D FOREGROUND
