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

;; ;; unstable

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

;; (require 'magit)
;; ;; full screen magit-status
;; (defadvice magit-status (around magit-fullscreen activate)
;;   (window-configuration-to-register :magit-fullscreen)
;;   ad-do-it
;;   (delete-other-windows))

;; (defun magit-quit-session ()
;;   "Restores the previous window configuration and kills the magit buffer"
;;   (interactive)
;;   (kill-buffer)
;;   (jump-to-register :magit-fullscreen))

;; (define-key magit-status-mode-map (kbd "q") 'magit-quit-session)

(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; (define-key dired-mode-map (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)
;; (define-key dired-mode-map (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)
;; (require 'dired-details)
;; (setq-default dired-details-hidden-string "--- ")
;; (dired-details-install)
;; (evil-define-key 'normal dired-mode-map (kbd "gg") 'dired-back-to-top)
;; (evil-define-key 'normal dired-mode-map (kbd "g") 'dired-jump-to-bottom)
;; (define-key magit-status-mode-map (kbd "/") 'evil-search-forward)
(require 'ein)
(require 'websocket)
(require 'request)

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

(require 'my-python)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(add-to-list 'package-archives
     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(add-hook 'haskell-mode-hook 'haskell-indent-mode)

(require 'tramp)
(setq tramp-default-method "ssh")
