FROM elasticsearch:2.3

# Install plugins cloud-aws for ec2 discovery
RUN bin/plugin install cloud-aws

# head for viewing shard and replica information
RUN bin/plugin install mobz/elasticsearch-head

# Copy of a test set of data
#COPY data.json /tmp/data.json
