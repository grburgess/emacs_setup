;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(setq debug-on-error t)

(menu-bar-mode 0)
;;(scroll-bar-mode 0)



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



;; (require 'neotree)
;; (global-set-key [f8] 'neotree-toggle)



;;;;; editing tools 

;(load (xah-get-fullpath "~/coding/emacs_setup/editing.el"))

(load (xah-get-fullpath "~/coding/emacs_setup/git_setup.el"))



;;;;; custom keybinds

(load (xah-get-fullpath "~/coding/emacs_setup/custom_keys.el"))




;;;; email!
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e")

;; (require 'mu4e)

;; (load (xah-get-fullpath "~/coding/emacs_setup/mail.el"))


;;;; SMEX and IDO

(load (xah-get-fullpath "~/coding/emacs_setup/complete.el"))


;;;;;;;;;;;;;; LATEX

(load (xah-get-fullpath "~/coding/emacs_setup/latex.el"))

;;;;;;;;;;;; PYTHON

(load (xah-get-fullpath "~/coding/emacs_setup/python_setup.el"))




;; SPOTIFY

;; (load (xah-get-fullpath "~/coding/emacs_setup/spotify_setup.el"))

;; ORG

(load (xah-get-fullpath "~/coding/emacs_setup/org_setup.el"))






;; (projectile-mode +1)
;; (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;; (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)



(add-hook 'after-init-hook 'global-color-identifiers-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require 'highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-auto-enabled nil)
(setq highlight-indent-guides-method 'character)
;(setq highlight-indent-guides-responsive 'stack)

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
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#303030" "#ff4b4b" "#d7ff5f" "#fce94f" "#5fafd7" "#d18aff" "#afd7ff" "#c6c6c6"])
 '(custom-enabled-themes (quote (kaolin-aurora)))
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(emms-mode-line-icon-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #1fb3b3\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(fci-rule-color "#383838")
 '(gnus-logo-colors (quote ("#2fdbde" "#c0c0c0")) t)
 '(gnus-mode-line-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #1fb3b3\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };")) t)
 '(inhibit-startup-buffer-menu t)
 '(linum-format " %7i ")
 '(org-agenda-files
   (quote
    ("~/org/projects.org" "~/org/notes.org" "~/org/publications.org")))
 '(org-log-into-drawer t)
 '(package-selected-packages
   (quote
    (alect-themes cyberpunk-theme magit-popup neotree browse-kill-ring spotify shell-pop use-package magithub smart-mode-line-powerline-theme moe-theme undo-tree mu4e-maildirs-extension mu4e-conversation mutt-mode blacken company-reftex company-auctex ace-jump-mode avy sublime-themes auto-complete-auctex sublimity org-trello yasnippet-classic-snippets standoff-mode elpygen projectile auto-complete smex yasnippet-snippets yaml-mode stan-snippets ssh sphinx-doc spacemacs-theme rope-read-mode rainbow-identifiers rainbow-delimiters python-docstring origami omtose-phellack-theme markdown-mode magit kaolin-themes js2-mode highlight-numbers highlight-indent-guides gist flymake-python-pyflakes flycheck ess elpy dockerfile-mode cython-mode context-coloring company-irony-c-headers color-identifiers-mode colonoscopy-theme auctex)))
 '(pos-tip-background-color "#3D4E54")
 '(pos-tip-foreground-color "#C1CADE")
 '(pyvenv-mode t)
 '(send-mail-function (quote smtpmail-send-it))
 '(shell-pop-shell-type
   (quote
    ("terminal" "*terminal*"
     (lambda nil
       (term shell-pop-term-shell)))))
 '(sml/mode-width (quote full))
 '(sml/pos-id-separator
   (quote
    (""
     (:propertize " " face powerline-active1)
     (:eval
      (propertize " "
		  (quote display)
		  (funcall
		   (intern
		    (format "powerline-%s-%s"
			    (powerline-current-separator)
			    (car powerline-default-separator-dir)))
		   (quote powerline-active1)
		   (quote powerline-active2))))
     (:propertize " " face powerline-active2))))
 '(sml/pos-minor-modes-separator
   (quote
    (""
     (:propertize " " face powerline-active1)
     (:eval
      (propertize " "
		  (quote display)
		  (funcall
		   (intern
		    (format "powerline-%s-%s"
			    (powerline-current-separator)
			    (cdr powerline-default-separator-dir)))
		   (quote powerline-active1)
		   (quote sml/global))))
     (:propertize " " face sml/global))))
 '(sml/pre-id-separator
   (quote
    (""
     (:propertize " " face sml/global)
     (:eval
      (propertize " "
		  (quote display)
		  (funcall
		   (intern
		    (format "powerline-%s-%s"
			    (powerline-current-separator)
			    (car powerline-default-separator-dir)))
		   (quote sml/global)
		   (quote powerline-active1))))
     (:propertize " " face powerline-active1))))
 '(sml/pre-minor-modes-separator
   (quote
    (""
     (:propertize " " face powerline-active2)
     (:eval
      (propertize " "
		  (quote display)
		  (funcall
		   (intern
		    (format "powerline-%s-%s"
			    (powerline-current-separator)
			    (cdr powerline-default-separator-dir)))
		   (quote powerline-active2)
		   (quote powerline-active1))))
     (:propertize " " face powerline-active1))))
 '(sml/pre-modes-separator (propertize " " (quote face) (quote sml/modes)))
 '(vc-annotate-background "#222222")
 '(vc-annotate-color-map
   (quote
    ((20 . "#db4334")
     (40 . "#ea3838")
     (60 . "#abab3a")
     (80 . "#e5c900")
     (100 . "#fe8b04")
     (120 . "#e8e815")
     (140 . "#3cb370")
     (160 . "#099709")
     (180 . "#7fb07f")
     (200 . "#32cd32")
     (220 . "#8ce096")
     (240 . "#528d8d")
     (260 . "#1fb3b3")
     (280 . "#0c8782")
     (300 . "#30a5f5")
     (320 . "#62b6ea")
     (340 . "#94bff3")
     (360 . "#e353b9"))))
 '(vc-annotate-very-old-color "#e353b9")
 '(xterm-color-names
   ["#404B5C" "#B26BB8" "#76A8A0" "#C79474" "#6886A6" "#515275" "#7D8AA8" "#8C92A1"])
 '(xterm-color-names-bright
   ["#666B88" "#C27CBE" "#7FBAB0" "#9FC7AD" "#76A0C4" "#898EC4" "#A4A4BD" "#858B99"]))
 


;;;;;;;;;;; DISPLAY


(setq powerline-arrow-shape 'curve)
(setq powerline-default-separator-dir '(right . left))
(setq sml/theme 'powerline)
(setq sml/shorten-directory t)
(setq sml/shorten-modes t)

(sml/setup)





;(global-linum-mode 1)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(highlight-indent-guides-character-face ((t (:foreground "color-99"))))
 '(highlight-indent-guides-even-face ((t (:background "#303035"))))
 '(highlight-indent-guides-odd-face ((t (:background "color-16"))))
 '(sml/folder ((t (:inherit sml/global :background "gray25" :foreground "color-105" :weight normal))))
 '(sml/modes ((t (:inherit sml/global :background "gray12" :foreground "color-33"))))
 '(sml/position-percentage ((t (:inherit sml/prefix :background "gray12" :foreground "color-48" :weight normal))))
 '(sml/vc ((t (:inherit sml/git :background "#222225" :foreground "brightred"))))
 '(sml/vc-edited ((t (:inherit sml/prefix :background "gray12" :foreground "color-46")))))
