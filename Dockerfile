FROM python:3.8-slim
COPY --from=amazon/aws-cli:latest /usr/local /usr/local
RUN pip install ansible boto3
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
