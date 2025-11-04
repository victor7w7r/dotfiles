;;; init.el -*- lexical-binding: t; -*-

(doom! :completion
       (corfu +dabbrev +icons)
       (vertico +icons)

       :ui
       doom
       doom-dashboard
       (emoji +unicode +github)
       hl-todo
       indent-guides
       ligatures
       minimap
       modeline
       ophints
       (popup +defaults)
       tabs
       (treemacs +lsp)
       (vc-gutter +pretty)
       vi-tilde-fringe
       (window-select +numbers +switch-window)
       ;;(workspaces +tabs)
       (zen +writeroom-mode)

       :editor
       (evil +everywhere)
       file-templates
       fold
       (format +onsave)
       ;;god
       multiple-cursors
       parinfer
       rotate-text
       snippets
       (whitespace +guess +trim)
       word-wrap

       :emacs
       (dired +dirvish +icons)
       electric
       eww
       (ibuffer +icons)
       tramp
       undo
       vc

       :term
       eshell
       vterm

       :checkers
       (syntax +childframe +flymake +icons)

       :tools
       debugger
       direnv
       (docker +lsp +tree-sitter)
       editorconfig
       (eval +overlay)
       llm
       (lookup +docsets +dictionary)
       (lsp +peek)
       magit
       make
       pdf
       tmux
       tree-sitter

       :os
       tty

       :lang
       data
       (dart +flutter +lsp +tree-sitter)
       emacs-lisp
       (java +lsp +tree-sitter)
       (javascript +lsp +tree-sitter)
       (json +lsp +tree-sitter)
       (kotlin +lsp +tree-sitter)
       (markdown +tree-sitter)
       (nix +lsp +tree-sitter)
       (python +lsp +tree-sitter +pyright +pyenv)
       (rest +jq)
       (rust +lsp +tree-sitter)
       (sh +powershell +lsp)
       (web +lsp +tree-sitter)
       (yaml +tree-sitter)

       :config
       (default +bindings +smartparens))
