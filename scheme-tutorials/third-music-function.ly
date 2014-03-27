\version "2.18.0"

colorNote =
#(define-music-function (parser location color)
   (color?)
   #{
     \once \override NoteHead.color = $color
     \once \override Stem.color = $color
   #})

\relative c' {
  c4 \colorNote #blue c \colorNote #green c c
}
