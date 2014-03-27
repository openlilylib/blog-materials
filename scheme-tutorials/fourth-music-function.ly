\version "2.18.0"

noOp =
#(define-music-function (parser location music)
   (ly:music?)
   #{
     $music
   #})

noOpTwo =
#(define-music-function (parser location music)
   (ly:music?)
   music)

\relative c' {
  c4 \noOp c \noOpTwo c c
}
