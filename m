From: lnowakow at eng.ucsd.edu (Luke Nowakowski-Krijger)
Date: Thu, 4 Jul 2019 10:04:22 -0700
Subject: [Linux-kernel-mentees] [Linux-kernel-mentee,
 PATCH] media: dvb_frontend.h: Fix shifting signed 32-bit value
 problem
Message-ID: <20190704170422.GA25633@luke-XPS-13>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Fix DVBFE_ALGO_RECOVERY and DVBFE_ALGO_SEARCH_ERROR to use U cast which
fixes undefined behavior error by certain compilers. 

Signed-off-by: Luke Nowakowski-Krijger <lnowakow at eng.ucsd.edu>
---
 include/media/dvb_frontend.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/media/dvb_frontend.h b/include/media/dvb_frontend.h
index f05cd7b94a2c..472fe5871d94 100644
--- a/include/media/dvb_frontend.h
+++ b/include/media/dvb_frontend.h
@@ -144,7 +144,7 @@ enum dvbfe_algo {
 	DVBFE_ALGO_HW			= (1 <<  0),
 	DVBFE_ALGO_SW			= (1 <<  1),
 	DVBFE_ALGO_CUSTOM		= (1 <<  2),
-	DVBFE_ALGO_RECOVERY		= (1 << 31)
+	DVBFE_ALGO_RECOVERY		= (1U << 31)
 };
 
 /**
@@ -175,7 +175,7 @@ enum dvbfe_search {
 	DVBFE_ALGO_SEARCH_FAILED	= (1 <<  2),
 	DVBFE_ALGO_SEARCH_INVALID	= (1 <<  3),
 	DVBFE_ALGO_SEARCH_AGAIN		= (1 <<  4),
-	DVBFE_ALGO_SEARCH_ERROR		= (1 << 31),
+	DVBFE_ALGO_SEARCH_ERROR		= (1U << 31),
 };
 
 /**
-- 
2.20.1
