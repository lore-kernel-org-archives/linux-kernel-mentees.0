From: puranjay12 at gmail.com (Puranjay Mohan)
Date: Thu, 2 May 2019 00:53:24 +0530
Subject: [Linux-kernel-mentees] [PATCH v3] Staging: rtl8192e: Remove extra
 space before break statement
Message-ID: <20190501192324.GA9665@arch>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Remove extra spaces before "break" statements to fix the following
warnings from checkpatch.pl

WARNING: Statements should start on a tabstop
+		 break;

WARNING: Statements should start on a tabstop
+		 break;

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
