;;; $DOOMDIR/config.el -*- lexical-binding: t; -*

;;
;; AI
(use-package chatgpt-shell
  :ensure t
  :custom
  ((chatgpt-shell-openai-key
    (lambda ()
      (auth-source-pass-get 'secret "openai-key")))))

;;
;; Code
(setq company-idle-delay 0.2
      company-minimum-prefix-length 1)
(setq evil-disable-insert-state-bindings t)
(after! lsp-mode
  (setq lsp-enable-snippet t
        lsp-headerline-breadcrumb-enable t
        lsp-modeline-code-actions-enable t))
(use-package! lsp-tailwindcss :after lsp-mode)
(require 'toggle-quotes)
(global-set-key (kbd "C-'") 'toggle-quotes)

;;
;; Games / Decoration
(setq zone-timer (run-with-idle-timer 120 t 'zone))
(use-package parrot
  :config
  (parrot-mode))

;;
;; UI
(context-menu-mode 1)
(menu-bar-mode 1)
(tool-bar-mode 1)
(scroll-bar-mode 1)

(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

(beacon-mode 1)
(use-package bm
         :ensure t
         :demand t

         :init
         (setq bm-restore-repository-on-load t)


         :config
         (setq bm-cycle-all-buffers t)
         (setq bm-repository-file "~/.emacs.d/bm-repository")
         (setq-default bm-buffer-persistence t)
         (add-hook 'after-init-hook 'bm-repository-load)
         (add-hook 'kill-buffer-hook #'bm-buffer-save)
         (add-hook 'kill-emacs-hook #'(lambda nil
                                          (bm-buffer-save-all)
                                          (bm-repository-save)))
         (add-hook 'after-save-hook #'bm-buffer-save)
         (add-hook 'find-file-hooks   #'bm-buffer-restore)
         (add-hook 'after-revert-hook #'bm-buffer-restore)
         (add-hook 'vc-before-checkin-hook #'bm-buffer-save)

         :bind (("<f2>" . bm-next)
                ("S-<f2>" . bm-previous)
                ("C-<f2>" . bm-toggle)))

(use-package centaur-tabs
  :config
 (centaur-tabs-mode t)
 (setq centaur-tabs-style "bar"
       centaur-tabs-set-icons t
       centaur-tabs-set-bar 'under
       centaur-tabs-set-modified-marker t
       centaur-tabs-height 32)
 (global-set-key (kbd "M-{") 'centaur-tabs-backward)
 (global-set-key (kbd "M-}") 'centaur-tabs-forward)
 (global-set-key (kbd "C-p") 'projectile-find-file)
 (global-set-key (kbd "C-S-p") 'execute-extended-command)
 (global-set-key (kbd "C-/") 'comment-line)
 (global-set-key (kbd "C-b") 'treemacs)
 (global-set-key (kbd "<C-tab>") 'next-buffer)
 (global-set-key (kbd "<C-S-tab>") 'previous-buffer))

(global-set-key (kbd "C-a") 'mwim-beginning)
(global-set-key (kbd "C-e") 'mwim-end)

;;(use-package colorful-mode)
(setq display-line-numbers-type t)
(setq doom-modeline-height 25
      doom-modeline-icon t
      doom-modeline-buffer-file-name-style 'truncate-with-project)
(setq doom-theme 'doom-tokyo-night)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
(with-eval-after-load 'evil
  (require 'evil-anzu))
(global-evil-mc-mode  1)
(require 'evil-goggles)
(require 'hungry-delete)
(global-hungry-delete-mode)
(use-package literate-calc-mode
  :ensure t)
(lsp-treemacs-sync-mode 1)
(setq minimap-width-fraction 0.1)
(setq minimap-window-location 'right)
(move-text-default-bindings)
(require 'quickrun)
(setq treemacs-width 30)
(require 'ts-fold)
(require 'ws-butler)
(global-yascroll-bar-mode 1)

;;
;; Mouse
(xterm-mouse-mode 1)
(setq mouse-drag-copy-region t)
(global-set-key [mouse-4] 'scroll-down-line)
(global-set-key [mouse-5] 'scroll-up-line)

;;
;; Hooks
(add-hook 'rust-mode-hook 'ws-butler-mode)
