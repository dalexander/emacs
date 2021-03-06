(add-hook 'c++-mode-hook 'rcc-style)
(add-hook 'c-mode-hook 'global-linum-mode)
(add-hook 'c-mode-hook 'rcc-style)
(add-hook 'python-mode-hook 'global-linum-mode)

(setq save-place-file (concat my-home-directory ".emacs.d/saved-places")
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

(add-to-list 'load-path (concat my-home-directory "/.emacs.d/"))
(add-to-list 'load-path (concat my-home-directory "/.emacs.d/ace-jump-mode"))
(add-to-list 'load-path (concat my-home-directory "/.emacs.d/evil"))
(add-to-list 'load-path (concat my-home-directory "/.emacs.d/elscreen-1.4.6"))
(add-to-list 'load-path (concat my-home-directory "/.emacs.d/magit-1.2.0"))
(add-to-list 'load-path (concat my-home-directory "/.emacs.d/auto-complete"))
(add-to-list 'load-path (concat my-home-directory "/.emacs.d/ein"))

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
(require 'my-haskell)
(require 'my-python)

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
(when (display-graphic-p) (load-theme 'wombat t))
(setq evil-default-cursor t)
;; (disable-theme 'wombat)

;; (setq x-select-enable-clipboard t)
(global-set-key (kbd "C-S-v") 'paste-from-clipboard)
(global-set-key (kbd "C-S-c") 'copy-to-clipboard)

(require 'my-packages)



(require 'tramp)
(setq tramp-default-method "ssh")
(setenv "INPUTRC" "/dev/null")

(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(require 'flymake-rust)
(add-hook 'rust-mode-hook 'flymake-rust-load)

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(defun my:ac-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/include/c++/4.8")
  (add-to-list 'achead:include-directories '"/usr/include/x86_64-linux-gnu/c++/4.8")
  (add-to-list 'achead:include-directories '"/usr/include/c++/4.8/backward")
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/4.8/include")
  (add-to-list 'achead:include-directories '"/usr/local/include")
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed")
  (add-to-list 'achead:include-directories '"/usr/include/x86_64-linux-gnu")
  (add-to-list 'achead:include-directories '"/usr/include")
)

(add-hook 'c++-mode-hook 'my:ac-header-init)
(add-hook 'c-mode-hook 'my:ac-header-init)
(define-key global-map (kbd "C-c ;") 'iedit-mode)

(defun my:google-cpp-lint-init ()
  (require 'flymake-google-cpplint)
  (custom-set-variables
   '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
  (flymake-google-cpplint-load)
)
(add-hook 'c++-mode-hook 'my:google-cpp-lint-init)
(add-hook 'c-mode-hook 'my:google-cpp-lint-init)

; list-packages deps: (el-complete, auto-complete, auto-complete-c-headers, iedit, flymake-google-cpp-lint)

