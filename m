From: puranjay12@gmail.com (Puranjay Mohan)
Date: Mon, 29 Apr 2019 20:20:02 +0530
Subject: [Linux-kernel-mentees] [PATCH] staging: media: bcm2048: Fixed style
 error ERROR: Macros with complex values should be enclosed in parentheses
 found using scripts/checkpatch.pl
Message-ID: <20190429145002.GA12732@arch>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190429145002.S_F9X39oCHdCjNdOLYnPZcgqIp4jlO8PanNqM36r_II@z>

Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
---
 drivers/staging/media/bcm2048/radio-bcm2048.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/bcm2048/radio-bcm2048.c b/drivers/staging/media/bcm2048/radio-bcm2048.c
index d9b02ff66259..599da6c977ed 100644
--- a/drivers/staging/media/bcm2048/radio-bcm2048.c
+++ b/drivers/staging/media/bcm2048/radio-bcm2048.c
@@ -2000,7 +2000,7 @@ static ssize_t bcm2048_##prop##_read(struct device *dev,		\
 	return sprintf(buf, mask "\n", value);				\
 }
 
-#define DEFINE_SYSFS_PROPERTY(prop, prop_type, mask, check)		\
+#define (DEFINE_SYSFS_PROPERTY(prop, prop_type, mask, check))		\
 property_write(prop, prop_type, mask, check)				\
 property_read(prop, mask)						\
 
-- 
2.21.0
