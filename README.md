[![Open Source Helpers](https://www.codetriage.com/juuh42dias/transervicos/badges/users.svg)](https://www.codetriage.com/juuh42dias/transervicos)

Version in [ENGLISH](https://github.com/juuh42dias/transervicos/blob/master/README-EN.md)

# Transerviços
Esta é uma aplicação Rails 5.2.x

# Documentação

Este README descreve o objetivo deste repositório e como configurar um ambiente de desenvolvimento. Outras fontes de documentação são as seguintes:

##  Pré requisitos
### Este projeto requer:


**Ruby 2.6.4**, preferencialmente gerenciado usando [Rbenv](https://github.com/rbenv/rbenv).
[PostgreSQL](https://www.digitalocean.com/community/tutorials/how-to-set-up-ruby-on-rails-with-postgres) deve estar instalado e aceitando conexões.

**Docker e Docker Compose (opcionais)**
Uma alternativa para executar o projeto em modo de desenvolvimento e/ou testes é
utilizar o [Docker](https://docs.docker.com/install/) com [Docker
Compose](https://docs.docker.com/compose/install/).

Se você precisar de ajuda para configurar um ambiente de desenvolvimento Ruby, consulte este Guia de instalação do Rails OS X.

# Começando sem Docker

**bin/setup**  
Execute o script bin/setup. Este script irá:  

* Verificar se você tem a versão necessária do Ruby  
* Instalar gemas usando o Bundler  
* Criar cópias locais de .env e database.yml  
* Criar, migrar e propagar/popular o banco de dados  
* Executá-lo!  
* Executar o teste bin/rake para garantir que tudo funcione.  
* Executar teste bin/rake: sistema para executar testes do sistema.  
* Execute bin/rails  

# Começando com Docker

Com Docker e Docker Compose instalados, execute no diretório raíz do projeto:

* `docker-compose build` para criar as imagens necessárias
* `docker-compose run web bash` para acessar o `shell` do container já com a
  aplicação instalada

Dentro desse `shell` você deve configurar o banco de dados antes de executar
outros comandos. Para isso execute:

`bin/setup`

Para executar a aplicação, a partir do `shell` do Docker, execute:

`rails server -b 0.0.0.0 `


# Executando o projeto de forma local

Para executar o projeto de forma local, após executar o comando `bin/setup`,
basta executar `rails server`. A aplicação estará disponível no endereço:
`localhost:3000` em seu navegador.

Caso você esteja utilizando Docker, basta executar `docker-compose up`. A aplicação estará disponível no endereço:
`localhost:3000` em seu navegador.


# Rodando testes

*  `bundle install` para instalar o Rspec, que está no gemfile.

**Para executar todos os testes:**  `bundle exec rspec`
> Executa todos os testes da pasta `spec`.

**Para executar os testes de um único arquivo:** `bundle exec rspec ./spec/models/my_file.rb.`
> Executa todos os testes do arquivo `my_file`.

**Para executar um teste específico:**  `bundle exec rspec ./spec/models/my_file.rb:10`
> Executa o teste na linha 10 do `my_file`.