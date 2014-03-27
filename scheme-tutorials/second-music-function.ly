\version "2.18.0"

makeRedNote =
#(define-music-function (parser location)()
   #{
     \once \override NoteHead.color = #red
     \once \override Stem.color = #red
   #})

\relative c' {
  c4 \makeRedNote c c c
}
