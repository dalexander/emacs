;; (setq py-install-directory "~/git/basics/.emacs.d/python-mode.el-6.1.2")
;; (autoload 'python-mode "python-mode" "Python Mode." t)
;; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; (add-to-list 'load-path py-install-directory)
;; (require 'python-mode)

;; ;; ; use IPython
;; (setq-default py-shell-name "ipython")
;; (setq-default py-which-bufname "IPython")
;; ; use the wx backend, for both mayavi and matplotlib
;; (setq py-python-command-args
;;   '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
;; (setq py-force-py-shell-name-p t)

;; (setq py-shell-switch-buffers-on-execute-p nil)
;; (setq py-switch-buffers-on-execute-p nil)
;; (setq py-split-windows-on-execute-p nil)
;; (setq py-smart-indentation t)
 
;; (require 'python-mode)



;; (add-to-list 'load-path "~/git/basics/.emacs.d/pymacs-0.25/")
;; (add-to-list 'load-path "~/git/basics/.emacs.d/ropemacs-0.7/")
;; (add-to-list 'load-path "~/git/basics/.emacs.d/rope-0.9.4")
;; (require 'pymacs)
;; (pymacs-load "ropemacs" "rope-")

;; (push "/home/russell/git/src/python/ENV/bin" exec-path)
;; (setenv "PATH"
;;         (concat
;;          "/home/russell/git/src/python/ENV/bin" ":"
;;          (getenv "PATH")
;;          ))
;; (setq py-load-pymacs-p nil)

;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)
;; (pymacs-load "ropemacs" "rope-")
;; (setq ropemacs-enable-autoimport t)

;; (require 'auto-complete)
;; (global-auto-complete-mode t)



;; (add-to-list 'load-path "~/git/basics/.emacs.d/pymacs-0.25/")
;; (add-to-list 'load-path "~/git/basics/.emacs.d/ropemacs-0.7/")
;; (add-to-list 'load-path "~/git/basics/.emacs.d/rope-0.9.4")
;; (require 'pymacs)
;; (pymacs-load "ropemacs" "rope-")

;; (push "/home/russell/git/src/python/ENV/bin" exec-path)
;; (setenv "PATH"
;;         (concat
;;          "/home/russell/git/src/python/ENV/bin" ":"
;;          (getenv "PATH")
;;          ))
;; (setq py-load-pymacs-p nil)
;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)
;; (pymacs-load "ropemacs" "rope-")
;; (setq ropemacs-enable-autoimport t)

;; (require 'auto-complete)
;; (global-auto-complete-mode t)



;; (require 'el-get)
;; (add-to-list 'load-path "~/.emacs.d/el-get/jedi")

;; ; ------
;; ; pymacs
;; ; ------
;; (add-to-list 'load-path "~/git/basics/.emacs.d/pymacs-0.25")
;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)
;; (autoload 'pymacs-autoload "pymacs")

;; (require 'pymacs)
;; (add-to-list 'load-path "~/git/basics/.emacs.d/ropemacs-0.7/")
;; (add-to-list 'load-path "~/.emacs.d/el-get/ropemacs-0.7/")
;; (pymacs-load "ropemacs" "rope-")

;; ;; (key-chord-define evil-normal-state-map "nj"  #'four-down)
;; (key-chord-define evil-normal-state-map "nk"  #'four-up)
;; (key-chord-define evil-normal-state-map "nm"  #'sixteen-down)
;; (key-chord-define evil-normal-state-map "n,"  #'sixteen-up)
;; (key-chord-define evil-normal-state-map "mk"  #'four-up)
;; (key-chord-define evil-normal-state-map "nf"  'sixteen-forward)
;; (key-chord-define evil-normal-state-map "nb"  'sixteen-backward)
;; (define-key org-mode-map (kbd "M-l") 'org-metaright)
;; (define-key org-mode-map (kbd "M-h") 'org-metaleft)
;; (define-key org-mode-map (kbd "M-k") 'org-metaup)
;; (define-key org-mode-map (kbd "M-j") 'org-metadown)
;; (define-key org-mode-map (kbd "M-L") 'org-shiftmetaright)
;; (define-key org-mode-map (kbd "M-H") 'org-shiftmetaleft)
;; (define-key org-mode-map (kbd "M-K") 'org-shiftmetaup)
;; (define-key org-mode-map (kbd "M-J") 'org-shiftmetadown)))

;; ;; remap org-mode meta keys for convenience
;; (mapcar (lambda (state)
;;     (evil-declare-key state org-mode-map
;;       (kbd "M-l") 'org-metaright
;;       (kbd "M-h") 'org-metaleft
;;       (kbd "M-k") 'org-metaup
;;       (kbd "M-j") 'org-metadown
;;       (kbd "M-L") 'org-shiftmetaright
;;       (kbd "M-H") 'org-shiftmetaleft
;;       (kbd "M-K") 'org-shiftmetaup
;;       (kbd "M-J") 'org-shiftmetadown))
;;   '(normal insert))
;; (require 'tabkey2)
;; (tabkey2-mode t)
;; (require 'yasnippet)
;; (yas-global-mode 1)
;; (require 'yasnippet)
;; (yas-global-mode 1)

;; (global-set-key "\C-\M-a" 'icicle-next-S-TAB-completion-method)
;; (global-set-key "\M-[" 'semantic-tag-folding-fold-block)
;; (global-set-key "\M-]" 'semantic-tag-folding-show-block)
;; (global-set-key "\C-\M-[" 'semantic-tag-folding-fold-all)
;; (global-set-key "\C-\M-]" 'semantic-tag-folding-show-all)

;; (my-define-nv (kbd "n") #'conditional-search-next) 
;; (my-define-nv (kbd "go") 'occur) 
;; (my-define-nv (kbd "go") 'icicle-file) 
;; (my-define-nv (kbd "gf") 'ido-find-file ) 

;; (my-define-niv (kbd "TAB") 'indent-for-tab-command)
;; (defun select-inside-quotes ()
;;   "Select text between double straight quotes
;; on each side of cursor."
;;   (interactive)
;;   (let (p1 p2)
;;     (skip-chars-backward "^\"")
    
;;     (skip-chars-forward "^\"")
;;     (setq p2 (point))

;;     (goto-char p1)
;;     (push-mark p2)
;;     (setq mark-active t)
;;   )
;; )

;; (add-to-list 'load-path "~/git/basics/.emacs.d/plugins/yasnippet")
;; (add-to-list 'load-path "~/git/basics/.emacs.d/icicles")
;; (add-to-list 'load-path "~/git/basics/.emacs.d/cedet-1.1/common")
;; (add-to-list 'load-path "~/git/basics/.emacs.d/cedet-1.1/eieio")
;; (add-to-list 'load-path "~/git/basics/.emacs.d/cedet-1.1/speedbar")
;; (add-to-list 'load-path "~/git/basics/.emacs.d/cedet-1.1/semantic")
;; (add-to-list 'load-path "~/git/basics/.emacs.d/cedet-1.1/semantic/ctags")
;; (add-to-list 'load-path "~/git/basics/.emacs.d/cedet-1.1/semantic/symref")
;; (add-to-list 'load-path "~/git/basics/.emacs.d/ecb-snap")
;; (add-to-list 'load-path "~/git/basics/.emacs.d/ecb-2.40")

;; (define-key evil-normal-state-map [escape] 'keyboard-quit)
;; (define-key evil-visual-state-map [escape] 'keyboard-quit)
;; (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
;; (global-set-key [escape] 'evil-exit-emacs-state)

;; (menu-bar-mode -1)

;; (defvar *n-lock* (current-time))
;; (defvar *n-lock-wait* 5)
;; (defvar *m-lock-wait* 5)

;; (remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function
;; (remove-hook 'kill-buffer-query-functions 'process-kill-buffer-query-function)

;; ;; CEDET
;; ;; (load-file "~/.emacs.d/cedet-1.0pre7/common/cedet.el")
;; (require 'cedet) 

;; (global-ede-mode 'nil); do NOT use project manager

;; (semantic-load-enable-excessive-code-helpers)

;; (require 'semantic-ia); names completion and display of tags
;; (require 'semantic-gcc); auto locate system include files

;; ;; (semantic-add-system-include "~/3rd-party/protobuf-2.3.0/include" 'c++-mode)

;; (require 'semanticdb)
;; (global-semanticdb-minor-mode 1)

;; (defun my-cedet-hook ()
;;   (local-set-key [(control return)] 'semantic-ia-complete-symbol)
;;   (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
;;   (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
;;   (local-set-key "\C-c=" 'semantic-decoration-include-visit)
;;   (local-set-key "\C-cj" 'semantic-ia-fast-jump)
;;   (local-set-key "\C-cq" 'semantic-ia-show-doc)
;;   (local-set-key "\C-cs" 'semantic-ia-show-summary)
;;   (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
;;   (local-set-key "\C-c+" 'semantic-tag-folding-show-block)
;;   (local-set-key "\C-c-" 'semantic-tag-folding-fold-block)
;;   (local-set-key "\C-c\C-c+" 'semantic-tag-folding-show-all)
;;   (local-set-key "\C-c\C-c-" 'semantic-tag-folding-fold-all)
;;   (local-set-key "." 'semantic-complete-self-insert)
;;   (local-set-key ">" 'semantic-complete-self-insert)
;;   )
;; (add-hook 'c-mode-common-hook 'my-cedet-hook)
;; (global-semantic-tag-folding-mode 1)

;; (require 'eassist)

;; ;(concat essist-header-switches ("hh" "cc"))
;; (defun alexott/c-mode-cedet-hook ()
;;   (local-set-key "\C-ct" 'eassist-switch-h-cpp)
;;   (local-set-key "\C-xt" 'eassist-switch-h-cpp)
;;   (local-set-key "\C-ce" 'eassist-list-methods)
;;   (local-set-key "\C-c\C-r" 'semantic-symref)
;;   )
;; (add-hook 'c-mode-common-hook 'alexott/c-mode-cedet-hook)

;; ;; gnu global support
;; (require 'semanticdb-global)
;; (semanticdb-enable-gnu-global-databases 'c-mode)
;; (semanticdb-enable-gnu-global-databases 'c++-mode)

;; ;; ctags
;; (require 'semanticdb-ectag)
;; (semantic-load-enable-primary-exuberent-ctags-support)

;; (global-semantic-idle-tag-highlight-mode 1)


;; (require 'icicles)
;; (icy-mode t)

;; (print icicle-S-TAB-completion-methods-alist)

;; (setq
;;  python-shell-interpreter "ipython"
;;  python-shell-interpreter-args ""
;;  python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;;  python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;;  python-shell-completion-setup-code
;;    "from IPython.core.completerlib import module_completion"
;;  python-shell-completion-module-string-code
;;    "';'.join(module_completion('''%s'''))\n"
;;  python-shell-completion-string-code
;;    "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")


;; (require 'ecb)
;; (custom-set-variables
;; '(ecb-layout-name "left14")
;; '(ecb-layout-window-sizes (quote (("left14" (0.2564102564102564 . 0.6949152542372882) (0.2564102564102564 . 0.23728813559322035)))))
;; '(ecb-options-version "2.40")
;; '(ecb-source-path (quote ("d:/myRailsProject" "d:/useful scripts")))
;; '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
;; '(ecb-tip-of-the-day nil)
;; '(ecb-tree-buffer-style (quote ascii-guides)))

;; (semantic-complete-analyze-inline-idle)
;; (setq semantic-complete-inline-analyzer-idle-displayor-class semantic-displayor-tooltip) 

;; (eieio-browse)

;; (load "~/git/basics/.emacs.d/icicles-install")

;; (get-universial-time)                   ;


;; (require 'cedet)
;; ;; Enable EDE (Project Management) features
;; (global-ede-mode 1)
;; ;; (semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;; (semantic-load-enable-gaudy-code-helpers)      ; Enable prototype help and smart completion 
;; (global-semantic-tag-folding-mode)
;; (global-srecode-minor-mode 1)            ; Enable template insertion menu
;; (require 'ecb)

;; (global-semantic-idle-scheduler-mode 1) ;The idle scheduler with automatically reparse buffers in idle time.
;; (global-semantic-idle-completions-mode 1) ;Display a tooltip with a list of possible completions near the cursor.
;; (global-semantic-idle-summary-mode 1) ;Display a tag summary of the lexical token under the cursor.

;; ;;to work with my include files and cedet
;; (semantic-add-system-include "~/include" 'c++-mode)
;; (semantic-add-system-include "~/include" 'c-mode)


;; ;;To use additional features for names completion, and displaying of information for tags & classes,
;; ;; you also need to load the semantic-ia package. This could be performed with following command:
;; (require 'semantic-ia)

;; ;;to work with systme include files and gcc
;; (require 'semantic-gcc)


;; ;;integrate semantic with Imenu
;; (defun my-semantic-hook ()
;;   (imenu-add-to-menubar "TAGS"))
;; (add-hook 'semantic-init-hooks 'my-semantic-hook)

;; ;;load Semanticdb
;; (require 'semanticdb)
;; ;;(global-semanticdb-minor-mode 1)

;; ;;working with tags
;; ;; gnu global support
;; (require 'semanticdb-global)
;; (semanticdb-enable-gnu-global-databases 'c-mode)
;; (semanticdb-enable-gnu-global-databases 'c++-mode)

;; ;; ctags
;; (require 'semanticdb-ectag)
;; (semantic-load-enable-primary-exuberent-ctags-support)

;; (defun my-semantic-hook ()
;;   (imenu-add-to-menubar "TAGS"))
;; (add-hook 'semantic-init-hooks 'my-semantic-hook)


;; (defvar *emacs-load-start* (current-time))
;; (message "My .emacs loaded in %ds" (destructuring-bind (hi lo ms) (current-time)
                           ;; (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))
