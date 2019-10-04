From: bnvandana at gmail.com (Vandana BN)
Date: Fri,  4 Oct 2019 17:25:14 +0530
Subject: [Linux-kernel-mentees] [PATCH] Documentation:media:v4l2:Add vivid
	metadata doc
Message-ID: <20191004115514.31259-1-bnvandana@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Adds new file for describing new metadata format V4L2_META_FMT_VIVID added in vivid driver.

Signed-off-by: Vandana BN <bnvandana at gmail.com>
---
 Documentation/media/uapi/v4l/meta-formats.rst |  1 +
 .../media/uapi/v4l/pixfmt-meta-vivid.rst      | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst

diff --git a/Documentation/media/uapi/v4l/meta-formats.rst b/Documentation/media/uapi/v4l/meta-formats.rst
index b10ca9ee3968..74c8659ee9d6 100644
--- a/Documentation/media/uapi/v4l/meta-formats.rst
+++ b/Documentation/media/uapi/v4l/meta-formats.rst
@@ -24,3 +24,4 @@ These formats are used for the :ref:`metadata` interface only.
     pixfmt-meta-uvc
     pixfmt-meta-vsp1-hgo
     pixfmt-meta-vsp1-hgt
+    pixfmt-meta-vivid
diff --git a/Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst b/Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst
new file mode 100644
index 000000000000..e6c349fadf30
--- /dev/null
+++ b/Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst
@@ -0,0 +1,43 @@
+.. Permission is granted to copy, distribute and/or modify this
+.. document under the terms of the GNU Free Documentation License,
+.. Version 1.1 or any later version published by the Free Software
+.. Foundation, with no Invariant Sections, no Front-Cover Texts
+.. and no Back-Cover Texts. A copy of the license is included at
+.. Documentation/media/uapi/fdl-appendix.rst.
+..
+.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
+
+.. _v4l2-meta-fmt-vivid:
+
+*******************************
+V4L2_META_FMT_VIVID ('VIVID')
+*******************************
+
+VIVID Metadata Format
+
+
+Description
+===========
+
+This format describes metadata in vivid driver.
+
+It sets Brightness, Saturation, Contrast and Hue, each of which maps to
+corresponding control in vivid driver with respect to its range and default values.
+
+It contains the following fields:
+
+.. flat-table:: VIVID Metadata
+    :widths: 1 4
+    :header-rows:  1
+    :stub-columns: 0
+
+    * - Field
+      - Description
+    * - u16 brightness;
+      - Image brightness, value can be in range 0 to 255, with default value as 128.
+    * - u16 contrast;
+      - Image contrast, value can be in range 0 to 255, with default value as 128.
+    * - u16 saturation;
+      - Image color saturation, value can be in range 0 to 255, with default value as 128.
+    * - s16 hue;
+      - Image color balance, value can be in range -128 to 128, with default value as 0.
-- 
2.17.1
