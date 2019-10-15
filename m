From: madhuparnabhowmik04 at gmail.com (madhuparnabhowmik04 at gmail.com)
Date: Tue, 15 Oct 2019 21:43:41 +0530
Subject: [Linux-kernel-mentees] [PATCH] Power: supply: abx500_chargalg.c:
	Fixed a code indentation error
Message-ID: <20191015161341.26868-1-madhuparnabhowmik04@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

From: Madhuparna Bhowmik <madhuparnabhowmik04 at gmail.com>

Fixed Code indentation error caused due to using spaces
instead of tabs.
The error reported by checkpatch.pl is:
 ERROR: code indent should use tabs where possible
The warning reported by checkpatch.pl is:
 WARNING: please, no spaces at the start of a line

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04 at gmail.com>
---
 drivers/power/supply/abx500_chargalg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/power/supply/abx500_chargalg.c b/drivers/power/supply/abx500_chargalg.c
index 23757fb10479..e6e37d4f20e4 100644
--- a/drivers/power/supply/abx500_chargalg.c
+++ b/drivers/power/supply/abx500_chargalg.c
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
-- 
2.17.1
