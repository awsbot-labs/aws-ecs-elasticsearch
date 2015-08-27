FROM elasticsearch:1.7.1

# Install plugins
# cloud-aws for ec2 discovery
# head for viewing shard and replica information
RUN /usr/share/elasticsearch/bin/plugin install elasticsearch/elasticsearch-cloud-aws/2.7.0
RUN /usr/share/elasticsearch/bin/plugin --install mobz/elasticsearch-head

# Download confd for bootstraping containers
RUN wget -O /usr/bin/confd https://github.com/kelseyhightower/confd/releases/download/v0.10.0/confd-0.10.0-linux-amd64 && chmod 0755 /usr/bin/confd

# Confd and init scripts
COPY docker/etc/confd /etc/confd
COPY docker/etc/my_init.d /etc/my_init.d
COPY docker/sbin/my_init /sbin/my_init

# New Entrypoint is required
RUN ln -s /docker-entrypoint.sh /etc/my_init.d/98-docker-entrypoint
ENTRYPOINT ["/sbin/my_init"]

# Envrionment variables for detokenization during bootstrap
ENV ELASTICSEARCH_SHARDS=3
ENV ELASTICSEARCH_REPLICAS=3
ENV ELASTICSEARCH_CLUSTER_NAME=
ENV AWS_REGION=
ENV AWS_ACCESS_KEY_ID=
ENV AWS_SECRET_ACCESS_KEY=
