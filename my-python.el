(defadvice comint-previous-matching-input-from-input (around advice-a activate)
  (let ((p1 (point)))
    ad-do-it
    (goto-char p1)))
(defadvice comint-next-matching-input-from-input (around advice-a activate)
  (let ((p1 (point)))
    ad-do-it
    (goto-char p1)))
(define-key comint-mode-map (kbd "M-p") 'comint-previous-matching-input-from-input)
(define-key comint-mode-map (kbd "M-n") 'comint-next-matching-input-from-input)

(load-file (concat my-home-directory ".emacs.d/emacs-for-python/epy-init.el"))
(setq skeleton-pair nil)
(epy-setup-ipython)
(epy-setup-checker "pyflakes %f")

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat my-home-directory ".emacs.d/auto-complete/ac-dict"))
(ac-config-default)

(provide 'my-python)
