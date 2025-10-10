;;; slp-elfeed.el --- Setup Elfeed -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package elfeed
  :bind ("C-x w" . elfeed)
  :config
  (setq elfeed-feeds
      '("http://nullprogram.com/feed/"
        "https://planet.emacslife.com/atom.xml"
        "https://stallman.org/rss/rss.xml"
        "https://sophiebos.io/index.xml"
        "https://sigkill.dk/atom.xml"
        "https://xkcd.com/rss.xml"
        "https://danluu.com/atom.xml"
        "https://drewdevault.com/blog/index.xml")))

(provide 'slp-elfeed)
;;; slp-elfeed.el ends here
