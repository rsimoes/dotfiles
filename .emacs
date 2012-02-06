(add-to-list 'load-path "~/.emacs.d/")
(require 'ats-mode)
(require 'color-theme)
(require 'cperl-mode)
(require 'coffee-mode)
(require 'whitespace)

(color-theme-initialize)
(color-theme-taylor)

;; General settings
(fset 'yes-or-no-p 'y-or-n-p)
(setq make-backup-files nil)
(setq inhibit-startup-screen t)

;; Map major modes to file extensions
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
(add-to-list 'auto-mode-alist
			 '("\\.\\([pP][Llm]\\|cgi\\|t\\|psgi\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

(let ((faces '(
	(font-lock-comment-face :foreground "#4d7a70" :slant italic)
	(font-lock-constant-face :foreground "#6b7875")
	(font-lock-string-face :foreground "#7a633d")
	(font-lock-type-face :foreground "grey50")
	(font-lock-warning-face :foreground "#cd5c5c")
	(font-lock-preprocessor-face :foreground "#596766" :weight bold)
	(font-lock-doc-face :foreground "#707f75" :slant italic)
	(font-lock-keyword-face :foreground "#665d9c" :weight bold)
	(font-lock-builtin-face :foreground "gray50" :weight bold)
	(font-lock-function-name-face :foreground "#2e5fa2" :weight bold)
	(font-lock-variable-name-face :foreground "#6f5057" :weight bold)
	(whitespace-space :background "black" :foreground "gray15")
	(whitespace-tab :background "black" :foreground "gray15")
	(whitespace-newline :background "black" :foreground "gray15")
	(mode-line :background "#bedefe" :box (:line-width 2 :color "gray85")))))
	(dolist (face faces)
		(apply 'set-face-attribute (car face) nil (cdr face))))

(add-hook 'cperl-mode-hook (lambda ()
	(print "cperl-mode!")
	(defalias 'perl-mode 'cperl-mode)
	(set-face-background 'cperl-array-face nil)
	(set-face-background 'cperl-hash-face nil)
	(setq
		cperl-hairy t
		cperl-highlight-variables-indiscriminately t
		cperl-continued-statement-offset 0
		cperl-extra-newline-before-brace nil
		cperl-tab-always-indent t
		cperl-indent-level 3
		cperl-indent-parens-as-block t
		cperl-electric-keywords nil)))

(setq
	indent-line-function 'insert-tab
	default-tab-width 3
	tab-width 3
	tab-stop-list (number-sequence 4 120 4)
	backward-delete-char-untabify-method nil)

;; Global minor modes
(column-number-mode t)
(global-ede-mode t)
(global-font-lock-mode t)
(global-linum-mode t)
(global-whitespace-mode t)
(show-paren-mode t)

(add-hook 'coffee-mode-hook (lambda ()
	(set (make-local-variable 'tab-width) 2)))
