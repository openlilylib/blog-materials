\version "2.18.0"

colorMusic =
#(define-music-function (parser location color music)
   (color? ly:music?)
   #{
     \temporary \override NoteHead.color = $color
     \temporary \override Stem.color = $color
     \temporary \override Flag.color = $color
     \temporary \override Beam.color = $color
     \temporary \override Rest.color = $color
     \temporary \override Slur.color = $color
     \temporary \override PhrasingSlur.color = $color
     \temporary \override Tie.color = $color
     \temporary \override Script.color = $color
     \temporary \override Dots.color = $color
     
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
