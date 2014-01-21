;;;map "jk" to <Esc>
(evil-define-command cofi/maybe-exit ()
  :repeat change
  (interactive)
  (let ((modified (buffer-modified-p)))
    (let ((evt (read-event (format "Insert %c to exit insert state" ?k) nil 0.2)))
      (cond
       ((null evt) (insert "j"))
       ((and (integerp evt) (char-equal evt ?k))
	;(condition-case nil (evil-forward-char) (error nil) )
	(set-buffer-modified-p modified)
	(push 'escape unread-command-events))
       (t (insert "j") (setq unread-command-events (append unread-command-events
							   (list evt))))
       ))))


(evil-define-operator evil-destroy (beg end type register yank-handler)
  "Delete text from BEG to END with TYPE.
Save in REGISTER or in the kill-ring with YANK-HANDLER."
  (evil-delete beg end type 95 yank-handler)
)
(evil-define-operator evil-destroy-and-paste (beg end type register yank-handler)
  "Delete text from BEG to END with TYPE.
Save in REGISTER or in the kill-ring with YANK-HANDLER."
  (evil-delete beg end type 95 yank-handler)
  (evil-paste-before 1)
)


(defun copy-to-clipboard ()
  (interactive)
  (if (display-graphic-p)
      (progn
        (message "Yanked region to x-clipboard!")
        (call-interactively 'clipboard-kill-ring-save)
        )
    (if (region-active-p)
        (progn
          (shell-command-on-region (region-beginning) (region-end) "xsel -i -b")
          (message "Yanked region to clipboard!")
          (deactivate-mark))
      (message "No region active; can't yank to clipboard!")))
  )



(evil-define-command paste-from-clipboard()
  (if (display-graphic-p)
      (progn
        (clipboard-yank)
        (message "grapics active")
        )
    (insert (shell-command-to-string "xsel -o -b"))
    )
  )



(evil-define-command evil-paste-before2
  (count &optional register yank-handler)
  "Pastes the latest yanked text before the cursor position.
   The return value is the yanked text."
  :suppress-operator t
  (interactive "P<x>")
  (unless (or (null count) (> count 9))
  (setq register (+ count 48)))
  ;; (print register)
  (setq count 1)
  (if (evil-visual-state-p)
      (evil-visual-paste count register)
    (evil-with-undo
      (let* ((text (if register
                       (evil-get-register register)
                     (current-kill 0)))
             (yank-handler (or yank-handler
                               (when (stringp text)
                                 (car-safe (get-text-property
                                            0 'yank-handler text)))))
             (opoint (point)))
        (when text
          (if (functionp yank-handler)
              (let ((evil-paste-count count)
                    ;; for non-interactive use
                    (this-command #'evil-paste-before))
                (push-mark opoint t)
                (insert-for-yank text))
            ;; no yank-handler, default
            (set-text-properties 0 (length text) nil text)
            (push-mark opoint t)
            (dotimes (i (or count 1))
              (insert-for-yank text))
            (setq evil-last-paste
                  (list #'evil-paste-before
                        count
                        opoint
                        opoint    ; beg
                        (point))) ; end
            (evil-set-marker ?\[ opoint)
            (evil-set-marker ?\] (1- (point)))
            (when (> (length text) 0)
              (backward-char))))
        ;; no paste-pop after pasting from a register
        (when register
          (setq evil-last-paste nil))
        (and (> (length text) 0) text)))))







(evil-define-command evil-paste-after2
  (count &optional register yank-handler)
  "Pastes the latest yanked text behind point.
The return value is the yanked text."
  :suppress-opertaor t
  (interactive "P<x>")
  (unless (or (null count) (> count 9))
  (setq register (+ count 48)))
  ;; (print register)
  (setq count 1)
  (if (evil-visual-state-p)
      (evil-visual-paste count register)
    (evil-with-undo
      (let* ((text (if register
                       (evil-get-register register)
                     (current-kill 0)))
             (yank-handler (or yank-handler
                               (when (stringp text)
                                 (car-safe (get-text-property
                                            0 'yank-handler text)))))
             (opoint (point)))
        (when text
          (if (functionp yank-handler)
              (let ((evil-paste-count count)
                    ;; for non-interactive use
                    (this-command #'evil-paste-after))
                (insert-for-yank text))
            ;; no yank-handler, default
            (set-text-properties 0 (length text) nil text)
            (unless (eolp) (forward-char))
            (push-mark (point) t)
            ;; TODO: Perhaps it is better to collect a list of all
            ;; (point . mark) pairs to undo the yanking for COUNT > 1.
            ;; The reason is that this yanking could very well use
            ;; `yank-handler'.
            (let ((beg (point)))
              (dotimes (i (or count 1))
                (insert-for-yank text))
              (setq evil-last-paste
                    (list #'evil-paste-after
                          count
                          opoint
                          beg       ; beg
                          (point))) ; end
              (evil-set-marker ?\[ beg)
              (evil-set-marker ?\] (1- (point)))
              (when (evil-normal-state-p)
                (evil-move-cursor-back)))))
        (when register
          (setq evil-last-paste nil))
        (and (> (length text) 0) text)))))


(evil-define-motion four-down (count)
  "Move the cursor COUNT lines down."
  :type line
  (interactive "p")
  (let (line-move-visual)
    (evil-line-move (* 4 count))))

(evil-define-motion four-up (count)
  "Move the cursor COUNT lines down."
  :type line
  (interactive "P")
  (let (line-move-visual)
    (evil-line-move (- (* 4 (prefix-numeric-value count))))))

(evil-define-motion sixteen-up (count)
  "Move the cursor COUNT lines down."
  :type line
  (setf *n-lock* (current-time))
  (let (line-move-visual)
    (evil-line-move -16)))

(evil-define-motion sixteen-down (count)
  "Move the cursor COUNT lines down."
  :type line
  (setf *n-lock* (current-time))
  (let (line-move-visual)
    (evil-line-move 16)))

(evil-define-motion sixteen-forward (count)
  "Move the cursor COUNT lines down."
  :type line
  (setf *n-lock* (current-time))
  (let (line-move-visual)
    (evil-forward-char 16)))

(evil-define-motion sixteen-backward (count)
  "Move the cursor COUNT lines down."
  :type line
  (setf *n-lock* (current-time))
  (let (line-move-visual)
    (evil-backward-char 16)))



;; (evil-define-motion conditional-search-next (count)
;;   "Repeat the last search if *n-lock* > *n-lock-wait*."
;;   :jump t
;;   :type exclusive
;;   (when (> (abs (- (second (current-time)) (second *n-lock*))) *n-lock-wait*)
;;     (dotimes (var (or count 1))
;;       (evil-search (if evil-regexp-search
;;                        (car-safe regexp-search-ring)
;;                      (car-safe search-ring))
;;                    isearch-forward evil-regexp-search))))

(evil-define-command comment-out
  (count &optional register yank-handler)
  ;; (beg end &optional count)
  "comment functionality" 
  :suppress-operator t
  (interactive "P<x>")
  ;; (print count)
  (when (null count)
      (setq count 1))
  (evil-beginning-of-line)
  (evil-visual-line)
  (evil-next-line (- count 1))
  (evil-end-of-line)
  (comment-dwim nil)
  (evil-previous-line (- count 1))      
  (evil-first-non-blank)
  )

(evil-define-command reset-n-lock()
  "undo the n-lock"
  (setf (second *n-lock*) (- (second (current-time)) (* 2 *n-lock-wait*)))
  )

(defun evil-undefine ()                 ;
 (interactive)
 (let (evil-mode-map-alist)
   (call-interactively (key-binding (this-command-keys)))))

(defun append-semicolon ()
  "Select text between double straight quotes
on each side of cursor."
  (interactive)
  (goto-char (line-end-position))
  (insert ";")
  (evil-normal-state);
)

(defun rcc-style ()
  (setq c-default-style "k&r"
      c-basic-offset 4)
  (setq indent-tabs-mode nil)
  (c-set-offset 'inline-open '0)
  (c-set-offset 'substatement-open '0)
  (setf linum-mode t)
  )

(defun rotate-windows ()
  "Rotate your windows"
  (interactive)
  (cond ((not (> (count-windows)1))
         (message "You can't rotate a single window!"))
        (t
         (setq i 1)
         (setq numWindows (count-windows))
         (while  (< i numWindows)
           (let* (
                  (w1 (elt (window-list) i))
                  (w2 (elt (window-list) (+ (% i numWindows) 1)))

                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))

                  (s1 (window-start w1))
                  (s2 (window-start w2))
                  )
             (set-window-buffer w1  b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1+ i)))))))

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))

(defun dired-back-to-top ()
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 4))

(defun dired-jump-to-bottom ()
  (interactive)
  (end-of-buffer)
  (dired-next-line -1))

(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(defun buffer-mode (buffer-or-string)
  "Returns the major mode associated with a buffer."
  (with-current-buffer buffer-or-string
     major-mode))


(provide 'my-functions)
