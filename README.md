[![Open Source Helpers](https://www.codetriage.com/juuh42dias/transervicos/badges/users.svg)](https://www.codetriage.com/juuh42dias/transervicos)

# Transerviços
Esta é uma aplicação Rails 5.2.x

# Documentação

Este README descreve o objetivo deste repositório e como configurar um ambiente de desenvolvimento. Outras fontes de documentação são as seguintes:

##  Pré requisitos
### Este projeto requer:

**Ruby 2.6.4**, preferencialmente gerenciado usando [Rbenv](https://github.com/rbenv/rbenv)  
[PostgreSQL](https://www.digitalocean.com/community/tutorials/how-to-set-up-ruby-on-rails-with-postgres) deve estar instalado e aceitando conexões.

Se você precisar de ajuda para configurar um ambiente de desenvolvimento Ruby, consulte este Guia de instalação do Rails OS X.

# Começando
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
