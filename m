From: madhuparnabhowmik04 at gmail.com (Madhuparna Bhowmik)
Date: Sun, 29 Sep 2019 23:49:10 +0530
Subject: [Linux-kernel-mentees] [PATCH 4/4] Driver: Power: Supply:
 abx500_chargalg: Fixed a few coding style errors
Message-ID: <20190929181906.GA21828@madhuparna-HP-Notebook>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

This patch fixes a few coding style errors and warnings
detected by checkpatch.pl:

WARNING: please, no space before tabs
ERROR: code indent should use tabs where possible
WARNING: please, no spaces at the start of a line
WARNING: Unnecessary parentheses
WARNING: Block comments use a trailing */ on a separate line
WARNING: Prefer 'long' over 'long int' as the int is unnecessary

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04 at gmail.com>
---
 drivers/power/supply/abx500_chargalg.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/power/supply/abx500_chargalg.c b/drivers/power/supply/abx500_chargalg.c
index 23757fb10479..a779fcabe3c6 100644
--- a/drivers/power/supply/abx500_chargalg.c
+++ b/drivers/power/supply/abx500_chargalg.c
@@ -219,7 +219,7 @@ enum maxim_ret {
  * @chg_info:		information about connected charger types
  * @batt_data:		data of the battery
  * @susp_status:	current charger suspension status
- * @bm:           	Platform specific battery management information
+ * @bm:			Platform specific battery management information
  * @curr_status:	Current step status for over-current protection
  * @parent:		pointer to the struct abx500
  * @chargalg_psy:	structure that holds the battery properties exposed by
@@ -354,13 +354,13 @@ static int abx500_chargalg_check_charger_enable(struct abx500_chargalg *di)
 
 	if (di->chg_info.charger_type & USB_CHG) {
 		return di->usb_chg->ops.check_enable(di->usb_chg,
-                         di->bm->bat_type[di->bm->batt_id].normal_vol_lvl,
-                         di->bm->bat_type[di->bm->batt_id].normal_cur_lvl);
+			di->bm->bat_type[di->bm->batt_id].normal_vol_lvl,
+			di->bm->bat_type[di->bm->batt_id].normal_cur_lvl);
 	} else if ((di->chg_info.charger_type & AC_CHG) &&
 		   !(di->ac_chg->external)) {
 		return di->ac_chg->ops.check_enable(di->ac_chg,
-                         di->bm->bat_type[di->bm->batt_id].normal_vol_lvl,
-                         di->bm->bat_type[di->bm->batt_id].normal_cur_lvl);
+			di->bm->bat_type[di->bm->batt_id].normal_vol_lvl,
+			di->bm->bat_type[di->bm->batt_id].normal_cur_lvl);
 	}
 	return 0;
 }
@@ -865,7 +865,7 @@ static enum maxim_ret abx500_chargalg_chg_curr_maxim(struct abx500_chargalg *di)
 
 	di->ccm.wait_cnt = 0;
 
-	if ((di->batt_data.inst_curr > di->ccm.original_iset)) {
+	if (di->batt_data.inst_curr > di->ccm.original_iset) {
 		dev_dbg(di->dev, " Maximization Ibat (%dmA) too high"
 			" (limit %dmA) (current iset: %dmA)!\n",
 			di->batt_data.inst_curr, di->ccm.original_iset,
@@ -967,7 +967,8 @@ static int abx500_chargalg_get_ext_psy_data(struct device *dev, void *data)
 
 		/*
 		 * Initialize chargers if not already done.
-		 * The ab8500_charger*/
+		 * The ab8500_charger
+		 */
 		if (!di->ac_chg &&
 			ext->desc->type == POWER_SUPPLY_TYPE_MAINS)
 			di->ac_chg = psy_to_ux500_charger(ext);
@@ -1173,7 +1174,8 @@ static int abx500_chargalg_get_ext_psy_data(struct device *dev, void *data)
 			switch (ext->desc->type) {
 			case POWER_SUPPLY_TYPE_MAINS:
 				/* AVG is used to indicate when we are
-				 * in CV mode */
+				 * in CV mode
+				 */
 				if (ret.intval)
 					di->events.ac_cv_active = true;
 				else
@@ -1182,7 +1184,8 @@ static int abx500_chargalg_get_ext_psy_data(struct device *dev, void *data)
 				break;
 			case POWER_SUPPLY_TYPE_USB:
 				/* AVG is used to indicate when we are
-				 * in CV mode */
+				 * in CV mode
+				 */
 				if (ret.intval)
 					di->events.usb_cv_active = true;
 				else
@@ -1750,7 +1753,7 @@ static ssize_t abx500_chargalg_curr_step_show(struct abx500_chargalg *di,
 static ssize_t abx500_chargalg_curr_step_store(struct abx500_chargalg *di,
 					       const char *buf, size_t length)
 {
-	long int param;
+	long param;
 	int ret;
 
 	ret = kstrtol(buf, 10, &param);
@@ -1783,7 +1786,7 @@ static ssize_t abx500_chargalg_en_show(struct abx500_chargalg *di,
 static ssize_t abx500_chargalg_en_store(struct abx500_chargalg *di,
 	const char *buf, size_t length)
 {
-	long int param;
+	long param;
 	int ac_usb;
 	int ret;
 
-- 
2.17.1
