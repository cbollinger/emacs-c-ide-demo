;; http://cachestocaches.com/2015/8/c-completion-emacs/

;; == irony-mode ==
;; (use-package irony
;;   :ensure t
;;   :defer t
;;   :init
;;   (add-hook 'c++-mode-hook 'irony-mode)
;;   (add-hook 'c-mode-hook 'irony-mode)
;;   (add-hook 'objc-mode-hook 'irony-mode)
;;   :config
;;   ;; replace the `completion-at-point' and `complete-symbol' bindings in
;;   ;; irony-mode's buffers by irony-mode's function
;;   (defun my-irony-mode-hook ()
;;     (define-key irony-mode-map [remap completion-at-point]
;;       'irony-completion-at-point-async)
;;     (define-key irony-mode-map [remap complete-symbol]
;;       'irony-completion-at-point-async))
;;   (add-hook 'irony-mode-hook 'my-irony-mode-hook)
;;   (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;;   )

;; ;; == company-mode ==
;; (use-package company
;;   :ensure t
;;   :defer t
;;   :init (add-hook 'after-init-hook 'global-company-mode)
;;   :config
;;   (use-package company-irony :ensure t :defer t)
;;   (setq company-idle-delay              nil
;; 	company-minimum-prefix-length   2
;; 	company-show-numbers            t
;; 	company-tooltip-limit           20
;; 	company-dabbrev-downcase        nil
;; 	company-backends                '((company-irony company-gtags))
;; 	)
;;   :bind ("C-;" . company-complete-common)
;;   )


(use-package company
  
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/Projects/Code")
    (setq projectile-project-search-path '("~/Projects/Code")))
  (setq projectile-switch-project-action #'projectile-dired))


(use-package counsel-projectile
  :init
  (counsel-projectile-mode))



(provide 'setup-completion)
