(add-to-list 'load-path "~/.emacs.d/")
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

;; Global minor modes
(column-number-mode t)
(global-ede-mode t)
(global-font-lock-mode t)
(global-linum-mode t)
(whitespace-mode t)
(global-whitespace-mode t)
(show-paren-mode t)

;; Map major modes to file extensions
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\|cgi\\|t\\|psgi\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

(add-hook 'cperl-mode-hook (lambda ()
	(print "cperl-mode!")
	(defalias 'perl-mode 'cperl-mode)
	(setq
		cperl-hairy t
		cperl-highlight-variables-indiscriminately t
		cperl-continued-statement-offset 0
		cperl-extra-newline-before-brace nil
		cperl-tab-always-indent t
		cperl-indent-level 3
		cperl-electric-keywords nill)))

;;Whitespace mode settings:
(add-hook 'global-whitespace-mode-hook (lambda ()
	(setq
		global-whitespace-line-column 120
		global-whitespace-style
			'(empty trailing identation::tab space-before-tab::tab space-after-tab::tab))))

(setq indent-line-function 'insert-tab)
(setq indent-tabs-mode t)
(setq default-tab-width 3)
(setq tab-width 3)
(setq tab-stop-list (number-sequence 3 90 3))
(setq backward-delete-char-untabify-method nil)

(custom-set-faces
	'(font-lock-builtin-face ((t (:foreground "orange"))))
	'(font-lock-keyword-face ((t (:foreground "orange"))))
	'(font-lock-string-face ((t (:foreground "yellow"))))
	'(font-lock-variable-name-face ((t (:foreground "yellow" :weight bold))))
	'(whitespace-space ((((class color) (background dark)) (:foreground "gray15"))))
	'(whitespace-tab ((((class color) (background dark)) (:foreground "gray15"))))
	'(whitespace-newline ((t (:foreground "gray15" :weight normal))))
	'(cperl-array-face ((t (:foreground "red" :weight bold))))
	'(cperl-hash-face ((t (:foreground "red" :weight bold :background nil))))
	'(cperl-nonoverridable-face ((t (:foreground "orange"))))
)

(add-hook 'coffee-mode-hook (lambda ()
	(set (make-local-variable 'tab-width) 2)))
