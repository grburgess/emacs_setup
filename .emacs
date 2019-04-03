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

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)






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


;;;;; editing tools 

(load (xah-get-fullpath "~/coding/emacs_setup/editing.el"))



;;;;; custom keybinds

(load (xah-get-fullpath "~/coding/emacs_setup/custom_keys.el"))




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






(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)



(add-hook 'after-init-hook 'global-color-identifiers-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require 'highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-auto-enabled nil)
(setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-responsive 'stack)

(setq custom-safe-themes t)

;; (require 'ssh)
;; ;; (add-hook 'ssh-mode-hook
;; ;; 	  (lambda ()
;; ;; 	    (setq ssh-directory-tracking-mode t)
;; ;;                 (shell-dirtrack-mode t)
;; ;;                 (setq dirtrackp nil)))

;; ( setq tramp-default-method "ssh")

(load (xah-get-fullpath "~/coding/emacs_setup/view.el"))


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
 '(custom-enabled-themes (quote (wilson)))
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(inhibit-startup-buffer-menu t)
 '(linum-format " %7i ")
 '(org-agenda-files
   (quote
    ("~/org/projects.org" "~/org/notes.org" "~/org/publications.org")))
 '(org-log-into-drawer t)
 '(package-selected-packages
   (quote
    (smart-mode-line-powerline-theme moe-theme undo-tree mu4e-maildirs-extension mu4e-conversation mutt-mode blacken company-reftex company-auctex ace-jump-mode avy sublime-themes auto-complete-auctex sublimity org-trello yasnippet-classic-snippets standoff-mode elpygen projectile auto-complete smex yasnippet-snippets yaml-mode stan-snippets ssh sphinx-doc spacemacs-theme rope-read-mode rainbow-identifiers rainbow-delimiters python-docstring origami omtose-phellack-theme markdown-mode magit kaolin-themes js2-mode highlight-numbers highlight-indent-guides gist flymake-python-pyflakes flycheck ess elpy dockerfile-mode cython-mode context-coloring company-irony-c-headers color-identifiers-mode colonoscopy-theme auctex)))
 '(pos-tip-background-color "#3D4E54")
 '(pos-tip-foreground-color "#C1CADE")
 '(send-mail-function (quote smtpmail-send-it))
 '(xterm-color-names
   ["#404B5C" "#B26BB8" "#76A8A0" "#C79474" "#6886A6" "#515275" "#7D8AA8" "#8C92A1"])
 '(xterm-color-names-bright
   ["#666B88" "#C27CBE" "#7FBAB0" "#9FC7AD" "#76A0C4" "#898EC4" "#A4A4BD" "#858B99"]))
 


;;;;;;;;;;; DISPLAY
;; (add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
;; (require 'powerline)



;; (setq powerline-arrow-shape 'arrow14)   ;; give your mode-line curves


;; (setq powerline-color1 "grey10")
;; (setq powerline-color2 "forestgreen")
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
;;  '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))


(setq powerline-arrow-shape 'curve)
(setq powerline-default-separator-dir '(right . left))
(setq sml/theme 'powerline)


;; (set-face-attribute 'mode-line nil
;;                     :foreground "Black"
;;                     :background "OliveDrab3"
;;                     :box nil)


(sml/setup)





;(global-linum-mode 1)

