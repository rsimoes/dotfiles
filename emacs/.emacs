(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/haskell-mode/")
(require 'ats-mode)
(require 'color-theme)
(require 'cperl-mode)
(require 'whitespace)
(require 'jade-mode)
(require 'stylus-mode)
(require 'haskell-mode)

(color-theme-initialize)
(color-theme-taylor)

;; General settings
(fset 'yes-or-no-p 'y-or-n-p)

;; Map major modes to file extensions
(add-to-list 'auto-mode-alist '("\\.rkt$" . (quack-pltfile-mode scheme-mode)))
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
(global-whitespace-mode t)
(show-paren-mode t)

(setq-default make-backup-files nil
      inhibit-startup-screen t
      indent-tabs-mode nil
      indent-line-function 'insert-tab
      backward-delete-char-untabify-method t
      whitespace-style '(face trailing tabs lines-tail empty))

(let ((faces
       '(
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
         (mode-line :background "#bedefe" :box
                    (:line-width 2 :color "gray85")))))
  (dolist (face faces)
    (apply 'set-face-attribute (car face) nil (cdr face))))

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

(add-hook 'js-mode-hook
          (lambda () (setq js-indent-level 2)))

;(add-hook 'sql-mode-hook
;          (lambda ()
;            (setq default-tab-width 2
;                  whitespace-line-column 100
;                  backward-delete-char-untabify-method t)))
