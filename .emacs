(add-to-list 'load-path "~/.emacs.d")
(require 'coffee-mode)

(add-to-list 'auto-mode-alist '("\\.coffee\\'" . cofee-mode))

(color-theme-initialize)
(color-theme-taylor)
(show-ws-toggle-show-trailing-whitespace)

(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\|cgi\\|t\\)\\'" . cperl-mode))
;(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
;(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
;(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))
(add-hook 'cperl-mode-hook 'le-cperl-mode-hook t)
(defun le-cperl-mode-hook ()
	(message "cperl-mode hook!")
	(defalias 'perl-mode 'cperl-mode)
	(setq cperl-hairy t) ;; Turns on most of the CPerlMode options

;; this fixes the problem that most color themes have with cperl-mode.
	(defvar cperl-array-face)               ;tell compiler not to warn
                                        ;about this varible
	(add-hook 'cperl-mode-hook (lambda () (set-face-background
                                       cperl-array-face nil)))
	(setq cperl-continued-statement-offset 0)
	(setq cperl-extra-newline-before-brace nil)
	(setq cperl-tab-always-indent nil)
	(setq cperl-invalid-face nil)
	(setq cperl-highlight-variables-indiscriminately t)
	(setq cperl-electric-backspace-untabify nil)
	(setq cperl-indent-level 3)

	(linum-mode t)
	(whitespace-mode t)
)

;;Turn on font lock mode
(global-font-lock-mode t)

;;Show matching parenthesis
(show-paren-mode 1)

;;Use y or n for yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;;Indentation settings
(setq indent-tabs-mode t)
(setq-default indent-tabs-mode t)
(setq default-tab-width 3)
(setq tab-width 3)
(setq tab-stop-list (quote (3 6 9 12 15 18 21 24 24 27 30 33 36 39 41 45 48 51 54 60)))

;;Miscellaneous startup settings
(setq make-backup-files nil)
(setq inhibit-startup-screen t)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(global-whitespace-mode nil)
 '(global-whitespace-newline-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
	'(cperl-array-face ((t (:foreground "Orange" :weight bold))))
	'(cperl-hash-face ((t (:foreground "Red" :weight bold :background nil))))
	'(font-lock-builtin-face ((t (:foreground "Cyan"))))
	'(font-lock-string-face ((t (:foreground "Green"))))
	'(font-lock-variable-name-face ((t (:foreground "Yellow" :weight bold))))
	'(whitespace-newline ((t (:foreground "gray15" :weight normal))))
	'(whitespace-space ((((class color) (background dark)) (:foreground "gray15"))))
	'(whitespace-tab ((((class color) (background dark)) (:foreground "gray15"))))
)
