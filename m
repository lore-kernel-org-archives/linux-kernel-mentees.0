From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Sun, 29 Sep 2019 23:30:17 -0500
Subject: [Linux-kernel-mentees] [PATCH v3 3/3] cec-compliance: refactor
	tuner control tests
In-Reply-To: <20190924192445.93575-1-c0d1n61at3@gmail.com>
References: <20190924192445.93575-1-c0d1n61at3@gmail.com>
Message-ID: <20190930043017.474025-4-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190930043017.YcnOZoj66fjacDUvAbXSaR_u0Nk2UeBuqCEZnUttAY0@z>

Tests refactored for new features added to cec-collower.

Analog tuner control tests combined into tuner_ctl_test():
  - give analog tuner status
  - select tuner analog service
  - analog tuner step features

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 utils/cec-compliance/cec-test.cpp | 184 +++++++++---------------------
 1 file changed, 54 insertions(+), 130 deletions(-)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index aece546c..bdeb589f 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -722,9 +722,13 @@ static struct remote_subtest deck_ctl_subtests[] = {
   TODO: These are very rudimentary tests which should be expanded.
  */
 
-static int tuner_ctl_give_status(struct node *node, unsigned me, unsigned la, bool interactive)
+static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool interactive)
 {
 	struct cec_msg msg = {};
+	struct cec_op_tuner_device_info info = {};
+	struct cec_op_tuner_device_info data[81] = {};
+	int cnt = 0;
+	__u16 start_freq;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
@@ -734,163 +738,83 @@ static int tuner_ctl_give_status(struct node *node, unsigned me, unsigned la, bo
 		return NOTSUPPORTED;
 	if (refused(&msg))
 		return REFUSED;
-	if (cec_msg_status_is_abort(&msg))
-		return PRESUMED_OK;
-
-	return 0;
-}
+	cec_ops_tuner_device_status(&msg, &info);
+	start_freq = info.analog.ana_freq;
+	data[cnt++] = info;
 
-static int tuner_ctl_sel_analog_service(struct node *node, unsigned me, unsigned la, bool interactive)
-{
-	struct cec_msg msg = {};
+	while (1) {
+		struct cec_op_tuner_device_info *new_info =
+			(struct cec_op_tuner_device_info *)malloc(sizeof(struct cec_op_tuner_device_info));
 
-	node->remote[la].bcast_sys = ~0;
-	for (unsigned sys = 0; sys <= 8; sys++) {
 		cec_msg_init(&msg, me, la);
-		cec_msg_select_analogue_service(&msg, CEC_OP_ANA_BCAST_TYPE_CABLE,
-						7668, sys); // 479.25 MHz analog frequency
+		cec_msg_tuner_step_increment(&msg);
 		fail_on_test(!transmit_timeout(node, &msg));
 		if (unrecognized_op(&msg))
 			return NOTSUPPORTED;
-		if (abort_reason(&msg) == CEC_OP_ABORT_INVALID_OP) {
-			info("Tuner supports %s, but cannot select that service.\n",
-			     bcast_system2s(sys));
-			node->remote[la].bcast_sys = sys;
-			continue;
+		if (refused(&msg))
+			return REFUSED;
+		cec_msg_init(&msg, me, la);
+		cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
+		fail_on_test(!transmit_timeout(node, &msg));
+		fail_on_test(timed_out(&msg));
+		if (unrecognized_op(&msg))
+			return NOTSUPPORTED;
+		if (refused(&msg))
+			return REFUSED;
+		cec_ops_tuner_device_status(&msg, new_info);
+		if (new_info->analog.ana_freq == start_freq)
+			break;
+		if (new_info->analog.ana_freq == data[cnt - 1].analog.ana_freq) {
+			warn("Tuner channel step increment does not wrap.\n");
+			break;
 		}
-		if (cec_msg_status_is_abort(&msg))
-			continue;
-		info("Tuner supports %s\n", bcast_system2s(sys));
-		node->remote[la].bcast_sys = sys;
+		data[cnt] = *new_info;
+		cnt++;
 	}
 
-	if (node->remote[la].bcast_sys == (__u8)~0)
-		warn("No analog broadcast format supported\n");
-	else
-		return 0;
+	for (size_t i = 0; i < sizeof(data) / sizeof(data[0]); i++) {
+		info = data[i];
+		struct cec_op_tuner_device_info current;
 
-	return PRESUMED_OK;
-}
-
-static int tuner_ctl_sel_digital_service(struct node *node, unsigned me, unsigned la, bool interactive)
-{
-	struct cec_msg msg = {};
-	struct cec_op_digital_service_id digital_service_id = {};
-
-	digital_service_id.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_CHANNEL;
-	digital_service_id.channel.channel_number_fmt = CEC_OP_CHANNEL_NUMBER_FMT_1_PART;
-	digital_service_id.channel.minor = 1;
-
-	__u8 bcast_systems[] = {
-		CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_GEN,
-		CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_GEN,
-		CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_GEN,
-		CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_BS,
-		CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_CS,
-		CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_T,
-		CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_CABLE,
-		CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_SAT,
-		CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_T,
-		CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_C,
-		CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S,
-		CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S2,
-		CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_T,
-	};
-
-	node->remote[la].dig_bcast_sys = ~0;
-	for (unsigned i = 0; i < ARRAY_SIZE(bcast_systems); i++) {
-		__u8 sys = bcast_systems[i];
-
-		digital_service_id.dig_bcast_system = sys;
 		cec_msg_init(&msg, me, la);
-		cec_msg_select_digital_service(&msg, &digital_service_id);
+		cec_msg_select_analogue_service(&msg, info.analog.ana_bcast_type,
+			info.analog.ana_freq, info.analog.bcast_system);
 		fail_on_test(!transmit_timeout(node, &msg));
 		if (unrecognized_op(&msg))
 			return NOTSUPPORTED;
-		if (abort_reason(&msg) == CEC_OP_ABORT_INVALID_OP) {
-			info("Tuner supports %s, but cannot select that service.\n",
-			     dig_bcast_system2s(sys));
-			node->remote[la].dig_bcast_sys = sys;
-			continue;
+		if (refused(&msg))
+			return REFUSED;
+		cec_msg_init(&msg, me, la);
+		cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
+		fail_on_test(!transmit_timeout(node, &msg));
+		fail_on_test(timed_out(&msg));
+		if (unrecognized_op(&msg))
+			return NOTSUPPORTED;
+		if (refused(&msg))
+			return REFUSED;
+		cec_ops_tuner_device_status(&msg, &current);
+		fail_on_test(current.analog.ana_freq != info.analog.ana_freq);
+		if (info.is_analog) {
+			float freq_mhz = (info.analog.ana_freq * 625) / 10000;
+			info("Analog channel freq: %.2f MHz\n", freq_mhz);
 		}
-		if (cec_msg_status_is_abort(&msg))
-			continue;
-		info("Tuner supports %s\n", dig_bcast_system2s(sys));
-		node->remote[la].dig_bcast_sys = sys;
 	}
 
-	if (node->remote[la].dig_bcast_sys == (__u8)~0)
-		warn("No digital broadcast system supported\n");
-	else
-		return 0;
-
-	return PRESUMED_OK;
-}
-
-static int tuner_ctl_tuner_dev_status(struct node *node, unsigned me, unsigned la, bool interactive)
-{
-	struct cec_msg msg = {};
-	struct cec_op_tuner_device_info tuner_dev_info = {};
-
-	tuner_dev_info.rec_flag = CEC_OP_REC_FLAG_NOT_USED;
-	tuner_dev_info.tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_NONE;
-	tuner_dev_info.is_analog = false;
-	tuner_dev_info.digital.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_CHANNEL;
-	tuner_dev_info.digital.dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_C;
-	tuner_dev_info.digital.channel.channel_number_fmt = CEC_OP_CHANNEL_NUMBER_FMT_1_PART;
-	tuner_dev_info.digital.channel.minor = 1;
-
 	cec_msg_init(&msg, me, la);
-
-	cec_msg_tuner_device_status(&msg, &tuner_dev_info);
+	cec_msg_select_analogue_service(&msg, 3, 16000, 9);
 	fail_on_test(!transmit_timeout(node, &msg));
 	if (unrecognized_op(&msg))
 		return NOTSUPPORTED;
 	if (refused(&msg))
 		return REFUSED;
-	if (cec_msg_status_is_abort(&msg))
-		return PRESUMED_OK;
+	fail_on_test(!cec_msg_status_is_abort(&msg));
+	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
 
 	return 0;
 }
 
-static int tuner_ctl_step_dec(struct node *node, unsigned me, unsigned la, bool interactive)
-{
-	struct cec_msg msg = {};
-
-	cec_msg_init(&msg, me, la);
-	cec_msg_tuner_step_decrement(&msg);
-	fail_on_test(!transmit_timeout(node, &msg));
-	if (unrecognized_op(&msg))
-		return NOTSUPPORTED;
-	if (refused(&msg))
-		return REFUSED;
-
-	return PRESUMED_OK;
-}
-
-static int tuner_ctl_step_inc(struct node *node, unsigned me, unsigned la, bool interactive)
-{
-	struct cec_msg msg = {};
-
-	cec_msg_init(&msg, me, la);
-	cec_msg_tuner_step_increment(&msg);
-	fail_on_test(!transmit_timeout(node, &msg));
-	if (unrecognized_op(&msg))
-		return NOTSUPPORTED;
-	if (refused(&msg))
-		return REFUSED;
-
-	return PRESUMED_OK;
-}
-
 static struct remote_subtest tuner_ctl_subtests[] = {
-	{ "Give Tuner Device Status", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_give_status },
-	{ "Select Analogue Service", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_sel_analog_service },
-	{ "Select Digital Service", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_sel_digital_service },
-	{ "Tuner Device Status", CEC_LOG_ADDR_MASK_ALL, tuner_ctl_tuner_dev_status },
-	{ "Tuner Step Decrement", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_step_dec },
-	{ "Tuner Step Increment", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_step_inc },
+	{ "Tuner Control", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_test },
 };
 
 
-- 
2.23.0
