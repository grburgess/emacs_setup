
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'ido)
(ido-mode t)

(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'load-path "path/to/company-auctex.el")
(require 'company-auctex)
(company-auctex-init)

;;;;;;;; AC

;(require 'auto-complete)
;(setq ac-auto-start nil)
;(ac-set-trigger-key "TAB")

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





(require 'yasnippet)
;; ;; (global-set-key (kbd "C-:") 'avy-goto-char)
;; (avy-setup-default)
;; (global-set-key (kbd "C-c C-j") 'avy-resume)
