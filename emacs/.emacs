;; -*-mode: Emacs-Lisp; folding-mode:t-*-
;; Copyright (C) 2010 Mateusz Loskot <mateusz@loskot.net>
;; URL:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; general settings
;;

;; don't show startup messages
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; set default window size
(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
  (progn
    ;; use 90 or 120 char wide window for largeish displays
    ;; and smaller 80 column windows for smaller displays
    ;; pick whatever numbers make sense for you
    (if (> (x-display-pixel-width) 1280)
        (add-to-list 'default-frame-alist (cons 'width 90))
      (add-to-list 'default-frame-alist (cons 'width 80)))
    ;; for the height, subtract a couple hundred pixels
    ;; from the screen height (for panels, menubars and
    ;; whatnot), then divide by the height of a char to
    ;; get the height we want
    (add-to-list 'default-frame-alist 
                 (cons 'height (/ (- (x-display-pixel-height) 200) (frame-char-height)))))))

(set-frame-size-according-to-resolution)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; the modeline
;; 
;(line-number-mode t)                    ;; show line numbers
;(column-number-mode t)                  ;; show column numbers
;(size-indication-mode t)                ;; show file size (emacs 22+)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; buffers settings
;; 
;;  cycle through buffers with Ctrl-Tab (like Firefox)
;;  source: http://emacs-fu.blogspot.com/2008/12/cycling-through-your-buffers-with-ctrl.html
;;(global-set-key (kbd "<C-tab>") 'bury-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; editor settings
;; 
(setq scroll-step 1)                    ;; line by line scrolling
(global-hl-line-mode 1)                 ;; set the highlight current line minor mode
(setq-default tab-width 4)              ;; tab width and indentation
(setq-default indent-tabs-mode nil)     ;; turn off tabs character

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C/C++ mode 
;;
;; match tabs and indentation after Visual Studio for C/C++ files
;; source: http://stackoverflow.com/questions/663588/emacs-c-mode-incorrect-indentation/664492#664492
(defun my-c-mode-common-hook ()
 ;; my customizations for all of c-mode, c++-mode, objc-mode, java-mode
 (c-set-offset 'substatement-open 0)
 ;; other customizations can go here

 (setq c++-tab-always-indent t)
 (setq c-basic-offset 4)                  ;; Default is 2
 (setq c-indent-level 4)                  ;; Default is 2

 (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
 (setq tab-width 4)
 (setq indent-tabs-mode t)  ; use spaces only if nil
 )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;;  quickly switching between header and implementation
;;  source: http://emacs-fu.blogspot.com/2008/12/quickly-switching-between-header-and.html 
;;(add-hook 'c-mode-common-hook
;;    (lambda() 
;;        (local-set-key  (kbd "C-c o") 'ff-find-other-file)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacs-starter-kit
(load-file "~/dot/emacs/emacs-starter-kit/init.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; cedet
;; TODO: exctract to separate .el file
(load-file "~/dot/emacs/cedet/common/cedet.el")
(global-ede-mode 1)                      ; enable the Project management system
(global-srecode-minor-mode 1)            ; enable template ins

;; enables senator-minor-mode for navigation in buffer,
;; semantic-mru-bookmark-mode for storing positions of visited tags, and
;; semantic-idle-summary-mode, that shows information about tag under point
;(semantic-load-enable-code-helpers)

;; enables which-func-mode, that shows name of current function in status line
(semantic-load-enable-excessive-code-helpers)


(require 'semantic-ia)
(require 'semantic-gcc)
;; Boost 1.42
(semantic-add-system-include "/usr/include/boost" 'c++-mode)
;; Boost (current SVN trunk)
;;(semantic-add-system-include "~/dev/boost/_svn/trunk/boost" 'c++-mode)

;; Semantic bindings
(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))
(add-hook 'c-mode-common-hook 'my-cedet-hook)

(defun my-c-mode-cedet-hook ()
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert))
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

;; EOF
