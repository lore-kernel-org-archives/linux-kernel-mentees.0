From: puranjay12 at gmail.com (Puranjay Mohan)
Date: Sat, 22 Jun 2019 14:29:40 +0530
Subject: [Linux-kernel-mentees] [PATCH v2 2/3] net: ethernet: atheros: atlx:
	Include generic PCI definitions
In-Reply-To: <20190622085941.24931-1-puranjay12@gmail.com>
References: <20190622085941.24931-1-puranjay12@gmail.com>
Message-ID: <20190622085941.24931-3-puranjay12@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Include the uapi/linux/pci_regs.h header file which contains the generic
PCI defines.

Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
---
 drivers/net/ethernet/atheros/atlx/atl2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/atheros/atlx/atl2.c b/drivers/net/ethernet/atheros/atlx/atl2.c
index 3b9fa27cc459..c69cb5f14001 100644
--- a/drivers/net/ethernet/atheros/atlx/atl2.c
+++ b/drivers/net/ethernet/atheros/atlx/atl2.c
@@ -24,6 +24,7 @@
 #include <linux/netdevice.h>
 #include <linux/pci.h>
 #include <linux/pci_ids.h>
+#include <linux/pci_regs.h>
 #include <linux/pm.h>
 #include <linux/skbuff.h>
 #include <linux/slab.h>
-- 
2.21.0
