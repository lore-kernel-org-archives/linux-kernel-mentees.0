From: darrick.wong@oracle.com (Darrick J. Wong)
Date: Tue, 2 Jul 2019 08:15:45 -0700
Subject: [Linux-kernel-mentees] [linux-kernel-mentees] [PATCH v5] Doc :
 fs : convert xfs.txt to ReST
In-Reply-To: <20190702150452.GD1729@bombadil.infradead.org>
References: <20190702123040.GA30111@localhost>
	<20190702150452.GD1729@bombadil.infradead.org>
Message-ID: <20190702151545.GO1404256@magnolia>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190702151545.d3qXi9_lPOX7qT5W8b_0xHpMthEwH54QxszYfkBHxO8@z>

On Tue, Jul 02, 2019 at 08:04:52AM -0700, Matthew Wilcox wrote:
> On Tue, Jul 02, 2019 at 01:30:40PM +0100, Sheriff Esseson wrote:
> > +When mounting an XFS filesystem, the following options are accepted.  For
> > +boolean mount options, the names with the "(*)" prefix is the default behaviour.
> > +For example, take a behaviour enabled by default to be a one (1) or, a zero (0)
> > +otherwise, ``(*)[no]default`` would be 0 while ``[no](*)default`` , a 1.
> > -When mounting an XFS filesystem, the following options are accepted.
> > -For boolean mount options, the names with the (*) suffix is the
> > -default behaviour.
> 
> You seem to have reflowed all the text.  That means git no longer notices
> it's a rename, and quite frankly the shorter lines that were in use were
> better.

Agreed.  Please don't reflow text in a format conversion patch, it makes
it very difficult to figure out which changes were to accomodate rst.

If you want to reflow text (because of line length etc.) please do it as
a second patch.  I'd rather break the 80 column rule for a single commit
if it makes reviewing easy on the eyes.

> This is not an improvement; please undo it in the next version
> (which you should not post for several days to accumulate more feedback).

Seconded.  Thank you for sending v5 as a separate patch, though. :)

--D
