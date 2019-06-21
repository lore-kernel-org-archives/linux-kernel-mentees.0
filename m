From: puranjay12 at gmail.com (Puranjay Mohan)
Date: Fri, 21 Jun 2019 21:10:36 +0530
Subject: [Linux-kernel-mentees] [PATCH v5 2/3] net: fddi: skfp: Include
	generic PCI definitions
In-Reply-To: <20190621154037.25245-1-puranjay12@gmail.com>
References: <20190621154037.25245-1-puranjay12@gmail.com>
Message-ID: <20190621154037.25245-3-puranjay12@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

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
