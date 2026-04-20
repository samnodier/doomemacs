;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Iosevka Nerd Font" :size 16))
(setq doom-theme 'doom-dracula)
(setq display-line-numbers-type 'relative)
(setq org-directory "~/org/")

(after! evil
  (setq evil-escape-key-sequence "jk"
        evil-escape-delay 0.2))

(setq +format-on-save-enabled-modes t)

(map! :n "-" #'dired-jump)

(after! eglot
  (add-to-list 'eglot-server-programs
               '(python-mode . ("pyright-langserver" "--stdio")))
  (add-to-list 'eglot-server-programs
               '(sql-mode . ("sqls"))))

(use-package! evil-matchit
  :config
  (global-evil-matchit-mode 1))

(after! apheleia
  (setf (alist-get 'web-mode apheleia-mode-alist) 'prettier)
  (setf (alist-get 'html-mode apheleia-mode-alist) 'prettier)
  (setf (alist-get 'css-mode apheleia-mode-alist) 'prettier)
  (setf (alist-get 'sql-mode apheleia-mode-alist) 'pgformatter))
