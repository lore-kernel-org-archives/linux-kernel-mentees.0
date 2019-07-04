From: lnowakow@eng.ucsd.edu (Luke Nowakowski-Krijger)
Date: Thu, 4 Jul 2019 13:58:12 -0700
Subject: [Linux-kernel-mentees] [PATCH v2] media: dvb_frontend.h: Fix
 shifting signed 32-bit value problem
Message-ID: <20190704205812.GA28496@luke-XPS-13>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190704205812.MFuYNxEm8lUJ1Zyy3hLg1YzcUsO6MrgPIWdRKjs12JA@z>

Fix DVBFE_ALGO_RECOVERY and DVBFE_ALGO_SEARCH_ERROR use BIT macro which
fixes undefined behavior error by certain compilers. 

Also changed all other bit shifted definitions to use macro for better
readability. 

Signed-off-by: Luke Nowakowski-Krijger <lnowakow at eng.ucsd.edu>
---
 Changes in V2:
 + Added BIT macro to all bit shifted definitions
 - Removed U cast on 31 bit shifted definition
 Changes in V1:
 + Added U cast to shifting 31 bits

 include/media/dvb_frontend.h | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/include/media/dvb_frontend.h b/include/media/dvb_frontend.h
index f05cd7b94a2c..0d76fa4551b3 100644
--- a/include/media/dvb_frontend.h
+++ b/include/media/dvb_frontend.h
@@ -41,6 +41,7 @@
 #include <linux/delay.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
+#include <linux/bitops.h>
 
 #include <linux/dvb/frontend.h>
 
@@ -141,10 +142,10 @@ struct analog_parameters {
  *	These devices have AUTO recovery capabilities from LOCK failure
  */
 enum dvbfe_algo {
-	DVBFE_ALGO_HW			= (1 <<  0),
-	DVBFE_ALGO_SW			= (1 <<  1),
-	DVBFE_ALGO_CUSTOM		= (1 <<  2),
-	DVBFE_ALGO_RECOVERY		= (1 << 31)
+	DVBFE_ALGO_HW			= BIT(0),
+	DVBFE_ALGO_SW			= BIT(1),
+	DVBFE_ALGO_CUSTOM		= BIT(2),
+	DVBFE_ALGO_RECOVERY		= BIT(31),
 };
 
 /**
@@ -170,12 +171,12 @@ enum dvbfe_algo {
  *	The frontend search algorithm was requested to search again
  */
 enum dvbfe_search {
-	DVBFE_ALGO_SEARCH_SUCCESS	= (1 <<  0),
-	DVBFE_ALGO_SEARCH_ASLEEP	= (1 <<  1),
-	DVBFE_ALGO_SEARCH_FAILED	= (1 <<  2),
-	DVBFE_ALGO_SEARCH_INVALID	= (1 <<  3),
-	DVBFE_ALGO_SEARCH_AGAIN		= (1 <<  4),
-	DVBFE_ALGO_SEARCH_ERROR		= (1 << 31),
+	DVBFE_ALGO_SEARCH_SUCCESS	= BIT(0),
+	DVBFE_ALGO_SEARCH_ASLEEP	= BIT(1),
+	DVBFE_ALGO_SEARCH_FAILED	= BIT(2),
+	DVBFE_ALGO_SEARCH_INVALID	= BIT(3),
+	DVBFE_ALGO_SEARCH_AGAIN		= BIT(4),
+	DVBFE_ALGO_SEARCH_ERROR		= BIT(31),
 };
 
 /**
-- 
2.20.1
