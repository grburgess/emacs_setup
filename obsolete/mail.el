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

