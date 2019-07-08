From: willy@infradead.org (Matthew Wilcox)
Date: Mon, 8 Jul 2019 12:59:06 -0700
Subject: [Linux-kernel-mentees] [PATCH] Doc : fs : move xfs.txt to
 admin-guide
In-Reply-To: <20190705193329.GA20933@localhost>
References: <20190705190412.GB32320@bombadil.infradead.org>
	<20190705193329.GA20933@localhost>
Message-ID: <20190708195906.GH32320@bombadil.infradead.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190708195906.ei1py_RZ3ryES4MDggL2oPHGsPQcRPkLUkbPs-KkCHM@z>

On Fri, Jul 05, 2019 at 08:41:48PM +0100, Sheriff Esseson wrote:
> On Fri, Jul 05, 2019 at 12:04:12PM -0700, Matthew Wilcox wrote:
> > On Fri, Jul 05, 2019 at 02:14:46PM +0100, Sheriff Esseson wrote:
> > > As suggested by Matthew Wilcox, xfs.txt is primarily a guide on available
> > > options when setting up an XFS. This makes it appropriate to be placed under
> > > the admin-guide tree.
> > > 
> > > Thus, move xfs.txt to admin-guide and fix broken references.
> > 
> > What happened to the conversion to xfs.rst?
> 
> Okay, I was thinking placing the file properly should come first before the
> conversion.

But if you move it, then rename it, you have to change all these places
again.  The minimal conversion you did the first time was quite a nice diff
to read.
