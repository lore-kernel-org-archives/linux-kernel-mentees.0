From: greg at kroah.com (Greg KH)
Date: Sat, 10 Aug 2019 09:17:19 +0200
Subject: [Linux-kernel-mentees] [PATCH] PCI/IOV: Move sysfs SR-IOV
 functions to iov.c
In-Reply-To: <20190809195721.34237-1-skunberg.kelsey@gmail.com>
References: <20190809195721.34237-1-skunberg.kelsey@gmail.com>
Message-ID: <20190810071719.GA16356@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Fri, Aug 09, 2019 at 01:57:21PM -0600, Kelsey Skunberg wrote:
> +static struct device_attribute sriov_totalvfs_attr = __ATTR_RO(sriov_totalvfs);

DEVICE_ATTR_RO() please.  This is a device attribute, not a "raw"
kobject attribute.

> +static struct device_attribute sriov_numvfs_attr =
> +		__ATTR(sriov_numvfs, (S_IRUGO | S_IWUSR | S_IWGRP),
> +		       sriov_numvfs_show, sriov_numvfs_store);
> +static struct device_attribute sriov_offset_attr = __ATTR_RO(sriov_offset);
> +static struct device_attribute sriov_stride_attr = __ATTR_RO(sriov_stride);
> +static struct device_attribute sriov_vf_device_attr =
> +		__ATTR_RO(sriov_vf_device);
> +static struct device_attribute sriov_drivers_autoprobe_attr =
> +		__ATTR(sriov_drivers_autoprobe, (S_IRUGO | S_IWUSR | S_IWGRP),
> +		       sriov_drivers_autoprobe_show,
> +		       sriov_drivers_autoprobe_store);

Same for all of these, they should use DEVICE_ATTR* macros.

And why the odd permissions on 2 of these files?  Are you sure about
that?

thanks,

greg k-h
