(TeX-add-style-hook
 "bibliography"
 (lambda ()
   (LaTeX-add-bibitems
    "mdBook"))
 '(or :bibtex :latex))

