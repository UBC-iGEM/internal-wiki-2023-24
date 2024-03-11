(TeX-add-style-hook
 "bibliography"
 (lambda ()
   (LaTeX-add-bibitems
    "bioprocess"
    "bioreactors_synbio"
    "origins_microfluidics"
    "outlook_microfludics"))
 '(or :bibtex :latex))

