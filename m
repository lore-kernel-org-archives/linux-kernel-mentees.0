From: c0d1n61at3 at gmail.com (Jiunn Chang)
Date: Tue, 24 Sep 2019 09:17:51 -0500
Subject: [Linux-kernel-mentees] [PATCH 1/2] cec-follower: add tuner step
	increment/decrement
In-Reply-To: <20190924141752.5508-1-c0d1n61at3@gmail.com>
References: <20190924141752.5508-1-c0d1n61at3@gmail.com>
Message-ID: <20190924141752.5508-2-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Tuner step increment/decrement will select the next highest or next
lowest service frequency.  There are a total of three possible
frequencies from analog_freqs_khz given a broadcast type and system.

Opcodes implemented:
  - <Tuner Step Increment>
  - <Tuner Step Decrement>

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 utils/cec-follower/cec-tuner.cpp | 49 ++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 3 deletions(-)

diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index acc3fd00..adb2f63c 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -135,6 +135,22 @@ static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
 	return false;
 }
 
+static int analog_find_freq_index(struct cec_op_tuner_device_info *info)
+{
+	if (info->analog.ana_freq == 0)
+		return -1;
+
+	int ana_freq_khz = (info->analog.ana_freq * 625) / 10;
+
+	for (int i = 0; i < NUM_ANALOG_FREQS; i++) {
+		int freq = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][i];
+
+		if (ana_freq_khz == freq)
+			return i;
+	}
+	return -1;
+}
+
 void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
 {
 	bool is_bcast = cec_msg_is_broadcast(&msg);
@@ -178,12 +194,39 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		return;
 
 	case CEC_MSG_SELECT_DIGITAL_SERVICE:
-	case CEC_MSG_TUNER_STEP_DECREMENT:
-	case CEC_MSG_TUNER_STEP_INCREMENT:
-		if (!cec_has_tuner(1 << me))
+	case CEC_MSG_TUNER_STEP_DECREMENT: {
+		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
 			break;
+
+		struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
+		int idx = analog_find_freq_index(info);
+
+		if (idx == -1 || idx == 0)
+			return;
+		if (info->is_analog) {
+			int freq = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][--idx];
+
+			info->analog.ana_freq = (freq * 10) / 625;
+		}
 		return;
+	}
+
+	case CEC_MSG_TUNER_STEP_INCREMENT: {
+		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
+			break;
 
+		struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
+		int idx = analog_find_freq_index(info);
+
+		if (idx == -1 || idx == 2)
+			return;
+		if (info->is_analog) {
+			int freq = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][++idx];
+
+			info->analog.ana_freq = (freq * 10) / 625;
+		}
+		return;
+	}
 
 		/*
 		  One Touch Record
-- 
2.23.0
