From: puranjay12 at gmail.com (Puranjay Mohan)
Date: Sat, 22 Jun 2019 14:29:41 +0530
Subject: [Linux-kernel-mentees] [PATCH v2 3/3] net: ethernet: atheros: atlx:
	Remove unused and private PCI definitions
In-Reply-To: <20190622085941.24931-1-puranjay12@gmail.com>
References: <20190622085941.24931-1-puranjay12@gmail.com>
Message-ID: <20190622085941.24931-4-puranjay12@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Remove unused private PCI definitions from local headers,
because generic PCI symbols are already included from pci_regs.h.

Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
---
 drivers/net/ethernet/atheros/atlx/atl2.h | 7 -------
 drivers/net/ethernet/atheros/atlx/atlx.h | 5 -----
 2 files changed, 12 deletions(-)

diff --git a/drivers/net/ethernet/atheros/atlx/atl2.h b/drivers/net/ethernet/atheros/atlx/atl2.h
index d97613bd15d5..9b5807efc734 100644
--- a/drivers/net/ethernet/atheros/atlx/atl2.h
+++ b/drivers/net/ethernet/atheros/atlx/atl2.h
@@ -32,8 +32,6 @@
 int ethtool_ioctl(struct ifreq *ifr);
 #endif
 
-#define PCI_COMMAND_REGISTER	PCI_COMMAND
-#define CMD_MEM_WRT_INVALIDATE	PCI_COMMAND_INVALIDATE
 
 #define ATL2_WRITE_REG(a, reg, value) (iowrite32((value), \
 	((a)->hw_addr + (reg))))
@@ -201,11 +199,6 @@ static void atl2_force_ps(struct atl2_hw *hw);
 #define MII_DBG_ADDR	0x1D
 #define MII_DBG_DATA	0x1E
 
-/* PCI Command Register Bit Definitions */
-#define PCI_REG_COMMAND		0x04
-#define CMD_IO_SPACE		0x0001
-#define CMD_MEMORY_SPACE	0x0002
-#define CMD_BUS_MASTER		0x0004
 
 #define MEDIA_TYPE_100M_FULL	1
 #define MEDIA_TYPE_100M_HALF	2
diff --git a/drivers/net/ethernet/atheros/atlx/atlx.h b/drivers/net/ethernet/atheros/atlx/atlx.h
index 7f5d4e24eb9f..9647ec8be994 100644
--- a/drivers/net/ethernet/atheros/atlx/atlx.h
+++ b/drivers/net/ethernet/atheros/atlx/atlx.h
@@ -444,11 +444,6 @@
 #define MII_DBG_ADDR			0x1D
 #define MII_DBG_DATA			0x1E
 
-/* PCI Command Register Bit Definitions */
-#define PCI_REG_COMMAND			0x04	/* PCI Command Register */
-#define CMD_IO_SPACE			0x0001
-#define CMD_MEMORY_SPACE		0x0002
-#define CMD_BUS_MASTER			0x0004
 
 /* Wake Up Filter Control */
 #define ATLX_WUFC_LNKC	0x00000001	/* Link Status Change Wakeup Enable */
-- 
2.21.0
