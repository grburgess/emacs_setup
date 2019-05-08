
(require 'stan-mode)

(with-eval-after-load 'stan

(require 'stan-snippets)
(yas-global-mode 1)
(add-hook 'stan-mode-hook '(lambda () (yas-minor-mode)))

)
