
![logo.apidsl.com](https://logo.apidsl.com/1/cover.png)

# [Documentation - docs.apidsl.com](https://docs.apidsl.com/) [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/apidsl/docs/edit/main/MD/MENU.md) 

+ [Sourcecode - bash.apidsl.com](http://bash.apidsl.com)
+ [Contribution - contribution.apidsl.com](http://contribution.apidsl.com)
+ [Examples - examples.apidsl.com](http://examples.apidsl.com)
+ [Blog - www.apidsl.com](https://www.apidsl.com/)
+ [Logotyp - logo.apidsl.com](https://logo.apidsl.com/)

+ [LICENSE](../LICENSE)



## About [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/apidsl/docs/edit/main/MD/ABOUT.md)

One of the benefit of modularization is to have a modular architecture with independent modules from a programming language, so we present here an example langauge the APIDSL, which bring together different languages on shell level

I did last time some wrapper for bash, python, ... with such format: load("domains.txt")

```apidsl
load("domains.txt")
.split("/n")
.http()
.xpath("title")
.appendToFile("titles.txt")
```

I am using it to build multiplatform scripts, where the same sentence will be executed on PHP, Python, JS, ...

### The Inspiration was coming from such projects:


+ [jQuery, DOM Traversal and Manipulation](https://jquery.com/)
+ [Apache Camel uses a Java Domain Specific Language or DSL for creating Enterprise Integration Patterns or Routes in a variety of domain-specific languages (DSL)](https://camel.apache.org/manual/dsl.html)

## Czym jest APIDSL


![apidsllayers](apidsl-layers.png)


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


I did last time some wrapper for bash, python, ... with such format: load("domains.txt")

I am using it to build multiplatform scripts, where the same sentence will be executed on PHP, Python, JS, ...

[Programowanie imperatywne oraz deklaratywne | Codenga](https://codenga.pl/artykuly/poradniki/programowanie-imperatywne-oraz-deklaratywne)

> Programowanie imperatywne oraz deklaratywne

https://pl.wikipedia.org/wiki/Imperatyw
Imperatyw (łac. imperativus – rozkazujący) – nakaz, reguła, zasada, która nie podlega dyskusji i którą można bezpośrednio wywieść z założeń teoretycznych.

Paradygmat imperatywny można opisać tak: “mówimy jak komputer ma wykonać daną rzecz”. Czyli skupiamy się na poszczególnych krokach, które prowadzą do rozwiązania problemu.

Możesz sobie wyobrazić program napisany imperatywnie jako ciąg instrukcji.


Paradygmat deklaratywny można opisać tak: “mówimy komputerowi co ma dla nas zrobić”. Ważny jest dla nas wynik jaki uzyskamy - nie wnikamy w jaki sposób komputer ten wynik. osiągnie.

Taki styl programowania pozwala skupić się więc na celu. Na tym, co chcemy osiągnąć. Mniej ważne są tutaj kroki, które do tego celu prowadzą.
### The Inspiration was coming from such projects:

+ [jQuery, DOM Traversal and Manipulation](https://jquery.com/)
+ [Apache Camel uses a Java Domain Specific Language or DSL for creating Enterprise Integration Patterns or Routes in a variety of domain-specific languages (DSL)](https://camel.apache.org/manual/dsl.html)




## Supported technologies  [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/apidsl/docs/edit/main/MD/SUPPORTED.md)


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

# letPath



## DEPLOYMENT

run file
```bash
apidsl -d 'run("www.botreck.com.apidsl")'
```
run file
```bash
apidsl --get "https://github.com/letpath/bash" "path"
apidsl --run "www.botreck.com.apidsl"
```

run file with dependency
```bash
apidsl 'get("https://github.com/letclient/ssh","ssh").run("www.botreck.dev.apidsl")'
```
with debug
```bash
apidsl -d 'get("https://github.com/letclient/ssh","clientssh").run("www.botreck.com.apidsl")'
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
apidsl --get "deployment.get.txt"
apidsl --run "www.botreck.com.apidsl"
```


## STOP






---

+ [edit](https://github.com/apidsl/docs/edit/main/README.md)
+ [apidsl/docs](https://github.com/apidsl/docs)
