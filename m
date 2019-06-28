From: mchehab at kernel.org (Mauro Carvalho Chehab)
Date: Fri, 28 Jun 2019 06:30:50 -0300
Subject: [Linux-kernel-mentees] Patch guidelines and tips
In-Reply-To: <20190628083915.GA3682@localhost>
References: <6aa42000-1957-b0cf-ae6d-18e89d304892@linuxfoundation.org>
	<20190627064833.3e41d60a@coco.lan>
	<20190628083915.GA3682@localhost>
Message-ID: <20190628063050.2cbf6bbc@coco.lan>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Hi Sheriff,

Em Fri, 28 Jun 2019 09:39:15 +0100
Sheriff Esseson <sheriffesseson at gmail.com> escreveu:

> On Thu, Jun 27, 2019 at 06:48:33AM -0300, Mauro Carvalho Chehab wrote:
> > Em Wed, 26 Jun 2019 18:38:31 -0600
> > Shuah Khan <skhan at linuxfoundation.org> escreveu:
> >   
> > > Mentees,
> > > 
> > > Thanks for your active participation in working towards the
> > > required contributions. A few tips and guidelines to make
> > > this experience productive for us all.
> > > 
> > > - Before you start working on a task, please check the archive
> > >    first to see if a patch is already in progress. This avoids
> > >    duplicated efforts.
> > > 
> > >   https://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/
> > > 
> > > - For documentation tasks, start small with picking one file for
> > >    conversion first. You don't have to work on all the files in a
> > >    directory in one step. Working on a single file helps you get
> > >    over the learning curve and then you can take on larger set of
> > >    files as needed.
> > > 
> > >    If in doubt, send email to maintainers - starting with me if you
> > >    prefer.  
> > 
> > Please feel free to send e-mail to me with regards to documentation
> > tasks. I'm open to help with that.
> > 
> > Also, I have a big series of documentation patches under discussion
> > for the merge process. So, better to check with me before trying to
> > work on something that was already done.
> >   
> > > 
> > > These steps are all documented on the project page. Don't forget to
> > > do the following when you send patches:
> > > 
> > > - Please copy mailing lists and maintainers/developers suggested by
> > >    scripts/get_maintainer.pl
> > > 
> > > - Please run scripts/checkpatch.pl before sending the patch.
> > > 
> > > - Compile and test - Documentation compile steps have been documented.
> > > 

 > https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees  
> 
> Please is the filesystem docs available or taken?

I don't know anyone doing doc patches for filesystem, but each
filesystem has its own maintainer. For example (getting a random fs text
file): 

	$ ./scripts/get_maintainer.pl -f Documentation/filesystems/squashfs.txt
	Phillip Lougher <phillip at squashfs.org.uk> (maintainer:SQUASHFS FILE SYSTEM)
	Jonathan Corbet <corbet at lwn.net> (maintainer:DOCUMENTATION)
	linux-doc at vger.kernel.org (open list:DOCUMENTATION)
	linux-kernel at vger.kernel.org (open list)

Please notice that the best is to try preserving the original style of
the document as much as possible, avoiding adding unneeded markups.

We also avoid using all-uppercase titles for sections.

On this particular example, what I would do for the conversion would
be to mark the document title with:

	
=======================
Squashfs 4.0 Filesystem
=======================

...

Mailing list: squashfs-devel at lists.sourceforge.net

Web site: www.squashfs.org


1. Filesystem features
======================

doing the same title markup change for the other level 1 titles,
and use the table markups.

After doing the changes, don't forget to look at the resulting html output,
and do puntual changes, if required.

A good conversion is the one where:
	- avoids useless changes;
	- the file keeps easy to read as text file;
	- the html and pdf output looks nice.

Thanks,
Mauro
