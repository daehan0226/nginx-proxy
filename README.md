### NGINX PROXY
* 도메인/서브도메인 연결 시 jwilder/nginx-proxy 도커 이미지 사용
* 도커 네트워크 생성
* 연결해줄 컨테이너의 변수에 VIRTUAL_HOST로 설정하고 해당 컨테이너 실행 후 jwilder/nginx-proxy로 실행된 컨테이너를 재실행해줌

1. 도메인 연결시 .env 의 변수를 전달해서 hostname, redirect url, port 등을 관리할 수 있음
2. 현재 .env 에서는 DOMAIN, REDIRECT 변수가 있고
3. ./docker-compose.yml 에서 "VIRTUAL_HOST=DOMAIN", "REDIRECT=REDIRECT"로 전달되는 변수는 nginx의 conf 에 바로 전달되지 않음
4. ./nginx-www/www.conf.template을 만들고 여기에 변수를 포함하여 작성 후
5. ./nginx-www/Dockerfile 의 순서에 따라 빌드되면서
6. ./nginx-www/docker-entrypoint.sh 를 실행시키면 해당 쉘 스크립트가 변수들을 www.conf에 적용하여 만들어줌

#### 기타사항
1. 도커 네트워크 생성 필요함(예: docker network create nginx-proxy)
2. docker-entrypoint.sh 실행 권한 필요(예: chmod +x docker-entrypoint.sh)