From: sheriffesseson@gmail.com (Sheriff Esseson)
Date: Tue, 9 Jul 2019 21:29:15 +0100
Subject: [Linux-kernel-mentees] [linux-kernel-mentees] [PATCH v6] Doc :
 fs : convert xfs.txt to ReST
In-Reply-To: <20190709184559.GL32320@bombadil.infradead.org>
References: <20190709124859.GA21503@localhost>
	<20190709184559.GL32320@bombadil.infradead.org>
Message-ID: <20190709202915.GC28905@localhost>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190709202915.TlI1tvZiebf4lPsXpsERk6ONystH_lONpp54KCf7vEM@z>

On Tue, Jul 09, 2019 at 11:45:59AM -0700, Matthew Wilcox wrote:
> On Tue, Jul 09, 2019 at 01:48:59PM +0100, Sheriff Esseson wrote:
> > Convert xfs.txt to ReST, rename and fix broken references, consequently.
> > 
> > Signed-off-by: Sheriff Esseson <sheriffesseson at gmail.com>
> > ---
> > 
> > Changes in v6:
> > 	- undo text reflow from v5.
> > 	- fix a typo.
> > 	- change indication of defaults , as suggested by Darrick J. Wong, to
> > 	  keep the read simple.
> > 	- change delimiter of boolean option from a newline to an "or" (clue
> > 	  from something like "<option> and <another option>" in the text)
> > 	  because the former does not render well in html.
> > 
> >  Documentation/filesystems/dax.txt             |   2 +-
> >  Documentation/filesystems/index.rst           |   1 +
> >  .../filesystems/{xfs.txt => xfs.rst}          | 123 +++++++++---------
> >  MAINTAINERS                                   |   2 +-
> >  4 files changed, 61 insertions(+), 67 deletions(-)
> >  rename Documentation/filesystems/{xfs.txt => xfs.rst} (81%)
> 
> Documentation/{filesystem/xfs.txt => admin-guide/xfs.rst}.
> 
> > -	If "largeio" specified, a filesystem that was created with a
> > -	"swidth" specified will return the "swidth" value (in bytes)
> > -	in st_blksize. If the filesystem does not have a "swidth"
> > -	specified but does specify an "allocsize" then "allocsize"
> > +	If ``largeio`` specified, a filesystem that was created with a
> 
> surely 'If ``largeio`` is specified' here?

Oops!!! Thanks.
> 
> > +	``swidth`` specified will return the ``swidth`` value (in bytes)
> > +	in ``st_blksize``. If the filesystem does not have a ``swidth``
> > +	specified but does specify an ``allocsize`` then ``allocsize``
> >  	(in bytes) will be returned instead. Otherwise the behaviour
