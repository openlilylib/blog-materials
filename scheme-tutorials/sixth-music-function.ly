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

colorMusic =
#(define-music-function (parser location my-color music)
   (color? ly:music?)
   #{
     \colorGrob NoteHead #my-color
     \colorGrob Stem #my-color
     \colorGrob Flag #my-color
     \colorGrob Beam #my-color
     \colorGrob Rest #my-color
     \colorGrob Slur #my-color
     \colorGrob PhrasingSlur #my-color
     \colorGrob Tie #my-color
     \colorGrob Script #my-color
     \colorGrob Dots #my-color

     $music

     \uncolorGrob NoteHead
     \uncolorGrob Stem
     \uncolorGrob Flag
     \uncolorGrob Beam
     \uncolorGrob Rest
     \uncolorGrob Slur
     \uncolorGrob PhrasingSlur
     \uncolorGrob Tie
     \uncolorGrob Script
     \uncolorGrob Dots
   #})

music = \relative c' {
  c4. d8 e16 d r cis( d4) ~ | d1 \fermata
}

\relative c' {
  \colorMusic #blue \music
  \colorMusic #red { c4 c } d \colorMusic #green e\f
  \colorMusic #magenta \music
}
