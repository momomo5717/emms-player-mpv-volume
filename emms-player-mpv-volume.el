;;; emms-player-mpv-volume.el --- an extension of emms-player-mpv.el for volume control

;; Copyright (C) 2015 momomo5717

;; This program is free software: you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by the Free
;; Software Foundation, either version 3 of the License, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
;; FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
;; more details.

;; You should have received a copy of the GNU General Public License along with
;; this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;; This is an extension of emms-player-mpv.el for volume control.
;;
;; Setup
;; (require 'emms-player-mpv-volume)
;; (custom-set-variables
;;  '(emms-volume-change-function #'emms-player-mpv-volume-change))
;;

;;; Code:
(require 'emms-volume)
(require 'emms-player-mpv)

(defun emms-player-mpv-volume-change (v)
  "Change the volume by V for mpv."
  (let ((cmd (format "echo 'add volume %d' > %s" v emms-mpv-input-file)))
    (call-process-shell-command cmd nil nil nil)))

(defun emms-player-mpv-volume-set (v)
  "Set the volume to V for mpv."
  (interactive "nmpv volume : ")
  (let ((cmd (format "echo 'set volume %d' > %s" v emms-mpv-input-file)))
    (call-process-shell-command cmd nil nil nil)))

(defun emms-player-mpv-volume-mute ()
  "Toggle mute status for mpv."
  (interactive)
  (let ((cmd (format "echo 'cycle mute' > %s" emms-mpv-input-file)))
    (call-process-shell-command cmd nil nil nil)))

(provide 'emms-player-mpv-volume)
;;; emms-player-mpv-volume.el ends here
