;;; completion/ivy-cfg/config.el -*- lexical-binding: t; -*-

(use-package! ivy
  :general
  (ivy-minibuffer-map
   "C-r" #'ivy-reverse-i-search)
  :custom
  (ivy-extra-directories nil "don't add hardlinks to completion")
  :config
  ;; run after doom
  (setq ivy-re-builders-alist '((t . ivy--regex-ignore-order))))

(defun $counsel-rg-here ()
  "Call ripgrep in the directory at point."
  (interactive)
  (counsel-rg nil default-directory))

(after! evil
  (evil-ex-define-cmd "rg" '$counsel-rg-here))
