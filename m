From: bnvandana at gmail.com (Vandana BN)
Date: Thu,  3 Oct 2019 12:35:13 +0530
Subject: [Linux-kernel-mentees] [PATCH] v4l2-compliance: fix metadata output
	support
Message-ID: <20191003070513.21762-1-bnvandana@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

This patch fixes test failure in the v4l2-compliance
for metadata output support.

Signed-off-by: Vandana BN <bnvandana at gmail.com>
---
 utils/v4l2-compliance/v4l2-compliance.cpp | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index b9860f1e..a2378d8e 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -960,7 +960,8 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 			 V4L2_CAP_META_CAPTURE))
 		node.has_inputs = true;
 	if (node.g_caps() & (V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_VBI_OUTPUT |
-			 V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_SLICED_VBI_OUTPUT))
+			 V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_SLICED_VBI_OUTPUT |
+			 V4L2_CAP_META_OUTPUT))
 		node.has_outputs = true;
 	if (node.g_caps() & (V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VBI_CAPTURE |
 			 V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_VIDEO_M2M_MPLANE |
-- 
2.17.1
