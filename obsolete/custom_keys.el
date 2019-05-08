

;; join the line below with the current line
(global-set-key (kbd "M-j") (lambda () (interactive)
                  (join-line -1)))
(global-set-key (kbd "C-x C-b") 'ibuffer)
    (autoload 'ibuffer "ibuffer" "List buffers." t)
