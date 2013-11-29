##### Create the complete volume with LaTeX

*This post is part of a [series](http://lilypondblog.org/category/fried-songs) analyzing LilyPond's performance during the preparation of a new edition of [Oskar Fried's songs](http://lilypondblog.org/2013/10/oskar-fried-complete-songs).*

Of course it is clear that we prepared the scores of our edition with LilyPond. But at one point we decided to use yet another plain text tool to compile the complete volume, LaTeX.
The question of integrating text and music pops up regularly on the lilypond-user mailing list, so it may be interesting to see some of the tricks we applied to manage this project.
After that I will talk about some nice features I learned to love during the project
<--more-->


There are several ways to mix text and music in a document, but in a case like ours where we have scores and text neatly separated on individual pages it's quite natural to create one LaTeX document for the whole compilation and include the scores' PDF documents through `\includepdf` from the `pdfpages` package.
While this is basically very straightforward there *are* issues to consider, namely page layout, headers and footers and finally page numbering.

I think page layout in music books heavily differs from that of text books and therefore of LaTeX's default behaviour. In general you will have much smaller margins on A4 or similarly large paper. In text typesetting you are confronted with the issue of reducing the linewidth in order to improve legibility - an issue that is completely different with scores. Therefore you should happily ignore LaTeX's inclination to calculated type areas and hardcode it with the `geometry` package to fit your scores' margins.

The next topic to consider are page headers and footers - who should print them, LilyPond or LaTeX? We decided to let LaTeX print them because this automatically takes care of any page numberings, even when something changes, and of course it would have been difficult to get the formatting of footers and page numbers identical.  
But when working on a single song you normally work directly with the score, and you may consider it impractical to have a printout without any numberings. So what to do about this situation?
Our solution was part of a concept we used to call *Draft Mode*, which I can only recommend to adapt in one way or the other.
Basically we had include commands in each file that could load either a "draftMode", a "prePubMode" or no style sheet.

<pre class="lilypond"><span class="lilypond-comment">% Optionally activate draft Mode or prePublication mode</span>
<span class="lilypond-comment">% Both modes print a &quot;progress bar&quot; in the header line.</span>
<span class="lilypond-comment">% draft mode additionally applies coloring th many manually applied tweaks</span>

<span class="lilypond-keyword">\include</span> <span class="lilypond-string">&quot;</span><span class="lilypond-string">../includes/config/draftMode.ily</span><span class="lilypond-string">&quot;</span>
<span class="lilypond-comment">%\include &quot;../includes/config/prePubMode.ily&quot;</span>
</pre>

These modes did a lot which I may write about another time. But in particular they printed a "status bar" and page numbers. One little noteworthy trick was that if no mode-stylesheet was included the status bar was printed anyway but with an empty string. This way it didn't affect page layout and we could safely switch modes on and off until the last day.  
To make sure we didn't produce any confusion I colored the items in LaTeX so we could make sure there were no remnants of LilyPond items in the final volume, and in the end I could simply revert that coloring for printing.

---

Now after having talked a little bit about the complexity of our approach I'm going to tell you why I think it *was* a good idea to go that way. Actually I can't recall anymore whether I decided to learn LaTeX because I just had started using Git. Maybe I started using Git because I then could also integrate LaTeX in our project considerations. Anyway I did the switch, made our Fried song book my first real LaTeX document - and am happy with it.

Using LaTeX for such a task offers quite a number of advantages over using commercial DTP tools. Considering the result I can say that LaTeX's typesetting is typographically completely up to par with any competitor, particularly lualatex in combination with the `microtype` package which really does good paragraph formatting.
See for example this paragraph that I have rebuilt with LibreOffice using the same font as in our book:

![](LibreOffice.png)

Typeset with "plain" LuaLaTeX it looks like this:

![](lualatex-no-microtype.png)

which is already much better because the spacing is significantly better balanced. A detail that happens only twice in this paragraph but that makes a big difference between word processor and typesetter is the ligature in "typografisch".  
But the `microtype` package adds the finishing touches to it: protrusion and font expansion.

![](lualatex-microtype.png)

Rather obvious is that the hyphens protrude out of the margin. It may first seem strange that this should be an advantage, but once you start to notice it you'll realize that it makes the visual appearance of the margin *much* more steady and calm. Go back and look at the previous image where the hyphens cause the right edge of the text block to appear interrupted. Other good candidates for protrusion are quotation marks but actually it affects all characters to a greater or lesser extent. Look in books that you have or on any printed media around you: Who cares for protrusion? You'll notice that in old books this is really standard while today it is rather rare.
The other technique is "font expansion" that uses tiny bits of squeezing and pulling at the character shapes and the space between them to create a more even distribution of the text on the page. In effect using this package gives you professional typesetting without having to know about it. And the additional package `selnolig` even takes care of removing unsuitable ligatures for you. Huh, why remove ligatures now? Well, at least in German typography there are many places where you should *not* use ligatures, particularly at syllable borders: So this

![](hoffen-correct.png)

is correct while this

![](hoffen-wrong.png)

is wrong.



From the workflow perspective it is clear that it offers all the goodies that versioning provides us with - exactly like with the LilyPond part. In fact I could even encourage some people without any prior knowledge to review and edit files through the [Bitbucket](https://bitbucket.org) web interface.

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
