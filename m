From: c0d1n61at3 at gmail.com (Jiunn Chang)
Date: Mon,  9 Sep 2019 15:20:30 -0500
Subject: [Linux-kernel-mentees] [PATCH] cec-compliance: system audio control
Message-ID: <20190909202030.82287-1-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Add comment block documenting tests not included from section 13.15 of
the HDMI CEC 1.4b specification.  This section outlines the System Audio
Control feature.

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 utils/cec-compliance/cec-test-audio.cpp | 30 +++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
index 2bc24daf..e0cdb9dc 100644
--- a/utils/cec-compliance/cec-test-audio.cpp
+++ b/utils/cec-compliance/cec-test-audio.cpp
@@ -309,6 +309,36 @@ const unsigned arc_subtests_size = ARRAY_SIZE(arc_subtests);
 
 /* System Audio Control */
 
+/**
+ * The following scenarios defined in section 13.15 of the HDMI CEC 1.4b
+ * specification are not currently tested:
+ *
+ * 1.  Amplifier initiated <System Audio Mode Request> and active source
+ *     discovery with a <Request Active Source> broadcast plus the
+ *     <Active Source> response.
+ * 2.  Post discovery, amplifier subsequent <Set System Audio Mode> [On]
+ *     and System Audio Control feature support confirmation with TV if
+ *     present.
+ * 3.  Amplifier broadcasts <Set System Audio Mode> [On] to mute the TV and
+ *     unmute amplifier.
+ * 4.  Amplifier broadcasts <Set System Audio Mode> [Off] to unmute the TV
+ *     and mute the amplifier.
+ * 5.  When System Audio Mode is On, muting and unmuting an amplifier sends
+ *     a <Report Audio Status> message to the TV.
+ * 6.  When System Audio Mode is On, the amplifier sends a <Set System Audio
+ *     Mode> [Off] to unmute the TV before going into standby.
+ * 7.  When System Audio Mode is On, only the amplifier can control system
+ *     volume.
+ * 8.  Optional features defined in subsection 13.15.4 of the HDMI CEC 1.4b
+ *     specifictation.
+ * 9.  <Request Audio Descriptor> message is new since HDMI CEC 1.4 so 1.3a
+ *     or earlier devices report <Feature Abort> for this feature.
+ * 10. <Report Audio Descriptor> message is new since HDMI CEC 1.4 so 1.3a
+ *     or earlier devices report <Feature Abort> for this feature.
+ * 11. System Audio Control is new since HDMI CEC 1.3a so 1.3 and earlier
+ *     devices report <Feature Abort> for this feature.
+ */
+
 static int sac_request_sad_probe(struct node *node, unsigned me, unsigned la, bool interactive)
 {
 	struct cec_msg msg = {};
-- 
2.23.0
