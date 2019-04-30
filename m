From: puranjay12 at gmail.com (Puranjay Mohan)
Date: Wed, 1 May 2019 00:45:58 +0530
Subject: [Linux-kernel-mentees] [PATCH] Staging: rtl8192e: rtl8192e: Removed
 extra space before break statement
Message-ID: <20190430191558.GA22185@arch>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Fixed a style issue reported by checkpatch.pl
break statements had extra spaces before them.
WARNING: Statements should start on a tabstop

Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 0353f7ee5341..ef92ce957466 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1913,7 +1913,7 @@ static void _rtl92e_update_received_rate_histogram_stats(
 		break;
 	case MGN_2M:
 		rateIndex = 1;
-		 break;
+		break;
 	case MGN_5_5M:
 		rateIndex = 2;
 		break;
@@ -1931,7 +1931,7 @@ static void _rtl92e_update_received_rate_histogram_stats(
 		break;
 	case MGN_18M:
 		rateIndex = 7;
-		 break;
+		break;
 	case MGN_24M:
 		rateIndex = 8;
 		break;
-- 
2.21.0
