(require 'cc-mode)
(require 'semantic)

(semantic-mode 1)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-idle-completions-mode 1)
(global-semantic-stickyfunc-mode 1)


(defun christian:cedet-hook ()
  (local-set-key "\C-c\C-j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-s" 'semantic-ia-show-summary)
  (add-to-list 'ac-sources 'ac-source-gtags)
  (add-to-list 'ac-sources 'ac-source-semantic))

(add-hook 'c-mode-common-hook 'christian:cedet-hook)
(add-hook 'c-mode-hook 'christian:cedet-hook)
(add-hook 'c++-mode-hook 'christian:cedet-hook)

(require 'semantic/ia)
;(require 'eassist)
;; Enable EDE only in C/C++
(require 'ede)
(global-ede-mode 1)
(ede-enable-generic-projects)
(ede-cpp-root-project "Dummy"
                      :name "UIC-GW"
                      :file "/home/Christian/Data/Duagon/ionia_yocto/packages/uic-gw/CMakeCache.txt"
                      :include-path '("/.../inc"))

(provide 'setup-cedet)
