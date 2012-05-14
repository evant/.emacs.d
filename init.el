(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(global-set (kbd "M-n") 'new-frame)

fun add-hooks (hooks f)
  (mapc
    (lambda (hook) (add-hook hook f))
    hooks))

(defun plain-text ()
  (auto-fill-mode 1))

(defun code ()
  (linum-mode 1))

(add-hook 'text-mode-hook 'plain-text)
(add-hook 'prog-mode 'code)

(add-hooks
  '(emacs-lisp-mode-hook
    ruby-mode-hook
    java-mode-hook
    haskell-mode-hook
    python-mode-hook
    sh-mode-hook
    c-mode-common-hook)
  'code)
