;;; -*- lexical-binding: t -*-
;;; init.el --- emacs config file
;;; disable package.eL loading init.el at startup
(setq package-enable-at-startup nil)
;; custom variables file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
;; Remove default menu bar stuff
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen 1)
(setq ring-bell-function 'ignore)
(setq display-line-numbers-type 'relative)
(global-hl-line-mode 1)
(column-number-mode 1)
(global-display-line-numbers-mode 1)

(add-to-list 'completion-styles-alist '("flex" "partial-completion"))

;; Font settings
(set-face-attribute 'default nil :font "Iosevka Nerd Font Mono" )
(set-frame-font "Iosevka Nerd Font Mono-18" nil t)
(add-to-list 'default-frame-alist '(font . "Iosevka Nerd Font Mono-18"))

;; Package Manager
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(use-package straight
  :custom
  (straight-use-package-by-default t))
(use-package el-patch)

;; Evil mode
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (evil-set-leader 'normal (kbd "SPC"))
  (evil-set-leader 'normal (kbd "\\") t)
  (evil-set-leader 'emacs (kbd "\\") t)

  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-d-scroll t)
  (setq evil-want-C-w-in-emacs-state t)
  (setq evil-want-Y-yank-to-eol t)
  (setq evil-indent-convert-tabs nil)
  (setq evil-shift-round nil)

  (evil-define-key 'normal 'global (kbd "gc") 'comment-line)
  (evil-define-key nil 'global (kbd "C-j") 'evil-window-down)
  (evil-define-key nil 'global (kbd "C-k") 'evil-window-up)
  (evil-define-key nil 'global (kbd "C-l") 'evil-window-right)
  (evil-define-key '(normal insert visual motion replace) 'global (kbd "C-h") 'evil-window-left)
  (evil-define-key 'normal 'global (kbd "<leader>g") 'magit-status)
  (evil-define-key 'normal 'global (kbd "<leader>op") 'treemacs)
  (evil-define-key 'normal 'global (kbd "<leader>pc") 'compile)
  (evil-define-key 'normal 'global (kbd "<leader>pe") 'async-shell-command)
  (evil-define-key 'normal 'global (kbd "<leader>:") 'execute-extended-command))

(use-package evil-collection
  :after evil
  :ensure t
  :custom
  (evil-collection-setup-minibuffer t)
  :init
  (evil-collection-init))

(use-package evil-surround
  :after evil
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package evil-snipe :init (evil-snipe-mode))
(use-package evil-numbers)
(use-package which-key :init (which-key-mode))

(use-package vertico :init (vertico-mode 1))
(use-package vertico-posframe
  :ensure t
  :init (vertico-posframe-mode 1))
(use-package savehist :init (savehist-mode))

;; eye candy
(use-package all-the-icons)
(use-package doom-modeline :init (doom-modeline-mode 1))
(use-package doom-themes
  :init
  (setq doom-themes-enable-bold t)
  (setq doom-themes-enable-italic t)
  :config
  (load-theme 'doom-monokai-classic)
  (doom-themes-org-config))

(use-package hl-todo :config (global-hl-todo-mode 1))
(use-package vterm)

;; Magit
(use-package magit)

;; compile-mode
(use-package ansi-color
  :ensure nil
  :config
  (add-hook 'compilation-filter-hook 'ansi-color-compilation-filter))


;; markdown
(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
         ("C-c C-e" . markdown-do)))

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist
             '("\\.\\(?:md\\|markdown\\|mkd\\|mdown\\|mkdn\\|mdwn\\)\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

(with-eval-after-load 'markdown-mode
  (define-key markdown-mode-map (kbd "C-c C-e") #'markdown-do))

;; Projectile
(use-package projectile
  :ensure t)

;; Treemacs with integration of other stuff
(use-package treemacs)
(use-package treemacs-evil
  :ensure t
  :after (evil treemacs))

(use-package treemacs-projectile
  :ensure t
  :after projectile)

(use-package lsp-treemacs
  :ensure t
  :after (lsp treemacs))

;; LSP
(use-package lsp-mode
  :ensure t
  :config
  (add-hook 'c++-ts-mode-hook' #'lsp)
  (add-hook 'c-ts-mode-hook' #'lsp)
  (add-hook 'go-ts-mode-hook' #'lsp)
  (add-hook 'js-ts-mode-hook' #'lsp)
  (add-hook 'typescript-ts-mode-hook' #'lsp)
  (add-hook 'java-ts-mode-hook' #'lsp)
  (add-hook 'latex-mode-hook' #'lsp))

(use-package lsp-pyright
  :ensure t
  :custom (lsp-pyright-langserver-command "pyright") ;; or basedpyright
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred


(add-to-list 'load-path "~/.emacs.d/tree-sitter/lib")

(use-package lsp-ui :after lsp-mode)

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-company-mode))

(use-package dap-mode :ensure t)

;; poetry mode
(use-package
  poetry
  :straight
  (poetry :type git :host github :repo "emil-vdw/emacs-poetry")
  :bind (("C-c m" . poetry-transient)))


;; Org mode
;; (setq org-hide-emphasis-markers t)
;; (use-package org-bullets
;;     :config
;;     (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; ;; Resize Org headings
;; ;; (dolist (face '((org-level-1 . 1.35)
;; ;;                 (org-level-2 . 1.3)
;; ;;                 (org-level-3 . 1.2)
;; ;;                 (org-level-4 . 1.1)
;; ;;                 (org-level-5 . 1.1)
;; ;;                 (org-level-6 . 1.1)
;; ;;                 (org-level-7 . 1.1)
;; ;;                 (org-level-8 . 1.1)))
;; ;;   (set-face-attribute (car face) nil :font "Iosevka Nerd Font" :weight 'bold :height (cdr face)))

;; ;; ;; Make the document title a bit bigger
;; (set-face-attribute 'org-document-title nil :font "Iosevka NF" :weight
;; 'bold :height 1.8)

;; (require 'org-indent)
;; (set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))

;; (set-face-attribute 'org-block nil            :foreground nil :inherit
;; 'fixed-pitch :height 0.85)
;; (set-face-attribute 'org-code nil             :inherit '(shadow fixed-pitch) :height 0.85)
;; (set-face-attribute 'org-indent nil           :inherit '(org-hide fixed-pitch) :height 0.85)
;; (set-face-attribute 'org-verbatim nil         :inherit '(shadow fixed-pitch) :height 0.85)
;; (set-face-attribute 'org-special-keyword nil  :inherit '(font-lock-comment-face
;; fixed-pitch))
;; (set-face-attribute 'org-meta-line nil        :inherit '(font-lock-comment-face fixed-pitch))
;; (set-face-attribute 'org-checkbox nil         :inherit 'fixed-pitch)

;; (add-hook 'org-mode-hook 'variable-pitch-mode)

;; ;; only enable in case of latex preview problems

;; ;; (plist-put org-format-latex-options :scale 2)

;; (setq org-adapt-indentation t
;;       org-hide-leading-stars t
;;       org-hide-emphasis-markers t
;;       org-pretty-entities t
;;       org-ellipsis "  ·")

;; (setq org-src-fontify-natively t
;; 	  org-src-tab-acts-natively t
;;       org-edit-src-content-indentation 0)

;; (add-hook 'org-mode-hook 'visual-line-mode)

;; (use-package olivetti)
;; (add-hook 'org-mode-hook 'olivetti-mode)


(use-package org-superstar
  :ensure t
  :hook (org-mode . org-superstar-mode)
  :custom
  (org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●")))

(setq org-hide-emphasis-markers t)

(add-hook 'org-mode-hook #'variable-pitch-mode)
(set-face-attribute 'fixed-pitch nil :family "Iosevka Nerd Font Mono")
(set-face-attribute 'variable-pitch nil :family "LiterationMono Nerd Font")

(setq org-startup-indented t
      org-fontify-whole-heading-line t
      org-fontify-quote-blocks t
      org-fontify-todo-headline t)

(use-package org-modern
  :ensure t
  :hook (org-mode . org-modern-mode)
  :config
  (setq org-modern-star '("✷" "✸" "✹" "✺" "✻"))
  (setq org-modern-table-vertical 0.5))

;; (setq org-export-dispatch-use-expert-ui t)
(use-package toc-org
  :ensure t
  :hook (org-mode . toc-org-mode)
  :config
  ;; Optional: customize maximum depth (default 2) or link style:
  ;; (setq toc-org-href-style "github")
  )



;; compilation mode
(with-eval-after-load 'compile
  ;; Remove Doom’s ANSI-color hook (Emacs < 28 uses doom-apply-ansi-color-to-compilation-buffer-h)
  (remove-hook 'compilation-filter-hook #'doom-apply-ansi-color-to-compilation-buffer-h)
  ;; Use the built-in ANSI color filter
  (add-hook 'compilation-filter-hook #'ansi-color-compilation-filter))

(add-hook 'compilation-filter-hook #'comint-truncate-buffer)

(setq compilation-scroll-output 'first-error
      compilation-auto-jump-to-first-error t)

(setq compilation-ask-about-save nil)
