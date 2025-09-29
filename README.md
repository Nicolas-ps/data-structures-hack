# Data Structures in Hack
Hack é um dialeto do PHP criado pelo facebook com foco em robustez de tipos e escalabilidade, mantendo a dinamicidade da linguagem original que trás consigo uma trade off de desenvolvimento mais tranquilo.

O Hack é perfeitamente interoperável com o PHP, e precisava ser, pois o mesmo surgiu num contexto em que o PHP era a principal linguagem utilizada nos motores do facebook e começava a apresentar algumas limitações técnicas relacionadas à escalabilidade e segurança. Assim fez-se necessária uma transicação gradual entre tecnologias, de forma que não impactasse a operação da aplicação em produção. A interoperabilidade resolve esse problema.

O Hack é executado pela HHVM, uma máquina virtual JIT também criada pelo facebook que trás o melhor dos dois mundos dos principais paradigmas de execução de código (interpretação e compilação). A HHVM trás a robustez necessária à linguagem através da checagem de tipos e implementação de validação na estruturação do programa para não permitir código não modular (fora de funções ou classes), obrigando o programador a organizar a base de código com mais afinco.

Abaixo você encontrará um tutorial de como inicializar um projeto Hack básico que utiliza alguns tipos primitivos e tipos de array nativos da linguagem, como Vetor e Dicionário para implementação de estruturas de dados simples.

### Requisitos

- PHP >= 7.4 (requerido para instalação do composer)
- Composer (instalado globalmente)

## Instalando a HHVM

Antes de tudo, você precisa realizar a instalação da HHVM na sua máquina. Com as instruções abaixo é possível realizar a instalação universal em distribuições Linux.

```bash
apt-get update 
apt-get install --yes software-properties-common apt-transport-https 
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xB4112585D386EB94 

add-apt-repository 'deb https://dl.hhvm.com/universal release main' 
apt-get update 
apt-get install hhvm
```

Execute o comando abaixo para verificar se a HHVM foi instalada corretamente. A saída deve ser o número da versão configurada.

```bash
hhvm --version
```
## Inicializando o projeto hack

Crie um diretório para o projeto na localização que sua preferência no sistemas de arquivos da sua máquina, em seguida, crie um arquivo nomeado `.hhconfig` na raiz do diretório.

```bash
touch .hhconfig
```

Agora, realize o download do .hhconfig default fornecido pelo repositório do hhvm no GitHub.

```bash
curl https://raw.githubusercontent.com/hhvm/hhast/master/.hhconfig > .hhconfig
```

Ou se preferir, insira-as manualmente (não recomendado)

```ini
ignored_paths = [ "tests/examples/NonHackFileTest/php_files/.*", ".*SyntaxExample.*", "vendor/bin" ]
error_php_lambdas = true
disable_xhp_children_declarations = false
allowed_decl_fixme_codes=2053,4045,4047
allowed_fixme_codes_strict=2011,2049,2050,2053,2083,3084,4027,4045,4047,4104,4106,4107,4108,4110,4128,4135,4188,4223,4240,4323,4390,4401
; enable_strict_string_concat_interp=true
```

Com as diretivas configuradas, vamos agora aos passos necessárias para instalação da biblioteca base da linguagem e configuração do autoload de classes e arquivos.

### Instalando o autoload de arquivos

Faça a instalação do pacote de autoload de arquivos do Hack.

```bash
composer require hhvm/hhvm-autoload
```


Execute o comando abaixo para criar um arquivo `hh_autoload.json` e inserir as configurações e autoload.

```json
cat > hh_autoload.json
{
  "roots": [
    "src/"
  ],
  "devRoots": [
    "tests/"
  ],
  "devFailureHandler": "Facebook\\AutoloadMap\\HHClientFallbackHandler"
}
```

Por último, execute o comando abaixo para gerar os arquivos de autoload.

```bash 
vendor/bin/hh-autoload
```

### Instalação a Hack Standard Library

Feita a instalação e configuração do autoload, vamos à instalação da biblioteca base, a Hack Standard Library (hsl).

O pacote hhvm/hsl contém a biblioteca base do hack. Ela contém funções e classes utilitárias para tarefas comuns de desenvolvimento, e na maioria dos casos substitui API's nativas do PHP.
 Com essa biblioteca o desenvolvimento com Hack se torna muito mais robusto e, na prática, é onde está boa parte das vantagens de se utilizar a linguagem, que, com esse pacote, se torna mais que um superset do PHP.

```bash
composer require hhvm/hsl
```

### Executando a aplicação

Você pode executar um arquivo `.hack` diretamente através da linha de comando realizando a chamada ao bin da hhvm que está instalada na raiz da sua máquina, como abaixo:

```
hhvm index.hack
```

Há também um  type checker utilitário que pode ser utilizado para realizar checagens básicas (verifica erros em tempo de build, como problemas na sintaxe e inferência de tipos).

```bash
hh_client
```

### Considerações finais

Divirta-se.