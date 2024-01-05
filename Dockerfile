# syntax=docker/dockerfile:1

# docker 이미지 파일을 만드는 명세 파일
# 어떤 이미지 base로 할건지, 미리 선택한다.


# python 버전을 명시해준다. 
# 이 이미지를 기반으로 사용하겠다. 
FROM python:3.8-slim-buster

# 작업 기반은 app
WORKDIR /app

# requirements 파일 복사해서 수행하지
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

# 5000번 port 수행
EXPOSE 5000

# 5000번 port로 수행하는 flask 파
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
