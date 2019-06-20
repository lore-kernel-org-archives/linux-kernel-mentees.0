From: puranjay12@gmail.com (Puranjay Mohan)
Date: Thu, 20 Jun 2019 23:37:52 +0530
Subject: [Linux-kernel-mentees] [PATCH v2 1/3] net: fddi: skfp: Rename
	PCI_REV_ID to PCI_REVISION_ID
In-Reply-To: <20190620180754.15413-1-puranjay12@gmail.com>
References: <20190620180754.15413-1-puranjay12@gmail.com>
Message-ID: <20190620180754.15413-2-puranjay12@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190620180752.ZamPLY7q7H-uF6EzcbA_kh-TI1tgUUj2WA3JN9zmFSc@z>

Rename the PCI_REV_ID define to PCI_REVISION_ID in skfbi.h
and drvfbi.c to make it compatible with the pci_regs.h
which defines it as PCI_REVISION_ID.

Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
---
 drivers/net/fddi/skfp/drvfbi.c  | 2 +-
 drivers/net/fddi/skfp/h/skfbi.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/fddi/skfp/drvfbi.c b/drivers/net/fddi/skfp/drvfbi.c
index bdd5700e71fa..b324c1acf195 100644
--- a/drivers/net/fddi/skfp/drvfbi.c
+++ b/drivers/net/fddi/skfp/drvfbi.c
@@ -127,7 +127,7 @@ static void card_start(struct s_smc *smc)
 	 *	 at very first before any other initialization functions is
 	 *	 executed.
 	 */
-	rev_id = inp(PCI_C(PCI_REV_ID)) ;
+	rev_id = inp(PCI_C(PCI_REVISION_ID)) ;
 	if ((rev_id & 0xf0) == SK_ML_ID_1 || (rev_id & 0xf0) == SK_ML_ID_2) {
 		smc->hw.hw_is_64bit = TRUE ;
 	} else {
diff --git a/drivers/net/fddi/skfp/h/skfbi.h b/drivers/net/fddi/skfp/h/skfbi.h
index 89557457b352..a05ce16171be 100644
--- a/drivers/net/fddi/skfp/h/skfbi.h
+++ b/drivers/net/fddi/skfp/h/skfbi.h
@@ -31,7 +31,7 @@
 #define	PCI_DEVICE_ID	0x02	/* 16 bit	Device ID */
 #define	PCI_COMMAND	0x04	/* 16 bit	Command */
 #define	PCI_STATUS	0x06	/* 16 bit	Status */
-#define	PCI_REV_ID	0x08	/*  8 bit	Revision ID */
+#define	PCI_REVISION_ID	0x08	/*  8 bit	Revision ID */
 #define	PCI_CLASS_CODE	0x09	/* 24 bit	Class Code */
 #define	PCI_CACHE_LSZ	0x0c	/*  8 bit	Cache Line Size */
 #define	PCI_LAT_TIM	0x0d	/*  8 bit	Latency Timer */
-- 
2.21.0
