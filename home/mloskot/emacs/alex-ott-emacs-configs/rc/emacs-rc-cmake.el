;;; emacs-rc-cmake.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;; Modifications:
;; Author: mateusz at loskot dot net
;; Source: http://github.com/mloskot/dot
;;
;; support for CMake

;; set possible locations of cmake-mode
(setq load-path (cons "~/dev/cmake/_git/cmake.git/Docs" load-path))
(setq load-path (cons "~/src/cmake-2.8.0/Docs" load-path))

(autoload 'cmake-mode "cmake-mode" t)
(add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))

(add-hook 'cmake-mode-hook 'alexott/common-hook)
(add-hook 'cmake-mode-hook 'alexott/show-prog-keywords)

;;; emacs-rc-cmake.el ends here
