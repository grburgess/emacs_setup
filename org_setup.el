

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

