From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Sun, 13 Oct 2019 23:17:16 -0500
Subject: [Linux-kernel-mentees] [PATCH 3/8] cec-follower: create digital
	ARIB channels
In-Reply-To: <20191014041721.52025-1-c0d1n61at3@gmail.com>
References: <20191014041721.52025-1-c0d1n61at3@gmail.com>
Message-ID: <20191014041721.52025-4-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20191014041716.Ltb57N7AkYUUnGnr4N8hEw2YGK2lAjkMHlItGEilcgw@z>

This table will allow proper testing of digital tuner control features.
There are three channels per TSID/ONID/SID combination along with channel
data for the following digital ARIB broadcast systems:
  - ARIB-BS
  - ARIB-T

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 utils/cec-follower/cec-tuner.cpp | 52 ++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index 3a71a890..4fd65876 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -9,8 +9,60 @@
 #include "cec-follower.h"
 
 #define NUM_ANALOG_FREQS 3
+#define NUM_DIGITAL_CHANS 3
 #define TOT_ANALOG_FREQS (sizeof(analog_freqs_khz) / sizeof(analog_freqs_khz[0][0][0]))
 
+struct service_info {
+	unsigned tsid;
+	unsigned onid;
+	unsigned sid;
+	unsigned fmt;
+	unsigned major;
+	unsigned minor;
+};
+
+/*
+ * This table contains the digital television channels for ARIB (ISDB).  There
+ * are a total of three channels that are identified by digital IDs or by
+ * channel.
+ *
+ * CEC 17 of the 1.4 specification lists the available digital identification
+ * methods, IDs, and channel data.
+ *
+ * Digital channel data for ARIB-BS is from:
+ *
+ * https://sichbopvr.com/frequency-tables/19-20E
+ *
+ * No public data was found for ARIB-BS so data is just copied.
+ *
+ * Digital channel data for ARIB-T is from:
+ *
+ * https://sichbopvr.com/frequency-tables/Brazil/Rio%20de%20Janeiro/Rio%20De%20Janeiro
+ */
+static const struct service_info digital_arib_data[2][1][NUM_DIGITAL_CHANS] =
+{
+	// satellite
+	{
+		// arib-bs
+		{
+			// tsid, onid, sid, fmt, major, minor
+			{ 1032, 1, 30203, 1, 0, 30203 },
+			{ 1046, 1, 30505, 1, 0, 30505 },
+			{ 1060, 1, 30609, 1, 0, 30609 }
+		}
+	},
+	// terrestrial
+	{
+		// arib-t
+		{
+			// tsid, onid, sid, fmt, major, minor
+			{ 1519, 1519, 48608, 1, 0, 48608 },
+			{ 1624, 1624, 51992, 1, 0, 51992 },
+			{ 1905, 1905, 60960, 1, 0, 60960 }
+		}
+	}
+};
+
 /*
  * This table contains analog television channel frequencies in KHz.  There are
  * a total of three frequencies per analog broadcast type and broadcast system.
-- 
2.23.0
