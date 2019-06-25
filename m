From: c0d1n61at3 at gmail.com (Jiunn Chang)
Date: Tue, 25 Jun 2019 12:48:02 -0500
Subject: [Linux-kernel-mentees] [SYZBOT REPORT] - WARNING: refcount bug
 in kobject_get
In-Reply-To: <20190624084421.GA2481@kroah.com>
References: <3674099a-c1f2-f9a3-57f4-d4f4b59a126a@linuxfoundation.org>
	<20190618215612.rguyuy6maxt56l4n@rYz3n>
	<72705c91-d753-4c3c-071b-92825d2cd092@linuxfoundation.org>
	<20190619152100.GB29425@kroah.com>
	<45d50c39-38de-d5d3-4c45-9e5a77e224cb@linuxfoundation.org>
	<20190620222242.ux65vxces7ou62o3@rYz3n>
	<20190621064501.GB12643@kroah.com>
	<20190621163439.is2e7i3bwz3jyfrj@rYz3n>
	<20190624081532.ihnrb475dduh77gj@rYz3n>
	<20190624084421.GA2481@kroah.com>
Message-ID: <20190625174801.nbmqafqk5ww7fibv@rYz3n>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Mon, Jun 24, 2019 at 04:44:21PM +0800, Greg KH wrote:
> On Mon, Jun 24, 2019 at 03:15:33AM -0500, Jiunn Chang wrote:
> > At this point, I need more help to attempt a fix.  If you have any suggestions please
> > let me know.
> 
> Sorry, I'm traveling all this week and have not had the chance to look
> at this yet.
> 
> The driver core is "tricky" as you have found out.  I'll dig into this
> when I get the chance, but it might be a few days.
> 
> Note, this call should not be the one that creates the "virtual" kobject
> parent, as that is almost always created before this (I would think.)
> 
> Are you testing this on a laptop or in a virtual machine?  Before you
> run the test script, is /sys/devices/virtual/ present on your system or
> not?

  Hello Greg,

  Happy travels!  Thanks for all the help.  I am testing on a laptop and not a vm.
  I do have /sys/devices/virtual--I thought about that too.

  I will take a closer look at where virtual device is/should being created.

  THX,

  Jiunn

> 
> thanks,
> 
> greg k-h
