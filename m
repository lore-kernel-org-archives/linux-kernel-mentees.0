From: puranjay12@gmail.com (Puranjay Mohan)
Date: Fri, 21 Jun 2019 22:09:21 +0530
Subject: [Linux-kernel-mentees] [PATCH 3/3] net: ethernet: atheros: atlx:
	Remove unused and private PCI definitions
In-Reply-To: <20190621163921.26188-1-puranjay12@gmail.com>
References: <20190621163921.26188-1-puranjay12@gmail.com>
Message-ID: <20190621163921.26188-4-puranjay12@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190621163921.biDOB7rzX6e-_RBQPrnVwFZLIYmnbUS5inFBFXN2sqM@z>

Remove unused private PCI definitions from skfbi.h because generic PCI
symbols are already included from pci_regs.h.

Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
---
 drivers/net/ethernet/atheros/atlx/atl2.h | 2 --
 drivers/net/ethernet/atheros/atlx/atlx.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/atheros/atlx/atl2.h b/drivers/net/ethernet/atheros/atlx/atl2.h
index c53b810a831d..1b25d6d747de 100644
--- a/drivers/net/ethernet/atheros/atlx/atl2.h
+++ b/drivers/net/ethernet/atheros/atlx/atl2.h
@@ -32,7 +32,6 @@
 int ethtool_ioctl(struct ifreq *ifr);
 #endif
 
-#define PCI_COMMAND_REGISTER	PCI_COMMAND
 #define CMD_MEM_WRT_INVALIDATE	PCI_COMMAND_INVALIDATE
 
 #define ATL2_WRITE_REG(a, reg, value) (iowrite32((value), \
@@ -202,7 +201,6 @@ static void atl2_force_ps(struct atl2_hw *hw);
 #define MII_DBG_DATA	0x1E
 
 /* PCI Command Register Bit Definitions */
-#define PCI_COMMAND		0x04
 #define CMD_IO_SPACE		0x0001
 #define CMD_MEMORY_SPACE	0x0002
 #define CMD_BUS_MASTER		0x0004
diff --git a/drivers/net/ethernet/atheros/atlx/atlx.h b/drivers/net/ethernet/atheros/atlx/atlx.h
index 09464cb02ce0..4d355dbc2d01 100644
--- a/drivers/net/ethernet/atheros/atlx/atlx.h
+++ b/drivers/net/ethernet/atheros/atlx/atlx.h
@@ -445,7 +445,6 @@
 #define MII_DBG_DATA			0x1E
 
 /* PCI Command Register Bit Definitions */
-#define PCI_COMMAND			0x04	/* PCI Command Register */
 #define CMD_IO_SPACE			0x0001
 #define CMD_MEMORY_SPACE		0x0002
 #define CMD_BUS_MASTER			0x0004
-- 
2.21.0
