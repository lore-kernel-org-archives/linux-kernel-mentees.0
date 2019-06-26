From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Tue, 25 Jun 2019 23:01:12 -0500
Subject: [Linux-kernel-mentees] [SYZBOT REPORT] - WARNING: refcount bug
 in kobject_get
In-Reply-To: <20190625174801.nbmqafqk5ww7fibv@rYz3n>
References: <20190618215612.rguyuy6maxt56l4n@rYz3n>
	<72705c91-d753-4c3c-071b-92825d2cd092@linuxfoundation.org>
	<20190619152100.GB29425@kroah.com>
	<45d50c39-38de-d5d3-4c45-9e5a77e224cb@linuxfoundation.org>
	<20190620222242.ux65vxces7ou62o3@rYz3n>
	<20190621064501.GB12643@kroah.com>
	<20190621163439.is2e7i3bwz3jyfrj@rYz3n>
	<20190624081532.ihnrb475dduh77gj@rYz3n>
	<20190624084421.GA2481@kroah.com>
	<20190625174801.nbmqafqk5ww7fibv@rYz3n>
Message-ID: <20190626040111.pwkesr2vdmdpgxoi@rYz3n>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190626040112.pT83DH0MVkoFQ0f38OSbSCZBhHGCaQtxQSxdJiJASeE@z>

On Tue, Jun 25, 2019 at 12:48:02PM -0500, Jiunn Chang wrote:
> On Mon, Jun 24, 2019 at 04:44:21PM +0800, Greg KH wrote:
> > On Mon, Jun 24, 2019 at 03:15:33AM -0500, Jiunn Chang wrote:
> > > At this point, I need more help to attempt a fix.  If you have any suggestions please
> > > let me know.
> > 
> > Sorry, I'm traveling all this week and have not had the chance to look
> > at this yet.
> > 
> > The driver core is "tricky" as you have found out.  I'll dig into this
> > when I get the chance, but it might be a few days.
> > 
> > Note, this call should not be the one that creates the "virtual" kobject
> > parent, as that is almost always created before this (I would think.)
> > 
> > Are you testing this on a laptop or in a virtual machine?  Before you
> > run the test script, is /sys/devices/virtual/ present on your system or
> > not?
> 
>   Hello Greg,
> 
>   Happy travels!  Thanks for all the help.  I am testing on a laptop and not a vm.
>   I do have /sys/devices/virtual--I thought about that too.
> 
>   I will take a closer look at where virtual device is/should being created.
> 
>   THX,
> 
>   Jiunn

  Hello Greg,

  I need to clarify my testing setup.  I misunderstood you when I read "laptop".
  I am testing on a laptop, but I am running the syz program on a QEMU Debian
  instance.  The QEMU Debian instance does have /sys/devices/virtual.

  I took a look, as you suggested, at where the virtual device parent is being
  created.  My intuition tells me that the parent should get initialized right
  after device_initialize() is called in hci_init_sysfs().  I do not think the
  driver core should be altered since this will impact other subsystems.  I
  noticed that virtual_device_parent() is not globally defined as device_initialize()
  seems to be.  Not sure if this is the right solution or not.

  One strange thing I did notice is the way virtual_device_parent() is defined.  It
  is being passed a device pointer but it does not appear to do anything with
  it.  It just creates a virtual_dir with a call to kobject_create_and_add().

  Let me know what you think when you have time.

  Thanks Greg.

  Jiunn

> 
> > 
> > thanks,
> > 
> > greg k-h
