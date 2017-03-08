(require 'package)

;; MELPA:
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/paradox.el/")

(require 'cperl-mode)
(require 'paradox)

;; Theme:
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)

;; General settings
(fset 'yes-or-no-p 'y-or-n-p)

;; Jedi.el:
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; Map major modes to file extensions
(add-to-list 'auto-mode-alist '("\\.rkt$" . (quack-pltfile-mode scheme-mode)))
(add-to-list 'auto-mode-alist '("\\.\\(txt\\|gfx\\|gui\\|asset\\)$" . paradox-mode))
(add-to-list 'auto-mode-alist
             '("\\.\\([pP][Llm]\\|cgi\\|t\\|psgi\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

;; Global minor modes
(column-number-mode t)
(global-ede-mode t)
(global-font-lock-mode t)
(global-linum-mode t)
; (global-electric-indent-mode nil)
(global-whitespace-mode t)
(show-paren-mode t)

(setq-default make-backup-files nil
              inhibit-startup-screen t
              indent-tabs-mode nil
              indent-line-function 'insert-tab
              backward-delete-char-untabify-method t
	      linum-format "%d "
              whitespace-line-column 79
              whitespace-style '(face trailing tabs lines-tail empty))

(set-fontset-font t 'unicode "Symbola" nil 'prepend)

(add-hook 'cperl-mode-hook
          (lambda ()
            (defalias 'perl-mode 'cperl-mode)
            (set-face-background 'cperl-array-face nil)
            (set-face-background 'cperl-hash-face nil)
            (setq cperl-hairy nil
                  cperl-highlight-variables-indiscriminately t
                  cperl-continued-statement-offset 4
                  cperl-extra-newline-before-brace nil
                  cperl-indent-level 4
                  cperl-indent-parens-as-block t
                  cperl-electric-keywords nil
                  cperl-electric-parens t
                  cperl-tab-always-indent nil
                  indent-tabs-mode nil)))

(add-hook 'paradox-mode-hook
          (lambda () (setq whitespace-style '(face trailing lines-tail empty)
                           indent-tabs-mode t
                           tab-width 4
                           backward-delete-char-untabify-method nil)))

(add-hook 'js-mode-hook
          (lambda () (setq js-indent-level 2)))

;(add-hook 'sql-mode-hook
;          (lambda ()
;            (setq default-tab-width 2
;                  whitespace-line-column 100
;                  backward-delete-char-untabify-method t)))
