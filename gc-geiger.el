(defvar gc-geiger-sound (base64-decode-string "UklGRogBAABXQVZFZm10IBAAAAABAAEARKwAAIhYAQACABAAZGF0YRoBAAAEBBgLbfK9PyF6pdoAgOzd8Q62AjcC5fwk/zUYFRZv/70H9gdkDZIS1/cAAA0OTAQ0A0gGlQTG7jrzvAU39KH4zP4c6obqFfPT+xQA9P+J/yQAuQRP+5YOIxnW/Z0MFhFc9lr3O/6YBSwCcv8K/23qB/A/Aw0CPOvF3fL7IQy2Cq8Fz/K89Xj5TAQ6Etf+XPUn+PgG9RNABVgJrQcIAicPTQ3vCvwLtQji+d36AhODBTr6AwLZ9vb/+gUeBS4M/v7W9uL6YAnkD1YDRgG++8j/JRIWEsUQlgfmAKQD9wXjDPH/GPlW+mPyqPho83P1aQ2hCM71aPKOAWgJVgNYBzQPmxpwF6kLBBheGGsJIQf9B/gG/PkC90f8RvlMSVNUQgAAAElORk9JQ1JEDAAAADIwMDUtMTItMjYAAElFTkcDAAAAIAAAAUlTRlQWAAAAU29ueSBTb3VuZCBGb3JnZSA4LjAAAA==")
  "The sound to be played by gc-geiger-mode, as a data string.")

(defun gc-geiger-play () (play-sound `(sound :data ,gc-geiger-sound)))

(define-minor-mode gc-geiger-mode
  "Make a click sound whenever garbage collection happens"
  :init-value nil
  :global t
  :lighter " Gc-Geiger"
  (if gc-geiger-mode
      (add-hook 'post-gc-hook #'gc-geiger-play )
    (remove-hook 'post-gc-hook #'gc-geiger-play)))

(provide 'gc-geiger)
