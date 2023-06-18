# README #

This README would normally document whatever steps are necessary to get your application up and running.

### What is this repository for? ###

* Quick summary
* Version
* [Learn Markdown](https://bitbucket.org/tutorials/markdowndemo)

### How do I get set up? ###

* Summary of set up
* Configuration
* Dependencies
* Database configuration
* How to run tests
* Deployment instructions

### Contribution guidelines ###

* Writing tests
* Code review
* Other guidelines

### Who do I talk to? ###

* Repo owner or admin

Инструкция по созданию сервера
1.	Спулиться с репозитория: https://MHlushneu@bitbucket.org/vstu-micro/default-service.git
2.	Переопределить в настройках проекта следующие параметры
spring.cloud.config.uri=http://localhost:8000 (оставить если не изменился)
spring.application.name=service-name (указать уникальное имя сервиса)
3.	Добавить файл с пропертями в config-service. Файл именуется следующим образом:
Название_сервиса.properties
4.	Добавить “route” в файл gateway-api-service.yml  в config-service. Данный роут отвечает за перенаправление запросов с api-gateway к конечному сервису. Параметры следующие:
5.	auth-service: - Название сервиса
6.	        path: /uaa/** - путь перенаправления
7.	        serviceId: auth-service – id сервиса, определенное в пункте 2
8.	        stripPrefix: true – «пропуск» префикса на конечный сервис
9.	        sensitive-headers: - возможность указать хедера, при отсутствии которых запрос не пройдет.

5. Написать сервис
