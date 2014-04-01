\version "2.18.0"

colorGrob =
#(define-music-function (parser location my-grob my-color color-on)
   (symbol? color? boolean?)
   ;; check for the boolean argument
   (if color-on
       ;; either set the color for the grob type
       #{
         \temporary \override #my-grob #'color = #my-color
       #}
       ;; or revert it
       #{
         \revert #my-grob #'color
       #}))

colorGrobs =
#(define-music-function (parser location my-grob-list my-color color-on)
   (symbol-list? color? boolean?)
   (if (null? my-grob-list)
       ;; issue an empty music expression
       #{ #}
       #{
         % color the first grob type of the current list
         \colorGrob #(car my-grob-list) #my-color #color-on
         % recursively call itself with the remainder
         % of the current list.
         \colorGrobs #(cdr my-grob-list) #my-color #color-on
       #}))

allGrobNames =
#(define-scheme-function (parser location)()
   ;; create a list with all grob names from LilyPond
   (map (lambda (gd) (car gd)) all-grob-descriptions))

colorMusic =
#(define-music-function (parser location my-color music)
   (color? ly:music?)
   #{
     \colorGrobs \allGrobNames #my-color ##t

     #music

     \colorGrobs \allGrobNames #my-color ##f
   #})

music = \relative c' {
  c4. d8 e16 d r cis( d4) ~ | d1 \fermata
}

\relative c' {
  \colorMusic #blue \music
  \colorMusic #red { c4 c } d \colorMusic #green e\f
  \colorMusic #magenta \music
}
