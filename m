From: gregkh at linuxfoundation.org (Greg Kroah-Hartman)
Date: Mon, 8 Jul 2019 17:16:05 +0200
Subject: [Linux-kernel-mentees] [PATCH] Documentation: usb: convert
	usb-help to rst
In-Reply-To: <CAD3AR6EN7n5KXnJqW0UdgB_eQjuTedB6KdC8sJ_h+MJNKB6ZmA@mail.gmail.com>
References: <20190705185519.31033-1-tranmanphong@gmail.com>
	<20190708075255.0f337b28@lwn.net>
	<CAD3AR6EN7n5KXnJqW0UdgB_eQjuTedB6KdC8sJ_h+MJNKB6ZmA@mail.gmail.com>
Message-ID: <20190708151605.GA14040@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Mon, Jul 08, 2019 at 10:01:13PM +0700, Phong Tran wrote:
> On Mon, Jul 8, 2019 at 8:52 PM Jonathan Corbet <corbet at lwn.net> wrote:
> >
> > On Sat,  6 Jul 2019 01:55:19 +0700
> > Phong Tran <tranmanphong at gmail.com> wrote:
> >
> > > Add new index.rst and change usb-help.txt format
> > > to rst.
> > >
> > > Signed-off-by: Phong Tran <tranmanphong at gmail.com>
> >
> > Thank you for working to make the kernel's documentation better.  That
> > said, I really don't think there is value in keeping this document.  It
> > hasn't been updated in any useful way in decades, contains broken links,
> > and the links that still work are full of obsolete information.  Honestly,
> > a better patch would, IMO, just delete this file.
> >
> @Jonathan Corbet  it's fine to me.
> 
> Need ack from you @Greg Kroah-Hartman
> if yes, I will send the cleanup patch.

All of the USB documentation needs a refresh and look again at where it
is and what it contains.  After 5.3-rc1 I would recommend doing that (as
that is when all of the recent pending documentation changes will be
merged).

thanks,

greg k-h
