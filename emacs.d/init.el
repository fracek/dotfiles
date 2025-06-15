(setq make-backup-files nil)
(setq backup-inhibited nil)
(setq create-lockfiles nil)

(when (native-comp-available-p)
  (setq native-comp-async-report-warnings-errors 'silent)
  (setq native-compile-prune-cache t))

(setq custom-file (make-temp-file "emacs-custom-"))

(add-to-list 'load-path (locate-user-emacs-file "fra"))

;;;; Packages

(setq package-vc-register-as-project nil)

(add-hook 'package-menu-mode-hook #'hl-line-mode)

(setq package-archives
      '(("elpa" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(setq package-archive-priorities
      '(("elpa" . 3)
        ("melpa" . 2)))

;;;; Load config

(require 'fra-ui)
(require 'fra-git)
(require 'fra-editor)
