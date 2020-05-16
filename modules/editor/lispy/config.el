;;; editor/lispy/config.el -*- lexical-binding: t; -*-

(use-package! lispyville
  :when (featurep! :editor evil)
  :hook ((lisp-mode . lispyville-mode)
         (emacs-lisp-mode . lispyville-mode))
  :config
  (lispyville--define-key 'normal
    "(" #'lispyville-wrap-round)
  (lispyville-set-key-theme
   '(operators
     c-w
     prettify
     text-objects
     commentary
     slurp/barf-cp
     additional
     additional-insert
     additional-wrap))
  (defadvice! $lispy-wrap-adjust-paren (_arg)
    :before #'lispy-wrap-round
    (when (eq ?\) (char-syntax (char-after)))
      (evil-jump-item)))
  (defadvice! $lispy-wrap-with-quote (_arg)
    :after #'lispy-wrap-round
    (when (looking-at-p "[`',]")
      (backward-char)
      (delete-char 1)
      (forward-char)
      (insert "("))))
