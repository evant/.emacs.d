(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(defun add-to-path (path)
  (setenv "PATH" (concat path ":" (getenv "PATH")))
  (setq exec-path (cons path exec-path)))

(defun add-to-home-path (path)
  (add-to-path (concat (getenv "HOME") "/" path)))

;; Set rbenv path\
(add-to-home-path ".rbenv/shims")
(add-to-home-path ".rbenv/bin")

(global-set-key (kbd "M-n") 'new-frame)
(global-set-key (kbd "C-x a r") 'align-regexp)

(defun add-hooks (hooks f)
  (mapc
    (lambda (hook) (add-hook hook f))
    hooks))

(defun plain-text ()
  (auto-fill-mode 1)
  (flyspell-mode 1))

(defun code ()
  (linum-mode 1)
  (flyspell-prog-mode))

(defun lisps ()
  (paredit-mode 1))

(add-hook 'text-mode-hook 'plain-text)
(add-hook 'prog-mode 'code)

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

(add-hooks
 '(emacs-lisp-mode-hook
   clojure-mode-hook)
 'lisps)
