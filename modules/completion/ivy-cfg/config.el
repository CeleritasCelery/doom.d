;;; completion/ivy-cfg/config.el -*- lexical-binding: t; -*-

(defun $counsel-rg-here ()
  "Call ripgrep in the directory at point."
  (interactive)
  (counsel-rg nil default-directory))

(setq ivy-extra-directories nil)

(evil-ex-define-cmd "rg" '$counsel-rg-here)
