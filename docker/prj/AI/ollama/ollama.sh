#!/bin/bash
tf=/tmp
ollama ps &> /dev/null

if [ $? -ne 0 ]; then
  echo "Starting Ollama"
  rm -rf $tf/ollama.*
  ollama serve &> $tf/ollama.log &
  echo "$!" > $tf/ollama.pid
  sleep 2
  echo -e "Ollama Started!\c"
else
  echo -e "Ollama already started!\c"
fi

opid=`cat ${tf}/ollama.pid`
echo -e "(PID:$opid)"

if [ "$1" = "k" ]; then
  kill -9 $opid
  rm -rf $tf/ollama.pid
  echo "Ollama killed!"
  exit 0
elif [ "$1" = "s" ]; then
  ollama ps
  echo
  ollama ls
  exit 0
fi

ollama $@