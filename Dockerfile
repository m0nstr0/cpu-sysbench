FROM ubuntu:17.10

RUN apt-get update && apt-get install -y sysbench

ADD ./cmd.sh ./cmd.sh

RUN chmod +x ./cmd.sh

CMD ["./cmd.sh"]