;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Mouse
(xterm-mouse-mode 1)
(setq mouse-drag-copy-region t)
(context-menu-mode 1)
(global-set-key [mouse-4] 'scroll-down-line)
(global-set-key [mouse-5] 'scroll-up-line)

(menu-bar-mode 1)
(tool-bar-mode 1)
(scroll-bar-mode 1)

(setq doom-theme 'doom-one)
(setq display-line-numbers-type t)
(setq org-directory "~/org/")

;; UI
(setq doom-modeline-height 25
      doom-modeline-icon t
      doom-modeline-buffer-file-name-style 'truncate-with-project)

(use-package centaur-tabs
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-style "bar"
        centaur-tabs-set-icons t
        centaur-tabs-set-bar 'under
        centaur-tabs-set-modified-marker t
        centaur-tabs-height 32))
(global-set-key (kbd "M-{") 'centaur-tabs-backward)
(global-set-key (kbd "M-}") 'centaur-tabs-forward)
(global-set-key (kbd "C-p") 'projectile-find-file)
(global-set-key (kbd "C-S-p") 'execute-extended-command)
(global-set-key (kbd "C-/") 'comment-line)
(global-set-key (kbd "C-b") 'treemacs)
(global-set-key (kbd "<C-tab>") 'next-buffer)
(global-set-key (kbd "<C-S-tab>") 'previous-buffer)

;; Code
(after! lsp-mode
  (setq lsp-enable-snippet t
        lsp-headerline-breadcrumb-enable t
        lsp-modeline-code-actions-enable t))

(setq company-idle-delay 0.2
      company-minimum-prefix-length 1)

(setq evil-disable-insert-state-bindings t)

;; Init
(setq treemacs-width 30)
(setq minimap-width-fraction 0.1)
(setq minimap-window-location 'right)