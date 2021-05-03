;; turn on/off the mode line for the current head only.
(setf *window-format* "%m%n%s%c")
(setf *screen-mode-line-format* (list "[^B%n^b] %W^>%d"))
(setf *time-modeline-string* "%a %b %e %k:%M")

(enable-mode-line (current-screen) (current-head) t)
