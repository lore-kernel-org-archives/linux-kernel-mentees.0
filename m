From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Wed, 11 Sep 2019 08:00:20 -0500
Subject: [Linux-kernel-mentees] [PATCH v3] cec-compliance: system audio
	control
In-Reply-To: <20190910193458.53210-2-c0d1n61at3@gmail.com>
References: <20190910193458.53210-2-c0d1n61at3@gmail.com>
Message-ID: <20190911130020.5547-1-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190911130020.1zWKP9j5OkIQnb14IRihrfIKFxwNnLV_T5dVZA7UlIU@z>

Add comment block documenting tests not included from section 13.15 of
the CEC 1.4b specification.  This section outlines the System Audio
Control feature.

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 utils/cec-compliance/cec-test-audio.cpp | 38 +++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
index 2bc24daf..55315439 100644
--- a/utils/cec-compliance/cec-test-audio.cpp
+++ b/utils/cec-compliance/cec-test-audio.cpp
@@ -309,6 +309,44 @@ const unsigned arc_subtests_size = ARRAY_SIZE(arc_subtests);
 
 /* System Audio Control */
 
+/*
+ * The following scenarios are defined in section 13.15 of the CEC 1.4
+ * specification.
+ *
+ * These are not tested as they need three CEC devices.  An amplifier
+ * provides the audio for a source that is being displayed on a TV.
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
+ *
+ * These are not tested as they are hard-to-test corner cases.
+ *
+ * 1.  Optional features in subsection 13.15.4 of version 1.4.
+ *
+ * These are not tested as they deal with 1.3a or older versions and is not
+ * worth spending time on.
+ *
+ * 1.  <Request Audio Descriptor> message is from version 1.4 so older versions
+ *     report <Feature Abort>.
+ * 2.  <Report Audio Descriptor> message is from version 1.4 so older versions
+ *     report <Feature Abort>.
+ * 3.  System Audio Control is from version 1.3a so older versions report
+ *     <Feature Abort>.
+ */
+
 static int sac_request_sad_probe(struct node *node, unsigned me, unsigned la, bool interactive)
 {
 	struct cec_msg msg = {};
-- 
2.23.0
