(menu-bar-mode -1)
(tool-bar-mode -1)

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;; company
(use-package company
  :init
  (global-company-mode 1))
;;  (delete 'company-semantic company-backends))
;;  (define-key c-mode-map  [(control tab)] 'company-complete)
;; (define-key c++-mode-map  [(control tab)] 'company-complete))
(add-hook 'after-init-hook 'global-company-mode)

;; a Backend for keyword completion
(defun company-elisp-finder-keyword-backend (command &optional arg &rest ign)
  "`company-backend' for finder-keywords."
  (case command
    (prefix
     (and (require 'finder nil t)
          (or (company-grab ":group '\\(\\(\\sw\\|\\s_\\)*\\)" 1)
              (company-grab "Keywords:.*[ \t]+\\(\\(\\sw\\|\\s_\\)*\\)" 1))))
    (candidates (all-completions arg finder-known-keywords))
    (meta (cdr (assoc (intern arg) finder-known-keywords)))))

(require 'company-c-headers)
(add-to-list 'company-backends 'company-c-headers)
(add-to-list 'company-c-headers-path-system "/usr/include/c++/8/")

;; Package: projejctile
(use-package projectile
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t))

;; Package zygospore
(use-package zygospore
  :bind (("C-x 1" . zygospore-toggle-delete-other-windows)
         ("RET" .   newline-and-indent)))

  ; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
(windmove-default-keybindings)

;; Define C/C++ Style
(setq-default indent-tabs-mode nil)
(setq c-default-style "k&r"
      c-basic-offset 4)


(provide 'setup-general)
