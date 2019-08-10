From: helgaas@kernel.org (Bjorn Helgaas)
Date: Sat, 10 Aug 2019 12:15:25 -0500
Subject: [Linux-kernel-mentees] [PATCH] PCI/IOV: Move sysfs SR-IOV
 functions to iov.c
In-Reply-To: <20190810071719.GA16356@kroah.com>
References: <20190809195721.34237-1-skunberg.kelsey@gmail.com>
	<20190810071719.GA16356@kroah.com>
Message-ID: <20190810171525.GG221706@google.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190810171525.hOuQwbjD-6t-JUzJcrAUKvSHC9XOFABPCSUsZPSAk9A@z>

On Sat, Aug 10, 2019 at 09:17:19AM +0200, Greg KH wrote:
> On Fri, Aug 09, 2019 at 01:57:21PM -0600, Kelsey Skunberg wrote:
> > +static struct device_attribute sriov_totalvfs_attr = __ATTR_RO(sriov_totalvfs);
> 
> DEVICE_ATTR_RO() please.  This is a device attribute, not a "raw"
> kobject attribute.

This patch is just a move; here's the source of the line above:

> > -static struct device_attribute sriov_totalvfs_attr = __ATTR_RO(sriov_totalvfs);

I certainly support using DEVICE_ATTR_RO() instead of __ATTR_RO(), but
that should be down with a separate patch so it's not buried in what
is otherwise a simple move.

> > +static struct device_attribute sriov_numvfs_attr =
> > +		__ATTR(sriov_numvfs, (S_IRUGO | S_IWUSR | S_IWGRP),
> > +		       sriov_numvfs_show, sriov_numvfs_store);
> > +static struct device_attribute sriov_offset_attr = __ATTR_RO(sriov_offset);
> > +static struct device_attribute sriov_stride_attr = __ATTR_RO(sriov_stride);
> > +static struct device_attribute sriov_vf_device_attr =
> > +		__ATTR_RO(sriov_vf_device);
> > +static struct device_attribute sriov_drivers_autoprobe_attr =
> > +		__ATTR(sriov_drivers_autoprobe, (S_IRUGO | S_IWUSR | S_IWGRP),
> > +		       sriov_drivers_autoprobe_show,
> > +		       sriov_drivers_autoprobe_store);
> 
> Same for all of these, they should use DEVICE_ATTR* macros.
> 
> And why the odd permissions on 2 of these files?  Are you sure about
> that?

Same for these.  It'd be nice to fix them (and similar cases in
pci-sysfs.c, rpadlpar_sysfs.c, sgi_hotplug.c, slot.c) but in a
separate patch.

I think Kelsey did the right thing here by not mixing unrelated fixes
in with the code move.  A couple additional patches to change the
__ATTR() uses and the permissions (git grep "\<S_" finds several
possibilities) would be icing on the cake, but getting the SR-IOV
code all together is an improvement by itself.

Bjorn
