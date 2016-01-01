; Steven Kneiser's .emacs
;
; Date Modified: 12/31/2015

; Python major mode
;  (for .py files)
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode)
				   interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)

; Markdown major mode
;  (for .md files)
(setq auto-mode-alist (cons '("\\.md$" . markdown-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("markdown" . markdown-mode)
				   interpreter-mode-alist))
(autoload 'markdown-mode "markdown-mode" "Markdown editing mode." t)

; Protocol Buffer major mode
;  (for .proto files)
(setq auto-mode-alist (cons '("\\.proto$" . protobuf-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("protobuf" . protobuf-mode)
				   interpreter-mode-alist))
(autoload 'protobuf-mode "protobuf-mode" "Protocol Buffer editing mode." t)

;; Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/lisp/")

