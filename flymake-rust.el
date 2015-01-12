;; flymake-rust.el
(require 'flymake)
(require 'rust-mode)

(defun flymake-rust-init ()
      (let* ((temp-file (flymake-init-create-temp-buffer-copy
                         'flymake-create-temp-inplace))
             (local-file (file-relative-name
                          temp-file
                          (file-name-directory buffer-file-name))))
        (list "/usr/local/bin/rustc" (list "--no-trans" local-file))))

(add-to-list 'flymake-allowed-file-name-masks
  '(".+\\.r[cs]$" flymake-rust-init
    flymake-simple-cleanup flymake-get-real-file-name))

(defun flymake-rust-load ()
  (flymake-mode t)
  ;; change these bindings as you see fit
  (local-set-key (kbd "C-c C-d") 'flymake-display-err-menu-for-current-line)
  (local-set-key (kbd "C-c C-n") 'flymake-goto-next-error)
  (local-set-key (kbd "C-c C-p") 'flymake-goto-prev-error))

(add-hook 'rust-mode-hook 'flymake-rust-load)

(provide 'flymake-rust)
