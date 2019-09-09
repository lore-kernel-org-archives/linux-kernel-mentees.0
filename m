From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Mon,  9 Sep 2019 10:07:05 -0500
Subject: [Linux-kernel-mentees] [PATCH] cec-compliance: system information
	give features
Message-ID: <20190909150705.38206-1-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190909150705.mQvhcjrkwhyn1KwhDorJLwcyvtfrgy-_aACImz2qJKQ@z>

For devices on a HDMI ARC link, sources can only receive ARC
and sinks can only transmit ARC.

Add two checks:
 - Playback devices can only receive ARC, i.e. source_has_arc_rx
 - TVs can only transmit ARC, i.e. sink_has_arc_tx

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 utils/cec-compliance/cec-test.cpp | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index bbd13989..aece546c 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -172,6 +172,10 @@ int system_info_give_features(struct node *node, unsigned me, unsigned la, bool
 		return fail("Only Playback and Recording devices shall set the Supports Deck Control bit\n");
 	if (!cec_has_tv(1 << la) && node->remote[la].has_rec_tv)
 		return fail("Only TVs shall set the Record TV Screen bit\n");
+	if (cec_has_playback(1 << la) && node->remote[la].sink_has_arc_tx)
+		return fail("A Playback device cannot set the Sink Supports ARC Tx bit\n");
+	if (cec_has_tv(1 << la) && node->remote[la].source_has_arc_rx)
+		return fail("A TV cannot set the Source Supports ARC Rx bit\n");
 
 	fail_on_test(node->remote[la].rc_profile != *rc_profile);
 	fail_on_test(node->remote[la].dev_features != *dev_features);
-- 
2.23.0
