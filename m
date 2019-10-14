From: c0d1n61at3 at gmail.com (Jiunn Chang)
Date: Sun, 13 Oct 2019 23:17:17 -0500
Subject: [Linux-kernel-mentees] [PATCH 4/8] cec-follower: create digital
	ATSC channels
In-Reply-To: <20191014041721.52025-1-c0d1n61at3@gmail.com>
References: <20191014041721.52025-1-c0d1n61at3@gmail.com>
Message-ID: <20191014041721.52025-5-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

This table will allow proper testing of digital tuner control features.
There are three channels per TSID/program number combination along with
channel data for the following digital ATSC broadcast systems:
  - ATSC-SAT
  - ATSC-T

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 utils/cec-follower/cec-tuner.cpp | 45 ++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index 4fd65876..4a4d2c7f 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -63,6 +63,51 @@ static const struct service_info digital_arib_data[2][1][NUM_DIGITAL_CHANS] =
 	}
 };
 
+/*
+ * This table contains the digital television channels for ATSC.  There
+ * are a total of three channels that are identified by digital IDs or by
+ * channel.
+ *
+ * CEC 17 of the 1.4 specification lists the available digital identification
+ * methods, IDs, and channel data.
+ *
+ * Digital channel data for atsc-sat is from:
+ *
+ * https://sichbopvr.com/frequency-tables/28-50E
+ *
+ * No public data was found for atsc-sat so data is just copied.
+ *
+ * Digital channel data for atsc-t is from:
+ *
+ * https://sichbopvr.com/frequency-tables/United%20States/Illinois/Caseyville
+ *
+ * ATSC does not use ONIDs and SID will be used as the program number.  All ATSC
+ * channel number formats are 2 part.
+ */
+static const struct service_info digital_atsc_data[2][1][NUM_DIGITAL_CHANS] =
+{
+	// satellite
+	{
+		// atsc-sat
+		{
+			// tsid, onid, sid, fmt, major, minor
+			{ 2065, 0, 50316, 2, 3, 50316 },
+			{ 2090, 0, 50882, 2, 3, 50882 },
+			{ 2122, 0, 55295, 2, 3, 55295 }
+		}
+	},
+	// terrestrial
+	{
+		// atsc-t
+		{
+			// tsid, onid, sid, fmt, major, minor
+			{ 1675, 0, 1, 2, 4, 1 },
+			{ 1675, 0, 2, 2, 4, 2 },
+			{ 1675, 0, 3, 2, 4, 3 }
+		}
+	}
+};
+
 /*
  * This table contains analog television channel frequencies in KHz.  There are
  * a total of three frequencies per analog broadcast type and broadcast system.
-- 
2.23.0
