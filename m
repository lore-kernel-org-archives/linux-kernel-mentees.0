From: puranjay12 at gmail.com (Puranjay Mohan)
Date: Fri, 21 Jun 2019 21:10:34 +0530
Subject: [Linux-kernel-mentees] [PATCH v5 0/3] net: fddi: skfp: Use PCI
	generic definitions instead of private duplicates
Message-ID: <20190621154037.25245-1-puranjay12@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

This patch series removes the private duplicates of PCI definitions in
favour of generic definitions defined in pci_regs.h.

This driver only uses some of the generic PCI definitons,
which are included from pci_regs.h and thier private versions
are removed from skfbi.h with all other private defines.

The skfbi.h defines PCI_REV_ID and other private defines with different
names, these are renamed to Generic PCI names to make them
compatible with defines in pci_regs.h.

All unused defines are removed from skfbi.h.

Changes in v5:
Removed unused PCI definitions which were left in v4

Changes in v4:
Removed unused PCI definitions which were left in v3

Changes in v3:
Renamed all local PCI definitions to Generic names.
Corrected coding style mistakes.

Changes in v2:
Converted individual patches to a series.
Made sure that individual patches build correctly

Puranjay Mohan (3):
  net: fddi: skfp: Rename local PCI defines to match generic PCI defines
  net: fddi: skfp: Include generic PCI definitions
  net: fddi: skfp: Remove unused private PCI definitions

 drivers/net/fddi/skfp/drvfbi.c  |   3 +-
 drivers/net/fddi/skfp/h/skfbi.h | 231 +-------------------------------
 2 files changed, 6 insertions(+), 228 deletions(-)

-- 
2.21.0
