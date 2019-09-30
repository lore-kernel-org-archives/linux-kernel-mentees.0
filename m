From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Sun, 29 Sep 2019 23:30:16 -0500
Subject: [Linux-kernel-mentees] [PATCH v3 2/3] cec-follower: add tuner step
	increment/decrement
In-Reply-To: <20190924192445.93575-1-c0d1n61at3@gmail.com>
References: <20190924192445.93575-1-c0d1n61at3@gmail.com>
Message-ID: <20190930043017.474025-3-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190930043016.YYRpCrqMZEK57xmWDNnF3iF5D9IUOH5jwgn_BUmXZI4@z>

Tuner step increment/decrement will select the next highest or next
lowest service frequency.  There are a total of three possible
frequencies given a broadcast type and system for a total of 81 analog
channels.

Opcodes implemented:
  - <Tuner Step Increment>
  - <Tuner Step Decrement>

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 utils/cec-follower/cec-follower.cpp |  2 +-
 utils/cec-follower/cec-follower.h   |  3 +-
 utils/cec-follower/cec-tuner.cpp    | 85 +++++++++++++++++++++++++----
 3 files changed, 76 insertions(+), 14 deletions(-)

diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 4243fdd9..8375404e 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -298,7 +298,7 @@ void state_init(struct node &node)
 	node.state.sac_active = false;
 	node.state.volume = 50;
 	node.state.mute = false;
-	analog_tuner_init(&node.state.tuner_dev_info);
+	analog_tuner_init(&node.state);
 }
 
 int main(int argc, char **argv)
diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index a53c16fe..d8ac4e77 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -52,6 +52,7 @@ struct state {
 	unsigned rc_press_hold_count;
 	unsigned rc_duration_sum;
 	struct cec_op_tuner_device_info tuner_dev_info;
+	unsigned int freq_idx;
 };
 
 struct node {
@@ -221,7 +222,7 @@ std::string opcode2s(const struct cec_msg *msg);
 void sad_encode(const struct short_audio_desc *sad, __u32 *descriptor);
 
 // cec-tuner.cpp
-void analog_tuner_init(struct cec_op_tuner_device_info *tuner_dev_info);
+void analog_tuner_init(struct state *state);
 void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me);
 
 // CEC processing
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index 2f6e3425..d3c6f9e8 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -90,8 +90,9 @@ static unsigned int analog_freqs_khz[3][9][NUM_ANALOG_FREQS] =
 	}
 };
 
-void analog_tuner_init(struct cec_op_tuner_device_info *info)
+void analog_tuner_init(struct state *state)
 {
+	struct cec_op_tuner_device_info *info = &state->tuner_dev_info;
 	unsigned int freq_khz =
 		analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][0];
 
@@ -101,20 +102,24 @@ void analog_tuner_init(struct cec_op_tuner_device_info *info)
 	info->analog.ana_bcast_type = CEC_OP_ANA_BCAST_TYPE_CABLE;
 	info->analog.bcast_system = CEC_OP_BCAST_SYSTEM_PAL_BG;
 	info->analog.ana_freq = (freq_khz * 10) / 625;
+	state->freq_idx = 18;
 }
 
-static unsigned int analog_get_nearest_freq(__u8 ana_bcast_type, __u8 ana_bcast_system,
-                                            int ana_freq_khz)
+static void analog_get_nearest_freq_idx(__u8 ana_bcast_type, __u8 ana_bcast_system,
+					int ana_freq_khz, int *nearest, int *idx)
 {
-	int nearest = analog_freqs_khz[ana_bcast_type][ana_bcast_system][0];
+	*nearest = analog_freqs_khz[ana_bcast_type][ana_bcast_system][0];
+	int offset = 0;
 
 	for (int i = 0; i < NUM_ANALOG_FREQS; i++) {
 		int freq = analog_freqs_khz[ana_bcast_type][ana_bcast_system][i];
 
-		if (abs(ana_freq_khz - freq) < abs(ana_freq_khz - nearest))
-			nearest = freq;
+		if (abs(ana_freq_khz - freq) < abs(ana_freq_khz - *nearest)) {
+			*nearest = freq;
+			offset++;
+		}
 	}
-	return nearest;
+	*idx = 18 + (NUM_ANALOG_FREQS * ((ana_bcast_type * 9) + ana_bcast_system)) + offset;
 }
 
 static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
@@ -127,8 +132,11 @@ static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
 	cec_ops_select_analogue_service(msg, &type, &freq, &system);
 	if (type < 3 && system < 9) {
 		int freq_khz = (freq * 625) / 10;
-		unsigned int nearest = analog_get_nearest_freq(type, system,
-							       freq_khz);
+		int idx;
+		int nearest;
+
+		analog_get_nearest_freq_idx(type, system, freq_khz, &nearest, &idx);
+		node->state.freq_idx = idx;
 		info->analog.ana_bcast_type = type;
 		info->analog.ana_freq = (nearest * 10) / 625;
 		info->analog.bcast_system = system;
@@ -137,6 +145,42 @@ static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
 	return false;
 }
 
+static void analog_get_type_system_idx(unsigned int freq_idx, int *type, int *system, int *idx)
+{
+	int num_freqs = NUM_ANALOG_FREQS * 9;
+	*type = (freq_idx - 18) / num_freqs;
+	*system = (freq_idx - (18 + num_freqs * *type)) / NUM_ANALOG_FREQS;
+	*idx = freq_idx % NUM_ANALOG_FREQS;
+}
+
+static void reset_tuner_dev_info(struct node *node)
+{
+	/*
+	  There are a total of 18 digital and 81 analog indexes with digital
+	  occurring before analog.  0-17 are digital and 18-98 are analog.
+	 */
+
+	struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
+
+	if (node->state.freq_idx < 18) {
+		// digital
+		info->is_analog = false;
+	} else {
+		// analog
+		int type;
+		int system;
+		int idx;
+		int freq_khz;
+
+		analog_get_type_system_idx(node->state.freq_idx, &type, &system, &idx);
+		info->is_analog = true;
+		info->analog.ana_bcast_type = type;
+		info->analog.bcast_system = system;
+		freq_khz = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][idx];
+		info->analog.ana_freq = (freq_khz * 10) / 625;
+	}
+}
+
 void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
 {
 	bool is_bcast = cec_msg_is_broadcast(&msg);
@@ -180,12 +224,29 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		return;
 
 	case CEC_MSG_SELECT_DIGITAL_SERVICE:
-	case CEC_MSG_TUNER_STEP_DECREMENT:
-	case CEC_MSG_TUNER_STEP_INCREMENT:
-		if (!cec_has_tuner(1 << me))
+	case CEC_MSG_TUNER_STEP_DECREMENT: {
+		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
 			break;
+
+		if (node->state.freq_idx == 18)
+			node->state.freq_idx = 98;
+		else
+			node->state.freq_idx--;
+		reset_tuner_dev_info(node);
 		return;
+	}
 
+	case CEC_MSG_TUNER_STEP_INCREMENT: {
+		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
+			break;
+
+		if (node->state.freq_idx == 98)
+			node->state.freq_idx = 18;
+		else
+			node->state.freq_idx++;
+		reset_tuner_dev_info(node);
+		return;
+	}
 
 		/*
 		  One Touch Record
-- 
2.23.0
