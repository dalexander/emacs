(load-file (concat default-directory ".emacs.d/emacs-for-python/epy-init.el"))
(setq skeleton-pair nil)
(epy-setup-ipython)
;; (epy-setup-checker "pyflakes %f")

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat default-directory ".emacs.d/auto-complete/ac-dict"))
(ac-config-default)

;; set up pylint
(setq pycodechecker "pylint_wrapper.py")
(setq pycodechecker-args " -P /home/russell/app/bin")
(when (load "flymake" t)
  (defun flymake-pylint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
               'flymake-create-temp-inplace))
       (local-file (file-relative-name
            temp-file
            (file-name-directory buffer-file-name))))
      (list pycodechecker (list pycodechecker-args local-file))))

  (add-to-list 'flymake-allowed-file-name-masks
           '("\\.py\\'" flymake-pylint-init))

  (defun flymake-show-error-at-point ()
    (when (get-char-property (point) 'flymake-overlay)
      (let ((help (get-char-property (point) 'help-echo)))
    (if help (message "%s" help)))))

  (add-hook 'post-command-hook 'flymake-show-error-at-point)
  (custom-set-faces
   '(flymake-errline ((((class color)) (:underline "red"))))
   '(flymake-warnline ((((class color)) (:underline "orange"))))))

(provide 'my-python)
