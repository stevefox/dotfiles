;; Setup package repositories
(require 'package)
(add-to-list 'package-archives
    '("melpa" .
      "http://melpa.org/packages/"))
(package-initialize)

;; Project management
(require 'helm-projectile)
(require 'projectile)
(require 'jedi)


;; Setup email sending
(require 'smtpmail)
(require 'starttls)
(setq send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "stfox88@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      user-mail-address "stfox88@gmail.com" ; make sure to change this
      smtpmail-debug-info t)

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
   '(("." . "~/.saves/"))    ; don't litter my fs tree
   kept-new-versions 5
   kept-old-versions 5
   version-control t)       ; use versioned backups
(setq create-lockfiles nil)

;;always end a file with a newline
(setq require-final-newline t)

;; display the time
(display-time)
;; set auto-fille-mode as always on
;; i.e. auto line-wrapping
;;(setq auto-fill-mode t)
(global-font-lock-mode 1)

;; shortcuts I can't live without
(global-set-key "\C-xg" 'goto-line)
(global-set-key "\C-xr" 'query-replace)
(global-set-key "\C-xe" 'end-of-buffer)
(global-set-key "\C-f" 'ffap)

;;get rid of that damn useless menu bar
(menu-bar-mode -1)

;;(setq c-basic-offset 2)
(setq auto-fill-mode 1)

;;fix some garbage in the shell
(add-hook 'shell-mode-hook
          'ansi-color-for-comint-mode-on)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))

(setq column-enforce-column 80)
(add-hook 'python-mode-hook 'jedi:setup) ; turn on jedi-mode and auto-completion
(setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook 'column-enforce-mode) ; Enforce the 80 column rule for python
(add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook '(lambda () (progn
                                          (set-variable 'py-indent-offset 4)
                                          (set-variable 'indent-tabs-mode nil))))

;; set projectile helm mode shortcut
(projectile-global-mode)
(global-set-key "\C-xj" 'helm-projectile)
(global-set-key "\C-xf" 'projectile-grep)
(global-set-key "\C-cf" 'projectile-find-file)
(global-set-key "\C-xw" 'whitespace-cleanup)

;; I found this useful setting up the coding standard
;; http://docs.astropy.org/en/stable/development/codeguide_emacs.html

;; Use spaces for indent not tab
(setq-default indent-tabs-mode nil)
;; set column with to be 79 characters
(setq fill-column 79)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(line-number-mode 1)
(column-number-mode 1)
(global-font-lock-mode 1)


;; Setup for Flymake code checking.
(require 'flymake)
(load-library "flymake-cursor")

;; Script that flymake uses to check code. This script must be
;; present in the system path.
(setq pycodechecker "pychecker")

;; TODO: http://blog.urth.org/2011/06/02/flymake-versus-the-catalyst-restarter/
(when (load "flymake" t)
  (defun flymake-pycodecheck-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list pycodechecker (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pycodecheck-init)))

(add-hook 'python-mode-hook 'flymake-mode)
(put 'set-goal-column 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(typescript-indent-level 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; http://stackoverflow.com/questions/27736107/emacs-started-adding-extra-tabs-in-when-i-paste-into-it-on-os-x
(setq electric-indent-mode nil)

(defun linum-format-func (line)
  (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
     (propertize (format (format "%%%dd " w) line) 'face 'linum)))
(setq linum-format 'linum-format-func)
(global-linum-mode 1)

;; automatically close parens (vi-style)
(require 'smartparens)
(smartparens-global-mode t)
