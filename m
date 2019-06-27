From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Thu, 27 Jun 2019 00:04:26 -0500
Subject: [Linux-kernel-mentees] [PATCH v3] nl80211: Fix undefined behavior
	in bit shift
In-Reply-To: <20190627032532.18374-4-c0d1n61at3@gmail.com>
References: <20190627032532.18374-4-c0d1n61at3@gmail.com>
Message-ID: <20190627050426.17925-3-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190627050426.uPpLtLAhK_Ls2th840wzEd812hM5Qgn__NDCGmOT_v0@z>

Shifting signed 32-bit value by 31 bits is undefined.  Changing most
significant bit to unsigned.

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
Changes included in v3:
  - remove change log from patch description

Changes included in v2:
  - use subsystem specific subject lines
  - CC required mailing lists

 include/uapi/linux/nl80211.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 6f09d1500960..fa7ebbc6ff27 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -5314,7 +5314,7 @@ enum nl80211_feature_flags {
 	NL80211_FEATURE_TDLS_CHANNEL_SWITCH		= 1 << 28,
 	NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR		= 1 << 29,
 	NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR	= 1 << 30,
-	NL80211_FEATURE_ND_RANDOM_MAC_ADDR		= 1 << 31,
+	NL80211_FEATURE_ND_RANDOM_MAC_ADDR		= 1U << 31,
 };
 
 /**
-- 
2.22.0
