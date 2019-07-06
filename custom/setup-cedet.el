
(use-package cc-mode :init)
(use-package semantic :init)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-stickyfunc-mode 1)

(semantic-mode 1)

(defun alexott/cedet-hook ()
  (local-set-key "\C-c\C-j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-s" 'semantic-ia-show-summary))

(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'c-mode-hook 'alexott/cedet-hook)
(add-hook 'c++-mode-hook 'alexott/cedet-hook)

;; Enable EDE only in C/C++
(use-package ede
  :init
  (global-ede-mode))
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode 1)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode 1)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode 1)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode 1)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode t)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode t)
(add-to-list 'semantic-default-submodes 'global-srecode-minor-mode t)
(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode t)
(semantic-mode) ;; Active le mode semantic

(use-package stickyfunc-enhance :init) ;; multilines concatene dans la header line
(require 'cedet-cscope)
(use-package ecb :init)

;; (ede-cpp-root-project "projName"
;;                       :name "projName Project"
;;                       :file "~/workspaces/projName/proj.txt" ;; an arbitrary file
;;                       :include-path '("/src/main/src"
;;                                       "/src/main/include"
;;                                       "/src/test/src"
;;                                       "/src/test/include"
;;                                       ... )
;;                       :system-include-path '("/usr/include/ ~/workspaces/install/proj3/lib/ /usr/include/boost/")
;;                       :spp-table '(("isUnix" . "") ("BOOST_TEST_DYN_LINK" . "")))



;; cedet semantic
(semanticdb-enable-gnu-global-databases 'c-mode t)
(semanticdb-enable-gnu-global-databases 'c++-mode t)

;; You can add this to improve the parse of macro-heavy code:

(require 'semantic/bovine/c)
(add-to-list 'semantic-lex-c-preprocessor-symbol-file "/usr/include/c++/8/stdlib.h")


(provide 'setup-cedet)
