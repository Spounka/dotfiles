;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq org-directory "~/org/")

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Nazih Boudaakkar"
      user-mail-address "nazih.boudaakkar@proton.me")

(setq doom-font         (font-spec :family "FiraCode Nerd Font" :size 18 :weight 'regular)
      doom-big-font     (font-spec :family "CodeNewRoman Nerd Font" :size 18 :weight 'semi-bold)
      doom-serif-font   (font-spec :family "FiraCode Nerd Font" :size 18 :weight 'regular)
)

(setq doom-theme 'doom-tokyo-night)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)
