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
(set-frame-font "FiraCode Nerd Font Mono-18" nil t)

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
(use-package evil :init (evil-mode 1))
(use-package evil-surround)
(use-package evil-snipe)
(use-package evil-numbers)

;; Ivy
(use-package ivy :init (ivy-mode 1))
(use-package vertico :init (vertico-mode 1))

;; eye candy
(use-package all-the-icons)
(use-package doom-modeline :init (doom-modeline-mode 1))
(use-package doom-themes :init (load-theme 'doom-monokai-classic))
(use-package hl-todo)
(use-package vterm)

;; Magit
(use-package magit)
