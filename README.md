
![logo.apidsl.com](https://logo.apidsl.com/1/cover.png)

# [Sourcecode - bash.apidsl.com](https://bash.apidsl.com/) [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/apidsl/bash/edit/main/DOCS/MENU.md) 

+ [Examples - examples.apidsl.com](http://examples.apidsl.com)
+ [Documentation - docs.apidsl.com](https://docs.apidsl.com/)
+ [Blog - www.apidsl.com](https://www.apidsl.com/)
+ [Logotyp - logo.apidsl.com](https://logo.apidsl.com/)

+ [LICENSE](../LICENSE)



## About [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/apidsl/bash/edit/main/DOCS/ABOUT.md)

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



## Supported technologies  [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/apidsl/bash/edit/main/DOCS/SUPPORTED.md)


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


## EXAMPLES [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/apidsl/download/edit/main/EXAMPLES.md)

Rozwiązanie #apidsl służy pisaniu komend do wcześniej napisanych skryptów, bibliotek, aplikacji. Zamiast ścieżek do plików używamy nazw jako funkcji z parametrem. Korzyść? re-użycie kodu, zamiast refaktoryzacji! APIDSL to jedno z rozwiązań w (pisanej jeszcze) książce #hipermodularyzacja

API + DSL = Application Programming Interface controlled over Domain Specific Language
#apidsl is available for testing
#hypermodularity #hyperprogramming #mvp #prototyping #programming #testing

### install

[minsungson/GitHub-cURL: A guide to installing files from GitHub repos in terminal using cURL](https://github.com/minsungson/GitHub-cURL)

```bash
./apifork install
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
./apidsl.sh 'letwhois.ns("softreck.com")'
```

### loop

```bash
./apidsl.sh 'f.load("domains.txt").split("/n").f.http().f.xpath("title").f.appendToFile("titles.txt")'
```



## APIfoundation [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/apidsl/bash/edit/main/DOCS/APIFOUNDATION.md)

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
echo "#!/bin/bash" > "readme"
echo "./flatedit/readme.sh readme.txt" > "readme"
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


## About flatedit [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/apidsl/bash/edit/main/DOCS/FLATEDIT.md)


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


## Docs [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/apidsl/bash/edit/main/DOCS/DOCS.md)




### Zalezności ładowane z github

+ zamiast xpath - ładowanie zalezności przez skrypt github
+ letPath - przygotować
  https://github.com/letpath/bash


### Another examples

get options
https://reposhub.com/linux/system-utilities/ko1nksm-getoptions.html

https://github.com/ko1nksm/getoptions



## TODO [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/apidsl/bash/edit/main/DOCS/TODO.md)

### Mapowanie

skrypty zapisywać w folderze głównym

zamiast w folderach, kazdy skrypt z kropkami
jeśli piszemy 

letwhois.ns()
plik:
letwhois.ns.sh

kazda funkcja jest przepisywana żeby mieć do niej dostęp z jednego poziomu bez przechodzenia po folderach

uproszcenie zarządzania i wyswietlanie listy plików

każda funkcja i tak musi działać autopnimicznie

skrypt instalujący kopiuje wszystkie skrypty bezposrednio

https://github.com/letwhois/bash apidsl/apidsl/bash letwhois

apidsl/apidsl/bash/letwhois/reverseIp.sh 

repozytiorium
https://github.com/letwhois/bash

mapa funkcji
apidsl/apidsl/bash/letwhois/reverseIp.sh reverseIp

1. pobiera cale repo
https://github.com/letwhois/bash

2. wyodrebnia poprzez mapowanie
domainIp.sh domainIp
domainIp.sh letwhois.domainIp






#### mapowanie funkcji z linuxa:
curl().grep("ri",)

#### mapowanie funckji uslug w linux

#### mapowanie API
+ Skąd pobierać dane autoryzacyjne?
 


### Praktyczne przykłady
+ Example with plainedit
+ more loop options
+ many loop in one sentence

install
https://github.com/apidsl/ultimate-nmap-parser


### Inframonit

skanuje hosty
git clone https://github.com/desecsecurity/parsing_html_bash
./parsing_html.sh www.google.com


+ skrypty do detekcji
+ skrypty do naprawy
+ schematy naprawy / template w zalezności od sytuacji



http.get("https://web.com")

$('#cliente').click(function(){$('#container').load('/clienti/cliente.html');});

js.
import("https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js")
.get("https://web.com")
.xpath("title")
.print()


js.
console.log("clone")
jquery.get("simpleargs")
.nano("filename.txt","content")
.git("commit","-m","nowy plik")
.git("push");




### Preprocessing

Każdy z tych jest w fodlerze ze skryptami, gdzie kolejno podaje sie wartosci
+ values
+ context - before, next command


---

+ [edit](https://github.com/apidsl/bash/edit/main/README.md)
+ [apidsl/bash](https://github.com/apidsl/bash)
