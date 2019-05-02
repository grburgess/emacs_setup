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
