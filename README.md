# SMARTBIT  - testes funcionais via Web e Mobile utilizando Robot Framework

Este repositório é um projeto de testes realizado sobre o framework Robot Framework. 
Testes desenvolvidos para realizar a validação dos requisitos funcionais e analisar o comportamento das regras de negócios da gestão de uma acadêmia (que contém cadastros de matrícula de novos alunos).

# User Web

## 🔖 Requisitos funcionais

### Landing Page

- [X] Should be show the Slogan in the Landing Page

### Login

- [X] Should be log in as a Gym Manager
- [X] Should not login as invalid password
- [X] Should not login as invalid email
- [X] Try invalid login

| campos   | descrição                             | tipo     | obrigatório |
| :-----   | :------------------------------------ | :------- | :---------- |
| email    | email identificador único             | email    | sim         |
| password | senha do usuário                      | texto    | sim         |

### SignUp

- [X] Should be start the client register
- [X] Field name is required 
- [X] Field email is required 
- [X] Field cpf is required
- [X] Field email is invalid 
- [X] Field cpf is invalid 
- [X] Field cpf is required 
- [X] Should be start the client register 
- [X] Tentativa de pré-cadastro 

| campos   | descrição                             | tipo     | obrigatório |
| :-----   | :------------------------------------ | :------- | :---------- |
| name     | nome do usuário                       | nome     | sim         |
| email    | email do usuário                      | email    | sim         |
| password | senha do usuário                      | texto    | sim         |
| cpf      | cpf identificador único               | texto    | sim         |

### Membership

- [X] Should realize a new Memberships
- [X] Should not realize a Membership duplicate 
- [X] Should search by name 
- [X] Should delete a membership

| campos | descrição                                | tipo     | obrigatório |
| :----- | :------------------------------------    | :------- | :---------- |
| name   | nome do usuário                          | nome     | sim         |
| email  | email do usuário                         | email    | sim         |
| cpf    | cpf identificador único                  | texto    | sim         |
| name   | nome do plano da academia                | texto    | sim         |
| price  | preço do plano da academia               | texto    | sim         |
| number | número do cartão de crédito do usuário   | texto    | sim         |
| holder | nome do usuario do cartão de crédito     | texto    | sim         |
| month  | mês de validação do cartão de crédito    | texto    | sim         |
| year   | ano de validação do cartão de crédito    | texto    | sim         |
| cvv    | código de validação do cartão de crédito | texto    | sim         |

# User Mobile

## 🔖 Requisitos funcionais
## Login

- [X] Should loggIn with CPF and Id
- [X] CPF not register
- [X] CPF invalid

| campos | descrição                             | tipo     | obrigatório |
| :----- | :------------------------------------ | :------- | :---------- |
| ip     | ip identificador único                | numerico | sim         |
| cpf    | cpf identificador único               | numerico | sim         |

## MyBody

- [X] Should register my physical measurements

| campos | descrição                             | tipo     | obrigatório |
| :----- | :------------------------------------ | :------- | :---------- |
| weight | peso do aluno matriculado             | numerico | não         |
| height | altura do aluno matriculado           | numerico | não         |

## 🚀 Tecnologias utilizadas

- [Node.js] - software de código aberto, multiplataforma, que permite a execução de códigos JavaScript. 
- [Robot Framework] - estrutura genérica de framework para automação de teste de software orientado a testes de aceitação por meio de palavras chave. 
- [Playwright] - biblioteca de automação de código aberto para testes de navegador e web scraping desenvolvida pela Microsoft.
- [Browser Library] - biblioteca voltada para testes Web desenvolvida em Playwright.
- [Appium] - ferramenta de código aberto e multi-plataforma para automatizar testes de aplicativos móveis.
- [Appium Inspector] - uma ferramenta de interface gráfica (GUI) que permite a inspeção e interação com a interface do usuário (UI) de aplicativos móveis. 
- [Android Studio] - é um ambiente de desenvolvimento integrado (IDE) para desenvolver aplicativos.

## 👨🏻‍💻 Como executar o projeto
# (Documentação em desenvolvimento)

1 - Instalar e configurar o Python3 + PIP3:

* python3: $ sudo apt-get install python3<br>
* pip: $ sudo apt-get install python3-pip<br>


2 - Escolher uma IDE de uso para automatizar seus testes. Ex: VSCode

3 - Instalar o Robot Framework:

* pip3 install robotframework

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
## Agradecimento
<!-- Feito com 💜 &nbsp;por Fernando Papito 👋 &nbsp;[Meu linkedin](https://www.linkedin.com/in/papitoio/) -->
Agradecimento especial ao Fernando Papito que vem contribuindo e popularizando cada vez mais com seus treinamentos e incentivo aos estudos de testes.
