From: puranjay12 at gmail.com (Puranjay Mohan)
Date: Sat, 22 Jun 2019 14:29:38 +0530
Subject: [Linux-kernel-mentees] [PATCH v2 0/3] net: ethernet: atheros: atlx:
	Use PCI generic definitions instead of private duplicates
Message-ID: <20190622085941.24931-1-puranjay12@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

This patch series removes the private duplicates of PCI definitions in
favour of generic definitions defined in pci_regs.h.

Changes in v2:
Removed local PCI definitions of PCI_COMMAND_IO, PCI_COMMAND_MASTER,
etc. which were left in v1.

Puranjay Mohan (3):
  net: ethernet: atheros: atlx: Rename local PCI defines to generic
    names
  net: ethernet: atheros: atlx: Include generic PCI definitions
  net: ethernet: atheros: atlx: Remove unused and private PCI
    definitions

 drivers/net/ethernet/atheros/atlx/atl2.c | 11 ++++++-----
 drivers/net/ethernet/atheros/atlx/atl2.h |  7 -------
 drivers/net/ethernet/atheros/atlx/atlx.h |  5 -----
 3 files changed, 6 insertions(+), 17 deletions(-)

-- 
2.21.0
