From: corbet at lwn.net (Jonathan Corbet)
Date: Sun, 23 Jun 2019 18:39:02 -0600
Subject: [Linux-kernel-mentees] [PATCH v2 0/7] Documentation: RCU:
 Convert to
In-Reply-To: <20190623081413.7095-1-c0d1n61at3@gmail.com>
References: <20190622090046.178d9d16@lwn.net>
	<20190623081413.7095-1-c0d1n61at3@gmail.com>
Message-ID: <20190623183902.71196f2a@lwn.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Sun, 23 Jun 2019 03:14:06 -0500
Jiunn Chang <c0d1n61at3 at gmail.com> wrote:

> This patch series is the initial conversion of the RCU documentation
> section.
> 
> [PATCH v2 0/7] Documentation: RCU: Convert the following to ReST
> [PATCH v2 1/7] Documentation: RCU: Convert RCU basic concepts to ReST
> 	- ReST markup and TOC tree hook.
> [PATCH v2 2/7] Documentation: RCU: Rename RCU basic concepts to ReST
> 	- Rename RCU basic concepts txt file to rst.
> [PATCH v2 3/7] Documentation: RCU: Convert RCU linked list to ReST
> 	- ReST markup and TOC tree hook.
> [PATCH v2 4/7] Documentation: RCU: Rename RCU linked list to ReST
> 	- Rename RCU linked list txt file to rst.
> [PATCH v2 5/7] Documentation: RCU: Convert RCU UP systems to ReST
> 	- ReST markup and TOC tree hook.
> [PATCH v2 6/7] Documentation: RCU: Rename RCU UP systems to ReST
> 	- Rename RCU UP systems txt file to rst.
> [PATCH v2 6/7] Documentation: RCU: Add links to rcu.rst
> 	- Add the following links to rcu.rst:
> 		list_rcu
> 		up_rcu

Thanks for working on this, we're getting closer.  That said, I have some
overall comments again:

 - Thanks for including a cover letter, but there should be a bit more
   than a list of patches there.  Put in a paragraph saying what the
   series as a whole is for; if somebody reads the cover letter and
   nothing else, they should know what you're up to.

 - The cover letter should also say what has changed since the previous
   posting.

 - Copying the relevant mailing lists really isn't optional, so I'll ask
   you again to do that.  Most maintainers won't accept patches that have
   not been posted to the appropriate public list(s)

 - Please thread your patches as replies to the cover letter, so they all
   stay together.  "git send-email" will do that nicely for you.

 - You have a couple of Reviewed-by tags from Joel now; be sure to add
   those before the next posting.

 - Thanks for splitting out the renames - do you see how that makes it
   easier to see what has actually changed in the files?  That said, you
   could easily and appropriately do all of the renames in a single
   commit.

Thanks,

jon
