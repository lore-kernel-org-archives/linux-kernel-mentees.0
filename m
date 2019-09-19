From: c0d1n61at3 at gmail.com (Jiunn Chang)
Date: Thu, 19 Sep 2019 12:47:00 -0500
Subject: [Linux-kernel-mentees] [PATCH v2] cec-follower: fix cec-tuner.cpp
In-Reply-To: <20190919021716.259614-1-c0d1n61at3@gmail.com>
References: <20190919021716.259614-1-c0d1n61at3@gmail.com>
Message-ID: <20190919174702.140335-1-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Remove static from reply_feature_abort() in cec-processing.cpp so
it can be used in cec-tuner.cpp.  This is maintain testing logic
for PRESUMED_OK which replies on the feature abort message.  Also
needed is a boolean for broadcast messages that should not be
aborted.

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---

Changes made since v1:
  - Remove reply_feature_abort() from cec-tuner.cpp
  - Remove static from reply_feature_abort() in cec-processing.cpp
  - Add prototype for reply_feature_abort() in cec-follower.h

---
 utils/cec-follower/cec-follower.h     | 1 +
 utils/cec-follower/cec-processing.cpp | 6 +++---
 utils/cec-follower/cec-tuner.cpp      | 7 +++++++
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index 9f5f1be4..03b52217 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -223,6 +223,7 @@ void sad_encode(const struct short_audio_desc *sad, __u32 *descriptor);
 void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me);
 
 // CEC processing
+void reply_feature_abort(struct node *node, struct cec_msg *msg, __u8 reason = CEC_OP_ABORT_UNRECOGNIZED_OP);
 void testProcessing(struct node *node, bool wallclock);
 
 // cec-log.c
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 15cedddf..3db88f1a 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -211,7 +211,7 @@ static void log_event(struct cec_event &ev, bool wallclock)
 		printf("\tTimestamp: %s\n", ts2s(ev.ts, wallclock).c_str());
 }
 
-static void reply_feature_abort(struct node *node, struct cec_msg *msg, __u8 reason = CEC_OP_ABORT_UNRECOGNIZED_OP)
+void reply_feature_abort(struct node *node, struct cec_msg *msg, __u8 reason)
 {
 	unsigned la = cec_msg_initiator(msg);
 	__u8 opcode = cec_msg_opcode(msg);
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
index 5e794d71..a1e349bd 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -9,6 +9,8 @@
 
 void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
 {
+	bool is_bcast = cec_msg_is_broadcast(&msg);
+
 	switch (msg.msg[1]) {
 
 
@@ -136,4 +138,9 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
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
