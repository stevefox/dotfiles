; do something automatically on start template function
;; (setq auto-mode-alist (cons '("README" . text-mode) auto-mode-alist))

;;must have jabber.el installed. look in the repository for this package
(setq jabber-account-list'(
			   ("myemailaddress@gmail.com"
			   (:password . nil)
			   (:network-server . "talk.google.com")
			   (:port . 443)
			   (:connection-type . ssl)

			   )))
;; Setup email sending
(require 'smtpmail)
(require 'starttls)
(setq send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "myemailaddress@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      user-mail-address "myemailaddress@gmail.com" ; make sure to change this
      smtpmail-debug-info t)

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves/"))    ; don't litter my fs tree
;;   delete-old-versions f
   kept-new-versions 5
   kept-old-versions 5
   version-control t)       ; use versioned backups
;;stop that annoying startup message

(setq create-lockfiles nil)

;;(setq inhibit-startup-message t)

;; set column with to be 80 characters
(setq fill-column 80)

;;always end a file with a newline
(setq require-final-newline t)

;; display the time
(display-time)
;; set auto-fille-mode as always on
;; i.e. auto line-wrapping
(setq auto-fill-mode t)
(global-font-lock-mode 1)

;; set f4 to be goto-line
(global-set-key [f4] 'goto-line)

;; set f3 to be shell
(global-set-key [f3] 'eshell)

;;set f5 to be find and replace
(global-set-key [f5] 'query-replace)

;;set f6 to be end of buffer key
(global-set-key [f6] 'end-of-buffer)

;;go to line
(global-set-key "\C-xg" 'goto-line)
(global-set-key "\C-xw" 'delete-trailing-whitespace)

;;get rid of that damn useless menu bar
(menu-bar-mode -1)

;;(setq c-basic-offset 2)
(setq auto-fill-mode 1)

;;fix some garbage in the shell
(add-hook 'shell-mode-hook
	  'ansi-color-for-comint-mode-on)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;(load-file "/home/stephen/.emacs.d/styles/fermat-style.el")
;(load-file "/home/stephen/.emacs.d/styles/android.el")

;(setq tabl-always-indent 'complete)
;(add-to-list 'completion-styles 'initials t)

;(load-file "/home/stephen/.emacs.d/styles/pcl-c-style.el")
;(add-hook 'c-mode-common-hook 'pcl-set-c-style) 

;(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))

;(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


;; This is what I like for python programming.
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional

;; web and javascxript


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; modifications jan 2013
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; tex-mode (major), tex-pdf-mode (minor)
(setq auto-mode-alist (cons '("\\.tex$" . tex-mode) auto-mode-alist))
(add-hook 'LaTeX-mode-hook (function (lambda() (tex-pdf-mode)
 				             (auto-fill-mode)
 					     (setq fill-column 80)
 					     (flymake-mode))))




;; some latex editing options
;; http://superuser.com/questions/253525/emacs-auctex-how-do-i-open-the-pdf-in-evince-at-the-current-cursor-position
;; 1/26/2013
;;(setq TeX-view-program-list '(("Evince" "evince --page-index=%(outpage) %o")))
;;(setq TeX-view-program-selection '((output-pdf "Evince")))

;;(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
;;(setq TeX-source-correlate-start-server t)

;;(add-hook 'python-mode-hook
;;	  (lambda() (setq indent-tabs-mode f)))

(setq-default indent-tabs-mode nil)

(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives 
    '("melpa" .
      "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; This is what I like for python programming.
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

(add-hook 'python-mode-hook 'jedi:setup) ; turn on jedi-mode and auto-completion
(setq jedi:complete-on-dot t)

(add-hook 'python-mode-hook 'column-enforce-mode) ; Enforce the 80 column rule for python
(add-hook 'python-mode-hook 'hs-minor-mode)


;; set projectile helm mode shortcut
(projectile-global-mode)
(global-set-key "\C-xj" 'helm-projectile)
(global-set-key "\C-xf" 'projectile-grep)
(global-set-key "\C-cf" 'projectile-find-file)

(put 'set-goal-column 'disabled nil)

;; Time to learn go - 11/4
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

;; (defun create-docker-terminal (buffer-name)
;;   (interactive "sshell name: ")
;;   (ansi-term "/home/alex/mailgun/docker/launch.sh")
;;   (rename-buffer buffer-name t))
;; (global-set-key (kbd "C-c d") 'create-docker-terminal)

(setq-default js-indent-level 2)
(setq-default typescript-indent-level 4)

;; copy/paste into emacs causing some annoying indentation issues
;; http://stackoverflow.com/questions/27736107/emacs-started-adding-extra-tabs-in-when-i-paste-into-it-on-os-x
(setq electric-indent-mode nil)
