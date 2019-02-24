(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)

;; For important compatibility libraries like cl-lib
(add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("834cbeacb6837f3ddca4a1a7b19b1af3834f36a701e8b15b628cad3d85c970ff" "3f44e2d33b9deb2da947523e2169031d3707eec0426e78c7b8a646ef773a2077" default)))
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   (quote
    (company irony-eldoc irony rtags cmake-ide tide flycheck auto-complete company-c-headers undo-tree zenburn-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Formatting Settings ;;

;; Disable tool bar
(tool-bar-mode -1)

;; Disable startup message and splash screen
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; Turn off bell for end of document
(setq ring-bell-function 'ignore)

;; Set font size
(set-face-attribute 'default nil :height 110)

;; Delete overtyped highlighted selection
(delete-selection-mode 1)

;; Undo feature
(global-undo-tree-mode)

;; Turn on word wrap at boundary
(global-visual-line-mode 1)

;; Enable visual line mode
(add-hook 'org-mode-hook #'visual-line-mode)

;; Auto indent
(define-key global-map (kbd "RET") 'newline-and-indent)
(c-set-offset 'case-label '+)
(setq c-default-style "bsd" c-basic-offset 4)

;; Auto complete braces and parentheses
(electric-pair-mode 1)

;; Highlight braces and parentheses
(show-paren-mode 1)

;; Auto-Complete
(global-auto-complete-mode t)

;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Theme
(load-theme 'zenburn t)

;; TypeScript Config:
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; CMake IDE
(require 'rtags) ;; optional, must have rtags installed
(cmake-ide-setup)

;; irony Config
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; company-mode
(add-hook 'after-init-hook 'global-company-mode)
