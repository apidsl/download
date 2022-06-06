
![logo.apidsl.com](https://logo.apidsl.com/1/cover.png)

# [Sourcecode - bash.apidsl.com](https://bash.apidsl.com/) [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/apidsl/docs/edit/main/DOCS/MENU.md) 

+ [Examples - examples.apidsl.com](http://examples.apidsl.com)
+ [Documentation - docs.apidsl.com](https://docs.apidsl.com/)
+ [Blog - www.apidsl.com](https://www.apidsl.com/)
+ [Logotyp - logo.apidsl.com](https://logo.apidsl.com/)

+ [LICENSE](../LICENSE)



## About [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/apidsl/docs/edit/main/DOCS/ABOUT.md)

APIDSL to zwykły skrypt o niezwykłych możliwościach
+ napisany w bash-u
+ jako lokalny skrypt bash, po skopiowaniu z repozytorium
+ jako komenda w systemie linux, po skopiowaniu do /usr/local/bin
+ z zarządzaniem zalezności: install, update ze wsparciem dla dla maven, composer, node

APIDSL tworzy abstrakcyjną warstwę w multi-języklowych projektach do celów łatwiejszego re-użycia kodu bibliotek i projektów.
APIDSL mapuje i uruchamia funkcje i skrypty z róznych języków programowania.
Mapowanie pozwala na kierowanie strumienia danych neizaleznie od języka programowania do endpoint-u.
Mapowanie skyrptów łączących się z API usług SaaS pozwala na łatwą integrację usług i tworzenie nowych.
Deklaratywny zapis opisuje działanie połączonych ze sobą bibliotek i api, co pozwala na deployment i testowanie całej infrastruktury.

Ten sam zapis APIDSL pozwala w zależnośći od załadowanych zależnosć uruchomić jak i przetestować infratsrukturę.



Taki użycie kodu nie ogranicza nas do stosowania jednej technologii czy środowiska,
a pozwala na łączenie najlepszych rozwiązań z różnych języków, bibliotek, frameworków, projektów opensorce czy API.

---

I did last time some wrapper for bash, python, ... with such format: load("domains.txt")

I am using it to build multiplatform scripts, where the same sentence will be executed on PHP, Python, JS, ...

### The Inspiration was coming from such projects:

+ [jQuery, DOM Traversal and Manipulation](https://jquery.com/)
+ [Apache Camel uses a Java Domain Specific Language or DSL for creating Enterprise Integration Patterns or Routes in a variety of domain-specific languages (DSL)](https://camel.apache.org/manual/dsl.html)



## Supported technologies  [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/apidsl/docs/edit/main/DOCS/SUPPORTED.md)


### Languages:
+ js
+ php
+ bash
+ python

### Environment
+ docker
+ logs

## Data formats

+ ini
+ json
+ yaml
+ csv
+ html
+ xml


## EXAMPLES [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/apidsl/docs/edit/main/DOCS/EXAMPLES.md)


Rozwiązanie #apidsl służy pisaniu komend do wcześniej napisanych skryptów, bibliotek, aplikacji.
Zamiast ścieżek do plików używamy nazw jako funkcji z parametrem. Korzyść? re-użycie kodu, zamiast refaktoryzacji! APIDSL to jedno z rozwiązań w (pisanej jeszcze) książce #hipermodularyzacja

API + DSL = Application Programming Interface controlled over Domain Specific Language
#apidsl is available for testing
#hypermodularity #hyperprogramming #mvp #prototyping #programming #testing

### install

[minsungson/GitHub-cURL: A guide to installing files from GitHub repos in terminal using cURL](https://github.com/minsungson/GitHub-cURL)

```bash
./apifork install
```

download and init command apidsl
```bash
./apidsl.sh -d
./apidsl.sh -i
apidsl -h
```


```js
load("domains.txt")
.split("/n")
.http()
.xpath("title")
.appendToFile("titles.txt")
```


### xpath from functions

```bash
./apidsl.sh 'f.http("https://softreck.com").f.xpath("title")'
```


### tag from letpath

```bash
./apidsl.sh 'f.http("https://softreck.com").letpath.tag("title")'
```


### nameservers

```bash
./apidsl.sh 'whois.ns("softreck.com")'
```

### loop

```bash
./apidsl.sh 'f.load("domains.txt").split("/n").f.http().f.xpath("title").f.appendToFile("titles.txt")'
```

more examples with scripts
# test.deploymat.com

```bash
./apidsl.sh 'get("https://github.com/letpath/bash","path").path.load("apifork.txt")'
./apidsl.sh 'path.load("apifork.txt")'
```

## LOGS

print logs for latest run
```bash
./apidsl.sh -l
```

## DEBUG

show infos after run
```bash
./apidsl.sh -d 'get("https://github.com/letpath/bash","path").path.load("apifork.txt")'
```


## DEPLOYMENT

run file
```bash
./apidsl.sh -d 'run("www.botreck.com.apidsl")'
```
run file
```bash
./apidsl.sh --import "https://github.com/letpath/bash" "path"
./apidsl.sh --run "www.botreck.com.apidsl"
```

run file with dependency
```bash
apidsl 'get("https://github.com/letclient/ssh","ssh").run("www.botreck.dev.apidsl")'
```
with debug
```bash
./apidsl.sh -d 'get("https://github.com/letclient/ssh","clientssh").run("www.botreck.com.apidsl")'
```



## CHECK STATUS
change dependency to make another action on the same command

```bash
apidsl 'get("https://github.com/letclient/ssh-test","clientssh").run("www.botreck.dev.apidsl")'
```

### deployment.sh

import from file: **deployment.get.txt**
https://github.com/letclient/ssh" "clientssh"

```bash
./apidsl.sh --get "deployment.get.txt"
./apidsl.sh --run "www.botreck.com.apidsl"
```

### monitoring.sh
```bash
./monitoring.sh
```

import from file: **monitoring.get.txt**
https://github.com/letclient/ssh-test" "clientssh

```bash
./apidsl.sh --get "monitoring.get.txt"
./apidsl.sh --run "www.botreck.com.apidsl"
```





get("https://github.com/let-api/github.com").add_project("infrat/www")

## APIfoundation [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/apidsl/docs/edit/main/DOCS/APIFOUNDATION.md)

Here are 3 levels of apifoundation solutions
+ apifork
+ apibuild
+ apidsl

**apifork** to bring dependencies,packagages to the project

**apibuild** - to build it over composer, maven, npm, ...

**apidsl** - to use it over hi level domain language 


## Contribution [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/inframonit/bash/edit/main/DOCS/CONTRIBUTION.md)


Solutions for development:

Install dependencies after created project
```bash
curl https://raw.githubusercontent.com/apifork/bash/main/apifork.sh -o apifork
echo "https://github.com/flatedit/bash.git flatedit" > "apifork.dev.txt"
./apifork install apifork.dev.txt
```

Edit documentation with flatedit
```bash
echo '#!/bin/bash' > 'readme'
echo './flatedit/readme.sh readme.txt' > 'readme'
echo "./DOCS/MENU.md" >> "readme.txt"
echo "./DOCS/ABOUT.md" >> "readme.txt"
echo "./DOCS/FOOT.md" >> "readme.txt"
```

### Update documentation

```bash
 ./readme
```

Config project file

The config file: **.apifork** can be another, e.g. **projects.txt**

Just change the first line in  **.apifork** on **projects.txt**
```bash
projects.txt
```


### install

[minsungson/GitHub-cURL: A guide to installing files from GitHub repos in terminal using cURL](https://github.com/minsungson/GitHub-cURL)

```bash
./apifork install
```
OR

```bash
./apifork
```

### update

```bash
./apifork update
```


### remove

```bash
./apifork remove
```


## About flatedit [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/apidsl/docs/edit/main/DOCS/FLATEDIT.md)


### Dependencies

projects list [**readme1.txt**](readme1.txt)
```
./DOCS/MENU.md
../bash/DOCS/TODO.md
./DOCS/FOOT.md
```
[**readme.sh**](readme.sh)
```bash
./flatedit/readme.md readme1.txt
```

### Comments

With comments not to load this file

projects list [**readme2.txt**](readme2.txt)
```
./DOCS/MENU.md
../bash/DOCS/TODO.md
./DOCS/FOOT.md
```
[**readme.sh**](readme.sh)
```bash
./flatedit/readme.md readme2.txt
```


### Logs

Show not- & working/existing files


projects list [**readme3.txt**](readme3.txt)
```
./DOCS/MENU.md
../bash/DOCS/TODO.md
./DOCS/FOOT.md
```
[**readme.sh**](readme.sh)
```bash
./flatedit/readme.md readme3.txt
```


## Docs [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/apidsl/docs/edit/main/DOCS/DOCS.md)




### Zalezności ładowane z github

+ zamiast xpath - ładowanie zalezności przez skrypt github
+ letPath - przygotować
  https://github.com/letpath/bash


### Another examples

get options
https://reposhub.com/linux/system-utilities/ko1nksm-getoptions.html

https://github.com/ko1nksm/getoptions



---

+ [edit](https://github.com/apidsl/docs/edit/main/README.md)
+ [apidsl/docs](https://github.com/apidsl/docs)
