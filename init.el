(add-hook 'c++-mode-hook 'rcc-style)
(add-hook 'c-mode-hook 'global-linum-mode)
(add-hook 'c-mode-hook 'rcc-style)
(add-hook 'python-mode-hook 'global-linum-mode)

(setq save-place-file (concat default-directory ".emacs.d/saved-places")
    save-interprogram-paste-before-kill t
    apropos-do-all t
    mouse-yank-at-point t
    read-file-name-completion-ignore-case t
    tab-width 4
    ido-use-virtual-buffers t
    frame-title-format '("Emacs @ : %b %+%+ %f")
    initial-scratch-message ""
    inhibit-startup-message t
    inhibit-startup-echo-area-message "guerry")

(tool-bar-mode 0)
(show-paren-mode 1)
(setq-default c-basic-offset 4)
(setq-default indent-tabs-mode nil)

(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'server-kill-buffer-query-function '(lambda () t))
(defalias 'yas/current-snippet-table 'yas--get-snippet-tables)
(defvar ido-cur-item nil)

(add-to-list 'load-path (concat default-directory "/.emacs.d/"))
(add-to-list 'load-path (concat default-directory "/.emacs.d/ace-jump-mode"))
(add-to-list 'load-path (concat default-directory "/.emacs.d/evil"))
(add-to-list 'load-path (concat default-directory "/.emacs.d/elscreen-1.4.6"))
(add-to-list 'load-path (concat default-directory "/.emacs.d/magit-1.2.0"))
(add-to-list 'load-path (concat default-directory "/.emacs.d/auto-complete"))
(add-to-list 'load-path (concat default-directory "/.emacs.d/ein"))

(require 'maxframe)
(maximize-frame)

(require 'cython-mode)	       	
(require 'dirtree)
(require 'windata)
(require 'tree-mode)
(require 'goto-last-change)
(require 'saveplace)
(setq-default save-place t)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(require 'ido)
(setq ido-enable-flex-matching t
    ido-everywhere t
    ido-use-filename-at-point nil)
(ido-mode 1) 
(require 'evil)
(evil-mode 1)
(require 'my-keymaps)
(require 'my-functions)
;; (require 'my-python)

;; ;; unstable
(require 'undo-tree)

(global-linum-mode)

(defun my-elscreen-load ()
  (interactive)
  (require 'elscreen)
  (load "elscreen" "ElScreen" t)
  (elscreen-start)
  (global-set-key "\C-t" 'elscreen-create)
  (my-define-niv "\C-t" 'elscreen-create)
  (my-define-nv "ght" 'elscreen-create)
  (elscreen-create)
  )


;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

(defadvice evil-find-char-to (around advice-a activate)
  (progn
    (forward-char)
    ad-do-it)
  )

(scroll-bar-mode -1)
(load-theme 'wombat t)
(setq evil-default-cursor t)
;; (disable-theme 'wombat)

;; (setq x-select-enable-clipboard t)
(global-set-key (kbd "C-S-v") 'paste-from-clipboard)
(global-set-key (kbd "C-S-c") 'copy-to-clipboard)

(require 'my-packages)

(require 'my-haskell)


(require 'tramp)
(setq tramp-default-method "ssh")
