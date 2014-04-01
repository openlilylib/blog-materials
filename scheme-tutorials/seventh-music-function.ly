\version "2.18.0"

colorGrob =
#(define-music-function (parser location my-grob my-color)
   (symbol? color?)
   #{
       \temporary \override #my-grob #'color = #my-color
   #})

uncolorGrob =
#(define-music-function (parser location my-grob)
   (symbol?)
   #{
     \revert #my-grob #'color
   #})

colorGrobs =
#(define-music-function (parser location my-grob-list my-color)
   (symbol-list? color?)
   (if (null? my-grob-list)
       ;; issue an empty music expression
       #{ #}
       #{
         % color the first grob type of the current list
         \colorGrob #(car my-grob-list) #my-color
         % recursively call itself with the remainder
         % of the current list.
         \colorGrobs #(cdr my-grob-list) #my-color
       #}))

uncolorGrobs =
#(define-music-function (parser location my-grob-list)
   (symbol-list?)
   (if (null? my-grob-list)
       ;; issue an empty music expression
       #{ #}
       #{
         \uncolorGrob #(car my-grob-list)
         \uncolorGrobs #(cdr my-grob-list)
       #}))


colorMusic =
#(define-music-function (parser location my-color music)
   (color? ly:music?)
   #{
     \colorGrobs #'(NoteHead
                    Stem
                    Flag
                    Beam
                    Rest
                    Slur
                    PhrasingSlur
                    Tie
                    Script
                    Dots
                    DynamicText
                    Accidental) #my-color

     #music

     \uncolorGrobs #'(NoteHead
                      Stem
                      Flag
                      Beam
                      Rest
                      Slur
                      PhrasingSlur
                      Tie
                      Script
                      Dots
                      DynamicText
                      Accidental)
   #})

music = \relative c' {
  c4. d8 e16 d r cis( d4) ~ | d1 \fermata
}

\relative c' {
  \colorMusic #blue \music
  \colorMusic #red { c4 c } d \colorMusic #green e\f
  \colorMusic #magenta \music
}
