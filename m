From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Sun, 13 Oct 2019 23:17:19 -0500
Subject: [Linux-kernel-mentees] [PATCH 6/8] cec-follower: add tuner digital
	service emulation
In-Reply-To: <20191014041721.52025-1-c0d1n61at3@gmail.com>
References: <20191014041721.52025-1-c0d1n61at3@gmail.com>
Message-ID: <20191014041721.52025-7-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20191014041719.MenKRmzCuOhaDMLy3DQ8pP5kUrf55OHj49ZcI0HSUnc@z>

The cec-follower will now emulate a digital service.  This allows an
initiator device can directly select a digital service by choosing a
digital service ID method and broadcast system along with the proper
digital IDs or channel data.  After a digital service is selected,
the cec-follower will also provide the tuner device status upon
request.

Opcodes implemented:
  - <Select Digital Service>

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 utils/cec-follower/cec-tuner.cpp | 169 +++++++++++++++++++++++++++++++
 1 file changed, 169 insertions(+)

diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index 04e7e4c3..760eed2a 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -244,6 +244,162 @@ void analog_tuner_init(struct state *state)
 	info->analog.ana_freq = (freq_khz * 10) / 625;
 }
 
+static int digital_get_service_offset(struct cec_op_digital_service_id *digital)
+{
+	__u8 method = digital->service_id_method;
+	struct cec_op_dvb_data *dvb = &digital->dvb;
+	struct cec_op_atsc_data *atsc = &digital->atsc;
+	struct cec_op_channel_data *channel = &digital->channel;
+	unsigned int sys =
+		(digital->dig_bcast_system == CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_T ||
+		 digital->dig_bcast_system == CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_T ||
+		 digital->dig_bcast_system == CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_T) ? 1 : 0;
+
+	for (int i = 0; i < NUM_DIGITAL_CHANS; i++) {
+		switch (method) {
+		case CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID:
+			if (dvb->transport_id == digital_arib_data[sys][0][i].tsid &&
+			    dvb->service_id == digital_arib_data[sys][0][i].sid &&
+			    dvb->orig_network_id == digital_arib_data[sys][0][i].onid) {
+				return (sys * NUM_DIGITAL_CHANS) + i;
+			}
+			if (atsc->transport_id == digital_atsc_data[sys][0][i].tsid &&
+			    atsc->program_number == digital_atsc_data[sys][0][i].sid) {
+				return (sys * NUM_DIGITAL_CHANS) + i;
+			}
+			if (dvb->transport_id == digital_dvb_data[sys][0][i].tsid &&
+			    dvb->service_id == digital_dvb_data[sys][0][i].sid &&
+			    dvb->orig_network_id == digital_dvb_data[sys][0][i].onid) {
+				return (sys * NUM_DIGITAL_CHANS) + i;
+			}
+			break;
+		case CEC_OP_SERVICE_ID_METHOD_BY_CHANNEL:
+			if (channel->minor == digital_arib_data[sys][0][i].minor) {
+				return (sys * NUM_DIGITAL_CHANS) + i;
+			}
+			if (channel->major == digital_atsc_data[sys][0][i].major &&
+			    channel->minor == digital_atsc_data[sys][0][i].minor) {
+				return (sys * NUM_DIGITAL_CHANS) + i;
+			}
+			if (channel->minor == digital_dvb_data[sys][0][i].minor) {
+				return (sys * NUM_DIGITAL_CHANS) + i;
+			}
+			break;
+		default:
+			break;
+		}
+	}
+	return -1;
+}
+
+static int digital_get_service_idx(struct cec_op_digital_service_id *digital)
+{
+	__u8 system = digital->dig_bcast_system;
+	int offset = digital_get_service_offset(digital);
+
+	switch (system) {
+	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_BS:
+	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_T:
+		return offset;
+	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_SAT:
+	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_T: {
+		return offset == -1 ? offset : NUM_DIGITAL_CHANS * 2 + offset;
+	}
+	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S2:
+	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_T: {
+		return offset == -1 ? offset : NUM_DIGITAL_CHANS * 4 + offset;
+	}
+	default:
+		break;
+	}
+	return -1;
+}
+
+static void digital_update_tuner_dev_info(struct node *node, unsigned int idx,
+					  __u8 method = CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID)
+{
+	struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
+	struct cec_op_digital_service_id *digital = &info->digital;
+	struct cec_op_dvb_data *dvb = &digital->dvb;
+	struct cec_op_atsc_data *atsc = &digital->atsc;
+	struct cec_op_channel_data *channel = &digital->channel;
+	unsigned int tbl = idx / (NUM_DIGITAL_CHANS * 2);
+	unsigned int sys = (idx % (NUM_DIGITAL_CHANS * 2)) / NUM_DIGITAL_CHANS;
+	unsigned int offset = idx % NUM_DIGITAL_CHANS;
+
+	node->state.service_idx = idx;
+	info->tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_DIGITAL;
+	info->is_analog = false;
+	digital->service_id_method = method;
+	switch (tbl) {
+	case 0: {
+		if (sys)
+			digital->dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_T;
+		else
+			digital->dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_BS;
+		if (digital->service_id_method) {
+			channel->channel_number_fmt = digital_arib_data[sys][0][offset].fmt;
+			channel->major = digital_arib_data[sys][0][offset].major;
+			channel->minor = digital_arib_data[sys][0][offset].minor;
+		} else {
+			dvb->transport_id = digital_arib_data[sys][0][offset].tsid;
+			dvb->orig_network_id = digital_arib_data[sys][0][offset].onid;
+			dvb->service_id = digital_arib_data[sys][0][offset].sid;
+		}
+		break;
+	}
+	case 1: {
+		if (sys)
+			digital->dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_T;
+		else
+			digital->dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_SAT;
+		if (digital->service_id_method) {
+			channel->channel_number_fmt = digital_atsc_data[sys][0][offset].fmt;
+			channel->major = digital_atsc_data[sys][0][offset].major;
+			channel->minor = digital_atsc_data[sys][0][offset].minor;
+		} else {
+			atsc->transport_id = digital_atsc_data[sys][0][offset].tsid;
+			atsc->program_number = digital_atsc_data[sys][0][offset].sid;
+		}
+		break;
+	}
+	case 2: {
+		if (sys)
+			digital->dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_T;
+		else
+			digital->dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S2;
+		if (digital->service_id_method) {
+			channel->channel_number_fmt = digital_dvb_data[sys][0][offset].fmt;
+			channel->major = digital_dvb_data[sys][0][offset].major;
+			channel->minor = digital_dvb_data[sys][0][offset].minor;
+		} else {
+			dvb->transport_id = digital_dvb_data[sys][0][offset].tsid;
+			dvb->orig_network_id = digital_dvb_data[sys][0][offset].onid;
+			dvb->service_id = digital_dvb_data[sys][0][offset].sid;
+		}
+		break;
+	}
+	default:
+		break;
+	}
+}
+
+static bool digital_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
+{
+	struct cec_op_digital_service_id digital = {};
+	__u8 method;
+	int idx;
+
+	cec_ops_select_digital_service(msg, &digital);
+	method = digital.service_id_method;
+	idx = digital_get_service_idx(&digital);
+	if (idx > -1) {
+		digital_update_tuner_dev_info(node, idx, method);
+		return true;
+	}
+	return false;
+}
+
 static unsigned int analog_get_nearest_service_idx(__u8 ana_bcast_type, __u8 ana_bcast_system,
 						   int ana_freq_khz)
 {
@@ -340,6 +496,19 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		return;
 
 	case CEC_MSG_SELECT_DIGITAL_SERVICE:
+		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
+			break;
+
+		if (node->state.tuner_dev_info.rec_flag == CEC_OP_REC_FLAG_USED) {
+			reply_feature_abort(node, &msg, CEC_OP_ABORT_REFUSED);
+			return;
+		}
+		if (!digital_set_tuner_dev_info(node, &msg)) {
+			reply_feature_abort(node, &msg, CEC_OP_ABORT_INVALID_OP);
+			return;
+		}
+		return;
+
 	case CEC_MSG_TUNER_STEP_DECREMENT: {
 		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
 			break;
-- 
2.23.0
