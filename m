From: c0d1n61at3 at gmail.com (Jiunn Chang)
Date: Sun, 13 Oct 2019 23:17:15 -0500
Subject: [Linux-kernel-mentees] [PATCH 2/8] cec-follower: rename freq_idx to
	service_idx
In-Reply-To: <20191014041721.52025-1-c0d1n61at3@gmail.com>
References: <20191014041721.52025-1-c0d1n61at3@gmail.com>
Message-ID: <20191014041721.52025-3-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

The implementation of digital support in tuner control requires the
renaming of freq_idx to service_idx as analog and digital channels
are referred to collectively as services.  The index will now represent
the current state of both analog and digital.  Tuner step features will
cycle through both analog and digital with digital preceeding analog.

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 utils/cec-follower/cec-follower.h |  2 +-
 utils/cec-follower/cec-tuner.cpp  | 32 +++++++++++++++----------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index fc335b14..2a9e397a 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -53,7 +53,7 @@ struct state {
 	unsigned rc_press_hold_count;
 	unsigned rc_duration_sum;
 	struct cec_op_tuner_device_info tuner_dev_info;
-	unsigned int freq_idx;
+	unsigned int service_idx;
 };
 
 struct node {
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index b3b20b89..3a71a890 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -96,7 +96,7 @@ void analog_tuner_init(struct state *state)
 	struct cec_op_tuner_device_info *info = &state->tuner_dev_info;
 	unsigned int freq_khz;
 
-	state->freq_idx = 0;
+	state->service_idx = 0;
 	info->rec_flag = CEC_OP_REC_FLAG_NOT_USED;
 	info->tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_ANALOGUE;
 	info->is_analog = true;
@@ -106,8 +106,8 @@ void analog_tuner_init(struct state *state)
 	info->analog.ana_freq = (freq_khz * 10) / 625;
 }
 
-static unsigned int analog_get_nearest_freq_idx(__u8 ana_bcast_type, __u8 ana_bcast_system,
-						int ana_freq_khz)
+static unsigned int analog_get_nearest_service_idx(__u8 ana_bcast_type, __u8 ana_bcast_system,
+						   int ana_freq_khz)
 {
 	int nearest = analog_freqs_khz[ana_bcast_type][ana_bcast_system][0];
 	unsigned int offset = 0;
@@ -130,13 +130,13 @@ static void analog_update_tuner_dev_info(struct node *node, unsigned int idx)
 	unsigned int offset;
 	unsigned int freq_khz;
 
-	node->state.freq_idx = idx;
+	node->state.service_idx = idx;
 	info->tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_ANALOGUE;
 	info->is_analog = true;
-	info->analog.ana_bcast_type = node->state.freq_idx / tot_freqs;
+	info->analog.ana_bcast_type = node->state.service_idx / tot_freqs;
 	info->analog.bcast_system =
-		(node->state.freq_idx - (tot_freqs * info->analog.ana_bcast_type)) / NUM_ANALOG_FREQS;
-	offset = node->state.freq_idx % NUM_ANALOG_FREQS;
+		(node->state.service_idx - (tot_freqs * info->analog.ana_bcast_type)) / NUM_ANALOG_FREQS;
+	offset = node->state.service_idx % NUM_ANALOG_FREQS;
 	freq_khz = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][offset];
 	info->analog.ana_freq = (freq_khz * 10) / 625;
 }
@@ -152,7 +152,7 @@ static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
 	if (type < 3 && system < 9) {
 		int freq_khz = (freq * 625) / 10;
 
-		idx = analog_get_nearest_freq_idx(type, system, freq_khz);
+		idx = analog_get_nearest_service_idx(type, system, freq_khz);
 		analog_update_tuner_dev_info(node, idx);
 		return true;
 	}
@@ -206,11 +206,11 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
 			break;
 
-		if (node->state.freq_idx == 0)
-			node->state.freq_idx = TOT_ANALOG_FREQS - 1;
+		if (node->state.service_idx == 0)
+			node->state.service_idx = TOT_ANALOG_FREQS - 1;
 		else
-			node->state.freq_idx--;
-		analog_update_tuner_dev_info(node, node->state.freq_idx);
+			node->state.service_idx--;
+		analog_update_tuner_dev_info(node, node->state.service_idx);
 		return;
 	}
 
@@ -218,11 +218,11 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
 			break;
 
-		if (node->state.freq_idx == TOT_ANALOG_FREQS - 1)
-			node->state.freq_idx = 0;
+		if (node->state.service_idx == TOT_ANALOG_FREQS - 1)
+			node->state.service_idx = 0;
 		else
-			node->state.freq_idx++;
-		analog_update_tuner_dev_info(node, node->state.freq_idx);
+			node->state.service_idx++;
+		analog_update_tuner_dev_info(node, node->state.service_idx);
 		return;
 	}
 
-- 
2.23.0
