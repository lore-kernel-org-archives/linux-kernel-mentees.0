From: puranjay12@gmail.com (Puranjay Mohan)
Date: Fri, 21 Jun 2019 22:09:20 +0530
Subject: [Linux-kernel-mentees] [PATCH 2/3] net: ethernet: atheros: atlx:
	Include generic PCI definitions
In-Reply-To: <20190621163921.26188-1-puranjay12@gmail.com>
References: <20190621163921.26188-1-puranjay12@gmail.com>
Message-ID: <20190621163921.26188-3-puranjay12@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190621163920.ZrdPz2qi251pCdxZ72QbjjwIEeklqk0GtYl_5FUByjY@z>

Include the uapi/linux/pci_regs.h header file which contains the generic
PCI defines.

Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
---
 drivers/net/ethernet/atheros/atlx/atl2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/atheros/atlx/atl2.c b/drivers/net/ethernet/atheros/atlx/atl2.c
index 478db3fe920a..58abadd18df2 100644
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
