(TeX-add-style-hook
 "bibliography"
 (lambda ()
   (LaTeX-add-bibitems
    "bioprocess"
    "bioreactors_synbio"))
 '(or :bibtex :latex))

