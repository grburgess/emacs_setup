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
