;; set key for agenda
(global-set-key (kbd "C-c a") 'org-agenda)

;; Show column view with fixed size font
(defun org-column-view-uses-fixed-width-face ()
  ;; copy from org-faces.el
  (when (fboundp 'set-face-attribute)
    ;; Make sure that a fixed-width face is used when we have a column
    ;; table.
    (set-face-attribute 'org-column nil
                        :height (face-attribute 'default :height)
                        :family (face-attribute 'default :family))))
(when (and (fboundp 'daemonp) (daemonp))
  (add-hook 'org-mode-hook 'org-column-view-uses-fixed-width-face))


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
         "* TODO [#A] %?")
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
                            ("FLAGGED" . ??))))

;; Allow setting single tags without the menu
(setq org-fast-tag-selection-single-key (quote expert))

;; For tag searches ignore tasks with scheduled and deadline dates
(setq org-agenda-tags-todo-honor-ignore-options t)

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
