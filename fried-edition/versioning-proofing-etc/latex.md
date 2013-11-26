##### Create the complete volume with LaTeX

We didn't only prepare our scores in (LilyPond) text files, also the main volume was created that way, namely as a LaTeX document.

Using LaTeX for such a task offers quite a number of advantages over using commercial DTP tools. From the workflow perspective it is clear that it offers all the goodies that versioning provides us with - exactly like with the LilyPond part. In fact I could even encourage some people without any prior knowledge to review and edit files through the [Bitbucket](https://bitbucket.org) web interface.

From the result perspective one has to note the *really* good typography that LaTeX offers, particularly lualatex in combination with the `microtype` package which really does toplevel paragraph formatting.

Recalling earlier projects with considerably simpler tasks I wouldn't want to think of editing a 124 page document with heavy graphics (scores) in InDesign. LaTeX is simply shrugging its shoulders about such dimensions because it doesn't have to keep such a document “open”. Of course a recompilation takes its time, but thanks to include-files one can work on short segments most of the time.

Providing `commands` is a *very* useful feature of LaTeX. Of course using styles instead of manual text formatting is a no-brainer even with word processors. But with LaTeX commands you can raise that to another level.  
For the revision report I created (for example) a command `\revEntry` which takes four arguments: a measure number, a position in measure, the affected instrument, and the entry body text. The separators and space between the different entries are intelligently handled so I could have entries such as
<pre lang="latex">\revEntry{45}{3. \crotchet}{\lh}{Missing slur in OE.}
\revEntry{46}{}{\lyrics}{OE prints "sie" instead of "er".}
\revEntry{}{last \semiquaver}{\rh}{Wrong pitch c\oct[2].}</pre>
which would result in

[Enter example]

Here you can see several commands in action: some simple shorthands guaranteeing consistent formatting and typography for abbreviations, a nice little function typesetting octave ticks, and finally the revision entry itself that formats the entries differently according to the presence or absence of the different arguments.  
While actively working on the report I used a modified version of the command to typeset the entries in a much more tabular and generously spaced version that made working with them simpler, and for the final layout I could have a totally different layout just by modifying the command. Note that I'm not only talking about character formatting but of a complete layout with different spacer characters, order of elements etc.

Plain text files can also easily be accessed with tools like `grep` and friends. I noticed that `f\oct[2]`, that is an `f` with octave tick(s) didn't work well because the upper extender (???) of the `f` collided with the first tick. So I simply created a new command `\fOct` which gives just that necessary amount of space between the `f` and the ticks. Propagating this change throughout all the files of the revision report was a matter of one call to `rpl "f\oct" "\fOct" *`! Compare this to the traditional approach with normal style sheets...

Managing such a song book with alternating text and score parts in a LaTeX document is also very straightforward, particularly as the “sources“ are always only a single compilation a way. Updating a score usually means simply to first compile the score with LilyPond and then compile the volume with LaTeX, and you're done. And when we started versioning PDFs too incorporating Janek's latest changes in the main volume was a matter of
<pre lang="bash">git pull
lualatex -interaction=nonstopmode "main-volume.tex"
evince main-volume.tex</pre>
which can conveniently be wrapped up in a one line script, so (e.g.) `update-fried` will get any updates from the server, compile and display the updated volume with one command!
