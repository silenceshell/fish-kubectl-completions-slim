# kubectl completion for fish shell slim

## Why

This project is inspired by [fish-kubectl-completions](https://github.com/evanlucas/fish-kubectl-completions.git).

Why not use that project directly? It works **VERY** slowly on my workstation, normally I have to wait up to 10 to 20 seconds for the output.

So I decided to write a slim one, and it works quite well.

## Install

```fish
$ mkdir -p ~/.config/fish/completions
$ cd ~/.config/fish
$ git clone https://github.com/silenceshell/fish-kubectl-completions-slim.git
$ cp ./fish-kubectl-completions-slim/kubectl.fish completions/
```

Relogin to fish and enjoy!

## Author

silenceshell
