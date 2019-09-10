From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Tue, 10 Sep 2019 14:34:58 -0500
Subject: [Linux-kernel-mentees] [PATCH v2] cec-compliance: system audio
	control
In-Reply-To: <20190909202030.82287-1-c0d1n61at3@gmail.com>
References: <20190909202030.82287-1-c0d1n61at3@gmail.com>
Message-ID: <20190910193458.53210-2-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190910193458.3ysgMk2Gonm2chZ1jYIgdYupa0vFKZE5FdHnzlZBO1A@z>

Add comment block documenting tests not included from section 13.15 of
the CEC 1.4b specification.  This section outlines the System Audio
Control feature.

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 utils/cec-compliance/cec-test-audio.cpp | 29 +++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
index 2bc24daf..14f1d122 100644
--- a/utils/cec-compliance/cec-test-audio.cpp
+++ b/utils/cec-compliance/cec-test-audio.cpp
@@ -309,6 +309,35 @@ const unsigned arc_subtests_size = ARRAY_SIZE(arc_subtests);
 
 /* System Audio Control */
 
+/*
+ * The following scenarios are defined in section 13.15 of the CEC 1.4b
+ * specification where the amplifier provides the audio for a source that
+ * is being displayed on a TV.
+ *
+ * 1.  Amplifier initiated <System Audio Mode Request> and active source
+ *     discovery with a <Request Active Source> broadcast plus the
+ *     <Active Source> response.
+ * 2.  Post discovery, subsequent amplifier <Set System Audio Mode> [On]
+ *     and System Audio Control feature confirmation with TV.
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
+ * 8.  Optional features in subsection 13.15.4 of version 1.4b.
+ * 9.  <Request Audio Descriptor> message is from version 1.4 so older versions
+ *     report <Feature Abort>.
+ * 10. <Report Audio Descriptor> message is from version 1.4 so older versions
+ *     report <Feature Abort>.
+ * 11. System Audio Control is from version 1.3a so older versions report
+ *     <Feature Abort>.
+ */
+
 static int sac_request_sad_probe(struct node *node, unsigned me, unsigned la, bool interactive)
 {
 	struct cec_msg msg = {};
-- 
2.23.0
