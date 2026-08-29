SHELL := /usr/bin/env bash

SCRIPT := ./dbx-gaming-deploy

.PHONY: help run debug dry-run check status

help:
	@printf '%s\n' 'Targets:'
	@printf '%s\n' '  make run      Lance la TUI'
	@printf '%s\n' '  make debug    Lance la TUI en dry-run'
	@printf '%s\n' '  make check    Verifie la syntaxe bash'
	@printf '%s\n' '  make status   Affiche le statut git'

run:
	$(SCRIPT)

debug dry-run:
	$(SCRIPT) --debug

check:
	bash -n dbx-gaming-deploy

status:
	git status --short
