From: c0d1n61at3 at gmail.com (Jiunn Chang)
Date: Sun, 29 Sep 2019 23:30:15 -0500
Subject: [Linux-kernel-mentees] [PATCH v3 1/3] cec-follower: fix bugs for
	tuner emulation
In-Reply-To: <20190924192445.93575-1-c0d1n61at3@gmail.com>
References: <20190924192445.93575-1-c0d1n61at3@gmail.com>
Message-ID: <20190930043017.474025-2-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Fix some typos for tuner emulation:
  - analog_tuner_init() store ana_freq in hex
  - analog_get_nearest_freq() temp variable check

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 utils/cec-follower/cec-tuner.cpp | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index acc3fd00..2f6e3425 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -92,13 +92,15 @@ static unsigned int analog_freqs_khz[3][9][NUM_ANALOG_FREQS] =
 
 void analog_tuner_init(struct cec_op_tuner_device_info *info)
 {
+	unsigned int freq_khz =
+		analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][0];
+
 	info->rec_flag = CEC_OP_REC_FLAG_NOT_USED;
 	info->tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_ANALOGUE;
 	info->is_analog = true;
 	info->analog.ana_bcast_type = CEC_OP_ANA_BCAST_TYPE_CABLE;
 	info->analog.bcast_system = CEC_OP_BCAST_SYSTEM_PAL_BG;
-	info->analog.ana_freq =
-		analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][0];
+	info->analog.ana_freq = (freq_khz * 10) / 625;
 }
 
 static unsigned int analog_get_nearest_freq(__u8 ana_bcast_type, __u8 ana_bcast_system,
@@ -123,7 +125,7 @@ static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
 	__u8 system;
 
 	cec_ops_select_analogue_service(msg, &type, &freq, &system);
-	if (info->analog.ana_bcast_type < 3 && info->analog.bcast_system < 9) {
+	if (type < 3 && system < 9) {
 		int freq_khz = (freq * 625) / 10;
 		unsigned int nearest = analog_get_nearest_freq(type, system,
 							       freq_khz);
-- 
2.23.0
