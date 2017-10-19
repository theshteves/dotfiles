;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;{{{
;
; Steven Kneiser's dope .emacs
; 
; Raw version:
;   https://raw.githubusercontent.com/theshteves/dotfiles/master/.emacs
;
; Navigating this .emacs w/ vim folds:
;   I provided manual fold markers so you can shrink and expand this file at 
;   your pleasure so first enable folding in you current buffer:
;   
;   	:set foldmethod=marker
;
;	Now you can press "za" within any Section to shrink/expand multiple lines
;
; Sections:
;   -> General
;   -> User Interface
;   -> Modes
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;}}}
;
; GENERAL
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;{{{
; auto-load personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/lisp/")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;}}}
;
; USER INTERFACE
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;{{{
; turn off the toolbar
(tool-bar-mode -1)

; turn off the menu bar
(menu-bar-mode -1)

; eliminate long "yes" or "no" prompts
(fset 'yes-or-no-p 'y-or-n-p)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;}}}
;
; MODES
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;{{{
; ORG MODE BABY
; ...it didn't do the thing :_(

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
