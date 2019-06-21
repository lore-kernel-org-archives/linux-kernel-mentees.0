From: puranjay12 at gmail.com (Puranjay Mohan)
Date: Fri, 21 Jun 2019 20:44:13 +0530
Subject: [Linux-kernel-mentees] [PATCH v4 1/3] net: fddi: skfp: Rename local
	PCI defines to match generic PCI defines
In-Reply-To: <20190621151415.10795-1-puranjay12@gmail.com>
References: <20190621151415.10795-1-puranjay12@gmail.com>
Message-ID: <20190621151415.10795-2-puranjay12@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Rename the PCI_REV_ID and other local defines to Generic PCI define names
in skfbi.h and drvfbi.c to make it compatible with the pci_regs.h.

Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
---
 drivers/net/fddi/skfp/drvfbi.c  | 2 +-
 drivers/net/fddi/skfp/h/skfbi.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

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
index 89557457b352..5f9b631e7515 100644
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
@@ -110,7 +110,7 @@
 #define PCI_66MHZCAP	0x0020	/* Bit 5:	66 MHz PCI bus clock capable */
 #define PCI_NEWCAP	0x0010	/* Bit 4:	New cap. list implemented */
 
-#define PCI_ERRBITS	(PCI_PERR|PCI_SERR|PCI_RMABORT|PCI_STABORT|PCI_DATAPERR)
+#define PCI_ERRBITS	(PCI_STATUS_DETECTED_PARITY | PCI_STATUS_SIG_SYSTEM_ERROR | PCI_STATUS_REC_MASTER_ABORT | PCI_STATUS_SIG_TARGET_ABORT | PCI_STATUS_PARITY)
 
 /*	PCI_REV_ID	8 bit	Revision ID */
 /*	PCI_CLASS_CODE	24 bit	Class Code */
-- 
2.21.0
