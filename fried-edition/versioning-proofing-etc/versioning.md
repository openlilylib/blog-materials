##### Using Version Control

*“As you have said, it's too late to migrate Fried project to git.[...]”*

My email client insists I really got this in a message by Janek. In a former life, obviously. And presumably immediately prior to one of the most consequential decisions I took in recent years: Learning to use Git and LaTeX.  
Following this statement Janek told me that he put the content of his project directory in a personal Git repository (the email title was "A git experiment") but this

*“shouldn't affect our workflow at all"*.

If you follow this blog you'll know that by now I'm a passionate advocate of version control and plain text based work, so from today's perspective this quote sounds absolutely unbelievable to me. But obviously it reflects our perspective of these days.

Up to that point we had managed our project files in a shared [Dropbox](http://www.dropbox.com) folder. This seemed to work quite well because we didn't have to *exchange* files via email but could access the *shared* files. But it soon became a nightmare to maintain due to the large number of files our project had. We were always in fear of raising file conflicts by parallel edits - and my mailbox tells me that this actually happened a few times. And once I had to make a real copy of a complete song because I had to do a transposition and was afraid of messing up the song completely. In fact this last incident - feeling that it is somehow silly and especially dangerous to start having duplicates of files - seems to have finally triggered concrete ideas about moving the project to a shared Git repository.

Reviewing our communication of that time I think it will be a good idea to write a separate post about this because probably my experience was quite typical and the story is something to share to encourage others to take the step too.
But today I will tell you something about the final phase of our edition process.

As I've pointed out earlier one aspect of version control is that it accounts for anything you do by storing *commits*, that you can make this accounting as specific as you need, and finally you know that anything you've done can easily be identified, modified or reverted. And you can separate your work into discrete *branches*.  
All this together is a great relief: You can work without permanently fearing to mess up someone else's work, and you can freely work on several issues at a time without being afraid of losing track of the tasks. You know, our edition contains 26 songs, and proof-reading all of them was only one out of a number of tasks to be completed. Therefore it was very practical to simply have (up to) 26 branches open at any time and adding any work directly to the context of the actual song at hand.

One fundamental issue when modifying a beautified score is the impact this change may have on the layout. In order to make this issue more manageable I decided to enclose each individual correction in its own commit. This would ensure that Janek gets concise reports about what I've done (i.e. where he should look at in particular). Therefore I produced a large number of commits that looked similar to this (real) example fixing a single pitch:

<pre lang="diff">
  e'2. | %34
    \times 2/3 { \slurUp
                 \shape Slur #'((1 . 0.7)(1 . 1.7)(-0.5 . 0)(0 . -0.7))
-                fis8( h fis } \voiceOne dis'4 e) | %35
+                fis8( g fis } \voiceOne dis'4 e) | %35
    \shape Slur #'((0.5 . 1.2)(0.5 . 1)(0 . 0.5)(0 . 0.8))
    \voiceTwo a,4( fis g8) r | %36
</pre>
This way Janek would be able to revert any changes individually or compile - if necessary - scores in the state *before* and *after* any single modification to judge their impact on the engravign. And because in each branch only files from one song were touched everything went completely smoothly, without any any hickups or merge conflicts that caused either of us any headache.

It can't be stressed enough that this text based, versioned approach allowed us to access *the same* files, i.e. that we could both work on the scores simultaneously, or at least without having any kind of *exchange* process which would require precautions not to lose information. For example when Janek processed the proofread score (and took care about our beautification requests) I could still apply some 'hotfixes' on top of his work - everything transparently documented through Git's commit history. I even made use of the possibility to apply fixes by editing the files directly on the server, through an internet browser. I'm not sure if I'm only dreaming, but I could *never* imagine such interlocked cooperation using opaque files from a graphical notation program.

One more thing to note in this context is that I could already apply fixes myself if I noticed that my modification caused a regression. I always knew that Janek would be able to *read* what I've done so I felt way less intrusive than I'd feel modifying a purely graphical score. Through *commenting out* I could even provide him with alternative suggestions without removing his own solutions. After a third (at most) of the mentioned 200 fixes all this became a second nature to us so we could naturally juggle with this and sometimes worked together in near realtime although we live more than 1.300 km apart.

While this already worked incredibly well, maybe the best part of it was that LilyPond itself made a good part of it practically obsolete, so keep reading on...

##### Conclusion

(from the original article, has to be placed at an appropriate place yet).

You may have noticed I'm excited about it ;-) So that's nothing to talk about in a conclusion. But let me tell you about one more thing.

I had been a LilyPond user for quite some time so I was accustomed to text input. But before starting this project I wasn't comfortable with tweaking LilyPond's default output, I hadn't even dared before to change LilyPond's default appearance in my scores. I admit I had - intermittent - experience as a hobby programmer since my teenage years. But I didn't know LaTeX, and I hadn't really heard about version control. So this edition is the project I learned both LaTeX and Git with. This was quite an investment in time, nerves and work, but already with this single project I'd say the investment has paid off a dozen times. What I exposed in this post surely was a set of showcase examples, but you can't deny that working this way is something for your daily life as a document author. "shouldn't affect our workflow at all" - actually it turned our workflow upside down. 

I would say learning to use text based tools and version control changes your life in a similar way and to a similar extent as learning to ride a bicycle. The only difference is that noone would ever question learning to ride “because it's too complicated” ...