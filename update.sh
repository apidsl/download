#!/bin/bash
set -x
rm -rf apifork
rm -rf flatedit
#rm -rf apipackage
curl https://raw.githubusercontent.com/apifork/bash/main/apifork.sh -o apifork
curl https://raw.githubusercontent.com/flatedit/bash/main/flatedit.sh -o flatedit
#curl https://raw.githubusercontent.com/apipackage/bash/main/apipackage.sh -o apipackage
./apifork update
./install_apidsl.sh