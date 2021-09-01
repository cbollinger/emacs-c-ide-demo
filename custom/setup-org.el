;; set key for agenda
(global-set-key (kbd "C-c a") 'org-agenda)

;; TODO: Mode this to another section
(setq-default fill-column 80)

;; Turn on indentation and auto-fill mode for Org files
(defun dw/org-mode-setup ()
  (org-indent-mode)
  (setq variable-pitch-mode 1)
  (setq auto-fill-mode 0)
  (setq visual-line-mode 1)
  (setq evil-auto-indent nil)

  (setq org-startup-folded t)
  (setq org-latex-caption-above '(table))
  (setq org-latex-compiler "xelatex")
  (setq org-latex-listings 'minted)
  )

(use-package org
  :defer t
  :hook (org-mode . dw/org-mode-setup)
  :config
  (setq org-ellipsis " ▾"
        org-hide-emphasis-markers t
        org-src-fontify-natively t
        org-fontify-quote-and-verse-blocks t
        org-src-tab-acts-natively t
        org-edit-src-content-indentation 2
        org-hide-block-startup t
        org-src-preserve-indentation nil
        org-startup-folded t
        org-cycle-separator-lines 2))

  (setq org-modules
        '(org-crypt
          org-habit
          org-bookmark
          org-eshell
          org-irc))

(use-package org-superstar
  :after org
  :hook (org-mode . org-superstar-mode)
  :custom
  (org-superstar-remove-leading-stars t)
  (org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●")))

;; Replace list hyphen with dot
;; (font-lock-add-keywords 'org-mode
;;                         '(("^ *\\([-]\\) "
;;                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;; Increase the size of various headings
 (set-face-attribute 'org-document-title nil :font "Iosevka Etoile" :weight 'bold :height 1.3)
(dolist (face '((org-level-1 . 1.8)
                (org-level-2 . 1.7)
                (org-level-3 . 1.6)
                (org-level-4 . 1.5)
                (org-level-5 . 1.4)
                (org-level-6 . 1.3)
                (org-level-7 . 1.2)
                (org-level-8 . 1.1)))
(set-face-attribute (car face) nil :font "Iosevka Etoile" :weight 'medium :height (cdr face)))

;; Make sure org-indent face is available
(require 'org-indent)

;; Ensure that anything that should be fixed-pitch in Org files appears that way
(set-face-attribute 'org-block           nil :inherit 'fixed-pitch                          :background "dark slate gray" )
(set-face-attribute 'org-table           nil :inherit 'fixed-pitch)
(set-face-attribute 'org-formula         nil :inherit 'fixed-pitch)
(set-face-attribute 'org-code            nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-indent          nil :inherit '(org-hide fixed-pitch))
(set-face-attribute 'org-verbatim        nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch) :foreground "DarkOrange1" )
(set-face-attribute 'org-meta-line       nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-checkbox        nil :inherit 'fixed-pitch)

;; Get rid of the background on column views
(set-face-attribute 'org-column-title nil :background "light gray")
;; (set-face-attribute 'org-column face :height 180 :width normal)
(set-face-attribute 'org-column nil :background "light gray" :foreground "dark red")



(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "ONGOING(g)"  "|" "DONE(d)")
              (sequence "WAITING(w@/)" "PAUSED(h@/)" "|" "CANCELLED(c@/)" "PHONE" "MEETING"))))

(setq org-todo-keyword-faces
      (quote (("TODO"      :foreground "red"          :weight bold)
              ("NEXT"      :foreground "OrangeRed"    :weight bold)
              ("REQUEST"   :foreground "blue"         :weight bold)
              ("DEFINED"   :foreground "SlateBlue"    :weight bold)
              ("ONGOING"   :foreground "Green2"       :weight bold)
              ("FIXED"     :foreground "SeaGreen"     :weight bold)
              ("DONE"      :foreground "forest green" :weight bold)
              ("WAITING"   :foreground "orange"       :weight bold)
              ("PAUSED"    :foreground "magenta"      :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING"   :foreground "forest green" :weight bold)
              ("PHONE"     :foreground "forest green" :weight bold))))

;;file to save todo items
;; (setq org-agenda-files (quote ("~/org/todo.org"
;;                                "~/org/reference.org"
;;                                "/mnt/c/Users/cbollinger/Documents/DG_Projekte/D521-Alstom_PDM/todo/d521_alstom_nl_pdm.org"
;;                                "/mnt/c/Users/cbollinger/Documents/DG_Projekte/D522-Alstom_PDM/todo/todo/todo.org"
;;                                "/mnt/c/Users/cbollinger/Documents/DG_Projekte/i101_Kernel_update/todo/todo.org"
;;                                "/mnt/c/Users/cbollinger/Documents/DG_Projekte/i102_NewHW/todo/todo.org"
;;                                )))

(setq org-agenda-files (quote ("~/Daten/Duagon/DG_ORG/todo/DG_TodoList.org"
                               )))


;; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))


;;set priority range from A to C with default A
(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?A)

;;set colours for priorities
(setq org-priority-faces '((?A . (:foreground "#F0DFAF" :weight bold))
                           (?B . (:foreground "LightSteelBlue"))
                           (?C . (:foreground "OliveDrab"))))

;;open agenda in current window
(setq org-agenda-window-setup (quote current-window))

;; Place tags close to the right-hand side of the window
(add-hook 'org-finalize-agenda-hook 'place-agenda-tags)
(defun place-agenda-tags ()
  "Put the agenda tags by the right border of the agenda window."
  (setq org-agenda-tags-column (- 4 (window-width)))
  (org-agenda-align-tags))

;;capture todo items using C-c c t
(define-key global-map (kbd "C-c c") 'org-capture)
(setq org-capture-templates
      '(("t" "todo" entry (file+headline "~/org/todo.org" "Tasks")
         "* TODO [#A] %?\n  %U\n  %a\n  %i")
        ("n" "note" entry (file+datetree "~/org/reference.org")
         "* %?\nEntered on %U\n  %i")
        ))

;; Tags with fast selection keys
(setq org-tag-alist (quote ((:startgroup)
                            ("Projekte" . ?P)
                            (:grouptags)
                            ("D521_PDM" . ?a)
                            ("D522_BT" . ?b)
                            ("D522_NLD" . ?c)
                            ("RemoteIO" . ?c)
                            (:endgroup)
                            (:startgroup)
                            ("Private" . ?V)
                            (:grouptags)
                            ("Training" . ?t)
                            ("DSP" . ?d)
                            ("NOTE" . ?n)
                            ("ORG" . ?o)
                            ("PERSONAL" . ?p)
                            (:endgroup)
                            ("FLAGsGED" . ??))))

;; Allow setting single tags without the menu
(setq org-fast-tag-selection-single-key (quote expert))

;; For tag searches ignore tasks with scheduled and deadline dates
(setq org-agenda-tags-todo-honor-ignore-options t)


;; Spell checker
;; flyspell mode for spell checking everywhere
(add-hook 'org-mode-hook 'turn-on-flyspell 'append)

;; Disable keys in org-mode
;;    C-c [
;;    C-c ]
;;    C-c ;
;;    C-c C-x C-q  cancelling the clock (we never want this)
(add-hook 'org-mode-hook
          '(lambda ()
             ;; Undefine C-c [ and C-c ] since this breaks my
             ;; org-agenda files when directories are include It
             ;; expands the files in the directories individually
             (org-defkey org-mode-map "\C-c[" 'undefined)
             (org-defkey org-mode-map "\C-c]" 'undefined)
             (org-defkey org-mode-map "\C-c;" 'undefined)
             (org-defkey org-mode-map "\C-c\C-x\C-q" 'undefined))
          'append)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-mode agenda options                                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;open agenda in current window
(setq org-agenda-window-setup (quote current-window))
;;warn me of any deadlines in next 7 days
(setq org-deadline-warning-days 7)
;;show me tasks scheduled or due in next fortnight
(setq org-agenda-span (quote fortnight))
;;don't show tasks as scheduled if they are already shown as a deadline
(setq org-agenda-skip-scheduled-if-deadline-is-shown t)
;;don't give awarning colour to tasks with impending deadlines
;;if they are scheduled to be done
(setq org-agenda-skip-deadline-prewarning-if-scheduled (quote pre-scheduled))
;;don't show tasks that are scheduled or have deadlines in the
;;normal todo list
(setq org-agenda-todo-ignore-deadlines (quote all))
(setq org-agenda-todo-ignore-scheduled (quote all))
;;sort tasks in order of when they are due and then by priority
(setq org-agenda-sorting-strategy
  (quote
   ((agenda deadline-up priority-down)
    (todo priority-down category-keep)
    (tags priority-down category-keep)
    (search category-keep))))



(provide 'setup-org)
