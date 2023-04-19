#!/bin/bash

set -e

python3 ./oppo_decrypt/ofp_qc_decrypt.py $(find -type f -iname '*.ofp') out
rmdir out  # A bug in the decryptor

outdir=$(find -type d -name 'out')
cd "$outdir"

./7zz -mmt20 -mx9 a decrypted.7z * .*

curl -sL https://git.io/file-transfer | sh

./transfer wet decrypted.7z
