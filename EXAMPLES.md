
## EXAMPLES [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/apidsl/download/edit/main/EXAMPLES.md)



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

