(add-hook 'haskell-mode-hook 'haskell-indent-mode)
(add-hook 'haskell-mode-hook 'redef-evil-open-below)
(defun redef-evil-open-below ()
    (defun evil-open-below (count)
      "Insert a new line below point and switch to Insert state.
    The insertion will be repeated COUNT times."
      (interactive "p")
      (evil-insert-newline-below)
      (setq evil-insert-count count
            evil-insert-lines t
            evil-insert-vcount nil)
      (evil-insert-state 1)
      (add-hook 'post-command-hook #'evil-maybe-remove-spaces)
      ;; (when evil-auto-indent
      ;;   (indent-according-to-mode))
      )
    (defun evil-open-above (count)
      "Insert a new line above point and switch to Insert state.
    The insertion will be repeated COUNT times."
      (interactive "p")
      (evil-insert-newline-above)
      (setq evil-insert-count count
            evil-insert-lines t
            evil-insert-vcount nil)
      (evil-insert-state 1)
      (add-hook 'post-command-hook #'evil-maybe-remove-spaces)
      ;; (when evil-auto-indent
      ;;   (indent-according-to-mode))
      )
    (my-define-niv (kbd "RET") 'evil-undefine)
    )

(provide 'my-haskell)
