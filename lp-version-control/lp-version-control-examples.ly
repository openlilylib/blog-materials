\version "2.16.2"

% Examples for "LilyPond and Version Control" post

music = \relative c { 
  \key c \major 
  \clef bass
  c4 d 
       \shape Slur #'((0 . 0)(1 . 0)(0 . -1)(0 . 0))
       e( d | % 110
  f2 a4.) g16 f | % 111
  e1\fermata %112
}

\score {
  \new Staff \music
}