From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Thu, 19 Sep 2019 12:47:01 -0500
Subject: [Linux-kernel-mentees] [PATCH v4] cec-follower: create analog
	channel frequencies
In-Reply-To: <20190919025324.277999-1-c0d1n61at3@gmail.com>
References: <20190919025324.277999-1-c0d1n61at3@gmail.com>
Message-ID: <20190919174702.140335-2-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190919174701.mDe8e3915GAx3EDz9E_C1Cg1OYqFVTaGIvaFKDTBI4M@z>

This frequency table will allow proper testing of tuner control.  There
are three frequencies per analog broadcast type and broadcast system, so
tuner increment and decrement can be tested.

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---

Changes made since v1:
  - Add Wikipedia link for analog channel frequencies
  - Add spaces between { and }

Changes made since v2:
  - Add reply_feature_abort() to cec-tuner.cpp
  - Refactor lines numbers since a fix patch was needed for cec-tuner.cpp

Changes made since v3:
  - Remove reply_feature_abort() from cec-tuner.cpp
  - Add macro for NUM_ANALOG_FREQS
  - Refactor lines numbers since a fix patch was needed for cec-tuner.cpp

---
 utils/cec-follower/cec-tuner.cpp | 82 ++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index a1e349bd..bdeda342 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -7,6 +7,88 @@
 
 #include "cec-follower.h"
 
+#define NUM_ANALOG_FREQS	3
+
+/*
+ * This table contains analog television channel frequencies in KHz.  There are
+ * a total of three frequencies per analog broadcast type and broadcast system.
+ *
+ * CEC 17 and CEC Table 31 of the 1.4 specification lists the available analog
+ * broadcast types and broadcast systems.
+ *
+ * The table is indexed by [ana_bcast_type][bcast_system][NUM_ANALOG_FREQS].
+ *
+ * Analog channel frequencies are from Wikipedia:
+ *
+ * https://en.wikipedia.org/wiki/Television_channel_frequencies
+ */
+static unsigned int analog_freqs_khz[3][9][NUM_ANALOG_FREQS] =
+{
+	// cable
+	{
+		// pal-bg
+		{ 471250, 479250, 487250 },
+		// secam-lq
+		{ 615250, 623250, 631250 },
+		// pal-m
+		{ 501250, 507250, 513250 },
+		// ntsc-m
+		{ 519250, 525250, 531250 },
+		// pal-i
+		{ 45750, 53750, 61750 },
+		// secam-dk
+		{ 759250, 767250, 775250 },
+		// secam-bg
+		{ 495250, 503250, 511250 },
+		// secam-l
+		{ 639250, 647250, 655250 },
+		// pal-dk
+		{ 783250, 791250, 799250 }
+	},
+	// satellite
+	{
+		// pal-bg
+		{ 519250, 527250, 535250 },
+		// secam-lq
+		{ 663250, 671250, 679250 },
+		// pal-m
+		{ 537250, 543250, 549250 },
+		// ntsc-m
+		{ 555250, 561250, 567250 },
+		// pal-i
+		{ 175250, 183250, 191250 },
+		// secam-dk
+		{ 807250, 815250, 823250 },
+		// secam-bg
+		{ 543250, 551250, 559250 },
+		// secam-l
+		{ 687250, 695250, 703250 },
+		// pal-dk
+		{ 831250, 839250, 847250 }
+	},
+	// terrestrial
+	{
+		// pal-bg
+		{ 567250, 575250, 583250 },
+		// secam-lq
+		{ 711250, 719250, 727250 },
+		// pal-m
+		{ 573250, 579250, 585250 },
+		// ntsc-m
+		{ 591250, 597250, 603250 },
+		// pal-i
+		{ 199250, 207250, 215250 },
+		// secam-dk
+		{ 145250, 153250, 161250 },
+		// secam-bg
+		{ 591250, 599250, 607250 },
+		// secam-l
+		{ 735250, 743250, 751250 },
+		// pal-dk
+		{ 169250, 177250, 185250 }
+	}
+};
+
 void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
 {
 	bool is_bcast = cec_msg_is_broadcast(&msg);
-- 
2.23.0
