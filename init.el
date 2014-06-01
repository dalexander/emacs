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
(add-to-list 'load-path (concat default-directory "/.emacs.d/multiple-cursors"))

(require 'maxframe)
(maximize-frame)


(require 'cython-mode)	       	
(require 'magit)
(require 'dirtree)
(require 'windata)
(require 'tree-mode)
(require 'goto-last-change)
;; (require 'cl)
(require 'saveplace)
(setq-default save-place t)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(require 'surround)
(global-surround-mode 1)
(require 'ido)
(setq ido-enable-flex-matching t
    ido-everywhere t
    ido-use-filename-at-point nil)
(ido-mode 1) 
(require 'my-functions)
(require 'my-keymaps)

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

(define-key dired-mode-map (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)
(define-key dired-mode-map (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; full screen magit-status
(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)

(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(require 'multiple-cursors)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c v") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-<") 'mc/mark-all-words-like-this)

(require 'dired-details)
(setq-default dired-details-hidden-string "--- ")
(dired-details-install)
(require 'ein)
(require 'websocket)
(require 'request)

(defadvice evil-find-char-to (around advice-a activate)
  (progn
    (forward-char)
    ad-do-it)
  )
(defadvice comint-previous-matching-input-from-input (around advice-a activate)
  (let ((p1 (point)))
    ad-do-it
    (goto-char p1)))
(defadvice comint-next-matching-input-from-input (around advice-a activate)
  (let ((p1 (point)))
    ad-do-it
    (goto-char p1)))
(define-key comint-mode-map (kbd "C-p") 'comint-previous-matching-input-from-input)
(define-key comint-mode-map (kbd "C-n") 'comint-next-matching-input-from-input)

(evil-define-key 'normal dired-mode-map (kbd "gg") 'dired-back-to-top)
(evil-define-key 'normal dired-mode-map (kbd "g") 'dired-jump-to-bottom)
(define-key magit-status-mode-map (kbd "/") 'evil-search-forward)


(load-file (concat default-directory ".emacs.d/emacs-for-python/epy-init.el"))
(setq skeleton-pair nil)
(epy-setup-ipython)
;; (epy-setup-checker "pyflakes %f")

(scroll-bar-mode -1)
(load-theme 'wombat t)
(setq evil-default-cursor t)
;; (disable-theme 'wombat)

;; (setq x-select-enable-clipboard t)
(global-set-key [f8] 'copy-to-clipboard)
(global-set-key [f9] 'paste-from-clipboard)
(global-set-key (kbd "C-S-v") 'paste-from-clipboard)


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


(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat default-directory ".emacs.d/auto-complete/ac-dict"))
(ac-config-default)


(require 'edit-server)
(edit-server-start)

(setq global-wakatime-mode t)
(setq wakatime-cli-path (concat (getenv "HOME") ".emacs.d/wakatime/wakatime-cli.py") )
(setq wakatime-api-key "56fcb503-5a20-4483-82b4-f47dd6642830")

(require 'org)

(evil-declare-key 'normal org-mode-map (kbd "<C-tab>") 'elscreen-next)
(mapcar (lambda (state)
    (evil-declare-key state org-mode-map
      (kbd "M-l") 'org-metaright
      (kbd "M-h") 'org-metaleft
      (kbd "M-p") 'org-metaup
      (kbd "M-n") 'org-metadown
      (kbd "M-L") 'org-shiftmetaright
      (kbd "M-H") 'org-shiftmetaleft
      (kbd "M-P") 'org-shiftmetaup
      (kbd "M-N") 'org-shiftmetadown))
  '(normal insert))

(add-hook 'haskell-mode-hook 'haskell-indent-mode)

(require 'tramp)
(setq tramp-default-method "ssh")
