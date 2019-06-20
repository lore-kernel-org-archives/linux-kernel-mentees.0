From: puranjay12 at gmail.com (Puranjay Mohan)
Date: Thu, 20 Jun 2019 23:37:51 +0530
Subject: [Linux-kernel-mentees] [PATCH v2 0/3] net: fddi: skfp: Use PCI
	generic definitions instead of private duplicates
Message-ID: <20190620180754.15413-1-puranjay12@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

This patch series removes the private duplicates of PCI definitions in
favour of generic definitions defined in pci_regs.h.

This driver only uses one of the generic PCI definitons, i.e.
PCI_REVISION_ID, which is included from pci_regs.h and its private
version is removed from skfbi.h with all other private defines.

The skfbi.h defines PCI_REV_ID which is renamed to PCI_REVISION_ID in
drvfbi.c to make it compatible with the generic define in pci_regs.h.

Puranjay Mohan (3):
  net: fddi: skfp: Rename PCI_REV_ID to PCI_REVISION_ID
  net: fddi: skfp: Include generic PCI definitions
  net: fddi: skfp: Remove unused private PCI definitions

 drivers/net/fddi/skfp/drvfbi.c  |   4 +-
 drivers/net/fddi/skfp/h/skfbi.h | 207 +-------------------------------
 2 files changed, 3 insertions(+), 208 deletions(-)

-- 
2.21.0
