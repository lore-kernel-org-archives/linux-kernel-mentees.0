From: c0d1n61at3 at gmail.com (Jiunn Chang)
Date: Thu,  5 Sep 2019 22:51:28 -0500
Subject: [Linux-kernel-mentees] [PATCH] cec-compliance: audio return channel
	tests
Message-ID: <20190906035129.18447-1-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

For devices on a HDMI ARC link, sinks can only support transmitter
devices and sources and only support receiver devices.

This patch checks to see if the DUT is an transmitter or receiver and
has the ARC flag set properly from the device.

This should apply to devices that support the HDMI CEC 1.4 spec going
forward when ARC was introduced.

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 utils/cec-compliance/cec-test-audio.cpp | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
index 872bb9ad..da2ed1d1 100644
--- a/utils/cec-compliance/cec-test-audio.cpp
+++ b/utils/cec-compliance/cec-test-audio.cpp
@@ -297,11 +297,35 @@ static int arc_terminate_rx(struct node *node, unsigned me, unsigned la, bool in
 	return 0;
 }
 
+static int arc_sink_tx(struct node *node, unsigned me, unsigned la, bool interactive)
+{
+	/* Check if we are upstream from the device. If we are, then the device is
+	   an HDMI source, which means that it is an ARC receiver, not a transmitter. */
+	if (pa_is_upstream_from(node->phys_addr, node->remote[la].phys_addr))
+		return NOTAPPLICABLE;
+	fail_on_test(!node->remote[la].has_arc_tx);
+
+	return 0;
+}
+
+static int arc_source_rx(struct node *node, unsigned me, unsigned la, bool interactive)
+{
+	/* Check if the DUT is upstream from us. If it is, then it is an
+	   HDMI sink, which means that it is an ARC transmitter, not receiver. */
+	if (pa_is_upstream_from(node->remote[la].phys_addr, node->phys_addr))
+		return NOTAPPLICABLE;
+	fail_on_test(!node->remote[la].has_arc_rx);
+
+	return 0;
+}
+
 struct remote_subtest arc_subtests[] = {
 	{ "Initiate ARC (RX)", CEC_LOG_ADDR_MASK_ALL, arc_initiate_rx },
 	{ "Terminate ARC (RX)", CEC_LOG_ADDR_MASK_ALL, arc_terminate_rx },
 	{ "Initiate ARC (TX)", CEC_LOG_ADDR_MASK_ALL, arc_initiate_tx },
 	{ "Terminate ARC (TX)", CEC_LOG_ADDR_MASK_ALL, arc_terminate_tx },
+	{ "Sink ARC (TX)", CEC_LOG_ADDR_MASK_ALL, arc_sink_tx },
+	{ "Source ARC (RX)", CEC_LOG_ADDR_MASK_ALL, arc_source_rx },
 };
 
 const unsigned arc_subtests_size = ARRAY_SIZE(arc_subtests);
-- 
2.23.0
