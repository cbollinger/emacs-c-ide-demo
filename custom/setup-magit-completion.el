;; http://cachestocaches.com/2015/8/c-completion-emacs/

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
  (when (file-directory-p "~/Daten/learning/Digital-Signal-Processing/sp4comm/orgmode")
    (setq projectile-project-search-path '("~/Daten/learning/Digital-Signal-Processing/sp4comm/orgmode")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :init
  (counsel-projectile-mode))


(use-package magit
  :commands (magit-status magit-get-current-branch)
  ;;:custom
  ;;(magit-display-buffer-function #'magit-dislay-buffer-same-window-except-diff-v1)
  )

;; NOTE: Make sure to configure a GitHub token before using this package!
;; - https://magit.vc/manual/forge/Token-Creation.html#Token-Creation
;; - https://magit.vc/manual/ghub/Getting-Started.html#Getting-Started
(use-package forge
  :after magit)


(provide 'setup-magit-completion)
