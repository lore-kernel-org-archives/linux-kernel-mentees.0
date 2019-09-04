From: lukas at wunner.de (Lukas Wunner)
Date: Wed, 4 Sep 2019 07:35:23 +0200
Subject: [Linux-kernel-mentees] [PATCH 2/2] PCI: Unify
 pci_dev_is_disconnected() and pci_dev_is_inaccessible()
In-Reply-To: <20190904043633.65026-3-skunberg.kelsey@gmail.com>
References: <20190904043633.65026-1-skunberg.kelsey@gmail.com>
	<20190904043633.65026-3-skunberg.kelsey@gmail.com>
Message-ID: <20190904053523.7lmuoo5zempxtsdq@wunner.de>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Tue, Sep 03, 2019 at 10:36:35PM -0600, Kelsey Skunberg wrote:
> Change pci_dev_is_disconnected() call inside pci_dev_is_inaccessible() to:
> 
> 	pdev->error_state == pci_channel_io_perm_failure
> 
> Change remaining pci_dev_is_disconnected() calls to
> pci_dev_is_inaccessible() calls.

I don't think that's a good idea because it introduces a config space read
(for the vendor ID) in places where we don't want that.  E.g., after the
check of pdev->error_state, a regular config space read may take place and
if that returns all ones, we may already be able to determine that the
device is inaccessible, obviating the need for a vendor ID check.
Config space reads aren't for free.

Thanks,

Lukas
