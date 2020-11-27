(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))


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
(add-hook 'after-init-hook 'global-company-mode)
(setq company-backends (delete 'company-semantic company-backends))
(define-key c-mode-map  [(control tab)] 'company-complete)
(define-key c++-mode-map  [(control tab)] 'company-complete)
;; (add-to-list 'company-backends 'company-c-headers)
;; (add-to-list 'company-c-headers-path-system "/usr/include/c++/7/")



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


;; Package: projejctile
(use-package projectile
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t))

(require 'projectile)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)

;; Package zygospore
(use-package zygospore
  :bind (("C-x 1" . zygospore-toggle-delete-other-windows)
         ("RET" .   newline-and-indent)))

  ; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
(windmove-default-keybindings)



;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;; Define C/C++ Style
(setq-default indent-tabs-mode nil) ;; use space to indent by default
;; Available C style:
   ;; “gnu”: The default style for GNU projects
   ;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
   ;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
   ;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
   ;; “stroustrup”: What Stroustrup, the author of C++ used in his book
   ;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
   ;; “linux”: What the Linux developers use for kernel development
   ;; “python”: What Python developers use for extension modules
   ;; “java”: The default style for java-mode (see below)
   ;; “user”: When you want to define your own style
(setq c-default-style "k&r" c-basic-offset 4)


(provide 'setup-general)
