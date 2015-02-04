\version "2.18.0"

%{
  Color a music expression with a given color.

  This is an improved file with a solution to a series of posts
  on Scores of Beauty:
  - http://lilypondblog.org/2014/03/music-functions-1-getting-to-grips-with-scheme-in-lilypond/
  - http://lilypondblog.org/2014/03/music-functions-2-start-doing-something-useful/
  - http://lilypondblog.org/2014/04/music-functions-3-reusing-code/
  - http://lilypondblog.org/2014/04/music-functions-4-recursion/
  - http://lilypondblog.org/2014/05/local-variables-in-scheme-lilypond/

  There have been very helpful comments to the posts which lead to a
  much better and cleaner (and even faster) solution, but it's some
  work to put the pieces together. Therefore I compiled a new file
  with all results in it.
  I did my best to comment and credit as thoroughly as possible.
%}

% Wraps the input list of music elements in a single sequential music element.
% This can be used instead of calling colorGrob recursively.
% Based on solutions by Jay Anderson and Ralf Mattes:
% http://lilypondblog.org/2014/04/music-functions-3-reusing-code/#comment-34479
% http://lilypondblog.org/2014/05/local-variables-in-scheme-lilypond/
% http://lilypondblog.org/2014/05/local-variables-in-scheme-lilypond/#comment-37500
#(define (wrap-music-list music-list)
   (make-music 'SequentialMusic 'elements music-list))

% Switch coloring for a given grob type on or off
% (function as in Urs' original post)
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

% Switch coloring for a list of given grob types on or off.
% Maps the results of individual calls to \colorGrob to a
% list of music expressions which is sent to wrap-music-list
% to be wrapped into a single sequential music expression.
% Solution by Jay Anderson:
% http://lilypondblog.org/2014/04/music-functions-3-reusing-code/#comment-34479
colorGrobs =
#(define-music-function (parser location my-grob-list my-color color-on)
  (symbol-list? color? boolean?)
  (wrap-music-list (map (lambda (arg) #{ \colorGrob $arg $my-color $color-on #}) my-grob-list)))

% color a given music expression with a given color.
% This is a closure returning a music function
% (solution by Ralf Mattes: 
%  http://lilypondblog.org/2014/04/music-functions-4-recursion/#comment-34553).
% In that closure the list of all grob names is only calculated once,
% during function definition.
% Solution for reducing the generation of the grob name list by Paul Morris:
% http://lilypondblog.org/2014/04/music-functions-4-recursion/#comment-34507
colorMusic =
#(let ((grob-names (map car all-grob-descriptions)))
   (define-music-function (parser location my-color music)
     (color? ly:music?)
        #{
          \colorGrobs #grob-names #my-color ##t
          #music
          \colorGrobs #grob-names #my-color ##f
          #}))

% Example music and score
music = \relative c' {
  c4. d8 e16 d r cis( d4) ~ | d1 \fermata
}

\relative c' {
  \colorMusic #blue \music
  \colorMusic #red { c4 c } d \colorMusic #green e\f
  \colorMusic #magenta \music
}