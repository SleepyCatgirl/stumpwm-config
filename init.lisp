(in-package :stumpwm)
(defvar *stumpwm-config-dir* "~/.stumpwm.d/" "StumpWM config directory")
;; some links
;; https://github.com/Jassob/.stumpwm.d/blob/master/init.lisp
;; https://github.com/JMC-design/truetype-clx/blob/master/truetype-clx.lisp
;; https://github.com/benjamin-james/dotfiles/blob/master/.config/stumpwm/mode-line.lisp
;; load some generic contrib modules
(mapcar #'load-module '("cpu" "mem" "hostname" "net" "app-menu" "windowtags"))
;; modeline config
(setf *window-format* "%m%n%s%c")
(setf *screen-mode-line-format* (list "[^B%n^b] [^B%g^b] %C %W^>%d"))
(setf *time-modeline-string* "%a %b %e %k:%M")


(enable-mode-line (current-screen) (current-head) t)

;; Gaps
;;(load-module "swm-gaps")

;;(setf swm-gaps:*inner-gaps-size* 3)
;;(setf swm-gaps:*outer-gaps-size* 6)
;;(run-commands "toggle-gaps")

;; some config
(setf *message-window-gravity* :top-right
      *input-window-gravity* :top-right
      *window-border-style* :thin
      *message-window-padding* 1
      *maxsize-border-width* 2
      *normal-border-width* 2
      *transient-border-width* 2
      stumpwm::*float-window-border* 2
      stumpwm::*float-window-title-height* 5
      *mouse-focus-policy* :click)
;; Colors
(set-bg-color "#ffffff")
(set-fg-color "#7f7f81")
(set-border-color "#32555f")
(stumpwm:set-focus-color "#7f7f81")
;; Workspaces
(stumpwm:grename "Alpha")
(stumpwm:gnewbg "Beta")
(stumpwm:gnewbg "Gamma")
(stumpwm:gnewbg "Delta")
(stumpwm:gnewbg "Epsilon")
;; Set prefix key
(set-prefix-key (kbd "C-z"))
;; wallpaper
(stumpwm:run-shell-command
 "feh --bg-scale ~/Download/wallpaper1.jpg")
;; Start emacs daemon
; (run-shell-command "emacs --daemon")
;; Some personal config
(define-key *root-map* (kbd "F") "fullscreen")
;;(define-key *root-map* (kbd "q") "quit")
;; Screenshot function
(defun global-set-key (key command)
 (define-key *top-map* key command))
(run-shell-command "wal -i ~/Downloads/wallpaper-1.jpg")
(defcommand screenshot () ()
            "Take screenshot"
            (run-shell-command "scrot ~/Pictures/%Y-%m-%d-%T-screenshot.png -e 'xclip -selection clipboard -target image/png -i $f'"))
(defcommand screenshot-crop () ()
            "Take screenshot"
            (run-shell-command "sleep 0.2 && scrot ~/Pictures/%Y-%m-%d-%T-screenshot.png -s -e 'xclip -selection clipboard -target image/png -i $f'"))
(defcommand dmenu () ()
	    "Run dmenu, the autocompleting launcher"
	    (run-shell-command "dmenu_run -i -b -p \"run command:\""))
(global-set-key (kbd "Print") "screenshot")
(define-key *root-map* (kbd "Print") "screenshot-crop")
(define-key *root-map* (kbd "d") "dmenu")
;;(define-key () (kbd "Print") "screenshot")
