From: gregkh@linuxfoundation.org (Greg KH)
Date: Sat, 6 Jul 2019 10:19:26 +0200
Subject: [Linux-kernel-mentees] git: Behaviour of the stable-rc repo
In-Reply-To: <20190706065655.GA10163@arch>
References: <20190706065655.GA10163@arch>
Message-ID: <20190706081926.GA8177@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190706081926.1UfWcCSEsYtIF6Vdnya1K7oUioQ6R3cx3YbdjQE0T_I@z>

On Sat, Jul 06, 2019 at 12:28:07PM +0530, Amol Surati wrote:
> Hi,
> 
> Since yesterday, the stable-rc branch 'linux-5.1.y' has received new
> commits.

The stable-rc tree is a rebased mess of a git tree, don't use it unless
you really understand git :)

> There were 7 code-change-commits + 1 version-change-commit, which were
> based on the released 5.1.16. Now, when the branch has been refreshed
> (twice afaics) with new commits, those 8 previous commits have been assigned
> new identities (still based on 5.1.16).
> 
> It seems that there are 3 copies of those 8 commits.
> For e.g., the version-change-commit has these IDs -
> 
> 57f5b343cdf9593b22d79f5261f30243c07d6515,
> 925bedf91c6bb194cb6b23a553cb8469f3a2007f, and
> 2b5fd394355ac0b2cc9572232727cb2bce7c15a7
> 
> with 2b5... being the most recent ID (and the HEAD iinm).
> 
> Could you help me understand how these copies are created, and why?
> 
> Also, why do we want to commit the version update, if more commits are
> expected to arrive on top of it?

The stable kernel tree patches are kept as a series of patches that will
be applied on top of the previous version, using a tool called quilt.
That set of quilt patches can be found in the stable-queue.git tree on
git.kernel.org.

>From that quilt tree of patches, I generate the stable-rc tree every so
often so that people who only use git, have an easier way to test
things.  The tree is constantly rebased and rebuilt every time I do a
new push to it and a number of autobuilders and testing systems watch it
and send me automated reports when it changes.

So I recommend ONLY using it if you just always rebase, and treat it
like a "point in time" type of tree.

When I do a "real" -rc release, I do an announcement to the stable
mailing list and lkml and push out a compressed patch that you can apply
to the last released kernel, or you can pull from the stable-rc tree
(again rebasing) if that is easier for you to test from.

Does this help?  The stable-rc tree there is present only for those who
don't like dealing with quilt, and I never use it myself, I only
generate it for others who can use it for early testing.

thanks,

greg k-h
