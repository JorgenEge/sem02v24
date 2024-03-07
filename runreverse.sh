#!/bin/bash
GITHUBUSER="...fyll inn ditt brukernavn på Github ..."
BASE="${HOME}/github.com/${GITHUBUSER}/fil/sem02v24"
cd ${BASE}/c 
echo -e "\n----- C --------"
time ./reverse
cd ${BASE}/csharp
echo -e "\n----- C# -------"
time mono reverse-bytes-of-file.exe 
cd ${BASE}/java
echo -e "\n----- Java -----"
time java ReverseBytesOfFile
cd ${BASE}/go
echo -e "\n----- Go -------"
time ./reverse 
cd ${BASE}/rust
echo -e "\n----- Rust -----"
time ./reverse-rust
cd ${BASE}/python
echo -e "\n------Python ---"
time python3 reverse-python.py
