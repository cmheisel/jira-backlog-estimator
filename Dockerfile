FROM python:3.8.3-slim-buster
MAINTAINER chris@heisel.org

ENV PYTHONUNBUFFERED 1

RUN mkdir -p /app/jira_backlog_estimator/
WORKDIR /app
ADD ./requirements-frozen.txt /app/jira_backlog_estimator

RUN pip install -r /app/jira_backlog_estimator/requirements-frozen.txt

ADD ./jira_backlog_estimator/* /app/jira_backlog_estimator/
ADD ./entrypoint.sh /app

EXPOSE 8000

CMD ["/app/entrypoint.sh"]
