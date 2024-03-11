(TeX-add-style-hook
 "bibliography"
 (lambda ()
   (LaTeX-add-bibitems
    "origins_microfluidics"
    "outlook_microfludics"))
 '(or :bibtex :latex))

