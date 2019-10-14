From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Sun, 13 Oct 2019 23:17:21 -0500
Subject: [Linux-kernel-mentees] [PATCH 8/8] cec-compliance: add digital
	tuner control testing
In-Reply-To: <20191014041721.52025-1-c0d1n61at3@gmail.com>
References: <20191014041721.52025-1-c0d1n61at3@gmail.com>
Message-ID: <20191014041721.52025-9-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20191014041721.X-Uiz44_67eWw4JnLuJbUZNLQxhql_XY_MS2ShcAza0@z>

tuner_ctl_test() will now test both digital and analog services.  There
are a total of 98 channels, 18 digital and 81 analog with digital
proceeding analog.

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 utils/cec-compliance/cec-test.cpp | 50 +++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 1fd0ea92..bc89c317 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -769,8 +769,11 @@ static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool inte
 	for (std::vector<struct cec_op_tuner_device_info>::iterator iter = info_vec.begin();
 			iter != info_vec.end(); iter++) {
 		cec_msg_init(&msg, me, la);
-		cec_msg_select_analogue_service(&msg, iter->analog.ana_bcast_type,
-			iter->analog.ana_freq, iter->analog.bcast_system);
+		if (iter->is_analog)
+			cec_msg_select_analogue_service(&msg, iter->analog.ana_bcast_type,
+				iter->analog.ana_freq, iter->analog.bcast_system);
+		else
+			cec_msg_select_digital_service(&msg, &iter->digital);
 		fail_on_test(!transmit_timeout(node, &msg));
 		fail_on_test(cec_msg_status_is_abort(&msg));
 		cec_msg_init(&msg, me, la);
@@ -784,6 +787,39 @@ static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool inte
 			double freq_mhz = (iter->analog.ana_freq * 625) / 10000.0;
 
 			info("Analog channel freq: %.2f MHz\n", freq_mhz);
+		} else {
+			__u8 system = iter->digital.dig_bcast_system;
+
+			switch (system) {
+			case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_BS:
+			case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_T: {
+				__u16 tsid = iter->digital.arib.transport_id;
+				__u16 sid = iter->digital.arib.service_id;
+				__u16 onid = iter->digital.arib.orig_network_id;
+
+				info("ARIB digital channel TSID: %u, SID: %u, ONID: %u", tsid, sid, onid);
+				break;
+			}
+			case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_SAT:
+			case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_T: {
+				__u16 tsid = iter->digital.atsc.transport_id;
+				__u16 pn = iter->digital.atsc.program_number;
+
+				info("ATSC digital channel TSID: %u, Program Number: %u", tsid, pn);
+				break;
+			}
+			case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S2:
+			case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_T: {
+				__u16 tsid = iter->digital.dvb.transport_id;
+				__u16 sid = iter->digital.dvb.service_id;
+				__u16 onid = iter->digital.dvb.orig_network_id;
+
+				info("DVB digital channel TSID: %u, SID: %u, ONID: %u", tsid, sid, onid);
+				break;
+			}
+			default:
+				break;
+			}
 		}
 	}
 
@@ -792,6 +828,16 @@ static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool inte
 	fail_on_test(!transmit_timeout(node, &msg));
 	fail_on_test(!cec_msg_status_is_abort(&msg));
 	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
+	cec_msg_init(&msg, me, la);
+	info.digital.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID;
+	info.digital.dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S2;
+	info.digital.dvb.transport_id = 0;
+	info.digital.dvb.service_id = 0;
+	info.digital.dvb.orig_network_id = 0;
+	cec_msg_select_digital_service(&msg, &info.digital);
+	fail_on_test(!transmit_timeout(node, &msg));
+	fail_on_test(!cec_msg_status_is_abort(&msg));
+	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
 
 	return 0;
 }
-- 
2.23.0
