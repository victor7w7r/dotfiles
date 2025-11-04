;;; init.el -*- lexical-binding: t; -*-

(doom! :completion
       (company +childframe +tng)
       (corfu +dabbrev +icons)
       (vertico +icons)

       :ui
       doom
       doom-dashboard
       (emoji +unicode)
       hl-todo
       indent-guides
       ligatures
       minimap
       modeline
       ophints
       (popup +defaults)
       tabs
       treemacs
       (vc-gutter +pretty)
       window-select
       ;;(workspaces +tabs)
       zen

       :editor
       (evil +everywhere)
       file-templates
       fold
       (format +onsave)  ; automated prettiness
       ;;god               ; run Emacs commands without modifier keys
       multiple-cursors  ; editing in many places at once
       ;;objed             ; text object editing for the innocent
       parinfer          ; turn lisp into python, sort of
       ;;rotate-text       ; cycle region at point between text candidates
       snippets
       (whitespace +guess +trim)  ; a butler for your whitespace
       ;;word-wrap         ; soft wrapping with language-aware indent

       :emacs
       (dired +dirvish +icons)
       electric          ; smarter, keyword-based electric-indent
       ;;eww               ; the internet is gross
       ;;ibuffer           ; interactive buffer management
       tramp             ; remote files at your arthritic fingertips
       undo              ; persistent, smarter undo for your inevitable mistakes
       vc                ; version-control and Emacs, sitting in a tree

       :term
       eshell
       vterm

       :checkers
       syntax

       :tools
       debugger
       direnv
       docker
       editorconfig
       (eval +overlay)
       (lookup +docsets +dictionary)
       lsp
       (magit +childframe +forge)
       pdf
       tmux
       tree-sitter

       :os
       tty

       :lang
       (data +tree-sitter)
       (dart +flutter +lsp +tree-sitter)
       emacs-lisp
       (java +lsp +tree-sitter)
       (javascript +lsp +tree-sitter)
       (json +tree-sitter)
       (kotlin +lsp +tree-sitter)
       (markdown +tree-sitter)
       (nix +lsp +tree-sitter)
       (python +lsp +tree-sitter +pyright)
       rest
       (rust +lsp +tree-sitter)
       (sh +powershell +lsp)
       (toml +tree-sitter)
       (typescript +lsp +tree-sitter)
       (web +lsp +tree-sitter)
       (yaml +tree-sitter)

       :email
       (mu4e +mbsync +fastmail +org +icons)

       :config
       (default +bindings +smartparens))
