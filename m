From: sheriffesseson at gmail.com (Sheriff Esseson)
Date: Sat, 13 Jul 2019 09:32:12 +0100
Subject: [Linux-kernel-mentees] git: Behaviour of the stable-rc repo
In-Reply-To: <20190706094126.GB15480@kroah.com>
References: <20190706065655.GA10163@arch> <20190706081926.GA8177@kroah.com>
	<20190706091957.GA15828@arch> <20190706094126.GB15480@kroah.com>
Message-ID: <20190713083212.GA19807@localhost>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Sat, Jul 06, 2019 at 11:41:26AM +0200, Greg KH wrote:
> On Sat, Jul 06, 2019 at 02:49:57PM +0530, Amol Surati wrote:
> > On Sat, Jul 06, 2019 at 10:19:26AM +0200, Greg KH wrote:
> > > On Sat, Jul 06, 2019 at 12:28:07PM +0530, Amol Surati wrote:
> > > > Hi,
> > > > 
> > > > Since yesterday, the stable-rc branch 'linux-5.1.y' has received new
> > > > commits.
> > > 
> > > The stable-rc tree is a rebased mess of a git tree, don't use it unless
> > > you really understand git :)
> > 
> > I don't understand git to that extent :)
> 
> Hey, you can now learn :)
> 
> > > > There were 7 code-change-commits + 1 version-change-commit, which were
> > > > based on the released 5.1.16. Now, when the branch has been refreshed
> > > > (twice afaics) with new commits, those 8 previous commits have been assigned
> > > > new identities (still based on 5.1.16).
> > > > 
> > > > It seems that there are 3 copies of those 8 commits.
> > > > For e.g., the version-change-commit has these IDs -
> > > > 
> > > > 57f5b343cdf9593b22d79f5261f30243c07d6515,
> > > > 925bedf91c6bb194cb6b23a553cb8469f3a2007f, and
> > > > 2b5fd394355ac0b2cc9572232727cb2bce7c15a7
> > > > 
> > > > with 2b5... being the most recent ID (and the HEAD iinm).
> > > > 
> > > > Could you help me understand how these copies are created, and why?
> > > > 
> > > > Also, why do we want to commit the version update, if more commits are
> > > > expected to arrive on top of it?
> > > 
> > > The stable kernel tree patches are kept as a series of patches that will
> > > be applied on top of the previous version, using a tool called quilt.
> > > That set of quilt patches can be found in the stable-queue.git tree on
> > > git.kernel.org.
> > 
> > Okay.
> > 
> > > 
> > > From that quilt tree of patches, I generate the stable-rc tree every so
> > > often so that people who only use git, have an easier way to test
> > > things.  The tree is constantly rebased and rebuilt every time I do a
> > > new push to it and a number of autobuilders and testing systems watch it
> > > and send me automated reports when it changes.
> > 
> > Okay. Some of them would be those on kernelci.org, who use 'git describe'
> > to identify the point-in-time when reporting their results.
> 
> Yes, kernelci uses this as does others.
> 
> > > So I recommend ONLY using it if you just always rebase, and treat it
> > > like a "point in time" type of tree.
> > > 
> > > When I do a "real" -rc release, I do an announcement to the stable
> > > mailing list and lkml and push out a compressed patch that you can apply
> > > to the last released kernel, or you can pull from the stable-rc tree
> > > (again rebasing) if that is easier for you to test from.
> > 
> > Okay. Understood. The stable-rc tree that I tested yesterday was a
> > shallow (depth 1) clone. I am assuming that rebasing would't work on
> > it, owing to lack of necessary information.
> 
> A shallow clone of a kernel tree isn't good, you can't do much with that
> for a "real" git tree.
> 
> I recommend cloning Linus's tree once, and then add the linux-stable
> tree as a remote and pulling from that, and then taking that local tree
> and just using it as a base to create other local trees from for
> anything else.
> 
> That way you have one "real" copy of upstream, which you took the time
> to suck down once, and then any additions you make on top of that is
> always much simpler and faster.  If you use the '-s' option to git when
> cloning the trees, you will not take up additional disk space for the
> .git objects.
> 
> As an example, here's how I do my work.  It's a bit more complex than
> what you probably want to do, but you can get the idea here.
> 
> I have one "root" git tree, that is a "bare" repo:
> 	linux/work/torvalds/
> that I cloned from git.kernel.org with the --bare option.
> I run 'git fetch origin' on it every once in a while to keep it up to
> date.
> 
> I have a "local" tree that I do my work in and run my machine's kernel
> off of, it was created by doing:
> 	cd linux
> 	git clone -s linux/work/torvalds/ gregkh
> and in linux/gregkh/ I have local branches and other stuff that I use
> for upstream development and messing around with.  When I want to update
> it to the latest tree from Linus's tree, I just do a 'git pull' in my
> linux/gregkh/ directory and all is good.
> 
> For stable kernel work, I have a "real" tree that was based off of the
> torvalds tree, but added the upstream stable repo from.  It was created
> by doing:
> 	cd linux
> 	mkdir stable
> 	git clone -s linux/work/torvalds/ stable/linux-stable
> 	cd stable/linux-stable
> 	git remote add stable [FULL linux-stable.git URL HERE]
> 	git fetch --all
> 
> Then, for individual specific release branches of the linux-stable tree,
> I create local copies of that tree.  For example, to create the
> linux-4.19.y tree, I would do:
> 	cd linux/stable
> 	git clone -s linux-stable linux-4.19.y
> 	cd linux-4.19.y
> 	git checkout -t -b linux-4.19.y origin/linux-4.19.y
> 
> There, I have 3 different "full" source trees on my system now, but the
> majority of the git objects all live in linux/work/torvalds/ and after
> that, I only have to update tiny amounts.
> 
> > LKMP describes both methods (stable-rc, and the compressed patch), but
> > they need us to /wait/ for your email before attempting a test.
> 
> What is "LKMP"?
> 
> And yes, you can wait for my email to do "real" testing, as that is when
> I am asking others to test.  If you want to do testing before then,
> that's wonderful, but you have to be able to handle the git tree
> rebasing.
> 
> You can do this, by always doing a 'git pull --rebase' on the
> linux-stable-rc tree, but if you do that, you will loose any changes you
> might have had there, so don't do this on a tree you actually create
> patches on.
> 
> > The presence of '5.1.17-rc1' commit threw me off the track :) - I see
> > now that it is not an actual -rc1 release.
> 
> Yes, my scripts just automatically add that to make it obvious that the
> testing kernel is not the previous release.
> 
> hope this helps,
> 
> greg k-h

Please, does a "git pull" in "linux/gregkh" merges the FETCH_HEAD of
"linux/work/torvalds" (You do only "git fetch origin" here).
