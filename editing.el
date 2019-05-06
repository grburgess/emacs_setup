(require 'undo-tree)
(global-undo-tree-mode)

;; define pasting to osx 
(defun copy-from-osx ()
(shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
(let ((process-connection-type nil))
(let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
(process-send-string proc text)
(process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx) 

;(require 'shell-pop)



(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)
