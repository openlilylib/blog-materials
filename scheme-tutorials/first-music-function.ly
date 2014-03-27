\version "2.18.0"

function = { c2 }

\relative c' {
  c4 \function c
}

schemeFunction =
#(define-music-function (parser location)()
   #{
     c2
   #})

\relative c' {
  c4 \schemeFunction c
}
