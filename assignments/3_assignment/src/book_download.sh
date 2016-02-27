#!/usr/bin/env bash

if [ ! -d "in" ]
  then
    mkdir in
fi


if [ ! -f "in/notebooks_of_davinci.txt" ]
  then
    curl -o "in/notebooks_of_davinci.txt" http://www.gutenberg.org/files/5000/5000-8.txt
fi

if [ ! -f "in/ulysses.txt" ]
  then
    curl -o "in/ulysses.txt" http://www.gutenberg.org/cache/epub/4300/pg4300.txt
fi

if [ ! -f "in/outline_of_science.txt" ]
  then
    curl -o "in/outline_of_science.txt" http://www.gutenberg.org/cache/epub/20417/pg20417.txt
fi
