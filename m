From: c0d1n61at3 at gmail.com (Jiunn Chang)
Date: Sun, 13 Oct 2019 23:17:20 -0500
Subject: [Linux-kernel-mentees] [PATCH 7/8] cec-follower: fix tuner step
	increment/decrement
In-Reply-To: <20191014041721.52025-1-c0d1n61at3@gmail.com>
References: <20191014041721.52025-1-c0d1n61at3@gmail.com>
Message-ID: <20191014041721.52025-8-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Tuner step feature will select the next highest or lowest service
There are a total of 98 channels, 18 digital and 81 analog with
digital preceeding analog.  Analog channels defined by broadcast
type and system.  Digital channels defined by service ID method
and broadcast system along with digital IDs and channel data.

Opcodes implemented:
  - <Tuner Step Increment>
  - <Tuner Step Decrement>

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 utils/cec-follower/cec-follower.cpp |  2 +-
 utils/cec-follower/cec-follower.h   |  2 +-
 utils/cec-follower/cec-tuner.cpp    | 46 +++++++++++++++++++----------
 3 files changed, 32 insertions(+), 18 deletions(-)

diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 00783d15..2488d2e8 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -296,7 +296,7 @@ void state_init(struct node &node)
 	node.state.sac_active = false;
 	node.state.volume = 50;
 	node.state.mute = false;
-	analog_tuner_init(&node.state);
+	tuner_dev_info_init(&node.state);
 }
 
 int main(int argc, char **argv)
diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index 2a9e397a..01357dc2 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -223,7 +223,7 @@ std::string opcode2s(const struct cec_msg *msg);
 void sad_encode(const struct short_audio_desc *sad, __u32 *descriptor);
 
 // cec-tuner.cpp
-void analog_tuner_init(struct state *state);
+void tuner_dev_info_init(struct state *state);
 void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me);
 
 // CEC processing
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index 760eed2a..8a75f0f5 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -11,6 +11,9 @@
 #define NUM_ANALOG_FREQS 3
 #define NUM_DIGITAL_CHANS 3
 #define TOT_ANALOG_FREQS (sizeof(analog_freqs_khz) / sizeof(analog_freqs_khz[0][0][0]))
+#define TOT_DIGITAL_CHANS ((sizeof(digital_arib_data) / sizeof(digital_arib_data[0][0][0])) + \
+			   (sizeof(digital_atsc_data) / sizeof(digital_atsc_data[0][0][0])) + \
+			   (sizeof(digital_dvb_data) / sizeof(digital_dvb_data[0][0][0])))
 
 struct service_info {
 	unsigned tsid;
@@ -229,19 +232,20 @@ static unsigned int analog_freqs_khz[3][9][NUM_ANALOG_FREQS] =
 	}
 };
 
-void analog_tuner_init(struct state *state)
+void tuner_dev_info_init(struct state *state)
 {
 	struct cec_op_tuner_device_info *info = &state->tuner_dev_info;
-	unsigned int freq_khz;
+	struct cec_op_digital_service_id *digital = &info->digital;
 
 	state->service_idx = 0;
 	info->rec_flag = CEC_OP_REC_FLAG_NOT_USED;
-	info->tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_ANALOGUE;
-	info->is_analog = true;
-	info->analog.ana_bcast_type = CEC_OP_ANA_BCAST_TYPE_CABLE;
-	info->analog.bcast_system = CEC_OP_BCAST_SYSTEM_PAL_BG;
-	freq_khz = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][0];
-	info->analog.ana_freq = (freq_khz * 10) / 625;
+	info->tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_DIGITAL;
+	info->is_analog = false;
+	digital->service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID;
+	digital->dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_BS;
+	digital->arib.transport_id = digital_arib_data[0][0][0].tsid;
+	digital->arib.service_id = digital_arib_data[0][0][0].sid;
+	digital->arib.orig_network_id = digital_arib_data[0][0][0].onid;
 }
 
 static int digital_get_service_offset(struct cec_op_digital_service_id *digital)
@@ -414,22 +418,24 @@ static unsigned int analog_get_nearest_service_idx(__u8 ana_bcast_type, __u8 ana
 			offset = i;
 		}
 	}
-	return NUM_ANALOG_FREQS * ((ana_bcast_type * 9) + ana_bcast_system) + offset;
+	return NUM_ANALOG_FREQS * ((ana_bcast_type * 9) + ana_bcast_system) +
+		offset + TOT_DIGITAL_CHANS;
 }
 
 static void analog_update_tuner_dev_info(struct node *node, unsigned int idx)
 {
 	struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
-	unsigned int tot_freqs = NUM_ANALOG_FREQS * 9;
+	unsigned int sys_freqs = NUM_ANALOG_FREQS * 9;
 	unsigned int offset;
 	unsigned int freq_khz;
 
 	node->state.service_idx = idx;
 	info->tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_ANALOGUE;
 	info->is_analog = true;
-	info->analog.ana_bcast_type = node->state.service_idx / tot_freqs;
+	info->analog.ana_bcast_type = (node->state.service_idx - TOT_DIGITAL_CHANS) / sys_freqs;
 	info->analog.bcast_system =
-		(node->state.service_idx - (tot_freqs * info->analog.ana_bcast_type)) / NUM_ANALOG_FREQS;
+		(node->state.service_idx -
+		 (sys_freqs * info->analog.ana_bcast_type + TOT_DIGITAL_CHANS)) / NUM_ANALOG_FREQS;
 	offset = node->state.service_idx % NUM_ANALOG_FREQS;
 	freq_khz = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][offset];
 	info->analog.ana_freq = (freq_khz * 10) / 625;
@@ -514,10 +520,14 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 			break;
 
 		if (node->state.service_idx == 0)
-			node->state.service_idx = TOT_ANALOG_FREQS - 1;
+			node->state.service_idx =
+				TOT_DIGITAL_CHANS + TOT_ANALOG_FREQS - 1;
 		else
 			node->state.service_idx--;
-		analog_update_tuner_dev_info(node, node->state.service_idx);
+		if (node->state.service_idx < TOT_DIGITAL_CHANS)
+			digital_update_tuner_dev_info(node, node->state.service_idx);
+		else
+			analog_update_tuner_dev_info(node, node->state.service_idx);
 		return;
 	}
 
@@ -525,11 +535,15 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
 			break;
 
-		if (node->state.service_idx == TOT_ANALOG_FREQS - 1)
+		if (node->state.service_idx ==
+				TOT_DIGITAL_CHANS + TOT_ANALOG_FREQS - 1)
 			node->state.service_idx = 0;
 		else
 			node->state.service_idx++;
-		analog_update_tuner_dev_info(node, node->state.service_idx);
+		if (node->state.service_idx < TOT_DIGITAL_CHANS)
+			digital_update_tuner_dev_info(node, node->state.service_idx);
+		else
+			analog_update_tuner_dev_info(node, node->state.service_idx);
 		return;
 	}
 
-- 
2.23.0
