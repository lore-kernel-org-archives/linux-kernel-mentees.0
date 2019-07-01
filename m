From: bnvandana@gmail.com (Vandana BN)
Date: Mon,  1 Jul 2019 19:46:10 +0530
Subject: [Linux-kernel-mentees] [PATCH] net:gue.h:Fix shifting signed 32-bit
	value by 31 bits problem
Message-ID: <20190701141610.3681-1-bnvandana@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190701141610.XnfkkKibDv_Zl9ej4Y66ViQlSFUrBvxOAHM1L-fQK6M@z>

Fix GUE_PFLAG_REMCSUM to use "U" cast to avoid shifting signed
32-bit value by 31 bits problem.

Signed-off-by: Vandana BN <bnvandana at gmail.com>
---
 include/net/gue.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/net/gue.h b/include/net/gue.h
index fdad41469b65..3a6595bfa641 100644
--- a/include/net/gue.h
+++ b/include/net/gue.h
@@ -60,7 +60,7 @@ struct guehdr {

 /* Private flags in the private option extension */

-#define GUE_PFLAG_REMCSUM	htonl(1 << 31)
+#define GUE_PFLAG_REMCSUM	htonl(1U << 31)
 #define GUE_PLEN_REMCSUM	4

 #define GUE_PFLAGS_ALL	(GUE_PFLAG_REMCSUM)
--
2.17.1
