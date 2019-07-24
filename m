From: skunberg.kelsey@gmail.com (Kelsey Skunberg)
Date: Wed, 24 Jul 2019 00:06:59 -0600
Subject: [Linux-kernel-mentees] [PATCH v3] drivers: net: xgene: Remove
	acpi_has_method() calls
In-Reply-To: <20190723185811.8548-1-skunberg.kelsey@gmail.com>
References: <20190723185811.8548-1-skunberg.kelsey@gmail.com>
Message-ID: <20190724060659.105292-1-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190724060659.NmRR90_cwFWnFC2MSeq0Hq_MCFDP9haFmpnCgiqLWf4@z>

acpi_evaluate_object will already return an error if the needed method
does not exist. Remove unnecessary acpi_has_method() calls and check the
returned acpi_status for failure instead.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
Changes in v2:
	- Fixed white space warnings and errors

Changes in v3:
	- Resolved build errors caused by missing bracket

 drivers/net/ethernet/apm/xgene/xgene_enet_hw.c    | 9 ++++-----
 drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c | 9 +++++----
 drivers/net/ethernet/apm/xgene/xgene_enet_xgmac.c | 9 ++++-----
 3 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/apm/xgene/xgene_enet_hw.c b/drivers/net/ethernet/apm/xgene/xgene_enet_hw.c
index 61a465097cb8..79924efd4ab7 100644
--- a/drivers/net/ethernet/apm/xgene/xgene_enet_hw.c
+++ b/drivers/net/ethernet/apm/xgene/xgene_enet_hw.c
@@ -694,6 +694,7 @@ bool xgene_ring_mgr_init(struct xgene_enet_pdata *p)
 static int xgene_enet_reset(struct xgene_enet_pdata *pdata)
 {
 	struct device *dev = &pdata->pdev->dev;
+	acpi_status status;
 
 	if (!xgene_ring_mgr_init(pdata))
 		return -ENODEV;
@@ -712,11 +713,9 @@ static int xgene_enet_reset(struct xgene_enet_pdata *pdata)
 		udelay(5);
 	} else {
 #ifdef CONFIG_ACPI
-		if (acpi_has_method(ACPI_HANDLE(&pdata->pdev->dev), "_RST")) {
-			acpi_evaluate_object(ACPI_HANDLE(&pdata->pdev->dev),
-					     "_RST", NULL, NULL);
-		} else if (acpi_has_method(ACPI_HANDLE(&pdata->pdev->dev),
-					 "_INI")) {
+		status = acpi_evaluate_object(ACPI_HANDLE(&pdata->pdev->dev),
+					      "_RST", NULL, NULL);
+		if (ACPI_FAILURE(status)) {
 			acpi_evaluate_object(ACPI_HANDLE(&pdata->pdev->dev),
 					     "_INI", NULL, NULL);
 		}
diff --git a/drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c b/drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c
index 6453fc2ebb1f..3b3dc5b25b29 100644
--- a/drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c
+++ b/drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c
@@ -437,6 +437,7 @@ static void xgene_sgmac_tx_disable(struct xgene_enet_pdata *p)
 static int xgene_enet_reset(struct xgene_enet_pdata *p)
 {
 	struct device *dev = &p->pdev->dev;
+	acpi_status status;
 
 	if (!xgene_ring_mgr_init(p))
 		return -ENODEV;
@@ -460,12 +461,12 @@ static int xgene_enet_reset(struct xgene_enet_pdata *p)
 		}
 	} else {
 #ifdef CONFIG_ACPI
-		if (acpi_has_method(ACPI_HANDLE(&p->pdev->dev), "_RST"))
-			acpi_evaluate_object(ACPI_HANDLE(&p->pdev->dev),
-					     "_RST", NULL, NULL);
-		else if (acpi_has_method(ACPI_HANDLE(&p->pdev->dev), "_INI"))
+		status = acpi_evaluate_object(ACPI_HANDLE(&p->pdev->dev),
+					      "_RST", NULL, NULL);
+		if (ACPI_FAILURE(status)) {
 			acpi_evaluate_object(ACPI_HANDLE(&p->pdev->dev),
 					     "_INI", NULL, NULL);
+		}
 #endif
 	}
 
diff --git a/drivers/net/ethernet/apm/xgene/xgene_enet_xgmac.c b/drivers/net/ethernet/apm/xgene/xgene_enet_xgmac.c
index 133eb91c542e..78584089d76d 100644
--- a/drivers/net/ethernet/apm/xgene/xgene_enet_xgmac.c
+++ b/drivers/net/ethernet/apm/xgene/xgene_enet_xgmac.c
@@ -380,6 +380,7 @@ static void xgene_xgmac_tx_disable(struct xgene_enet_pdata *pdata)
 static int xgene_enet_reset(struct xgene_enet_pdata *pdata)
 {
 	struct device *dev = &pdata->pdev->dev;
+	acpi_status status;
 
 	if (!xgene_ring_mgr_init(pdata))
 		return -ENODEV;
@@ -393,11 +394,9 @@ static int xgene_enet_reset(struct xgene_enet_pdata *pdata)
 		udelay(5);
 	} else {
 #ifdef CONFIG_ACPI
-		if (acpi_has_method(ACPI_HANDLE(&pdata->pdev->dev), "_RST")) {
-			acpi_evaluate_object(ACPI_HANDLE(&pdata->pdev->dev),
-					     "_RST", NULL, NULL);
-		} else if (acpi_has_method(ACPI_HANDLE(&pdata->pdev->dev),
-					   "_INI")) {
+		status = acpi_evaluate_object(ACPI_HANDLE(&pdata->pdev->dev),
+					      "_RST", NULL, NULL);
+		if (ACPI_FAILURE(status)) {
 			acpi_evaluate_object(ACPI_HANDLE(&pdata->pdev->dev),
 					     "_INI", NULL, NULL);
 		}
-- 
2.20.1
