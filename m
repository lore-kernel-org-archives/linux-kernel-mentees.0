From: puranjay12 at gmail.com (Puranjay Mohan)
Date: Fri, 21 Jun 2019 22:09:19 +0530
Subject: [Linux-kernel-mentees] [PATCH 1/3] net: ethernet: atheros: atlx:
	Rename local PCI defines to generic names
In-Reply-To: <20190621163921.26188-1-puranjay12@gmail.com>
References: <20190621163921.26188-1-puranjay12@gmail.com>
Message-ID: <20190621163921.26188-2-puranjay12@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Rename all local PCI definitons to Generic PCI definitions to make them
compatible with generic definitions present in pci_regs.h

Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
---
 drivers/net/ethernet/atheros/atlx/atl2.c | 4 ++--
 drivers/net/ethernet/atheros/atlx/atl2.h | 2 +-
 drivers/net/ethernet/atheros/atlx/atlx.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/atheros/atlx/atl2.c b/drivers/net/ethernet/atheros/atlx/atl2.c
index 3a3fb5ce0fee..478db3fe920a 100644
--- a/drivers/net/ethernet/atheros/atlx/atl2.c
+++ b/drivers/net/ethernet/atheros/atlx/atl2.c
@@ -2103,13 +2103,13 @@ static s32 atl2_reset_hw(struct atl2_hw *hw)
 	int i;
 
 	/* Workaround for PCI problem when BIOS sets MMRBC incorrectly. */
-	atl2_read_pci_cfg(hw, PCI_REG_COMMAND, &pci_cfg_cmd_word);
+	atl2_read_pci_cfg(hw, PCI_COMMAND, &pci_cfg_cmd_word);
 	if ((pci_cfg_cmd_word &
 		(CMD_IO_SPACE|CMD_MEMORY_SPACE|CMD_BUS_MASTER)) !=
 		(CMD_IO_SPACE|CMD_MEMORY_SPACE|CMD_BUS_MASTER)) {
 		pci_cfg_cmd_word |=
 			(CMD_IO_SPACE|CMD_MEMORY_SPACE|CMD_BUS_MASTER);
-		atl2_write_pci_cfg(hw, PCI_REG_COMMAND, &pci_cfg_cmd_word);
+		atl2_write_pci_cfg(hw, PCI_COMMAND, &pci_cfg_cmd_word);
 	}
 
 	/* Clear Interrupt mask to stop board from generating
diff --git a/drivers/net/ethernet/atheros/atlx/atl2.h b/drivers/net/ethernet/atheros/atlx/atl2.h
index d97613bd15d5..c53b810a831d 100644
--- a/drivers/net/ethernet/atheros/atlx/atl2.h
+++ b/drivers/net/ethernet/atheros/atlx/atl2.h
@@ -202,7 +202,7 @@ static void atl2_force_ps(struct atl2_hw *hw);
 #define MII_DBG_DATA	0x1E
 
 /* PCI Command Register Bit Definitions */
-#define PCI_REG_COMMAND		0x04
+#define PCI_COMMAND		0x04
 #define CMD_IO_SPACE		0x0001
 #define CMD_MEMORY_SPACE	0x0002
 #define CMD_BUS_MASTER		0x0004
diff --git a/drivers/net/ethernet/atheros/atlx/atlx.h b/drivers/net/ethernet/atheros/atlx/atlx.h
index 7f5d4e24eb9f..09464cb02ce0 100644
--- a/drivers/net/ethernet/atheros/atlx/atlx.h
+++ b/drivers/net/ethernet/atheros/atlx/atlx.h
@@ -445,7 +445,7 @@
 #define MII_DBG_DATA			0x1E
 
 /* PCI Command Register Bit Definitions */
-#define PCI_REG_COMMAND			0x04	/* PCI Command Register */
+#define PCI_COMMAND			0x04	/* PCI Command Register */
 #define CMD_IO_SPACE			0x0001
 #define CMD_MEMORY_SPACE		0x0002
 #define CMD_BUS_MASTER			0x0004
-- 
2.21.0
