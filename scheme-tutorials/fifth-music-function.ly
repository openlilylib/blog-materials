\version "2.18.0"


colorMusic =
#(define-music-function (parser location my-color music)
   (color? ly:music?)
   #{
     \temporary \override NoteHead.color = #my-color
     \temporary \override Stem.color = #my-color
     \temporary \override Flag.color = #my-color
     \temporary \override Beam.color = #my-color
     \temporary \override Rest.color = #my-color
     \temporary \override Slur.color = #my-color
     \temporary \override PhrasingSlur.color = #my-color
     \temporary \override Tie.color = #my-color
     \temporary \override Script.color = #my-color
     \temporary \override Dots.color = #my-color

     $music

     \revert NoteHead.color
     \revert Stem.color
     \revert Flag.color
     \revert Beam.color
     \revert Rest.color
     \revert Slur.color
     \revert PhrasingSlur.color
     \revert Tie.color
     \revert Script.color
     \revert Dots.color
   #})

music = \relative c' {
  c4. d8 e16 d r cis( d4) ~ | d1 \fermata
}

\relative c' {
  \colorMusic #blue \music
  \colorMusic #red { c4 c } d \colorMusic #green e\f
  \colorMusic #magenta \music
}
