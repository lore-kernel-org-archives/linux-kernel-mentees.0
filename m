From: bnvandana at gmail.com (Vandana BN)
Date: Wed, 11 Sep 2019 15:40:23 +0530
Subject: [Linux-kernel-mentees] [PATCH] uvc/vsp1/ipu3: use VFL_TYPE_METADATA
	for metadata device.
Message-ID: <20190911101023.29003-1-bnvandana@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Use vfl_type VFL_TYPE_METADATA instead of VFL_TYPE_GRABBER for metadata device.

Signed-off-by: Vandana BN <bnvandana at gmail.com>
---
 drivers/media/platform/vsp1/vsp1_histo.c | 4 ++--
 drivers/media/usb/uvc/uvc_driver.c       | 4 +++-
 drivers/staging/media/ipu3/ipu3-v4l2.c   | 8 +++++++-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1_histo.c b/drivers/media/platform/vsp1/vsp1_histo.c
index 30d751f2cccf..1e1429817758 100644
--- a/drivers/media/platform/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/vsp1/vsp1_histo.c
@@ -551,7 +551,7 @@ int vsp1_histogram_init(struct vsp1_device *vsp1, struct vsp1_histogram *histo,
 	histo->video.fops = &histo_v4l2_fops;
 	snprintf(histo->video.name, sizeof(histo->video.name),
 		 "%s histo", histo->entity.subdev.name);
-	histo->video.vfl_type = VFL_TYPE_GRABBER;
+	histo->video.vfl_type = VFL_TYPE_METADATA;
 	histo->video.release = video_device_release_empty;
 	histo->video.ioctl_ops = &histo_v4l2_ioctl_ops;
 	histo->video.device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
@@ -576,7 +576,7 @@ int vsp1_histogram_init(struct vsp1_device *vsp1, struct vsp1_histogram *histo,
 
 	/* ... and register the video device. */
 	histo->video.queue = &histo->queue;
-	ret = video_register_device(&histo->video, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(&histo->video, VFL_TYPE_METADATA, -1);
 	if (ret < 0) {
 		dev_err(vsp1->dev, "failed to register video device\n");
 		goto error;
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 66ee168ddc7e..cf2e23238268 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1942,6 +1942,7 @@ int uvc_register_video_device(struct uvc_device *dev,
 			      const struct v4l2_ioctl_ops *ioctl_ops)
 {
 	int ret;
+	int vfl_type = VFL_TYPE_GRABBER;
 
 	/* Initialize the video buffers queue. */
 	ret = uvc_queue_init(queue, type, !uvc_no_drop_param);
@@ -1975,6 +1976,7 @@ int uvc_register_video_device(struct uvc_device *dev,
 		break;
 	case V4L2_BUF_TYPE_META_CAPTURE:
 		vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
+		vfl_type = VFL_TYPE_METADATA;
 		break;
 	}
 
@@ -1986,7 +1988,7 @@ int uvc_register_video_device(struct uvc_device *dev,
 	 */
 	video_set_drvdata(vdev, stream);
 
-	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vdev, vfl_type, -1);
 	if (ret < 0) {
 		uvc_printk(KERN_ERR, "Failed to register %s device (%d).\n",
 			   v4l2_type_names[type], ret);
diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 3c7ad1eed434..56fab0de4342 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -1245,7 +1245,13 @@ static int imgu_v4l2_node_setup(struct imgu_device *imgu, unsigned int pipe,
 	vdev->queue = &node->vbq;
 	vdev->vfl_dir = node->output ? VFL_DIR_TX : VFL_DIR_RX;
 	video_set_drvdata(vdev, imgu);
-	r = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+
+	if (vbq->type == V4L2_BUF_TYPE_META_CAPTURE ||
+	    vbq->type == V4L2_BUF_TYPE_META_OUTPUT)
+		r = video_register_device(vdev, VFL_TYPE_METADATA, -1);
+	else
+		r = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+
 	if (r) {
 		dev_err(dev, "failed to register video device (%d)", r);
 		media_entity_cleanup(&vdev->entity);
-- 
2.17.1
