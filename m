From: bnvandana@gmail.com (Vandana BN)
Date: Wed, 25 Sep 2019 14:44:26 +0530
Subject: [Linux-kernel-mentees] [PATCH v2] v4l2-compliance: Verify metadata
	formats
In-Reply-To: <49ffdb33-39a7-aa44-fb0c-302e963972b1@xs4all.nl>
References: <49ffdb33-39a7-aa44-fb0c-302e963972b1@xs4all.nl>
Message-ID: <20190925091426.17120-1-bnvandana@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190925091426.EHfHmQWeYHTPG6fPvR5U0z73InK8QZkHthq_ODYpQcM@z>

Metadata formats may not be defined for a given input or output type.
This patch checks, if given input/output type enumerates metadata formats
and validates G_FMT accordingly.

Signed-off-by: Vandana BN <bnvandana at gmail.com>
---
 utils/v4l2-compliance/v4l2-test-formats.cpp | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index 525dfafa..b60d9275 100644
--- a/utils/v4l2-compliance/v4l2-test-formats.cpp
+++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
@@ -305,8 +305,6 @@ int testEnumFormats(struct node *node)
 		case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		case V4L2_BUF_TYPE_SDR_CAPTURE:
 		case V4L2_BUF_TYPE_SDR_OUTPUT:
-		case V4L2_BUF_TYPE_META_CAPTURE:
-		case V4L2_BUF_TYPE_META_OUTPUT:
 			if (ret && (node->g_caps() & buftype2cap[type]))
 				return fail("%s cap set, but no %s formats defined\n",
 						buftype2s(type).c_str(), buftype2s(type).c_str());
@@ -314,6 +312,10 @@ int testEnumFormats(struct node *node)
 				return fail("%s cap not set, but %s formats defined\n",
 						buftype2s(type).c_str(), buftype2s(type).c_str());
 			break;
+		case V4L2_BUF_TYPE_META_CAPTURE:
+		case V4L2_BUF_TYPE_META_OUTPUT:
+			/* Metadata formats need not be present for the current input/output */
+			break;
 		default:
 			if (!ret)
 				return fail("Buffer type %s not allowed!\n", buftype2s(type).c_str());
@@ -599,8 +601,6 @@ int testGetFormats(struct node *node)
 		case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		case V4L2_BUF_TYPE_SDR_CAPTURE:
 		case V4L2_BUF_TYPE_SDR_OUTPUT:
-		case V4L2_BUF_TYPE_META_CAPTURE:
-		case V4L2_BUF_TYPE_META_OUTPUT:
 			if (ret && (node->g_caps() & buftype2cap[type]))
 				return fail("%s cap set, but no %s formats defined\n",
 					buftype2s(type).c_str(), buftype2s(type).c_str());
@@ -608,6 +608,15 @@ int testGetFormats(struct node *node)
 				return fail("%s cap not set, but %s formats defined\n",
 					buftype2s(type).c_str(), buftype2s(type).c_str());
 			break;
+		case V4L2_BUF_TYPE_META_CAPTURE:
+		case V4L2_BUF_TYPE_META_OUTPUT:
+			if (ret && !node->buftype_pixfmts[type].empty())
+				return fail("%s G_FMT failed, but %s formats defined\n",
+					buftype2s(type).c_str(), buftype2s(type).c_str());
+			if (!ret && node->buftype_pixfmts[type].empty())
+				return fail("%s G_FMT success, but no %s formats defined\n",
+					buftype2s(type).c_str(), buftype2s(type).c_str());
+			break;
 		default:
 			/* ENUMFMT doesn't support other buftypes */
 			break;
-- 
2.17.1
