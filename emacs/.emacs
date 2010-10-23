;; -*-mode: Emacs-Lisp; folding-mode:t-*-
;
;; Author: Mateusz Loskot <mateusz@loskot.net>
;; Source: http://github.com/mloskot/dot

;; set init file for custom settings
(setq custom-file "~/.emacs.d/custom.el")

;; emacs-starter-kit
(load-file "~/dot/emacs/emacs-starter-kit/init.el")

;; PATH environment
(when (string= (system-name) "dog")
  (setenv "PATH" (concat "/home/mloskot/bin:/home/mloskot/usr/bin:" (getenv "PATH")))
  (push "/home/mloskot/bin" exec-path)
  (push "/home/mloskot/usr/bin" exec-path)
)

;; load concrete packages
;; -- to be done --

;; TODOs, etc.
;; -- to be done --

;; text editing
;; -- to be done --

;; programming tools & languages
(load "~/dot/emacs/alex-ott-emacs-configs/rc/emacs-rc-cedet.el")

;; VCS & DVCS
;(load "~/dot/emacs/alex-ott-emacs-configs/rc/emacs-rc-git.el")

;; WWW, IM, social networking & blogging
;; -- to be done --

;; Top Secret - DO NOT PUBLISH
;; -- to be done --
;;(load "~/emacs/passwords.el.gpg")

(load custom-file 'noerror)
