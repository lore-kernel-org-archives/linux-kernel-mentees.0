From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Mon, 30 Sep 2019 22:18:23 -0500
Subject: [Linux-kernel-mentees] [PATCH v4 3/3] cec-compliance: add tuner
	control test
In-Reply-To: <20190930043017.474025-1-c0d1n61at3@gmail.com>
References: <20190930043017.474025-1-c0d1n61at3@gmail.com>
Message-ID: <20191001031823.312020-4-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20191001031823.Ycd_ouNG6oKex7tB6ZyMOwWhPHUxrEK1_w3ESiQ9JAk@z>

Add test for new features added to cec-follower.

Analog tuner control test tuner_ctl_test():
  - give analog tuner status
  - select tuner analog service
  - analog tuner step features

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 utils/cec-compliance/cec-test.cpp | 91 +++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index aece546c..17f72cc6 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -16,6 +16,7 @@
 #include <sys/ioctl.h>
 #include <config.h>
 #include <sstream>
+#include <vector>
 
 #include "cec-compliance.h"
 
@@ -722,6 +723,95 @@ static struct remote_subtest deck_ctl_subtests[] = {
   TODO: These are very rudimentary tests which should be expanded.
  */
 
+static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool interactive)
+{
+	struct cec_msg msg = {};
+	struct cec_op_tuner_device_info info = {};
+	std::vector<struct cec_op_tuner_device_info> info_vec;
+	__u16 start_freq;
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
+	fail_on_test(!transmit_timeout(node, &msg));
+	fail_on_test(timed_out(&msg));
+	if (unrecognized_op(&msg))
+		return NOTSUPPORTED;
+	if (refused(&msg))
+		return REFUSED;
+	cec_ops_tuner_device_status(&msg, &info);
+	start_freq = info.analog.ana_freq;
+	info_vec.push_back(info);
+
+	while (1) {
+		struct cec_op_tuner_device_info new_info;
+
+		cec_msg_init(&msg, me, la);
+		cec_msg_tuner_step_increment(&msg);
+		fail_on_test(!transmit_timeout(node, &msg));
+		if (unrecognized_op(&msg))
+			return NOTSUPPORTED;
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
+		cec_ops_tuner_device_status(&msg, &new_info);
+		if (new_info.analog.ana_freq == start_freq)
+			break;
+		if (new_info.analog.ana_freq == info_vec.back().analog.ana_freq) {
+			warn("Tuner channel step increment does not wrap.\n");
+			break;
+		}
+		info_vec.push_back(new_info);
+	}
+
+	
+	for (std::vector<struct cec_op_tuner_device_info>::iterator iter = info_vec.begin();
+			iter != info_vec.end(); iter++) {
+		struct cec_op_tuner_device_info current;
+
+		cec_msg_init(&msg, me, la);
+		cec_msg_select_analogue_service(&msg, iter->analog.ana_bcast_type,
+			iter->analog.ana_freq, iter->analog.bcast_system);
+		fail_on_test(!transmit_timeout(node, &msg));
+		if (unrecognized_op(&msg))
+			return NOTSUPPORTED;
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
+		fail_on_test(current.analog.ana_freq != iter->analog.ana_freq);
+		if (iter->is_analog) {
+			float freq_mhz = (iter->analog.ana_freq * 625) / 10000;
+			info("Analog channel freq: %.2f MHz\n", freq_mhz);
+		}
+	}
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_select_analogue_service(&msg, 3, 16000, 9);
+	fail_on_test(!transmit_timeout(node, &msg));
+	if (unrecognized_op(&msg))
+		return NOTSUPPORTED;
+	if (refused(&msg))
+		return REFUSED;
+	fail_on_test(!cec_msg_status_is_abort(&msg));
+	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
+
+	return 0;
+}
+
 static int tuner_ctl_give_status(struct node *node, unsigned me, unsigned la, bool interactive)
 {
 	struct cec_msg msg = {};
@@ -885,6 +975,7 @@ static int tuner_ctl_step_inc(struct node *node, unsigned me, unsigned la, bool
 }
 
 static struct remote_subtest tuner_ctl_subtests[] = {
+	{ "Tuner Control", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_test },
 	{ "Give Tuner Device Status", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_give_status },
 	{ "Select Analogue Service", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_sel_analog_service },
 	{ "Select Digital Service", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_sel_digital_service },
-- 
2.23.0
