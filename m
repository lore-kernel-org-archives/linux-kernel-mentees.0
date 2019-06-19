From: puranjay12 at gmail.com (Puranjay Mohan)
Date: Wed, 19 Jun 2019 23:15:56 +0530
Subject: [Linux-kernel-mentees] [PATCH] net: fddi: skfp: Include generic PCI
	definitions from pci_regs.h
Message-ID: <20190619174556.21194-1-puranjay12@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Include the generic PCI definitions from include/uapi/linux/pci_regs.h
change PCI_REV_ID to PCI_REVISION_ID to make it compatible with the
generic define.
This driver uses only one generic PCI define.

Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
---
 drivers/net/fddi/skfp/drvfbi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/fddi/skfp/drvfbi.c b/drivers/net/fddi/skfp/drvfbi.c
index bdd5700e71fa..38f6d943385d 100644
--- a/drivers/net/fddi/skfp/drvfbi.c
+++ b/drivers/net/fddi/skfp/drvfbi.c
@@ -20,6 +20,7 @@
 #include "h/supern_2.h"
 #include "h/skfbiinc.h"
 #include <linux/bitrev.h>
+#include <uapi/linux/pci_regs.h>
 
 #ifndef	lint
 static const char ID_sccs[] = "@(#)drvfbi.c	1.63 99/02/11 (C) SK " ;
@@ -127,7 +128,7 @@ static void card_start(struct s_smc *smc)
 	 *	 at very first before any other initialization functions is
 	 *	 executed.
 	 */
-	rev_id = inp(PCI_C(PCI_REV_ID)) ;
+	rev_id = inp(PCI_C(PCI_REVISION_ID)) ;
 	if ((rev_id & 0xf0) == SK_ML_ID_1 || (rev_id & 0xf0) == SK_ML_ID_2) {
 		smc->hw.hw_is_64bit = TRUE ;
 	} else {
-- 
2.21.0
