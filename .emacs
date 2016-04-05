; Steven Kneiser's .emacs
;
; Date Modified: 12/31/2015

; turn off the toolbar
(tool-bar-mode -1)

; turn off the menu bar
(menu-bar-mode -1)

; eliminate long "yes" or "no" prompts
(fset 'yes-or-no-p 'y-or-n-p)

; Python major mode (for .py files)
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode)
				   interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)

; Markdown major mode (for .md files)
(setq auto-mode-alist (cons '("\\.md$" . markdown-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("markdown" . markdown-mode)
				   interpreter-mode-alist))
(autoload 'markdown-mode "markdown-mode" "Markdown editing mode." t)

; Protocol Buffer major mode (for .proto files)
(setq auto-mode-alist (cons '("\\.proto$" . protobuf-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("protobuf" . protobuf-mode)
				   interpreter-mode-alist))
(autoload 'protobuf-mode "protobuf-mode" "Protocol Buffer editing mode." t)

; auto-load personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/lisp/")

; ORG MODE BABY
; ...it didn't do the thing :_(

