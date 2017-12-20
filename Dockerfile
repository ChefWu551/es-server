FROM anapsix/alpine-java:jre8
ENV ES_PKG_NAME elasticsearch-2.4.6
ADD $ES_PKG_NAME.tar.gz /usr/share/
ADD elasticsearch/ /usr/share/$ES_PKG_NAME/
RUN cd /usr/share/ && \
mv $ES_PKG_NAME elasticsearch && \
chmod +x /usr/share/elasticsearch/bin/*
ENV PATH /usr/share/elasticsearch/bin:$PATH
EXPOSE 9200
# RUN mkdir /es-server
# ADD elasticsearch/ /usr/share/es-server/elasticsearch/
# RUN chmod +x /usr/share/es-server/elasticsearch/bin/*
# ENTRYPOINT /usr/share/es-server/elasticsearch/bin
# EXPOSE 9200
CMD ["elasticsearch"]