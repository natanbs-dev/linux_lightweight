#!/bin/bash

echo "verificando quantas threads tem o seu processador"
grep processor /proc/cpuinfo | wc -l

echo "teste de multi-threads"
sysbench cpu run --threads=<threads>

echo "teste de memória"
sysbench memory run
