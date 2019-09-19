From: c0d1n61at3 at gmail.com (Jiunn Chang)
Date: Wed, 18 Sep 2019 23:18:44 -0500
Subject: [Linux-kernel-mentees] [PATCH v4] cec-follower: add tuner analog
	service emulation
In-Reply-To: <20190918192710.170428-1-c0d1n61at3@gmail.com>
References: <20190918192710.170428-1-c0d1n61at3@gmail.com>
Message-ID: <20190919041844.346514-1-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Implement the following tuner control features:
  - <Select Analogue Service>
  - <Give Tuner Device Status> and reply <Tuner Device Status>

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---

Changes made since v1:
  - Fix typos/bugs
  - Import reply_feature_abort() from cec-processing.cpp
  - Add functionality to choose nearest frequency

Changes made since v2:
  - Fix typos/bugs
  - Use state from node in cec-follower.h
  - Rename functions to analog_ prefix

Changes made since v3:
  - Refactor lines numbers since a fix patch was needed for cec-tuner.cpp

---
 utils/cec-follower/cec-follower.h |  1 +
 utils/cec-follower/cec-tuner.cpp  | 57 ++++++++++++++++++++++++-------
 2 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index 9f5f1be4..9c146be1 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -51,6 +51,7 @@ struct state {
 	__u64 rc_press_rx_ts;
 	unsigned rc_press_hold_count;
 	unsigned rc_duration_sum;
+	struct cec_op_tuner_device_info tuner_dev_info;
 };
 
 struct node {
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index 2303e6bb..87c631e4 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -4,6 +4,7 @@
  */
 
 #include <sys/ioctl.h>
+#include <stdlib.h>
 
 #include "cec-follower.h"
 
@@ -117,6 +118,35 @@ static void reply_feature_abort(struct node *node, struct cec_msg *msg, __u8 rea
 	transmit(node, msg);
 }
 
+static void analog_set_tuner_chan_freq(struct node *node)
+{
+	unsigned int ana_freq_khz = (node->state.tuner_dev_info.analog.ana_freq * 625) / 10;
+	unsigned int nearest = analog_freqs_khz[node->state.tuner_dev_info.analog.ana_bcast_type][node->state.tuner_dev_info.analog.bcast_system][0];
+	for (int i = 0; i < 3; i++) {
+		if (abs(int(ana_freq_khz - analog_freqs_khz[node->state.tuner_dev_info.analog.ana_bcast_type][node->state.tuner_dev_info.analog.bcast_system][i])) <
+		    abs(int(ana_freq_khz - nearest))) {
+			nearest = analog_freqs_khz[node->state.tuner_dev_info.analog.ana_bcast_type][node->state.tuner_dev_info.analog.bcast_system][i];
+		}
+	}
+	node->state.tuner_dev_info.analog.ana_freq = (nearest * 10) / 625;
+}
+
+static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
+{
+	node->state.tuner_dev_info.rec_flag = CEC_OP_REC_FLAG_NOT_USED;
+	node->state.tuner_dev_info.tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_ANALOGUE;
+	node->state.tuner_dev_info.is_analog = true;
+	cec_ops_select_analogue_service(msg,
+					&node->state.tuner_dev_info.analog.ana_bcast_type,
+					&node->state.tuner_dev_info.analog.ana_freq,
+					&node->state.tuner_dev_info.analog.bcast_system);
+	if (node->state.tuner_dev_info.analog.ana_bcast_type > 2 ||
+	    node->state.tuner_dev_info.analog.bcast_system > 8)
+		return false;
+	analog_set_tuner_chan_freq(node);
+	return true;
+}
+
 void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
 {
 	bool is_bcast = cec_msg_is_broadcast(&msg);
@@ -133,21 +163,11 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		*/
 
 	case CEC_MSG_GIVE_TUNER_DEVICE_STATUS: {
-		if (!cec_has_tuner(1 << me))
+		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
 			break;
 
-		struct cec_op_tuner_device_info tuner_dev_info = {};
-
 		cec_msg_set_reply_to(&msg, &msg);
-		tuner_dev_info.rec_flag = CEC_OP_REC_FLAG_NOT_USED;
-		tuner_dev_info.tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_NONE;
-		tuner_dev_info.is_analog = false;
-		tuner_dev_info.digital.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_CHANNEL;
-		tuner_dev_info.digital.dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_C;
-		tuner_dev_info.digital.channel.channel_number_fmt = CEC_OP_CHANNEL_NUMBER_FMT_1_PART;
-		tuner_dev_info.digital.channel.minor = 1;
-
-		cec_msg_tuner_device_status(&msg, &tuner_dev_info);
+		cec_msg_tuner_device_status(&msg, &node->state.tuner_dev_info);
 		transmit(node, &msg);
 		return;
 	}
@@ -156,6 +176,19 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		return;
 
 	case CEC_MSG_SELECT_ANALOGUE_SERVICE:
+		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
+			break;
+
+		if (node->state.tuner_dev_info.rec_flag == CEC_OP_REC_FLAG_USED) {
+			reply_feature_abort(node, &msg, CEC_OP_ABORT_REFUSED);
+			return;
+		}
+		if (!analog_set_tuner_dev_info(node, &msg)) {
+			reply_feature_abort(node, &msg, CEC_OP_ABORT_INVALID_OP);
+			return;
+		}
+		return;
+
 	case CEC_MSG_SELECT_DIGITAL_SERVICE:
 	case CEC_MSG_TUNER_STEP_DECREMENT:
 	case CEC_MSG_TUNER_STEP_INCREMENT:
-- 
2.23.0
