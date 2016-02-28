#!/usr/bin/env bash

if [ ! -d "in" ]
  then
    mkdir in
fi


if [ ! -f "in/notebooks_of_davinci.txt" ]
  then
    curl http://www.gutenberg.org/files/5000/5000-8.txt | sed -e 's/[[:punct:]]/ /g' > "in/trim_notebooks_of_davinci.txt"
fi

if [ ! -f "in/ulysses.txt" ]
  then
    curl http://www.gutenberg.org/cache/epub/4300/pg4300.txt | sed -e 's/[[:punct:]]/ /g' > "in/trim_ulysses.txt"
fi

if [ ! -f "in/outline_of_science.txt" ]
  then
    curl http://www.gutenberg.org/cache/epub/20417/pg20417.txt | sed -e 's/[[:punct:]]/ /g' >  "in/trim_outline_of_science.txt"
fi
