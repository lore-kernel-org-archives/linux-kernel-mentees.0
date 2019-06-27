From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Thu, 27 Jun 2019 00:04:24 -0500
Subject: [Linux-kernel-mentees] [PATCH v3] packet: Fix undefined behavior in
	bit shift
In-Reply-To: <20190627032532.18374-2-c0d1n61at3@gmail.com>
References: <20190627032532.18374-2-c0d1n61at3@gmail.com>
Message-ID: <20190627050426.17925-1-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190627050424.T3cvgGo5axRAEjC-8WdqXnwtpDIAWq7aBvYa6zP8SEM@z>

Shifting signed 32-bit value by 31 bits is undefined.  Changing most
significant bit to unsigned.

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
Changes included in v3:
  - remove change log from patch description

Changes included in v2:
  - use subsystem specific subject lines
  - CC required mailing lists

 include/uapi/linux/if_packet.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/if_packet.h b/include/uapi/linux/if_packet.h
index 467b654bd4c7..3d884d68eb30 100644
--- a/include/uapi/linux/if_packet.h
+++ b/include/uapi/linux/if_packet.h
@@ -123,7 +123,7 @@ struct tpacket_auxdata {
 /* Rx and Tx ring - header status */
 #define TP_STATUS_TS_SOFTWARE		(1 << 29)
 #define TP_STATUS_TS_SYS_HARDWARE	(1 << 30) /* deprecated, never set */
-#define TP_STATUS_TS_RAW_HARDWARE	(1 << 31)
+#define TP_STATUS_TS_RAW_HARDWARE	(1U << 31)
 
 /* Rx ring - feature request bits */
 #define TP_FT_REQ_FILL_RXHASH	0x1
-- 
2.22.0
