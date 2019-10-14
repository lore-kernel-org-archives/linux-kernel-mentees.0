From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Sun, 13 Oct 2019 23:17:18 -0500
Subject: [Linux-kernel-mentees] [PATCH 5/8] cec-follower: create digital DVB
	channels
In-Reply-To: <20191014041721.52025-1-c0d1n61at3@gmail.com>
References: <20191014041721.52025-1-c0d1n61at3@gmail.com>
Message-ID: <20191014041721.52025-6-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20191014041718.4pd-c2lLWvGNbE3GSa3bUJZl98xv-exYd0TMgR7siys@z>

This table will allow proper testing of digital tuner control features.
There are three channels per TSID/ONID/SID combination along with channel
data for the following digital DVB broadcast systems:
  - DVB-S2
  - DVB-T

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 utils/cec-follower/cec-tuner.cpp | 41 ++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index 4a4d2c7f..04e7e4c3 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -108,6 +108,47 @@ static const struct service_info digital_atsc_data[2][1][NUM_DIGITAL_CHANS] =
 	}
 };
 
+/*
+ * This table contains the digital television channels for DVB.  There are a
+ * total of three channels that are identified by digital IDs or by channel.
+ *
+ * CEC 17 of the 1.4 specification lists the available digital identification
+ * methods, IDs, and channel data.
+ *
+ * Digital channel data for DVB-S2 is from:
+ *
+ * https://www.satellite-calculations.com/DVB/getchannellist.php?1west/Swedish_Nordig_Channel_List.htm
+ *
+ * Digital channel data for DVB-T is from:
+ *
+ * https://sichbopvr.com/frequency-tables/Denmark/Hovedstaden/Copenhagen
+ * https://sichbopvr.com/frequency-tables/Sweden/Skane%20Lan/Malm%c3%b6
+ *
+ */
+static const struct service_info digital_dvb_data[2][1][NUM_DIGITAL_CHANS] =
+{
+	// satellite
+	{
+		// dvb-s2
+		{
+			// tsid, onid, sid, fmt, major, minor
+			{ 61, 70, 7193, 1, 0, 24 },
+			{ 65, 70, 7040, 1, 0, 72 },
+			{ 28, 70, 7012, 1, 0, 101 }
+		}
+	},
+	// terrestrial
+	{
+		// dvb-t
+		{
+			// tsid, onid, sid, fmt, major, minor
+			{ 1002, 8400, 2025, 1, 0, 21 },
+			{ 1004, 8400, 84, 1, 0, 31 },
+			{ 1004, 8945, 1040, 1, 0, 1040 }
+		}
+	}
+};
+
 /*
  * This table contains analog television channel frequencies in KHz.  There are
  * a total of three frequencies per analog broadcast type and broadcast system.
-- 
2.23.0
