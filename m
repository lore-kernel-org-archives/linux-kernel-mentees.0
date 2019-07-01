From: bnvandana at gmail.com (Vandana BN)
Date: Mon,  1 Jul 2019 17:25:39 +0530
Subject: [Linux-kernel-mentees] [PATCH] net: dst.h: Fix shifting signed
	32-bit value by 31 bits problem
Message-ID: <20190701115539.6738-1-bnvandana@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Fix DST_FEATURE_ECN_CA to use "U" cast to avoid shifting signed
32-bit value by 31 bits problem.

Signed-off-by: Vandana BN <bnvandana at gmail.com>
---
 include/net/dst.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/net/dst.h b/include/net/dst.h
index 12b31c602cb0..095c5daf9403 100644
--- a/include/net/dst.h
+++ b/include/net/dst.h
@@ -183,7 +183,7 @@ static inline void dst_metric_set(struct dst_entry *dst, int metric, u32 val)
 }

 /* Kernel-internal feature bits that are unallocated in user space. */
-#define DST_FEATURE_ECN_CA	(1 << 31)
+#define DST_FEATURE_ECN_CA	(1U << 31)

 #define DST_FEATURE_MASK	(DST_FEATURE_ECN_CA)
 #define DST_FEATURE_ECN_MASK	(DST_FEATURE_ECN_CA | RTAX_FEATURE_ECN)
--
2.17.1
