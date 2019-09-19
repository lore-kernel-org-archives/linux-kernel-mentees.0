From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Wed, 18 Sep 2019 21:17:16 -0500
Subject: [Linux-kernel-mentees] [PATCH] cec-follower: fix cec-tuner.cpp
Message-ID: <20190919021716.259614-1-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190919021716.fVcA3RlbmVfy_ztTukSEhLm3wDmneX5YkHgL__Xaqqo@z>

Export code from cec-processing.cpp to cec-tuner.cpp so testing logic
does not break for PRESUMED_OK which replies on the feature abort
message.  Also needed it a boolean for broadcast messages that should
not be aborted.

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 utils/cec-follower/cec-processing.cpp |  4 +--
 utils/cec-follower/cec-tuner.cpp      | 37 +++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 15cedddf..c6ef1d09 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -608,7 +608,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 	case CEC_MSG_DECK_STATUS:
 		return;
 
-	/* Tuner Centric Messages */
+	/* Tuner/Record/Timer Messages */
 
 	case CEC_MSG_GIVE_TUNER_DEVICE_STATUS:
 	case CEC_MSG_TUNER_DEVICE_STATUS:
@@ -630,7 +630,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 	case CEC_MSG_TIMER_CLEARED_STATUS:
 	case CEC_MSG_TIMER_STATUS:
 		process_tuner_record_timer_msgs(node, msg, me);
-		break;
+		return;
 
 		/* Dynamic Auto Lipsync */
 
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index 5e794d71..bb727ae7 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -7,8 +7,40 @@
 
 #include "cec-follower.h"
 
+static void reply_feature_abort(struct node *node, struct cec_msg *msg, __u8 reason = CEC_OP_ABORT_UNRECOGNIZED_OP)
+{
+	unsigned la = cec_msg_initiator(msg);
+	__u8 opcode = cec_msg_opcode(msg);
+	__u64 ts_now = get_ts();
+
+	if (cec_msg_is_broadcast(msg) || cec_msg_initiator(msg) == CEC_LOG_ADDR_UNREGISTERED)
+		return;
+	if (reason == CEC_OP_ABORT_UNRECOGNIZED_OP) {
+		la_info[la].feature_aborted[opcode].count++;
+		if (la_info[la].feature_aborted[opcode].count == 2) {
+			/* If the Abort Reason was "Unrecognized opcode", the Initiator should not send
+			   the same message to the same Follower again at that time to avoid saturating
+			   the bus. */
+			warn("Received message %s from LA %d (%s) shortly after\n",
+				opcode2s(msg).c_str(), la, la2s(la));
+			warn("replying Feature Abort [Unrecognized Opcode] to the same message.\n");
+		}
+	}
+	else if (la_info[la].feature_aborted[opcode].count) {
+		warn("Replying Feature Abort with abort reason different than [Unrecognized Opcode]\n");
+		warn("to message that has previously been replied Feature Abort to with [Unrecognized Opcode].\n");
+	}
+	else
+		la_info[la].feature_aborted[opcode].ts = ts_now;
+
+	cec_msg_reply_feature_abort(msg, reason);
+	transmit(node, msg);
+}
+
 void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
 {
+	bool is_bcast = cec_msg_is_broadcast(&msg);
+
 	switch (msg.msg[1]) {
 
 
@@ -136,4 +168,9 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 	default:
 		break;
 	}
+
+	if (is_bcast)
+		return;
+
+	reply_feature_abort(node, &msg);
 }
-- 
2.23.0
