(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

;; Set Minor-Modes globally
(menu-bar-mode -1)           ; switch off menu-bar (values -1/1)
(tool-bar-mode -1)           ; swich off tool-bar (values -1/1)
(global-linum-mode 1)        ; always show line numbers
(setq column-number-mode t)  ; always show column numbers

;; Install spacemacs packages manually
;; spacemacs-theme, spacemacs-dark, spaceline-config
(load-theme 'spacemacs-dark t)
(setq spacemacs-theme-org-agenda-height nil)
(setq spacemacs-theme-org-height nil)

;; set sizes here to stop spacemacs theme resizing these
(set-face-attribute 'org-level-1 nil :height 1.5)
(set-face-attribute 'org-level-2 nil :height 1.3)
(set-face-attribute 'org-level-3 nil :height 1.1)
(set-face-attribute 'org-scheduled-today nil :height 1.2)
(set-face-attribute 'org-agenda-date-today nil :height 1.2)
(set-face-attribute 'org-table nil :foreground "#008787")

(setq powerline-default-separator 'arrow-fade)
(require 'spaceline-config)
(spaceline-spacemacs-theme)

;; Three-Style Directory Views
(use-package dired-subtree
  :config
  (bind-keys :map dired-mode-map
             ("i" . dired-subtree-insert)
             (";" . dired-subtree-remove)))

(provide 'setup-style)

;; Try this setup later - bug is than maybe fixed.
;; Propere initialisation fails - Install spacemacs packages manually
;; (use-package spacemacs-theme
;;    :ensure t
;;    :init
;;    (load-theme 'spacemacs-dark t)
;;    (setq spacemacs-theme-org-agenda-height nil)
;;    (setq spacemacs-theme-org-height nil))

;; use-package spaceline
;;   :demand t
;;   :init
;;   (setq powerline-default-separator 'arrow-fade)
;;   :config
;;   (require 'spaceline-config)
;;   (spaceline-spacemacs-theme))
