[![.github/workflows/main.yml](https://github.com/digarok/apple2-assembly-github-actions-ci-example/actions/workflows/main.yml/badge.svg)](https://github.com/digarok/apple2-assembly-github-actions-ci-example/actions/workflows/main.yml)

# apple2-assembly-github-actions-ci-example
Example project showing how to achieve Continuous Integration with Github Actions to assemble 65xx source, package it in a ProDOS disk image, and release it on Github.

# Explanation
This project contains a 6502 assembly language source file called `src/example.s` that can be assembled and run on an Apple II.  

But how do we do that?

We use Github Actions to install the Merlin32 assembler and CADIUS disk image tool to assemble our source file and put the resulting object on a disk image.  

See the project's [`.github/workflows/main.yml`](https://github.com/digarok/apple2-assembly-github-actions-ci-example/blob/master/.github/workflows/main.yml) file to understand how it is automatically built using  Github Action.

## How it works
The main project workflow file above has the following logic:

- Any time new code is pushed:
    - Build it with Merlin32 and report back success
- Any time we push a new version tag:
    - Build it with Merlin32 
    - Create a new ProDOS disk image with Cadius
    - Copy ProDOS system and our assembled objects to the image
    - Upload the new disk image to our Github Release page for anyone to download and use immediately!

Uses:
- [`digarok/install-merlin32-action@v0.1.2`](https://github.com/marketplace/actions/install-merlin32-action)
- [`digarok/install-cadius-action@v0.1.2`](https://github.com/marketplace/actions/install-cadius-action)
