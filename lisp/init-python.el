(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))

(require-package 'pip-requirements)
(require-package 'jedi)
(require-package 'sphinx-doc)
(require-package 'pyenv-mode)
(require-package 'anaconda-mode)

;;;(add-hook 'python-mode-hook 'jedi:setup)
(setq python-shell-virtualenv-path "~/.emacs.d/.python-environments/default")
(pyenv-mode)

(add-hook 'python-mode-hook (lambda ()
                              (require 'sphinx-doc)
                              (sphinx-doc-mode t)))
(add-to-list 'company-backends 'company-anaconda)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'eldoc-mode)

(setq jedi:complete-on-dot t)
;;;(setq jedi:server-args '("--log-traceback")

(when (maybe-require-package 'anaconda-mode)
  (after-load 'python
    (add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode))
  (when (maybe-require-package 'company-anaconda)
    (after-load 'company
      (add-hook 'python-mode-hook
                (lambda () (sanityinc/local-push-company-backend 'company-anaconda))))))


(provide 'init-python)
