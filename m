From: puranjay12@gmail.com (Puranjay Mohan)
Date: Fri, 21 Jun 2019 15:16:04 +0530
Subject: [Linux-kernel-mentees] [PATCH v3 0/3] net: fddi: skfp: Use PCI
	generic definitions instead of private duplicates
Message-ID: <20190621094607.15011-1-puranjay12@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190621094604.usMTY_C-wAyi3wPrD-tLwXbllKK_cTbJNP_XnTEjegY@z>

This patch series removes the private duplicates of PCI definitions in
favour of generic definitions defined in pci_regs.h.

This driver only uses some of the generic PCI definitons,
which are included from pci_regs.h and thier private versions
are removed from skfbi.h with all other private defines.

The skfbi.h defines PCI_REV_ID and other private defines with different
names, these are renamed to Generic PCI names to make them
compatible with defines in pci_regs.h.

All unused defines are removed from skfbi.h.

Puranjay Mohan (3):
  net: fddi: skfp: Rename local PCI defines to match generic PCI defines
  net: fddi: skfp: Include generic PCI definitions
  net: fddi: skfp: Remove unused private PCI definitions

 drivers/net/fddi/skfp/drvfbi.c  |  3 +-
 drivers/net/fddi/skfp/h/skfbi.h | 80 +--------------------------------
 2 files changed, 4 insertions(+), 79 deletions(-)

-- 
2.21.0
