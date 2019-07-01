From: sanjana99reddy99@gmail.com (Sanjana Sanikommu)
Date: Mon,  1 Jul 2019 19:47:19 +0530
Subject: [Linux-kernel-mentees] [PATCH] drivers: mtd: nand: raw: Remove
	unnecessary return variables.
Message-ID: <20190701141719.6636-1-sanjana99reddy99@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190701141719.dJuOpHW6VyWE4pVGy8tVfdWYcTuucpTuit_66c5RNYY@z>

Issue found using coccinelle tool.

Signed-off-by: Sanjana Sanikommu <sanjana99reddy99 at gmail.com>
---
 drivers/mtd/nand/raw/marvell_nand.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index f38e5c1b87e4..ac91ce6a8764 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -1029,8 +1029,7 @@ static int marvell_nfc_hw_ecc_hmg_do_read_page(struct nand_chip *chip,
 		marvell_nfc_xfer_data_in_pio(nfc, oob_buf, oob_bytes);
 	}
 
-	ret = marvell_nfc_wait_cmdd(chip);
-	return ret;
+	return marvell_nfc_wait_cmdd(chip);
 }
 
 static int marvell_nfc_hw_ecc_hmg_read_page_raw(struct nand_chip *chip, u8 *buf,
@@ -1141,9 +1140,8 @@ static int marvell_nfc_hw_ecc_hmg_do_write_page(struct nand_chip *chip,
 	if (ret)
 		return ret;
 
-	ret = marvell_nfc_wait_op(chip,
+	return marvell_nfc_wait_op(chip,
 				  PSEC_TO_MSEC(chip->data_interface.timings.sdr.tPROG_max));
-	return ret;
 }
 
 static int marvell_nfc_hw_ecc_hmg_write_page_raw(struct nand_chip *chip,
@@ -2708,8 +2706,7 @@ static int marvell_nand_chips_init(struct device *dev, struct marvell_nfc *nfc)
 	 * NAND controller node.
 	 */
 	if (nfc->caps->legacy_of_bindings) {
-		ret = marvell_nand_chip_init(dev, nfc, np);
-		return ret;
+		return marvell_nand_chip_init(dev, nfc, np);
 	}
 
 	for_each_child_of_node(np, nand_np) {
-- 
2.17.1
