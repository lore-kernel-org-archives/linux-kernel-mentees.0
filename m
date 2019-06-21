From: hvubfoss at gmail.com (Harshavardhan Unnibhavi)
Date: Fri, 21 Jun 2019 22:14:53 +0530
Subject: [Linux-kernel-mentees] [PATCH] staging: soc_mt9v022: replace
	symbolic permission with octal permission
Message-ID: <20190621164453.5075-1-hvubfoss@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Resolved following checkpatch issue:
WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider
using octal permissions '0444'.

Signed-off-by: Harshavardhan Unnibhavi <hvubfoss at gmail.com>
---
 drivers/staging/media/soc_camera/soc_mt9v022.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/soc_camera/soc_mt9v022.c b/drivers/staging/media/soc_camera/soc_mt9v022.c
index e7e0d3d29499..f73f5460663c 100644
--- a/drivers/staging/media/soc_camera/soc_mt9v022.c
+++ b/drivers/staging/media/soc_camera/soc_mt9v022.c
@@ -25,7 +25,7 @@
  */
 
 static char *sensor_type;
-module_param(sensor_type, charp, S_IRUGO);
+module_param(sensor_type, charp, 0444);
 MODULE_PARM_DESC(sensor_type, "Sensor type: \"colour\" or \"monochrome\"");
 
 /* mt9v022 selected register addresses */
-- 
2.17.1
