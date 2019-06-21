From: puranjay12 at gmail.com (Puranjay Mohan)
Date: Fri, 21 Jun 2019 22:09:18 +0530
Subject: [Linux-kernel-mentees] [PATCH 0/3] net: ethernet: atheros: atlx:
	Use PCI generic definitions instead of private duplicates
Message-ID: <20190621163921.26188-1-puranjay12@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

This patch series removes the private duplicates of PCI definitions in
favour of generic definitions defined in pci_regs.h.

Puranjay Mohan (3):
  net: ethernet: atheros: atlx: Rename local PCI defines to generic
    names
  net: ethernet: atheros: atlx: Include generic PCI definitions
  net: ethernet: atheros: atlx: Remove unused and private PCI
    definitions

 drivers/net/ethernet/atheros/atlx/atl2.c | 5 +++--
 drivers/net/ethernet/atheros/atlx/atl2.h | 2 --
 drivers/net/ethernet/atheros/atlx/atlx.h | 1 -
 3 files changed, 3 insertions(+), 5 deletions(-)

-- 
2.21.0
