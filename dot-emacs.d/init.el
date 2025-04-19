;; disable package.eL loading init.el at startup
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
  ;; (evil-define-key nil 'global (kbd "C-h") 'evil-window-left)
  (evil-define-key 'normal 'global (kbd "<leader>g") 'magit-status)
  (evil-define-key 'normal 'global (kbd "<leader>:") 'execute-extended-command))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-surround
  :after evil
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package evil-snipe)
(use-package evil-numbers)
(use-package which-key :init (which-key-mode))

;; Ivy
(use-package ivy :init (ivy-mode 0))
(use-package vertico :init (vertico-mode 1))
(use-package vertico-posframe
  :ensure t
  :init (vertico-posframe-mode 1))
(use-package savehist :init (savehist-mode))

;; eye candy
(use-package all-the-icons)
(use-package doom-modeline :init (doom-modeline-mode 1))
(use-package doom-themes
  :init (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
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
  :after evil)

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
  (add-hook 'c++-ts-mode-hook' #'lsp-deferred)
  (add-hook 'c-ts-mode-hook' #'lsp-deferred)
  (add-hook 'python-ts-mode-hook' #'lsp-deferred)
  (add-hook 'go-ts-mode-hook' #'lsp-deferred)
  (add-hook 'js-ts-mode-hook' #'lsp-deferred)
  (add-hook 'typescript-ts-mode-hook' #'lsp-deferred)
  (add-hook 'java-ts-mode-hook' #'lsp-deferred)
  (add-hook 'latex-mode-hook' #'lsp-deferred))

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

(use-package lsp-treemacs)
(use-package dap-mode)
