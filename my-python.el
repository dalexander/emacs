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

(setq pycodechecker "pylint_wrapper.py")
(setq pycodechecker-args " -P /home/russell/app/bin")
(when (load "flymake" t)
  ;; (defun flymake-pylint-init ()
  ;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
  ;;              'flymake-create-temp-inplace))
  ;;      (local-file (file-relative-name
  ;;           temp-file
  ;;           (file-name-directory buffer-file-name))))
  ;;     (list pycodechecker (list pycodechecker-args local-file))))

  ;; (add-to-list 'flymake-allowed-file-name-masks
  ;;          '("\\.py\\'" flymake-pylint-init))

  (defun flymake-show-error-at-point ()
    (when (get-char-property (point) 'flymake-overlay)
      (let ((help (get-char-property (point) 'help-echo)))
    (if help (message "%s" help)))))

  (add-hook 'post-command-hook 'flymake-show-error-at-point)
  (custom-set-faces
   '(flymake-errline ((((class color)) (:underline "red"))))
   '(flymake-warnline ((((class color)) (:underline "orange"))))))


(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat my-home-directory ".emacs.d/auto-complete/ac-dict"))
(ac-config-default)

(provide 'my-python)
