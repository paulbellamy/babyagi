FROM python:alpine

RUN apk add --update build-base

ADD requirements.txt ./
RUN pip install -r requirements.txt

RUN touch .env

# alternatively, gpt-4, text-davinci-003, etc
ENV OPENAI_API_MODEL="gpt-3.5-turbo" \
    PINECONE_ENVIRONMENT="us-east1-gcp" \
    TABLE_NAME="test-table" \
    OBJECTIVE="Solve world hunger" \
    FIRST_TASK="Develop a task list" \
    OPENAI_API_KEY="" \
    PINECONE_API_KEY=""

ADD babyagi.py ./
ENTRYPOINT python3 ./babyagi.py
