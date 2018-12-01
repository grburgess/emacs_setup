;; Added by Package.el.  This must come before configurations of
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




;;;; SMEX and IDO

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'ido)
(ido-mode t)

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

(add-hook 'python-mode-hook 'elpy-mode)
(with-eval-after-load 'elpy
(remove-hook 'elpy-modules 'elpy-module-flymake)
(add-hook 'elpy-mode-hook 'flycheck-mode))

;;;;;;;; AC

(require 'auto-complete)
(setq ac-auto-start nil)
(ac-set-trigger-key "TAB")


;; (require 'ssh)
;; (add-hook 'ssh-mode-hook
;; 	  (lambda ()
;; 	    (setq ssh-directory-tracking-mode t)
;;                 (shell-dirtrack-mode t)
;;                 (setq dirtrackp nil)))

;;( setq tramp-default-method "ssh")


 (mapc
 (lambda (p)
   (unless (package-installed-p p)
     (package-install p)))
 '(stan-mode stan-snippets))


(add-hook 'after-init-hook 'global-color-identifiers-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-responsive 'stack)

;; (set-face-background 'highlight-indentation-face "#000000")
;; (set-face-background 'highlight-indentation-current-column-face "#000000")


(setq custom-safe-themes t)

(require 'smart-mode-line)
;; These two lines you really need.
;; (setq sml/applytheme 'atom-one-dark)
;; (setq powerline-arrow-shape 'curve)
;; (setq powerline-default-separator-dir '(right . left))
;; (setq sml/theme 'powerline)
(set-face-attribute 'mode-line nil
                    :foreground "Black"
                    :background "Black"
                    :box nil)

(sml/setup)




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
 '(highlight-indent-guides-method (quote character))
 '(highlight-indent-guides-responsive (quote stack))
 '(package-selected-packages
   (quote
    (auto-complete smex yasnippet-snippets yaml-mode stan-snippets ssh sphinx-doc spacemacs-theme smart-mode-line-powerline-theme smart-mode-line-atom-one-dark-theme rope-read-mode rainbow-identifiers rainbow-delimiters python-docstring origami omtose-phellack-theme markdown-mode magit kaolin-themes js2-mode highlight-numbers highlight-indent-guides gist flymake-python-pyflakes flycheck ess elpy dockerfile-mode cython-mode context-coloring company-irony-c-headers color-identifiers-mode colonoscopy-theme auctex))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
