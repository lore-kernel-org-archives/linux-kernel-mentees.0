From: helgaas at kernel.org (Bjorn Helgaas)
Date: Wed, 14 Aug 2019 00:38:46 -0500
Subject: [Linux-kernel-mentees] [PATCH v2 2/3] PCI: sysfs: Change
 permissions from symbolic to octal
In-Reply-To: <20190813204513.4790-3-skunberg.kelsey@gmail.com>
References: <20190809195721.34237-1-skunberg.kelsey@gmail.com>
	<20190813204513.4790-1-skunberg.kelsey@gmail.com>
	<20190813204513.4790-3-skunberg.kelsey@gmail.com>
Message-ID: <20190814053846.GA253360@google.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

[+cc Bodong, Don, Greg for permission question]

On Tue, Aug 13, 2019 at 02:45:12PM -0600, Kelsey Skunberg wrote:
> Symbolic permissions such as "(S_IWUSR | S_IWGRP)" are not
> preferred and octal permissions should be used instead. Change all
> symbolic permissions to octal permissions.
> 
> Example of old:
> 
> "(S_IWUSR | S_IWGRP)"
> 
> Example of new:
> 
> "0220"


>  static DEVICE_ATTR_RO(sriov_totalvfs);
> -static DEVICE_ATTR(sriov_numvfs, (S_IRUGO | S_IWUSR | S_IWGRP),
> -				  sriov_numvfs_show, sriov_numvfs_store);
> +static DEVICE_ATTR(sriov_numvfs, 0664, sriov_numvfs_show, sriov_numvfs_store);
>  static DEVICE_ATTR_RO(sriov_offset);
>  static DEVICE_ATTR_RO(sriov_stride);
>  static DEVICE_ATTR_RO(sriov_vf_device);
> -static DEVICE_ATTR(sriov_drivers_autoprobe, (S_IRUGO | S_IWUSR | S_IWGRP),
> -		   sriov_drivers_autoprobe_show, sriov_drivers_autoprobe_store);
> +static DEVICE_ATTR(sriov_drivers_autoprobe, 0664, sriov_drivers_autoprobe_show,
> +		   sriov_drivers_autoprobe_store);

Greg noticed that sriov_numvfs and sriov_drivers_autoprobe have
"unusual" permissions.  These were added by:

  0e7df22401a3 ("PCI: Add sysfs sriov_drivers_autoprobe to control VF driver binding")
  1789382a72a5 ("PCI: SRIOV control and status via sysfs")

Kelsey's patch correctly preserves the existing permissions, but we
should double-check that they are the permissions they want, and
possibly add a comment about why they're different from the rest.

Bjorn
