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

(load (xah-get-fullpath "~/coding/emacs_setup/editing.el"))

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


(load (xah-get-fullpath "~/coding/emacs_setup/tablist_setup.el"))






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
 '(ansi-color-map (ansi-color-make-color-map) t)
 '(ansi-color-names-vector
   ["#303030" "#ff4b4b" "#d7ff5f" "#fce94f" "#5fafd7" "#d18aff" "#afd7ff" "#c6c6c6"])
 '(ansi-term-color-vector
   [unspecified "#14191f" "#d15120" "#81af34" "#deae3e" "#7e9fc9" "#a878b5" "#7e9fc9" "#dcdddd"])
 '(background-color "#202020")
 '(background-mode dark)
 '(beacon-color "#ffff2faf97d7")
 '(compilation-message-face (quote default))
 '(cursor-color "#cccccc")
 '(cursor-type (quote bar))
 '(custom-enabled-themes (quote (calmer-forest)))
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
\". c #1ba1a1\",
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
 '(evil-emacs-state-cursor (quote ("#E57373" hbar)))
 '(evil-insert-state-cursor (quote ("#E57373" bar)))
 '(evil-normal-state-cursor (quote ("#FFEE58" box)))
 '(evil-visual-state-cursor (quote ("#C5E1A5" box)))
 '(fci-rule-character-color "#192028")
 '(fci-rule-color "#eeeeee")
 '(foreground-color "#cccccc")
 '(frame-background-mode (quote dark))
 '(gnus-logo-colors (quote ("#4c8383" "#bababa")) t)
 '(gnus-mode-line-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #1ba1a1\",
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
 '(highlight-changes-colors (quote ("#ff8eff" "#ab7eff")))
 '(highlight-indent-guides-auto-enabled nil)
 '(highlight-symbol-colors
   (quote
    ("#FFEE58" "#C5E1A5" "#80DEEA" "#64B5F6" "#E1BEE7" "#FFCC80")))
 '(highlight-symbol-foreground-color "#E0E0E0")
 '(highlight-tail-colors (quote (("#ffff2faf97d7" . 0) ("#424242" . 100))))
 '(hl-paren-colors
   (quote
    ("#B9F" "#B8D" "#B7B" "#B69" "#B57" "#B45" "#B33" "#B11")))
 '(ibuffer-deletion-face (quote diredp-deletion-file-name))
 '(ibuffer-marked-face (quote diredp-flag-mark))
 '(inhibit-startup-buffer-menu t)
 '(linum-format " %7i ")
 '(magit-diff-use-overlays nil)
 '(org-log-into-drawer t)
 '(package-selected-packages
   (quote
    (org-bullets abyss-theme afternoon-theme ample-theme arjen-grey-theme atom-dark-theme badger-theme birds-of-paradise-plus-theme calmer-forest-theme constant-theme dakrone-theme dark-krystal-theme dark-mint-theme darkmine-theme darkokai-theme distinguished-theme exotica-theme flatui-dark-theme forest-blue-theme gotham-theme grandshell-theme gruber-darker-theme hamburg-theme idea-darkula-theme klere-theme kooten-theme liso-theme lush-theme madhat2r-theme majapahit-theme metalheart-theme monochrome-theme monokai-alt-theme noctilux-theme northcode-theme nyx-theme paganini-theme planet-theme reykjavik-theme rimero-theme sexy-monochrome-theme smart-mode-line-atom-one-dark-theme soft-charcoal-theme soothe-theme toxi-theme twilight-anti-bright-theme warm-night-theme zeno-theme zerodark-theme zweilight-theme alect-themes apropospriate-theme arc-dark-theme atom-one-dark-theme darktooth-theme eziam-theme foggy-night-theme minimal-theme mood-one-theme nimbus-theme nova-theme overcast-theme seti-theme srcery-theme tablist magit-popup neotree browse-kill-ring spotify shell-pop use-package magithub smart-mode-line-powerline-theme moe-theme undo-tree mu4e-maildirs-extension mu4e-conversation mutt-mode blacken company-reftex company-auctex ace-jump-mode avy sublime-themes auto-complete-auctex sublimity org-trello yasnippet-classic-snippets standoff-mode elpygen projectile auto-complete smex yasnippet-snippets yaml-mode stan-snippets ssh sphinx-doc spacemacs-theme rope-read-mode rainbow-identifiers rainbow-delimiters python-docstring origami omtose-phellack-theme markdown-mode magit kaolin-themes js2-mode highlight-numbers highlight-indent-guides gist flymake-python-pyflakes flycheck ess elpy dockerfile-mode cython-mode context-coloring company-irony-c-headers color-identifiers-mode colonoscopy-theme auctex)))
 '(pdf-view-midnight-colors (quote ("#eeeeee" . "#000000")))
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
 '(tabbar-background-color "#377737773777")
 '(tetris-x-colors
   [[229 192 123]
    [97 175 239]
    [209 154 102]
    [224 108 117]
    [152 195 121]
    [198 120 221]
    [86 182 194]])
 '(vc-annotate-background "#eeeeee")
 '(vc-annotate-color-map
   (\`
    ((20 \, "#DF8C8C")
     (40 \, "#dfdf8f8f8787")
     (60 \, "#e7e797978787")
     (80 \, "#efef9f9f8787")
     (100 \, "#f7f7a7a78787")
     (120 \, "#F2C38F")
     (140 \, "#f7f7b7b78787")
     (160 \, "#efefbfbf8787")
     (180 \, "#e7e7c7c78787")
     (200 \, "#dfdfcfcf8787")
     (220 \, "#DADA93")
     (240 \, "#cfcfd7d78787")
     (260 \, "#c7c7d7d78787")
     (280 \, "#bfbfd7d78787")
     (300 \, "#b7b7d7d78787")
     (320 \, "#A8CE93")
     (340 \, "#a7a7cfcf9797")
     (360 \, "#9f9fc7c7a7a7")
     (380 \, "#9797bfbfb7b7")
     (400 \, "#8f8fb7b7c7c7")
     (420 \, "#83AFE5")
     (440 \, "#8787a7a7d7d7")
     (460 \, "#87879f9fd7d7")
     (480 \, "#87879797d7d7")
     (500 \, "#87878f8fd7d7")
     (520 \, "#9A93E1"))))
 '(vc-annotate-very-old-color "#6c6c6c6cacac")
 '(weechat-color-list
   (unspecified "#242728" "#424748" "#F70057" "#ff0066" "#86C30D" "#63de5d" "#BEB244" "#E6DB74" "#40CAE4" "#06d8ff" "#FF61FF" "#ff8eff" "#00b2ac" "#53f2dc" "#f8fbfc" "#ffffff"))
 '(xterm-color-names
   ["#404B5C" "#B26BB8" "#76A8A0" "#C79474" "#6886A6" "#515275" "#7D8AA8" "#8C92A1"])
 '(xterm-color-names-bright
   ["#666B88" "#C27CBE" "#7FBAB0" "#9FC7AD" "#76A0C4" "#898EC4" "#A4A4BD" "#858B99"]))
 


;;;;;;;;;;; DISPLAY


(setq powerline-arrow-shape 'curve)
(setq powerline-default-separator-dir '(right . left))
;(setq sml/theme 'powerline)
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
