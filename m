From: puranjay12@gmail.com (Puranjay Mohan)
Date: Fri, 21 Jun 2019 15:16:06 +0530
Subject: [Linux-kernel-mentees] [PATCH v3 2/3] net: fddi: skfp: Include
	generic PCI definitions
In-Reply-To: <20190621094607.15011-1-puranjay12@gmail.com>
References: <20190621094607.15011-1-puranjay12@gmail.com>
Message-ID: <20190621094607.15011-3-puranjay12@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190621094606.0CxnIXwoPuaeTZbEfgT0Vq-maI8r25XAJiYp9I3_lh0@z>

Include the uapi/linux/pci_regs.h header file which contains the generic
PCI defines.

Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
---
 drivers/net/fddi/skfp/drvfbi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/fddi/skfp/drvfbi.c b/drivers/net/fddi/skfp/drvfbi.c
index b324c1acf195..9c8aa3a95463 100644
--- a/drivers/net/fddi/skfp/drvfbi.c
+++ b/drivers/net/fddi/skfp/drvfbi.c
@@ -20,6 +20,7 @@
 #include "h/supern_2.h"
 #include "h/skfbiinc.h"
 #include <linux/bitrev.h>
+#include <linux/pci_regs.h>
 
 #ifndef	lint
 static const char ID_sccs[] = "@(#)drvfbi.c	1.63 99/02/11 (C) SK " ;
-- 
2.21.0
