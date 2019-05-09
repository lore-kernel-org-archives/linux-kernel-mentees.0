From: helgaas at kernel.org (Bjorn Helgaas)
Date: Thu, 9 May 2019 07:42:42 -0500
Subject: [Linux-kernel-mentees] [PATCH] lspci: Make output for empty
 range behind a bridge consistent
In-Reply-To: <20190509053540.GA29343@asus>
References: <20190508052118.21796-1-skunberg.kelsey@gmail.com>
	<20190508134036.GA220289@google.com> <20190509053540.GA29343@asus>
Message-ID: <20190509124242.GA168700@google.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Wed, May 08, 2019 at 11:35:41PM -0600, Kelsey Skunberg wrote:
> On Wed, May 08, 2019 at 08:40:36AM -0500, Bjorn Helgaas wrote:
> > On Tue, May 07, 2019 at 11:21:18PM -0600, Kelsey Skunberg wrote:

> > > show_range() is only called when verbose (-v). Code checking for
> > > 'not verbose' is not needed.
> > 
> > Nice simplification!  I would split this into a separate patch because
> > it's not logically related to changing the text and it will make both
> > patches easier to read.  Also, it would make it easy for Martin to
> > choose whether he wants to apply one, both, or neither.
> 
> In the event the two patches would cause a merge conflict if both
> applied, is it still proper to submit them both? I can place the
> '!verbose' check back into this patch, though there would still be
> some changes to make it fit the new structure. 

The two patches would constitute a "series".  If applied in order they
should not cause conflicts.  What I would do in this situation is make
the first one do the cleanup because that should be uncontroversial
(if it's correct and causes no user-visible change) and make the
second do the wording change.  Then Martin could easily apply the
first and ignore the second.

> Ah! I was so focused on the leading whitespace I didn't check the trailing!
> I'll keep closer attention to this. Thank you! 

Many editors can highlight whitespace errors for you.  I have the
following in my .vimrc:

  " Show trailing whitespace and spaces before tabs
  hi link localWhitespaceError Error
  au Syntax * syn match localWhitespaceError /\(\zs\%#\|\s\)\+$/ display
  au Syntax * syn match localWhitespaceError / \+\ze\t/ display

But in general you should look through the diff and make sure it
includes only the changes you intend.

Bjorn
