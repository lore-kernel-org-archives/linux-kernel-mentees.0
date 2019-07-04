From: puranjay12 at gmail.com (Puranjay Mohan)
Date: Thu,  4 Jul 2019 23:21:05 +0530
Subject: [Linux-kernel-mentees] [PATCH] net: ethernet: intel: e1000: Remove
	unused PCI-Ex defines
Message-ID: <20190704175105.16084-1-puranjay12@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Remove the unused PCI-Ex define from e1000_hw.h.

Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
---
 drivers/net/ethernet/intel/e1000/e1000_hw.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/ethernet/intel/e1000/e1000_hw.h b/drivers/net/ethernet/intel/e1000/e1000_hw.h
index b57a04954ccf..1bc8bd792640 100644
--- a/drivers/net/ethernet/intel/e1000/e1000_hw.h
+++ b/drivers/net/ethernet/intel/e1000/e1000_hw.h
@@ -2178,10 +2178,6 @@ struct e1000_host_command_info {
 #define E1000_FACTPS_LAN_FUNC_SEL                   0x40000000
 #define E1000_FACTPS_PM_STATE_CHANGED               0x80000000
 
-/* PCI-Ex Config Space */
-#define PCI_EX_LINK_STATUS           0x12
-#define PCI_EX_LINK_WIDTH_MASK       0x3F0
-#define PCI_EX_LINK_WIDTH_SHIFT      4
 
 /* EEPROM Commands - Microwire */
 #define EEPROM_READ_OPCODE_MICROWIRE  0x6	/* EEPROM read opcode */
-- 
2.21.0
