;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Iosevka Nerd Font" :size 16))
(setq doom-theme 'doom-dracula)
(setq display-line-numbers-type 'relative)
(setq org-directory "~/org/")

;; Task management
(after! org
  ;; Files the agenda watches
  (setq org-agenda-files '("~/org/inbox.org"
                           "~/org/projects.org"
                           "~/org/someday.org"))

  ;; Todo states with handy shortcuts
  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

  ;; Where captured tasks land by default
  (setq org-default-notes-file "~/org/inbox.org")

  ;; Capture templates
  (setq org-capture-templates
        '(("t" "Task" entry
           (file "~/org/inbox.org")
           "* TODO %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n")
          ("n" "Next action" entry
           (file "~/org/inbox.org")
           "* NEXT %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n")
          ("j" "Journal / note" entry
           (file+datetree "~/org/journal.org")
           "* %?\n%U\n"))))

(after! evil
  (setq evil-escape-key-sequence "jk"
        evil-escape-delay 0.2))

(setq +format-on-save-enabled-modes t)

(map! :n "-" #'dired-jump
      :leader
      "x" #'org-capture
      "X" #'doom/open-scratch-buffer)

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
