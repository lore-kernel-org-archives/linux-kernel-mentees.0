From: c0d1n61at3 at gmail.com (Jiunn Chang)
Date: Wed, 26 Jun 2019 22:25:29 -0500
Subject: [Linux-kernel-mentees] [PATCH] ethtool: Fix undefined behavior in
	bit shift
Message-ID: <20190627032532.18374-1-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Shifting signed 32-bit value by 31 bits is undefined.  Changing most
significant bit to unsigned.

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 include/uapi/linux/ethtool.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/ethtool.h b/include/uapi/linux/ethtool.h
index 3534ce157ae9..859b2e99c000 100644
--- a/include/uapi/linux/ethtool.h
+++ b/include/uapi/linux/ethtool.h
@@ -1691,7 +1691,7 @@ static inline int ethtool_validate_duplex(__u8 duplex)
 #define	RXH_IP_DST	(1 << 5)
 #define	RXH_L4_B_0_1	(1 << 6) /* src port in case of TCP/UDP/SCTP */
 #define	RXH_L4_B_2_3	(1 << 7) /* dst port in case of TCP/UDP/SCTP */
-#define	RXH_DISCARD	(1 << 31)
+#define	RXH_DISCARD	(1U << 31)
 
 #define	RX_CLS_FLOW_DISC	0xffffffffffffffffULL
 #define RX_CLS_FLOW_WAKE	0xfffffffffffffffeULL
-- 
2.22.0
