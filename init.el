;;; -*- lexical-binding: t -*-

(defun tangle-init ()
  "If the current buffer is 'init.org' the code-blocks are
tangled, and the tangled file is compiled."
  (when (equal (buffer-file-name)
               (expand-file-name (concat user-emacs-directory "init.org")))
    ;; Avoid running hooks when tangling.
    (let ((prog-mode-hook nil))
      (org-babel-tangle)
      (byte-compile-file (concat user-emacs-directory "init.el")))))

(add-hook 'after-save-hook 'tangle-init)

(add-hook
 'after-init-hook
 (lambda ()
   (let ((private-file (concat user-emacs-directory "private.el")))
     (when (file-exists-p private-file)
       (load-file private-file)))))

(require 'cl)
(require 'package)
(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

(let* ((package--builtins nil)
       (packages
        '(auto-compile         ; automatically compile Emacs Lisp libraries
          company              ; Modular text completion framework
          focus                ; Dim color of text in surrounding sections
          idle-require         ; load elisp libraries while Emacs is idle
          jedi                 ; Python auto-completion for Emacs
          magit                ; control Git from Emacs
          markdown-mode        ; Emacs Major mode for Markdown-formatted files
          multiple-cursors     ; Multiple cursors for Emacs
          olivetti             ; Minor mode for a nice writing environment
          org                  ; Outline-based notes management and organizer
          org-ref              ; citations bibliographies in org-mode
          paredit              ; minor mode for editing parentheses
          pdf-tools            ; Emacs support library for PDF files
          slime                ; Superior Lisp Interaction Mode for Emacs
          which-key
	  org-bullets
	  abyss-theme
	  afternoon-theme
	  ample-theme
	  arjen-grey-theme
	  atom-dark-theme
	  badger-theme
	  birds-of-paradise-plus-theme
	  calmer-forest-theme
	  constant-theme
	  dakrone-theme
	  dark-krystal-theme
	  dark-mint-theme
	  darkmine-theme
	  darkokai-theme
	  distinguished-theme
	  exotica-theme
	  flatui-dark-theme
	  forest-blue-theme
	  gotham-theme
	  grandshell-theme
	  gruber-darker-theme
	  hamburg-theme
	  idea-darkula-theme
	  klere-theme
	  kooten-theme
	  liso-theme
	  lush-theme
	  madhat2r-theme
	  majapahit-theme
	  metalheart-theme
	  monochrome-theme
	  monokai-alt-theme
	  noctilux-theme
	  northcode-theme
	  nyx-theme
	  paganini-theme
	  planet-theme
	  reykjavik-theme
	  rimero-theme
	  sexy-monochrome-theme
	  smart-mode-line-atom-one-dark-theme
	  soft-charcoal-theme
	  soothe-theme
	  toxi-theme
	  twilight-anti-bright-theme
	  warm-night-theme
	  zeno-theme
	  zerodark-theme
	  zweilight-theme
	  alect-themes
	  apropospriate-theme
	  arc-dark-theme
	  atom-one-dark-theme
	  darktooth-theme
	  eziam-theme
	  foggy-night-theme
	  minimal-theme
	  mood-one-theme
	  nimbus-theme
	  nova-theme
	  overcast-theme
	  seti-theme
	  srcery-theme
	  tablist
	  magit-popup
	  neotree
	  browse-kill-ring
	  spotify
	  shell-pop
	  use-package
	  magithub
	  smart-mode-line-powerline-theme
	  moe-theme
	  undo-tree
	  mu4e-maildirs-extension
	  mu4e-conversation
	  mutt-mode
	  blacken
	  company-reftex
	  company-auctex
	  ace-jump-mode
	  sublime-themes
	  auto-complete-auctex
	  sublimity
	  yasnippet-classic-snippets
	  standoff-mode
	  elpygen
	  projectile
	  auto-complete
	  smex
	  yasnippet-snippets
	  yaml-mode
	  stan-snippets
	  ssh
	  sphinx-doc
	  spacemacs-theme
	  rope-read-mode
	  rainbow-identifiers
	  rainbow-delimiters
	  python-docstring
	  origami
	  omtose-phellack-theme
	  markdown-mode
	  magit
	  kaolin-themes
	  js2-mode
	  highlight-numbers
	  highlight-indent-guides
	  gist
	  flymake-python-pyflakes
	  flycheck
	  ess
	  elpy
	  dockerfile-mode
	  cython-mode
	  context-coloring
	  company-irony-c-headers
	  color-identifiers-mode
	  colonoscopy-theme
	  auctex
	  )))
          ; Display available keybindings in popup
	  (ignore-errors ;; This package is only relevant for Mac OS X.
	  (when (memq window-system '(mac ns))
          (push 'exec-path-from-shell packages)
          (push 'reveal-in-osx-finder packages))
	  (let ((packages (remove-if 'package-installed-p packages)))
          (when packages
          ;; Install uninstalled packages
          (package-refresh-contents)
          (mapc 'package-install packages)))))

(when (memq window-system '(mac ns))
  (setq ns-pop-up-frames nil
        mac-option-modifier nil
        mac-command-modifier 'meta
        x-select-enable-clipboard t)
  (exec-path-from-shell-initialize)
  (when (fboundp 'mac-auto-operator-composition-mode)
    (mac-auto-operator-composition-mode 1)))'

(setq auto-revert-interval 1            ; Refresh buffers fast
      custom-file (make-temp-file "")   ; Discard customization's
      default-input-method "TeX"        ; Use TeX when toggling input method
      echo-keystrokes 0.1               ; Show keystrokes asap
      inhibit-startup-message t         ; No splash screen please
      initial-scratch-message nil       ; Clean scratch buffer
      recentf-max-saved-items 100       ; Show more recent files
      ring-bell-function 'ignore        ; Quiet
      sentence-end-double-space nil)    ; No double space
;; Some mac-bindings interfere with Emacs bindings.
(when (boundp 'mac-pass-command-to-system)
  (setq mac-pass-command-to-system nil))

;; (setq-default fill-column 79                    ; Maximum line width
;;               truncate-lines t                  ; Don't fold lines
;;               indent-tabs-mode nil              ; Use spaces instead of tabs
;;               split-width-threshold 160         ; Split verticly by default
;;               split-height-threshold nil        ; Split verticly by default
;;               auto-fill-function 'do-auto-fill) ; Auto-fill-mode everywhere

;; (let ((default-directory (concat user-emacs-directory "site-lisp/")))
;;   (when (file-exists-p default-directory)
;;     (setq load-path
;;           (append
;;            (let ((load-path (copy-sequence load-path)))
;;              (normal-top-level-add-subdirs-to-load-path)) load-path))))

(fset 'yes-or-no-p 'y-or-n-p)

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

(set-language-environment "UTF-8")

(put 'narrow-to-region 'disabled nil)

(add-hook 'doc-view-mode-hook 'auto-revert-mode)

(setq inhibit-splash-screen t)
(add-hook 'after-init-hook 'global-color-identifiers-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require 'highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-auto-enabled nil)
(setq highlight-indent-guides-method 'character)


(dolist (mode
         '(tool-bar-mode                ; No toolbars, more room for text
           scroll-bar-mode              ; No scroll bars either
           ))
  (funcall mode 0))

(dolist (mode
         '(abbrev-mode                  ; E.g. sopl -> System.out.println
           column-number-mode           ; Show column number in mode line
           delete-selection-mode        ; Replace selected text
           dirtrack-mode                ; directory tracking in *shell*
           global-company-mode          ; Auto-completion everywhere
           global-prettify-symbols-mode ; Greek letters should look gree
           recentf-mode                 ; Recently opened files
           show-paren-mode              ; Highlight matching parentheses
           which-key-mode))             ; Available keybindings in popup
  (funcall mode 1))

(when (version< emacs-version "24.4")
  (eval-after-load 'auto-compile
    '((auto-compile-on-save-mode 1))))  ; compile .el files on save

(load-theme 'calmer-forest t)

(defun cycle-themes ()
  "Returns a function that lets you cycle your themes."
  (lexical-let ((themes '#1=(leuven atom-one-dark nimbus seti . #1#)))
    (lambda ()
      (interactive)
      ;; Rotates the thme cycle and changes the current theme.
      (load-theme (car (setq themes (cdr themes))) t))))

;; (cond ((member "Hasklig" (font-family-list))
;;        (set-face-attribute 'default nil :font "Hasklig-14"))
;;       ((member "Inconsolata" (font-family-list))
;;        (set-face-attribute 'default nil :font "Inconsolata-14")))

(defmacro safe-diminish (file mode &optional new-name)
  `(with-eval-after-load ,file
     (diminish ,mode ,new-name)))

(diminish 'auto-fill-function)
(safe-diminish "eldoc" 'eldoc-mode)
(safe-diminish "flyspell" 'flyspell-mode)
(safe-diminish "projectile" 'projectile-mode)
(safe-diminish "paredit" 'paredit-mode "()")

(require 'git-gutter-fringe)

(dolist (p '((git-gutter:added    . "#0c0")
             (git-gutter:deleted  . "#c00")
             (git-gutter:modified . "#c0c")))
  (set-face-foreground (car p) (cdr p))
  (set-face-background (car p) (cdr p)))

(setq-default prettify-symbols-alist '(("lambda" . ?λ)
                                       ("delta" . ?Δ)
                                       ("gamma" . ?Γ)
                                       ("phi" . ?φ)
                                       ("psi" . ?ψ)))

(add-hook 'pdf-tools-enabled-hook 'auto-revert-mode)
(add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-tools-install))

(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'load-path "path/to/company-auctex.el")
(require 'company-auctex)
(company-auctex-init)


(setq company-idle-delay 0
company-echo-delay 0
company-dabbrev-downcase nil
company-minimum-prefix-length 2
company-selection-wrap-around t
company-transformers '(company-sort-by-occurrence
company-sort-by-backend-importance))

(require 'yasnippet)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'ido)
(ido-mode t)

(autoload
'ace-jump-mode
"ace-jump-mode"
"Emacs quick move minor mode"
t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-c C-c SPC") 'ace-jump-line-mode)
;;(define-key global-map (kbd "C-o") 'ace-jump-mode)
;; (define-key global-map (kbd "C-o SPC") 'ace-jump-line-mode)

(setq mu4e-mu-binary "/usr/local/bin/mu")
(with-eval-after-load 'mu4e
  (require 'smtpmail)

  ;; (setq message-send-mail-function 'smtpmail-send-it
  ;;     starttls-use-gnutls t
  ;;     smtpmail-starttls-credentials
  ;;     '(("smtp.gmail.com" 587 nil nil))
  ;;     smtpmail-auth-credentials
  ;;     (expand-file-name "~/.authinfo")
  ;;     smtpmail-default-smtp-server "smtp.gmail.com"
  ;;     smtpmail-smtp-server "smtp.gmail.com"
  ;;     smtpmail-smtp-service 587
  ;;     smtpmail-debug-info t)

  
  (setq mu4e-maildir "/Users/jburgess/mail"
        mu4e-get-mail-command "mbsync -a --verbose"
        mu4e-update-interval 600
        mu4e-compose-signature-auto-include nil
        mu4e-view-show-images t
        mu4e-view-show-addresses t
        mu4e-enable-notifications nil
        mu4e-enable-mode-line t
        mu4e-headers-skip-duplicates t
        ;; rename files when moving, needed for mbsync
        mu4e-change-filenames-when-moving t
	
        mu4e-compose-dont-reply-to-self t
;        mu4e-compose-format-flowed nil
        fill-flowed-encode-column 280
        mu4e-user-mail-address-list '("jmichaelburgess@gmail.com" "jburgess@mpe.mpg.de, jmichael.gcn@gmail.com")
        mu4e-compose-complete-only-personal t
        mu4e-enable-async-operations t
        org-mu4e-link-query-in-headers-mode nil
        org-mu4e-convert-to-html t
        ;; customize the reply-quote-string
        message-citation-line-format "On %a %d %b %Y at %R, %f wrote:\n"
        ;; choose to use the formatted string
        message-citation-line-function 'message-insert-formatted-citation-line)


  ;; (setq smtpmail-smtp-server "smtp.gmail.com"
  ;; 	smtpmail-smtp-service 587
  ;; 	smtpmail-queue-mail nil
  ;; 	smtpmail-queue-dir "~/mail/queue/cur"
  ;; 	send-mail-function 'smtpmail-send-it
  ;; 	message-send-mail-function 'smtpmail-send-it
  ;; 	mu4e-sent-messages-behavior 'delete
  ;; 	mail-envelope-from 'header
  ;; 	mail-user-agent 'mu4e-user-agent
  ;; 	smtpmail-debug-info t
  ;; 	smtpmail-debug-verb t)
  
  ;; (defun mu4e-message-maildir-matches (msg rx)
  ;;   (string-match rx (mu4e-message-field msg :maildir)))
  
  (setq
   mu4e-compose-context-policy 'ask-if-none

   mu4e-contexts
   `(,(make-mu4e-context
       :name "home"
       :enter-func (lambda ()
		     (mu4e-message "Switch to jmichaelburgess@gmail.com"))
       ;; leave-func not defined
       :match-func (lambda (msg)
		     (when msg

		       (mu4e-message-contact-field-matches msg :to "jmichaelburgess@gmail.com")
		       ))
       :vars '((mu4e-sent-folder . "/gmail-personal/sent")
	       (mu4e-trash-folder . "/gmail-personal/trash")
	       (mu4e-refile-folder . "/gmail-personal/INBOX")
	       (mu4e-drafts-folder . "/gmail-personal/drafts")
	       (user-mail-address . "jmichaelburgess@gmail.com")
	       (user-full-name . "J. Michael Burgess")
	       (smtpmail-smtp-user . "jmichaelburgess@gmail.com")
	       ;(smtpmail-local-domain "gmail.com")
	       (smtpmail-default-smtp-server . "smtp.gmail.com")
	       (smtpmail-smtp-server . "smtp.gmail.com")
	       (smtpmail-smtp-service . 587)
					;(mu4e-compose-signature . (concat "Thanks,\n" "Ag\n"))
	       ))
     ,(make-mu4e-context
       :name "work"
       :enter-func (lambda ()
		     (mu4e-message "Switch to jburgess@mpe.mpg.de"))
       ;; leave-func not defined
       :match-func (lambda (msg)
		     (when msg
;		       (mu4e-message-maildir-matches msg "^/mpe/")
		       (mu4e-message-contact-field-matches msg :to "jburgess@mpe.mpg.de")
		       ))
       :vars '((mu4e-sent-folder . "/mpe/sent")
	       (mu4e-trash-folder . "/mpe/trash")
	       (mu4e-refile-folder . "/mpe/INBOX")
	       (mu4e-drafts-folder . "/mpe/drafts")
	       (user-mail-address . "jburgess@mpe.mpg.de")
	       (user-full-name . "J. Michael Burgess")
	       (smtpmail-smtp-user . "jburgess@mpe.mpg.de")
	       ;(smtpmail-local-domain "mpe.mpg.de")
	       (smtpmail-default-smtp-server . "smtp.mpe.mpg.de")
	       (smtpmail-smtp-server . "smtp.mpe.mpg.de")
	       (smtpmail-smtp-service . 587)
					;(mu4e-compose-signature . (concat "Thanks,\n" "Ag\n"))
	       
	       ))))
  
;  (add-hook 'mu4e-compose-mode-hook #'turn-off-auto-fill)
;  (add-hook 'mu4e-compose-mode-hook #'spacemacs/toggle-visual-line-navigation-on)
  
  (setq mu4e-view-actions
	'(("capture message" . mu4e-action-capture-message)
	  ("view in browser" . mu4e-action-view-in-browser)
	  ("show this thread" . mu4e-action-show-thread)
	  ("View as pdf" . mu4e-action-view-as-pdf)))


(setq mu4e-user-mail-address-list
      (delq nil
            (mapcar (lambda (context)
                      (when (mu4e-context-vars context)
                        (cdr (assq 'user-mail-address (mu4e-context-vars context)))))
                    mu4e-contexts)))


  
  ;; (add-to-list
  ;;  'mu4e-header-info-custom
  ;;  '(:foldername . (:name "Folder information"
  ;; 			  :shortname "Folder"
  ;; 			  :help "Message short storage information"
  ;; 			  :function (lambda (msg)
  ;; 				      (let ((shortaccount)
  ;; 					    (maildir (or (mu4e-message-field msg :maildir) ""))
  ;; 					    (mailinglist (or (mu4e-message-field msg :mailing-list) "")))
  ;; 					(if (not (string= mailinglist ""))
  ;; 					    (setq mailinglist (mu4e-get-mailing-list-shortname mailinglist)))
  ;; 					(when (not (string= maildir ""))
  ;; 					  (setq shortaccount
  ;; 						(substring
  ;; 						 (replace-regexp-in-string "^/\\(\\w+\\)/.*$" "\\1" maildir)
  ;; 						 0 1))
  ;; 					  (setq maildir (replace-regexp-in-string ".*/\\([^/]+\\)$" "\\1" maildir))
  ;; 					  (if (> (length maildir) 15)
  ;; 					      (setq maildir (concat (substring maildir 0 14) "…")))
  ;; 					  (setq maildir (concat "[" shortaccount "] " maildir)))
  ;; 					(cond
  ;; 					 ((and (string= maildir "")
  ;; 					       (not (string= mailinglist "")))
  ;; 					  mailinglist)
  ;; 					 ((and (not (string= maildir ""))
  ;; 					       (string= mailinglist ""))
  ;; 					  maildir)
  ;; 					 ((and (not (string= maildir ""))
  ;; 					       (not (string= mailinglist "")))
  ;; 					  (concat maildir " (" mailinglist ")"))
  ;; 					 (t "")))))))
  
  ;; (defun ed/get-mail-header (header-name path)
  ;;   (replace-regexp-in-string
  ;;    "[ \t\n]*$"
  ;;    ""
  ;;    (shell-command-to-string
  ;;     (concat "/usr/bin/sed -n '/^" header-name ":/I{:loop t;h;n;/^ /{H;x;s/\\n//;t loop};x;p}' '" path "' | sed -n 's/^" header-name ": \\(.*\\)$/\\1/Ip'"))))
  
  ;; (defun ed/get-origin-mail-system-header (msg)
  ;;   (let ((path (or (mu4e-message-field msg :path) "")))
  ;;     (if (or (string= path "")
  ;; 	      (not (file-readable-p path)))
  ;; 	  "no path found"
  ;; 	(let ((xmailer (ed/get-mail-header "x-mailer" path))
  ;; 	      (useragent (ed/get-mail-header "user-agent" path)))
  ;; 	  (if (string= xmailer useragent)
  ;; 	      xmailer
  ;; 	    (cond
  ;; 	     ((string= xmailer "") useragent)
  ;; 	     ((string= useragent "") xmailer)
  ;; 	     (t (concat xmailer " (xmailer)\n" useragent " (user-agent)"))))))))
  
  ;; (add-to-list 'mu4e-header-info-custom
  ;; 	       '(:useragent . (:name "User-Agent"
  ;; 				     :shortname "UserAgt."
  ;; 				     :help "Mail client used by correspondant"
  ;; 				     :function ed/get-origin-mail-system-header)))
  
  ;; (setq mu4e-headers-fields
  ;; 	'((:flags . 5)
  ;; 	  (:human-date . 22)
  ;; 	  (:size . 6)
  ;; 	  (:foldername . 25)
  ;; 	  (:from-or-to . 25)
  ;; 	  (:subject . nil))
	
  ;; 	mu4e-headers-date-format "%a %d %b %Y %H:%M"
  ;; 	mu4e-headers-time-format "%H:%M"
  ;; 	mu4e-use-fancy-chars nil
  ;; 	mu4e-view-fields '(:from :to :cc :subject :flags :date :maildir :mailing-list :tags  :attachments :signature :decryption))




;;  ;; I have my "default" parameters from Gmail
;; (setq mu4e-sent-folder "~/mail/gmail-personal/sent"
;;       ;; mu4e-sent-messages-behavior 'delete ;; Unsure how this should be configured
;;       mu4e-drafts-folder "~/mail/gmail-personal/drafts"
;;       user-mail-address "jmichaelburgess@gmail.com"
;;       smtpmail-default-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-service 587)

;; Now I set a list of 
;; (defvar my-mu4e-account-alist
;;   '(("Gmail"
;;      (mu4e-sent-folder "~/mail/gmail-personal/sent")
;;      (user-mail-address "jmichaelburgess@gmail.com")
;;      (smtpmail-smtp-user "jmichaelburgess")
;;      (smtpmail-local-domain "gmail.com")
;;      (smtpmail-default-smtp-server "smtp.gmail.com")
;;      (smtpmail-smtp-server "smtp.gmail.com")
;;      (smtpmail-smtp-service 587)
;;      )


;;     ("MPE"
;;      (mu4e-sent-folder "~/mail/mpe/sent")
;;      (user-mail-address "jburgess@mpe.mpg.de")
;;      (smtpmail-smtp-user "jburgess")
;;      (smtpmail-local-domain "mpe.mpg.de")
;;      (smtpmail-default-smtp-server "smtp.mpe.mpg.de")
;;      (smtpmail-smtp-server "smtp.mpe.mpg.de")
;;      (smtpmail-smtp-service 587)
;;      )
;;      ;; Include any other accounts here ...
;;     ))

;; (defun my-mu4e-set-account ()
;;   "Set the account for composing a message.
;;    This function is taken from: 
;;      https://www.djcbsoftware.nl/code/mu/mu4e/Multiple-accounts.html"
;;   (let* ((account
;;     (if mu4e-compose-parent-message
;;         (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
;;     (string-match "/\\(.*?\\)/" maildir)
;;     (match-string 1 maildir))
;;       (completing-read (format "Compose with account: (%s) "
;;              (mapconcat #'(lambda (var) (car var))
;;             my-mu4e-account-alist "/"))
;;            (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
;;            nil t nil nil (caar my-mu4e-account-alist))))
;;    (account-vars (cdr (assoc account my-mu4e-account-alist))))
;;     (if account-vars
;;   (mapc #'(lambda (var)
;;       (set (car var) (cadr var)))
;;         account-vars)
;;       (error "No email account found"))))

;; (add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)

;; (setq mu4e-user-mail-address-list
;;       (mapcar (lambda (account) (cadr (assq 'user-mail-address account)))
;;               my-mu4e-account-alist))
  
(mu4e-maildirs-extension)
  )

(add-hook 'text-mode-hook 'turn-on-flyspell)

(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(defun cycle-languages ()
  "Changes the ispell dictionary to the first element in
ISPELL-LANGUAGES, and returns an interactive function that cycles
the languages in ISPELL-LANGUAGES when invoked."
  (lexical-let ((ispell-languages '#1=("american" "norsk" . #1#)))
    (ispell-change-dictionary (car ispell-languages))
    (lambda ()
      (interactive)
      ;; Rotates the languages cycle and changes the ispell dictionary.
      (ispell-change-dictionary
       (car (setq ispell-languages (cdr ispell-languages)))))))

(defadvice turn-on-flyspell (before check nil activate)
  "Turns on flyspell only if a spell-checking tool is installed."
  (when (executable-find ispell-program-name)
    (local-set-key (kbd "C-c l") (cycle-languages))))

(defadvice flyspell-prog-mode (before check nil activate)
  "Turns on flyspell only if a spell-checking tool is installed."
  (when (executable-find ispell-program-name)
    (local-set-key (kbd "C-c l") (cycle-languages))))

(add-hook 'org-mode-hook 'turn-on-auto-fill)

(setq org-directory "~/org")
(setq org-agenda-files (list "~/org/"))
(setq org-agenda-file-regexp "\\`[^.].*\\.org\\|.todo\\'")
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(setq org-todo-keywords
'((sequence "TODO" "READ" "RESEARCH" "|" "DONE" "DELEGATED" )))



;(setq org-todo-keywords '((sequence "☛ TODO(t)" "|" "<img draggable="false" class="emoji" alt="✔" src="https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/svg/2714.svg"> DONE(d)")
;(sequence "⚑ WAITING(w)" "|")
;(sequence "|" "✘ CANCELED(c)")))


(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))


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

     ("c" "Coding tips" entry(file+headline "~/org/coding.org" "Refile") "** READ %^{description} %^g \n\t-Added: %U\n   :LOGBOOK:\n   :END:\n")

     ("f" "Fitting" entry(file+headline "~/org/fitting.org" "Refile") "** READ %^{description} %^g \n\t-Added: %U\n   :LOGBOOK:\n   :END:\n") 

     )
     )

(setq org-src-fontify-natively t
      org-src-tab-acts-natively t
      org-confirm-babel-evaluate nil
      org-edit-src-content-indentation 0)

;;(require 'org)
(eval-after-load "org"
  '(progn
     (setcar (nthcdr 2 org-emphasis-regexp-components) " \t\n,")
     (custom-set-variables `(org-emphasis-alist ',org-emphasis-alist))))

(defun cycle-spacing-delete-newlines ()
  "Removes whitespace before and after the point."
  (interactive)
  (if (version< emacs-version "24.4")
      (just-one-space -1)
    (cycle-spacing -1)))

(defun jump-to-symbol-internal (&optional backwardp)
  "Jumps to the next symbol near the point if such a symbol
exists. If BACKWARDP is non-nil it jumps backward."
  (let* ((point (point))
         (bounds (find-tag-default-bounds))
         (beg (car bounds)) (end (cdr bounds))
         (str (isearch-symbol-regexp (find-tag-default)))
         (search (if backwardp 'search-backward-regexp
                   'search-forward-regexp)))
    (goto-char (if backwardp beg end))
    (funcall search str nil t)
    (cond ((<= beg (point) end) (goto-char point))
          (backwardp (forward-char (- point beg)))
          (t  (backward-char (- end point))))))

(defun jump-to-previous-like-this ()
  "Jumps to the previous occurrence of the symbol at point."
  (interactive)
  (jump-to-symbol-internal t))

(defun jump-to-next-like-this ()
  "Jumps to the next occurrence of the symbol at point."
  (interactive)
  (jump-to-symbol-internal))

(defun kill-this-buffer-unless-scratch ()
  "Works like `kill-this-buffer' unless the current buffer is the
*scratch* buffer. In witch case the buffer content is deleted and
the buffer is buried."
  (interactive)
  (if (not (string= (buffer-name) "*scratch*"))
      (kill-this-buffer)
    (delete-region (point-min) (point-max))
    (switch-to-buffer (other-buffer))
    (bury-buffer "*scratch*")))

(defun duplicate-thing (comment)
  "Duplicates the current line, or the region if active. If an argument is
given, the duplicated region will be commented out."
  (interactive "P")
  (save-excursion
    (let ((start (if (region-active-p) (region-beginning) (point-at-bol)))
          (end   (if (region-active-p) (region-end) (point-at-eol))))
      (goto-char end)
      (unless (region-active-p)
        (newline))
      (insert (buffer-substring start end))
      (when comment (comment-region start end)))))

(defun tidy ()
  "Ident, untabify and unwhitespacify current buffer, or region if active."
  (interactive)
  (let ((beg (if (region-active-p) (region-beginning) (point-min)))
        (end (if (region-active-p) (region-end) (point-max))))
    (indent-region beg end)
    (whitespace-cleanup)
    (untabify beg (if (< end (point-max)) end (point-max)))))

(defun org-sync-pdf ()
  (interactive)
  (let ((headline (nth 4 (org-heading-components)))
        (pdf (concat (file-name-base (buffer-name)) ".pdf")))
    (when (file-exists-p pdf)
      (find-file-other-window pdf)
      (pdf-links-action-perform
       (cl-find headline (pdf-info-outline pdf)
                :key (lambda (alist) (cdr (assoc 'title alist)))
                :test 'string-equal)))))

(defadvice eval-last-sexp (around replace-sexp (arg) activate)
  "Replace sexp when called with a prefix argument."
  (if arg
      (let ((pos (point)))
        ad-do-it
        (goto-char pos)
        (backward-kill-sexp)
        (forward-sexp))
    ad-do-it))

(defadvice load-theme
    (before disable-before-load (theme &optional no-confirm no-enable) activate)
  (mapc 'disable-theme custom-enabled-themes))

(lexical-let* ((default (face-attribute 'default :height))
               (size default))

  (defun global-scale-default ()
    (interactive)
    (setq size default)
    (global-scale-internal size))

  (defun global-scale-up ()
    (interactive)
    (global-scale-internal (incf size 20)))

  (defun global-scale-down ()
    (interactive)
    (global-scale-internal (decf size 20)))

  (defun global-scale-internal (arg)
    (set-face-attribute 'default (selected-frame) :height arg)
    (set-temporary-overlay-map
     (let ((map (make-sparse-keymap)))
       (define-key map (kbd "C-=") 'global-scale-up)
       (define-key map (kbd "C-+") 'global-scale-up)
       (define-key map (kbd "C--") 'global-scale-down)
       (define-key map (kbd "C-0") 'global-scale-default) map))))

(add-hook 'compilation-filter-hook 'comint-truncate-buffer)

(lexical-let ((last-shell ""))
  (defun toggle-shell ()
    (interactive)
    (cond ((string-match-p "^\\*shell<[1-9][0-9]*>\\*$" (buffer-name))
           (goto-non-shell-buffer))
          ((get-buffer last-shell) (switch-to-buffer last-shell))
          (t (shell (setq last-shell "*shell<1>*")))))

  (defun switch-shell (n)
    (let ((buffer-name (format "*shell<%d>*" n)))
      (setq last-shell buffer-name)
      (cond ((get-buffer buffer-name)
             (switch-to-buffer buffer-name))
            (t (shell buffer-name)
               (rename-buffer buffer-name)))))

  (defun goto-non-shell-buffer ()
    (let* ((r "^\\*shell<[1-9][0-9]*>\\*$")
           (shell-buffer-p (lambda (b) (string-match-p r (buffer-name b))))
           (non-shells (cl-remove-if shell-buffer-p (buffer-list))))
      (when non-shells
        (switch-to-buffer (first non-shells))))))

(defadvice shell (after kill-with-no-query nil activate)
  (set-process-query-on-exit-flag (get-buffer-process ad-return-value) nil))

(defun clear-comint ()
  "Runs `comint-truncate-buffer' with the
`comint-buffer-maximum-size' set to zero."
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

(add-hook 'comint-mode-hook (lambda () (local-set-key (kbd "C-l") 'clear-comint)))

(dolist (mode '(cider-repl-mode
                clojure-mode
                ielm-mode
                geiser-repl-mode
                slime-repl-mode
                lisp-mode
                emacs-lisp-mode
                lisp-interaction-mode
                scheme-mode))
  ;; add paredit-mode to all mode-hooks
  (add-hook (intern (concat (symbol-name mode) "-hook")) 'paredit-mode))

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)

(add-hook 'cider-repl-mode-hook (lambda () (local-set-key (kbd "C-l") 'cider-repl-clear-buffer)))

(setq cider-cljs-lein-repl
      "(do (require 'figwheel-sidecar.repl-api)
           (figwheel-sidecar.repl-api/start-figwheel!)
           (figwheel-sidecar.repl-api/cljs-repl))")

(defun activate-slime-helper ()
  (when (file-exists-p "~/.quicklisp/slime-helper.el")
    (load (expand-file-name "~/.quicklisp/slime-helper.el"))
    (define-key slime-repl-mode-map (kbd "C-l")
      'slime-repl-clear-buffer))
  (remove-hook 'lisp-mode-hook #'activate-slime-helper))

(add-hook 'lisp-mode-hook #'activate-slime-helper)

(setq inferior-lisp-program "sbcl")

(setq lisp-loop-forms-indentation   6
      lisp-simple-loop-indentation  2
      lisp-loop-keyword-indentation 6)



(eval-after-load "geiser"
  '(setq geiser-active-implementations '(guile)))

(defun c-setup ()
  (local-set-key (kbd "C-c C-c") 'compile))

(add-hook 'c-mode-common-hook 'c-setup)

(define-abbrev-table 'java-mode-abbrev-table
  '(("psv" "public static void main(String[] args) {" nil 0)
    ("sopl" "System.out.println" nil 0)
    ("sop" "System.out.printf" nil 0)))

(defun java-setup ()
  (abbrev-mode t)
  (setq-local compile-command (concat "javac " (buffer-name))))

(add-hook 'java-mode-hook 'java-setup)

(defun asm-setup ()
  (setq comment-start "#")
  (local-set-key (kbd "C-c C-c") 'compile))

(add-hook 'asm-mode-hook 'asm-setup)

(load "auctex.el" nil t t)
(with-eval-after-load 'latex


(require 'reftex)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'reftex-mode)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook #'TeX-fold-mode) ;; Automatically activate TeX-fold-mode.
(add-hook 'LaTeX-mode-hook 'TeX-fold-buffer t)

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;  (add-hook 'LaTeX-mode-hook 'sublimity-mode 1)
(setq reftex-plug-into-AUCTeX t)
(setq reftex-default-bibliography '("/Users/jburgess/Documents/complete_bib.bib"))


)

(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(defun insert-markdown-inline-math-block ()
  "Inserts an empty math-block if no region is active, otherwise wrap a
math-block around the region."
  (interactive)
  (let* ((beg (region-beginning))
         (end (region-end))
         (body (if (region-active-p) (buffer-substring beg end) "")))
    (when (region-active-p)
      (delete-region beg end))
    (insert (concat "$math$ " body " $/math$"))
    (search-backward " $/math$")))

(add-hook 'markdown-mode-hook
          (lambda ()
            (auto-fill-mode 0)
            (visual-line-mode 1)
            (ispell-change-dictionary "norsk")
            (local-set-key (kbd "C-c b") 'insert-markdown-inline-math-block)) t)

(elpy-enable)

(with-eval-after-load 'elpy

(add-hook 'python-mode-hook (lambda ()
(require 'sphinx-doc)
(sphinx-doc-mode t)))

;; Activate python highlighting for PYX and PPL files
(add-to-list 'auto-mode-alist '("\\.pyx\\'" . cython-mode))
(add-to-list 'auto-mode-alist '("\\.ppl\\'" . cython-mode))



(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
(define-key global-map (kbd "C-c o") 'iedit-mode)


(add-hook 'python-mode-hook 'elpy-mode)

(remove-hook 'elpy-modules 'elpy-module-flymake)
(add-hook 'elpy-mode-hook 'flycheck-mode)

)

(defvar custom-bindings-map (make-keymap)
  "A keymap for custom bindings.")

(define-key custom-bindings-map (kbd "C-c D") 'define-word-at-point)

;; (define-key custom-bindings-map (kbd "C->")  'er/expand-region)
;; (define-key custom-bindings-map (kbd "C-<")  'er/contract-region)

;; (define-key custom-bindings-map (kbd "C-c e")  'mc/edit-lines)
;; (define-key custom-bindings-map (kbd "C-c a")  'mc/mark-all-like-this)
;; (define-key custom-bindings-map (kbd "C-c n")  'mc/mark-next-like-this)

(define-key custom-bindings-map (kbd "C-c m") 'magit-status)

(define-key company-active-map (kbd "C-d") 'company-show-doc-buffer)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "<tab>") 'company-complete)

(define-key custom-bindings-map (kbd "M-u")         'upcase-dwim)
(define-key custom-bindings-map (kbd "M-c")         'capitalize-dwim)
(define-key custom-bindings-map (kbd "M-l")         'downcase-dwim)
(define-key custom-bindings-map (kbd "M-]")         'other-frame)
(define-key custom-bindings-map (kbd "C-j")         'newline-and-indent)
(define-key custom-bindings-map (kbd "C-c s")       'ispell-word)
(define-key custom-bindings-map (kbd "C-x m")       'mu4e)
(define-key custom-bindings-map (kbd "C-c <up>")    'windmove-up)
(define-key custom-bindings-map (kbd "C-c <down>")  'windmove-down)
(define-key custom-bindings-map (kbd "C-c <left>")  'windmove-left)
(define-key custom-bindings-map (kbd "C-c <right>") 'windmove-right)
(define-key custom-bindings-map (kbd "C-c t")
  (lambda () (interactive) (org-agenda nil "n")))

(define-key global-map          (kbd "M-p")     'jump-to-previous-like-this)
(define-key global-map          (kbd "M-n")     'jump-to-next-like-this)
(define-key custom-bindings-map (kbd "M-,")     'jump-to-previous-like-this)
(define-key custom-bindings-map (kbd "M-.")     'jump-to-next-like-this)
(define-key custom-bindings-map (kbd "C-c .")   (cycle-themes))
(define-key custom-bindings-map (kbd "C-x k")   'kill-this-buffer-unless-scratch)
(define-key custom-bindings-map (kbd "C-c C-0") 'global-scale-default)
(define-key custom-bindings-map (kbd "C-c C-=") 'global-scale-up)
(define-key custom-bindings-map (kbd "C-c C-+") 'global-scale-up)
(define-key custom-bindings-map (kbd "C-c C--") 'global-scale-down)
(define-key custom-bindings-map (kbd "C-c j")   'cycle-spacing-delete-newlines)
(define-key custom-bindings-map (kbd "C-c d")   'duplicate-thing)
(define-key custom-bindings-map (kbd "<C-tab>") 'tidy)
(define-key custom-bindings-map (kbd "M-§")     'toggle-shell)
(dolist (n (number-sequence 1 9))
  (global-set-key (kbd (concat "M-" (int-to-string n)))
                  (lambda () (interactive) (switch-shell n))))
(define-key custom-bindings-map (kbd "C-c C-q")
  '(lambda ()
     (interactive)
     (focus-mode 1)
     (focus-read-only-mode 1)))
(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-'") 'org-sync-pdf))

(define-minor-mode custom-bindings-mode
  "A mode that activates custom-bindings."
  t nil custom-bindings-map)
