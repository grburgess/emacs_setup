;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(setq debug-on-error t)

(menu-bar-mode 0)
(scroll-bar-mode 0)

(set-frame-font "Hack-14" nil t)


(defun xah-get-fullpath (@file-relative-path)
  
  (concat (file-name-directory (or load-file-name buffer-file-name)) @file-relative-path)

  )




; Temporary files cluttering up the space are annoying.  Here's how we
; can deal with them -- create a directory in your home directory, and
; save to there instead!  No more random ~ files.
(defvar user-temporary-file-directory
  "~/.emacs-autosaves/")
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
        (tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))





;;;;;  PACKAGES

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(setq package-enable-at-startup nil) (package-initialize)



;;;; email!
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e")

(require 'mu4e)

(load (xah-get-fullpath "~/coding/emacs_setup/mail.el"))


;;;; SMEX and IDO

(load (xah-get-fullpath "~/coding/emacs_setup/complete.el"))


;;;;;;;;;;;;;; LATEX

(load (xah-get-fullpath "~/coding/emacs_setup/latex.el"))

;;;;;;;;;;;; PYTHON

(load (xah-get-fullpath "~/coding/emacs_setup/python_setup.el"))



;; ORG

(load (xah-get-fullpath "~/coding/emacs_setup/org_setup.el"))




;;;;;;;;;;; DISPLAY


(load (xah-get-fullpath "~/coding/emacs_setup/view.el"))



;; (set-face-background 'highlight-indentation-face "#000000")
;; (set-face-background 'highlight-indentation-current-column-face "#000000")


(setq custom-safe-themes t)

(require 'ssh)
;; (add-hook 'ssh-mode-hook
;; 	  (lambda ()
;; 	    (setq ssh-directory-tracking-mode t)
;;                 (shell-dirtrack-mode t)
;;                 (setq dirtrackp nil)))

( setq tramp-default-method "ssh")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-fold-macro-spec-list
   (quote
    (("[c]"
      ("citep" "citet"))
     ("[f]"
      ("footnote" "marginpar"))
     ("[c]"
      ("cite"))
     ("[l]"
      ("label"))
     ("[r]"
      ("ref" "pageref" "eqref"))
     ("[i]"
      ("index" "glossary"))
     ("[1]:||*"
      ("item"))
     ("..."
      ("dots"))
     ("(C)"
      ("copyright"))
     ("(R)"
      ("textregistered"))
     ("TM"
      ("texttrademark"))
     (1
      ("part" "chapter" "section" "subsection" "subsubsection" "paragraph" "subparagraph" "part*" "chapter*" "section*" "subsection*" "subsubsection*" "paragraph*" "subparagraph*" "emph" "textit" "textsl" "textmd" "textrm" "textsf" "texttt" "textbf" "textsc" "textup")))))
 '(custom-enabled-themes (quote (kaolin-fusion)))
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(highlight-indent-guides-auto-enabled nil)
 '(highlight-indent-guides-auto-stack-even-face-perc 20)
 '(highlight-indent-guides-method (quote character))
 '(highlight-indent-guides-responsive (quote stack))
 '(inhibit-startup-buffer-menu t)
 '(org-agenda-files
   (quote
    ("~/org/projects.org" "~/org/notes.org" "~/org/publications.org")))
 '(org-log-into-drawer t)
 '(org-trello-current-prefix-keybinding "C-c o" nil (org-trello))
 '(org-trello-files (quote ("~/org/stew.org")) nil (org-trello))
 '(package-selected-packages
   (quote
    (mu4e-conversation mutt-mode blacken company-reftex company-auctex ace-jump-mode avy sublime-themes auto-complete-auctex sublimity org-trello yasnippet-classic-snippets standoff-mode elpygen projectile auto-complete smex yasnippet-snippets yaml-mode stan-snippets ssh sphinx-doc spacemacs-theme smart-mode-line-powerline-theme smart-mode-line-atom-one-dark-theme rope-read-mode rainbow-identifiers rainbow-delimiters python-docstring origami omtose-phellack-theme markdown-mode magit kaolin-themes js2-mode highlight-numbers highlight-indent-guides gist flymake-python-pyflakes flycheck ess elpy dockerfile-mode cython-mode context-coloring company-irony-c-headers color-identifiers-mode colonoscopy-theme auctex))))



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;(global-linum-mode 1)
