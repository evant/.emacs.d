;;; Helper functions
(defun add-to-path (path)
  (setenv "PATH" (concat (expand-file-name path) ":" (getenv "PATH")))
  (setq exec-path (cons (expand-file-name path) exec-path)))

(defun add-package (dir name)
  (setq load-path (cons (expand-file-name dir) load-path))
  (require name))

(defun add-hooks (hooks f)
  (mapc
    (lambda (hook) (add-hook hook f))
    hooks))

;;; Customization
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(global-set-key (kbd "M-n") 'new-frame)
(global-set-key (kbd "C-x a r") 'align-regexp)

;;; Packages
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;;; Ruby

;; rails-reloaded
(add-package "rails-reloaded" 'rails-autoload)

;; set rbenv path
(add-to-path "~/.rbenv/shims")
(add-to-path "~/.rbenv/bin")

;; other ruby files
(mapc (lambda (file)
       (add-to-list 'auto-mode-alist
		    (cons (concat file "$") '(. ruby-mode))))
     '("/.rake" "/.gemspec" "/.ru" "Rakefile" "Gemfile"))

;;; Plain Text
(defun plain-text ()
  (auto-fill-mode 1)
  (flyspell-mode 1))

(add-hook 'text-mode-hook 'plain-text)

;;; Lisp
(defun lisps ()
  (paredit-mode 1))

(add-hooks
 '(emacs-lisp-mode-hook
   clojure-mode-hook)
 'lisps)

;;; Code
(defun code ()
  (linum-mode 1)
  (flyspell-prog-mode))

(add-hooks
 '(emacs-lisp-mode-hook
   ruby-mode-hook
   java-mode-hook
   haskell-mode-hook
   python-mode-hook
   sh-mode-hook
   c-mode-common-hook
   clojure-mode-hook)
 'code)

(add-hook 'prog-mode 'code)
