From: bnvandana at gmail.com (Vandana BN)
Date: Wed, 25 Sep 2019 13:57:30 +0530
Subject: [Linux-kernel-mentees] [PATCH v7 2/2] vivid: fixes for
	v4l2-compliance issues.
In-Reply-To: <20190925082730.15550-1-bnvandana@gmail.com>
References: <bbef8158-e603-7f80-308a-129d76c68a1b@xs4all.nl>
	<20190925082730.15550-1-bnvandana@gmail.com>
Message-ID: <20190925082730.15550-3-bnvandana@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

From: Hans Verkuil <hverkuil at xs4all.nl>

This patch fixes v4l2-compliance issues seen on metadata device.

Signed-off-by: Hans Verkuil <hverkuil-cisco at xs4all.nl>
---
 drivers/media/platform/vivid/vivid-core.c     | 16 +++++++++++++++-
 drivers/media/platform/vivid/vivid-meta-cap.c |  2 +-
 drivers/media/platform/vivid/vivid-vid-cap.c  |  5 ++++-
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
index c7d317f45fc0..97ab197bdec0 100644
--- a/drivers/media/platform/vivid/vivid-core.c
+++ b/drivers/media/platform/vivid/vivid-core.c
@@ -897,9 +897,14 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 				     V4L2_CAP_READWRITE;
 
 	/* set up the capabilities of meta capture device */
-	if (dev->has_meta_cap)
+	if (dev->has_meta_cap) {
 		dev->meta_cap_caps = V4L2_CAP_META_CAPTURE |
 				     V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
+		if (dev->has_audio_inputs)
+			dev->meta_cap_caps |= V4L2_CAP_AUDIO;
+		if (in_type_counter[TV])
+			dev->meta_cap_caps |= V4L2_CAP_TUNER;
+	}
 
 	ret = -ENOMEM;
 	/* initialize the test pattern generator */
@@ -960,6 +965,9 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_S_AUDIO);
 		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_G_AUDIO);
 		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_ENUMAUDIO);
+		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_AUDIO);
+		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_G_AUDIO);
+		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_ENUMAUDIO);
 	}
 	if (!dev->has_audio_outputs) {
 		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_S_AUDOUT);
@@ -985,12 +993,16 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_G_FREQUENCY);
 		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_S_FREQUENCY);
 		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_G_FREQUENCY);
+		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_FREQUENCY);
+		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_G_FREQUENCY);
 	}
 	if (!has_tuner) {
 		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_TUNER);
 		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_G_TUNER);
 		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_S_TUNER);
 		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_G_TUNER);
+		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_TUNER);
+		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_G_TUNER);
 	}
 	if (in_type_counter[HDMI] == 0) {
 		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_EDID);
@@ -1016,6 +1028,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
 	v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
 	v4l2_disable_ioctl(&dev->sdr_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
+	v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
 	v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_S_FREQUENCY);
 	v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_G_FREQUENCY);
 	v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_ENUM_FRAMESIZES);
@@ -1552,6 +1565,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		vfd->v4l2_dev = &dev->v4l2_dev;
 		vfd->queue = &dev->vb_meta_cap_q;
 		vfd->lock = &dev->mutex;
+		vfd->tvnorms = tvnorms_cap;
 		video_set_drvdata(vfd, dev);
 #ifdef CONFIG_MEDIA_CONTROLLER
 		dev->meta_cap_pad.flags = MEDIA_PAD_FL_SINK;
diff --git a/drivers/media/platform/vivid/vivid-meta-cap.c b/drivers/media/platform/vivid/vivid-meta-cap.c
index e3241d602b7a..b2f42c09abe1 100644
--- a/drivers/media/platform/vivid/vivid-meta-cap.c
+++ b/drivers/media/platform/vivid/vivid-meta-cap.c
@@ -135,7 +135,7 @@ int vidioc_enum_fmt_meta_cap(struct file *file, void  *priv,
 	struct vivid_dev *dev = video_drvdata(file);
 
 	if (!vivid_is_webcam(dev))
-		return -ENODATA;
+		return -EINVAL;
 
 	if (f->index > 0)
 		return -EINVAL;
diff --git a/drivers/media/platform/vivid/vivid-vid-cap.c b/drivers/media/platform/vivid/vivid-vid-cap.c
index 2d030732feac..e94beef008c8 100644
--- a/drivers/media/platform/vivid/vivid-vid-cap.c
+++ b/drivers/media/platform/vivid/vivid-vid-cap.c
@@ -1356,7 +1356,9 @@ int vidioc_s_input(struct file *file, void *priv, unsigned i)
 	if (i == dev->input)
 		return 0;
 
-	if (vb2_is_busy(&dev->vb_vid_cap_q) || vb2_is_busy(&dev->vb_vbi_cap_q))
+	if (vb2_is_busy(&dev->vb_vid_cap_q) ||
+	    vb2_is_busy(&dev->vb_vbi_cap_q) ||
+	    vb2_is_busy(&dev->vb_meta_cap_q))
 		return -EBUSY;
 
 	dev->input = i;
@@ -1366,6 +1368,7 @@ int vidioc_s_input(struct file *file, void *priv, unsigned i)
 		dev->vid_cap_dev.tvnorms = V4L2_STD_ALL;
 	}
 	dev->vbi_cap_dev.tvnorms = dev->vid_cap_dev.tvnorms;
+	dev->meta_cap_dev.tvnorms = dev->vid_cap_dev.tvnorms;
 	vivid_update_format_cap(dev, false);
 
 	if (dev->colorspace) {
-- 
2.17.1
