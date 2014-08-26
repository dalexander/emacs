(require 'surround)
(global-surround-mode 1)

(require 'evil-numbers)
(define-key evil-normal-state-map (kbd "gp") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "gm") 'evil-numbers/dec-at-pt)

(require 'evil-nerd-commenter)

(global-unset-key "\C-l")
(global-unset-key "\C-q")
(global-unset-key "\C-r")
(global-unset-key "\M-t")
(global-set-key [f5] 'compile)
(global-set-key (kbd "C-r") 'undo-tree-redo)

(define-key evil-normal-state-map "\C-e" 'evil-end-of-line)
(define-key evil-motion-state-map "\C-e" 'evil-end-of-line)
(define-key evil-insert-state-map "\C-e" 'end-of-line)
(define-key evil-visual-state-map "\C-e" 'evil-end-of-line)

(defmacro my-define-niv (in out) `(progn
                                (define-key evil-normal-state-map ,in ,out)
                                (define-key evil-insert-state-map ,in ,out)
                                (define-key evil-visual-state-map ,in ,out)
                                (define-key evil-motion-state-map ,in ,out)
                                    ))
(defmacro my-define-nv (in out) `(progn
                                (define-key evil-normal-state-map ,in ,out)
                                (define-key evil-visual-state-map ,in ,out)
                                (define-key evil-motion-state-map ,in ,out)
                                    ))

(global-set-key (kbd "M-/") 'auto-complete)
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)

(my-define-niv "\C-n" 'evil-next-line)
(my-define-niv "\C-p" 'evil-previous-line)
(my-define-niv "\C-k" 'kill-line)

(my-define-nv "u" 'undo-tree-undo)
(my-define-nv "ghmd" 'vc-version-diff)
(my-define-nv "gs" 'vc-version-diff)
(my-define-nv "Q" 'call-last-kbd-macro)
(my-define-nv (kbd "p") 'evil-paste-after2)
(my-define-nv (kbd "P") 'evil-paste-before2)
(my-define-nv (kbd "R") 'evil-destroy-and-paste)
(my-define-nv (kbd "TAB") 'evil-undefine)
(my-define-nv (kbd "grep") 'occur)
(my-define-nv (kbd "go") 'ido-find-file) 
(my-define-nv (kbd "gb") 'ido-switch-buffer)
(my-define-nv (kbd "gt") 'elscreen-next)
(my-define-nv (kbd "gT") 'elscreen-previous)
;; (my-define-nv (kbd "gs") 'magit-status)
;; (my-define-nv (kbd "ghms") 'magit-status)
(my-define-nv (kbd "gcgc") (kbd "C-c C-c"))
(my-define-nv (kbd "gcc") 'compile)
;; (my-define-nv (kbd "g.") 'ido-dired)
(my-define-nv (kbd "g,") 'evilnc-comment-or-uncomment-lines)
(my-define-nv (kbd "g'") 'evilnc-copy-and-comment-lines)
(my-define-nv (kbd "gho") 'other-window)
(my-define-nv (kbd "ghe") 'eval-last-sexp)
(my-define-nv (kbd "ghs") 'save-buffer)
(my-define-nv (kbd "ghq") 'kill-this-buffer)
(my-define-nv (kbd "ghhk") 'describe-key)
(my-define-nv (kbd "ghhv") 'describe-variable)
(my-define-nv (kbd "ghhf") 'describe-function)
(my-define-nv (kbd "ghha") 'apropos-command)
(my-define-nv (kbd "ght") 'my-elscreen-load)
(my-define-nv (kbd "ghx") 'elscreen-kill)
(my-define-nv (kbd "ghc") 'compile)
(my-define-nv (kbd "g0") 'delete-window)
(my-define-nv (kbd "g1") 'delete-other-windows)
(my-define-nv (kbd "g2") 'split-window-below)
(my-define-nv (kbd "g3") 'split-window-right)
(my-define-nv (kbd "g4") 'toggle-window-split)
(my-define-nv (kbd "g5") 'rotate-windows)
(my-define-nv (kbd "ghph") 'python-shell-send-buffer)
(my-define-nv (kbd "ghpp") 'run-python)
(my-define-nv (kbd "ghpe") 'python-shell-send-region)
(my-define-nv (kbd "ghpd") 'python-shell-send-defun)
(my-define-nv (kbd "ghpl") (kbd "0 v $ C-c C-r"))
(my-define-nv (kbd "ghpv") 'virtualenv-activate)
(my-define-nv (kbd "ghpc") (kbd "C-c C-v"))
(my-define-nv (kbd "ghpr") 'rope-rename)
(my-define-nv (kbd "-") (kbd "$"))
(my-define-nv (kbd "=") 'evil-indent)
(my-define-nv (kbd ")") 'evil-next-close-paren)
(my-define-nv (kbd "(") 'evil-previous-open-paren)
;(my-define-nv (kbd "X") 'evil-destroy)
(my-define-nv (kbd "<escape>") 'keyboard-quit)
(my-define-nv (kbd "C-S-O") 'evil-jump-forward)
(my-define-nv (kbd "C-o") 'evil-jump-backward)
(my-define-nv (kbd "[") 'four-down)
(my-define-nv (kbd "]") 'four-up)

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "jk"  'evil-normal-state)

;; F9 creates a new elscreen, shift-F9 kills it
(global-set-key (kbd "C-c t a b e") 'elscreen-create)
(global-set-key (kbd "C-c t a b d") 'elscreen-kill)
(my-define-niv (kbd "C-t") 'my-elscreen-load)
(global-set-key (kbd "C-w") 'elscreen-kill)
(my-define-niv (kbd "C-w") 'elscreen-kill)

;; Windowskey+PgUP/PgDown switches between elscreens
(global-set-key (kbd "<C-tab>") 'elscreen-next)
(global-set-key (kbd "<C-S-iso-lefttab>") 'elscreen-previous)

(provide 'my-keymaps)
