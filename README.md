
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

# Documenttion

[Documentation as Code » IT spotyka klienta](https://www.michalbartyzel.pl/documentation-as-code/?utm_campaign=coschedule&utm_source=linkedin&utm_medium=Micha%C5%82%20Bartyzel&utm_content=Documentation%20as%20Code%20%C2%BB%20IT%20spotyka%20klienta)

> ### Narzędzia
>
> Żałuję, że nie mogę polecić ultraszybkiego edytora SublimeText3, ale czasem jego konfiguracja jest dość zagmatwana.
>
> Polecam za to [Visual Studio Code](https://code.visualstudio.com/) jako bardzo dobrą alternatywę wraz z wykazem nastepujących wtyczek do zainstalowania:
>
> -   [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one) – wspiera edycję plików `*md`,
> -   [Markdown Preview Enhanced](https://marketplace.visualstudio.com/items?itemName=shd101wyy.markdown-preview-enhanced) – zapewnia ładny podgląd edytowanych plików,
> -   [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint) – sprawdza poprawność składni Markdown,
> -   [Spell Right](https://marketplace.visualstudio.com/items?itemName=ban.spellright) – słownik danego języka,
> -   [Local History](https://marketplace.visualstudio.com/items?itemName=xyz.local-history) – pozwala śledzić lokalną historię zmian w pliku,
> -   [Git Extension Pack](https://marketplace.visualstudio.com/items?itemName=donjayamanne.git-extension-pack) – zestaw wtyczek wspierających pracę z Gitem.
>
> Markdown nie jest jedynym narzędziem. Równie popularny jest [AsciiDoctor](https://marpit.marp.app/). Ma więcej możliwości konfiguracyjnych i pozwala tworzyć bardziej złożone dokumenty. Jeśli opanujesz Markdown, przejście w pewnym momencie na AsciiDoctor będzie dość łatwe.
>
> # Diagramy
>
> Diagramy również są do ogarnięcia za pomocą tekstu.
>
> Jest wiele narzędzi do generowania diagramów z tekstu. Moje typy to:
>
> -   [Mermaid](https://mermaid-js.github.io/mermaid/#/) – 90% zastosowań
> -   [PlantUML](https://plantuml.com/) – do złożonych diagramów, zwłaszcza, gdy chcesz użyć wszystkich niuansów standardu UML 😛

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

# letPath



## DEPLOYMENT

run file
```bash
apidsl -d 'run("www.botreck.com.apidsl")'
```
run file
```bash
apidsl --import "https://github.com/letpath/bash" "path"
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
