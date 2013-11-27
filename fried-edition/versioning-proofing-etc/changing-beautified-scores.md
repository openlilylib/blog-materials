*This post is part of a [series](http://lilypondblog.org/category/fried-songs) analyzing LilyPond's performance during the preparation of a new edition of [Oskar Fried's songs](http://lilypondblog.org/2013/10/oskar-fried-complete-songs).*

In his recent posts Janek shared with us his struggles with several *Engraving Challenges* that made him ask for more or less significant improvements in LilyPond (well, at least in one respect he actually implemented such an improvement himself, as he'll show you soon). So I think it's time for a real success story in between (appropriate for our **50th (!) post**).

But I will start off by confessing to a mistake. Our intention was to finish the musical text, do the beautification and do a last proof-reading run while approving Janek's work. But it turned out that we had to apply *nearly 200* fixes to the musical text on the 94 pages of the edition *after the beautification was considered finished". So it clearly seems we let Janek prematurely beautify the scores.  
The necessary fixes ranged from capitalization in lyrics or titles (completely harmless) over fixes in pitch and adding/removing/parenthesizing accidentals (potentially dangerous) to one extreme case of a slur which spans three measures and was accidentally hidden (asking for disaster). 

Anybody who as ever prepared publication quality scores can easily see the awful mess this could have created. But LilyPond graciously saved our day by providing incredible performance when it came to accomodating these post-beautification fixes!

---

Thanks to the use of versioning the whole process of beautification and proof-reading is meticulously documented. Therefore I can give you a quite specific report on how LilyPond coped with the task.

One nice thing about managing an edition project with LilyPond and version control is that I (as the editor) can directly apply any fixes to the shared source files without worrying about file conflicts. I don't have to either send Janek (the engraver) a list with fixes or ask him to send me the score file (while at the same time he must not edit it himself!). So I applied all the fixes found while proof-reading myself, committing them to the repository one by one. This gave me the opportunity to judge their implications individually and comment on them. But to my (pleasant) surprise the phrase I used in the *vast* majority of commit messages was *“No side-effects noticed”*. This means that in most cases applying a fix *did* (obviously) cause a change in layout but *did not* cause a regression.  
In a typical run-through of this process for a song I applied five to ten fixes to the musical text and wrote a list of four or five “beautification requests”, that is issues I wanted to have changed in the beautification of the score, either because Janek might have missed them or because I wanted something differently.  
When Janek was assigned to finish off the song he would first process the beautification requests and then look for the issues created by my modifications. Usually there were only one or two things he had to postprocess by adding or updating tweaks. Actually there even were numerous songs where he didn't have to fix any of my modifications at all. Considering how delicate it is for an engraving software to accomodate subsequent changes I can't say anything else than this was a triumphal success for LilyPond's performance.

##### Examples

In the remaining part of this post I will show you some examples of changes in the musical text and their impact on the layout. There will be some with and some without side-effects. Note that I didn't collect these examples along the way but can now easily reproduce them thanks to version control ;-)

- op. 3,4: Fix poet name
- op. 3.3: parenthesize accidental m.42  
- op. 7,5: Change beam/slur m. 19
- op. 7,6: Restore voicing m. 30
- op. 7,7: Remove accidental m. 32  
this *had* some side-effects

- op. 7,3: Reattach phrasing slur m. 50-52
- op. 7,5: Make slur visible m. 27-30
