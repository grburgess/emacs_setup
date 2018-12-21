1;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


(menu-bar-mode 0)
(scroll-bar-mode 0)

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

(require 'sublimity)
(require 'sublimity-scroll)
;;(require 'sublimity-map) ;; experimental
;; (require 'sublimity-attractive)
(sublimity-mode 1)
(setq sublimity-scroll-weight 10
      sublimity-scroll-drift-length 5)

;; (setq sublimity-map-size 20)
;; (setq sublimity-map-fraction 0.3)
;; (setq sublimity-map-text-scale -7)


;; (add-hook 'sublimity-map-setup-hook
;;           (lambda ()
;;             (setq buffer-face-mode-face '(:family "Monospace"))
;;             (buffer-face-mode)))

;; (sublimity-map-set-delay 5)

;;;; SMEX and IDO

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'ido)
(ido-mode t)

(add-hook 'after-init-hook 'global-company-mode)
;;;;;;;;;;;;;; LATEX
(load "auctex.el" nil t t)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)




;;;;;;;;;;;; PYTHON

(add-hook 'python-mode-hook (lambda ()
			      (require 'sphinx-doc)
			      (sphinx-doc-mode t)))

;; Activate python highlighting for PYX and PPL files
(add-to-list 'auto-mode-alist '("\\.pyx\\'" . cython-mode))
(add-to-list 'auto-mode-alist '("\\.ppl\\'" . cython-mode))

(elpy-enable)

(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
(define-key global-map (kbd "C-c o") 'iedit-mode)


(add-hook 'python-mode-hook 'elpy-mode)
(with-eval-after-load 'elpy
(remove-hook 'elpy-modules 'elpy-module-flymake)
(add-hook 'elpy-mode-hook 'flycheck-mode))

;;;;;;;; AC

;; (require 'auto-complete)
;; (setq ac-auto-start nil)
;; (ac-set-trigger-key "TAB")


(require 'ssh)
;; (add-hook 'ssh-mode-hook
;; 	  (lambda ()
;; 	    (setq ssh-directory-tracking-mode t)
;;                 (shell-dirtrack-mode t)
;;                 (setq dirtrackp nil)))

( setq tramp-default-method "ssh")


 ;; (mapc
 ;; (lambda (p)
 ;;   (unless (package-installed-p p)
 ;;     (package-install p)))
;; '(stan-mode stan-snippets))
(require 'yasnippet)
(require 'stan-mode)
(require 'stan-snippets)
(yas-global-mode 1)
(add-hook 'stan-mode-hook '(lambda () (yas-minor-mode)))

(add-hook 'after-init-hook 'global-color-identifiers-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-responsive 'stack)

;; (set-face-background 'highlight-indentation-face "#000000")
;; (set-face-background 'highlight-indentation-current-column-face "#000000")


(setq custom-safe-themes t)

(require 'smart-mode-line)


(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)


;; ORG



;; (setq org-agenda-files
;;       (mapcar 'abbreviate-file-name
;; 	      (split-string
;; 	                      (shell-command-to-string "find ~/org -name \"*.org\"") "\n")))

(setq org-directory "~/org")
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(setq org-todo-keywords
      '((sequence "TODO" "READ" "RESEARCH" "|" "DONE" "DELEGATED" )))

(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("READ" . "yellow") ("RESEARCH" . (:foreground "blue" :weight bold))
        ("CANCELED" . (:foreground "pink" :weight bold))
	("WRITING" . (:foreground "red" :weight bold))
	("RECIEVED" . (:foreground "red" :background "green" :weight bold))
	("SUBMITTED" . (:foreground "blue"))
	("ACCEPTED" . (:foreground "green"))
	

	))

;;; ORG TEMPLATES
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)
(setq org-capture-templates
    '(("t" "Todo" entry (file "~/org/notes.org")
       "* TODO %?\n%U" :empty-lines 1)
      ("l" "Logbook entry" entry (file+datetree "logbook-work.org") "** %U - %^{Activity}  :LOG:")

      ("P" "Research project" entry (file "~/org/projects.org")
       "* TODO %^{Project title} :%^G:\n:PROPERTIES:\n:CREATED: %U\n:END:\n%^{Project description}\n** TODO Literature review\n** TODO %?\n** TODO Summary\n** TODO Reports\n** Ideas\n" :clock-in t :clock-resume t)
      ("b" "Link from browser" entry (file "~/org/notes.org")
       "* TODO %? |- (%:description) :BOOKMARK:\n:PROPERTIES:\n:CREATED: %U\n:Source: %:link\n:END:\n%i\n" :clock-in t :clock-resume t)
      ("s" "Selection from browser" entry (file "~/org/note.org")
       "* TODO %? :BOOKMARK:\n%(replace-regexp-in-string \"\n.*\" \"\" \"%i\")\n:PROPERTIES:\n:CREATED: %U\n:Source: %:link\n:END:\n%i\n" :clock-in t :clock-resume t)
      ("a" "Research Article" entry(file+headline "~/org/publications.org" "Working articles") "** WRITING %^{Title}\n\t-Added: %U\n   :LOGBOOK:\n   :END:\n")
      ("r" "Ref. Report" entry(file+headline "~/org/publications.org" "Referee reports") "** WRITING %^{Title}\n\t-Added: %U\n   :LOGBOOK:\n   :END:\n") 

      )
    )






(require 'org-trello)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (kaolin-ocean)))
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
    (sublimity org-trello yasnippet-classic-snippets standoff-mode elpygen projectile auto-complete smex yasnippet-snippets yaml-mode stan-snippets ssh sphinx-doc spacemacs-theme smart-mode-line-powerline-theme smart-mode-line-atom-one-dark-theme rope-read-mode rainbow-identifiers rainbow-delimiters python-docstring origami omtose-phellack-theme markdown-mode magit kaolin-themes js2-mode highlight-numbers highlight-indent-guides gist flymake-python-pyflakes flycheck ess elpy dockerfile-mode cython-mode context-coloring company-irony-c-headers color-identifiers-mode colonoscopy-theme auctex))))



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-face-attribute 'mode-line nil
                    :foreground "Black"
                    :background "Black"
                    :box nil)

(sml/setup)

