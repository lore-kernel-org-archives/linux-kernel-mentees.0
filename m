From: gregkh@linuxfoundation.org (Greg KH)
Date: Thu, 15 Aug 2019 18:08:21 +0200
Subject: [Linux-kernel-mentees] [PATCH v3 0/4] PCI: Clean up pci-sysfs.c
In-Reply-To: <20190815153352.86143-1-skunberg.kelsey@gmail.com>
References: <20190813204513.4790-1-skunberg.kelsey@gmail.com>
	<20190815153352.86143-1-skunberg.kelsey@gmail.com>
Message-ID: <20190815160821.GA12911@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190815160821.9byujvbBGmrwy6oZN6vh0rpjMLlKljt7z39JgdvnShI@z>

On Thu, Aug 15, 2019 at 09:33:49AM -0600, Kelsey Skunberg wrote:
> This series is designed to clean up device attributes and permissions in
> pci-sysfs.c. Then move the sysfs SR-IOV functions from pci-sysfs.c to
> iov.c for better organization.
> 
> Patch 1: Define device attributes with DEVICE_ATTR* instead of __ATTR*.
> 
> Patch 2: Change permissions from symbolic to the preferred octal.
> 
> Patch 3: Change DEVICE_ATTR() with 0220 permissions to DEVICE_ATTR_WO().
> 
> Patch 4: Move sysfs SR-IOV functions to iov.c to keep the feature's code
> together.

Reviewed-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
