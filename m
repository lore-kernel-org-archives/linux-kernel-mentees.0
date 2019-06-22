From: puranjay12@gmail.com (Puranjay Mohan)
Date: Sat, 22 Jun 2019 14:29:39 +0530
Subject: [Linux-kernel-mentees] [PATCH v2 1/3] net: ethernet: atheros: atlx:
	Rename local PCI defines to generic names
In-Reply-To: <20190622085941.24931-1-puranjay12@gmail.com>
References: <20190622085941.24931-1-puranjay12@gmail.com>
Message-ID: <20190622085941.24931-2-puranjay12@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190622085939.7JWpVf58RrmDQejuF9wD9CcmwLnU9D75KpKMjvSnBmo@z>

Rename all local PCI definitons to Generic PCI definitions to make them
compatible with generic definitions present in pci_regs.h

Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
---
 drivers/net/ethernet/atheros/atlx/atl2.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/atheros/atlx/atl2.c b/drivers/net/ethernet/atheros/atlx/atl2.c
index 3a3fb5ce0fee..3b9fa27cc459 100644
--- a/drivers/net/ethernet/atheros/atlx/atl2.c
+++ b/drivers/net/ethernet/atheros/atlx/atl2.c
@@ -2103,13 +2103,13 @@ static s32 atl2_reset_hw(struct atl2_hw *hw)
 	int i;
 
 	/* Workaround for PCI problem when BIOS sets MMRBC incorrectly. */
-	atl2_read_pci_cfg(hw, PCI_REG_COMMAND, &pci_cfg_cmd_word);
+	atl2_read_pci_cfg(hw, PCI_COMMAND, &pci_cfg_cmd_word);
 	if ((pci_cfg_cmd_word &
-		(CMD_IO_SPACE|CMD_MEMORY_SPACE|CMD_BUS_MASTER)) !=
-		(CMD_IO_SPACE|CMD_MEMORY_SPACE|CMD_BUS_MASTER)) {
+		(PCI_COMMAND_IO | PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER)) !=
+		(PCI_COMMAND_IO | PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER)) {
 		pci_cfg_cmd_word |=
-			(CMD_IO_SPACE|CMD_MEMORY_SPACE|CMD_BUS_MASTER);
-		atl2_write_pci_cfg(hw, PCI_REG_COMMAND, &pci_cfg_cmd_word);
+			(PCI_COMMAND_IO | PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER);
+		atl2_write_pci_cfg(hw, PCI_COMMAND, &pci_cfg_cmd_word);
 	}
 
 	/* Clear Interrupt mask to stop board from generating
-- 
2.21.0
