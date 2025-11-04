;;; $DOOMDIR/config.el -*- lexical-binding: t; -*

;;
;; Clipboard
(setq wl-copy-process nil
      wl-paste-process nil)

(defun wl-copy (text)
  (setq wl-copy-process (make-process :name "wl-copy"
                                      :buffer nil
                                      :command '("wl-copy" "-f" "-n")
                                      :connection-type 'pipe))
  (process-send-string wl-copy-process text)
  (process-send-eof wl-copy-process))

(defun wl-paste ()
  (if (and wl-paste-process (process-live-p wl-paste-process))
      (with-temp-buffer
        (insert ""))
    (shell-command-to-string "wl-paste -n")))

(setq interprogram-cut-function 'wl-copy)
(setq interprogram-paste-function 'wl-paste)
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
;;(tool-bar-mode 1)

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

(global-set-key (kbd "C-S-p") 'execute-extended-command)
(global-set-key (kbd "C-/") 'comment-line)
(global-set-key (kbd "C-b") 'treemacs)
(global-set-key (kbd "<C-tab>") 'next-buffer)
(global-set-key (kbd "<C-S-tab>") 'previous-buffer)

(global-set-key (kbd "C-a") 'mwim-beginning)
(global-set-key (kbd "C-e") 'mwim-end)

(setq demap-minimap-window-side  'right)
(setq demap-minimap-window-width 15)

;;(use-package colorful-mode)
(setq display-line-numbers-type t)

(setq doom-modeline-height 22
      doom-modeline-icon t
      doom-modeline-env-version t
      doom-modeline-buffer-encoding t
      doom-modeline-buffer-file-name-style 'truncate-except-project
      doom-modeline-indent-info t
      doom-modeline-lsp t
      doom-modeline-lsp-icon t
      doom-modeline-major-mode-icon t
      doom-modeline-major-mode-color-icon t
      doom-modeline-modal t
      doom-modeline-modal-modern-icon t
      doom-modeline-percent-position nil
      doom-modeline-time-live-icon t
      doom-modeline-vcs-display-function #'doom-modeline-vcs-name
      doom-modeline-vcs-icon t
      doom-modeline-vcs-max-length 15
      doom-modeline-vcs-state-faces-alist
      '((needs-update . (doom-modeline-warning bold))
        (removed . (doom-modeline-urgent bold))
        (conflict . (doom-modeline-urgent bold))
        (unregistered . (doom-modeline-urgent bold)))
      doom-modeline-workspace-name t)

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
(move-text-default-bindings)
(require 'quickrun)
(setq treemacs-width 30)
(require 'ws-butler)

(setq projectile-project-search-path '("~/repositories/" "~/repositories/TCM/"))

;;
;; Mouse
(xterm-mouse-mode 1)
(setq mouse-drag-copy-region t)
(global-set-key [mouse-4] 'scroll-down-line)
(global-set-key [mouse-5] 'scroll-up-line)

;;
;; Hooks

;;(add-hook 'rust-mode-hook 'ws-butler-mode)

(add-hook 'find-file-hook
          (lambda()
            (when (and buffer-file-name
                       (not (minibufferp))
                       (not (string-match-p "^\\*" (buffer-name)))
                       (derived-mode-p 'prog-mode)
                       (not (get-buffer "*demap*")))
              (demap-open)
              (setq-local show-trailing-whitespace nil)
              (when (bound-and-true-p whitespace-mode)
                (whitespace-mode -1))
              (setq-local display-line-numbers nil)
              (setq-local global-hl-line-mode nil)
              (text-scale-set -1))))

(after! projectile
  (add-hook 'projectile-after-switch-project-hook
            (lambda ()
              (treemacs-add-and-display-current-project)
              (treemacs-select-window))))

(after! doom-themes
  (custom-set-faces!
    '(menu :background "#1e1e2e" :foreground "#cdd6f4")
    '(popup-menu :background "#1e1e2e" :foreground "#cdd6f4")
    '(popup-menu-mouse-face :background "#45475a" :foreground "#f5c2e7" :weight bold)
    '(popup-menu-selection :background "#45475a" :foreground "#f5c2e7" :weight bold)
    '(menu-bar :background "#313244" :foreground "#f5c2e7")))

(with-eval-after-load 'treemacs
  (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action))

(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-language-id-configuration '(dart-ts-mode . "dart")))
