From: hch at infradead.org (Christoph Hellwig)
Date: Sun, 23 Jun 2019 23:45:45 -0700
Subject: [Linux-kernel-mentees] [PATCH v2 1/3] net: fddi: skfp: Rename
 PCI_REV_ID to PCI_REVISION_ID
In-Reply-To: <20190620180754.15413-2-puranjay12@gmail.com>
References: <20190620180754.15413-1-puranjay12@gmail.com>
	<20190620180754.15413-2-puranjay12@gmail.com>
Message-ID: <20190624064545.GA23977@infradead.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Thu, Jun 20, 2019 at 11:37:52PM +0530, Puranjay Mohan wrote:
> Rename the PCI_REV_ID define to PCI_REVISION_ID in skfbi.h
> and drvfbi.c to make it compatible with the pci_regs.h
> which defines it as PCI_REVISION_ID.

We already cache the revision in struct pci_dev.  In doubt you should
use that one.
