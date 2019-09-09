From: bnvandana@gmail.com (Vandana BN)
Date: Mon,  9 Sep 2019 14:41:47 +0530
Subject: [Linux-kernel-mentees] [PATCH] vivid: Set vid_cap_streaming and
	vid_out_streaming to true
Message-ID: <20190909091147.6596-1-bnvandana@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190909091147.LYYdF-ODWsa1c6nzeFSZOtx4tlD5lBNCKeahgB4jDs4@z>

when vbi/meta stream is started, followed by video streaming,
the vid_cap_streaming and vid_out_streaming were not being set to true,
which would cause the video stream to stop when vbi/meta stream is stopped.
This patch allows to set vid_cap_streaming and vid_out_streaming to true.

Signed-off-by: Vandana BN <bnvandana at gmail.com>
---
 drivers/media/platform/vivid/vivid-vid-cap.c | 3 ---
 drivers/media/platform/vivid/vivid-vid-out.c | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/media/platform/vivid/vivid-vid-cap.c b/drivers/media/platform/vivid/vivid-vid-cap.c
index 8cbaa0c998ed..2d030732feac 100644
--- a/drivers/media/platform/vivid/vivid-vid-cap.c
+++ b/drivers/media/platform/vivid/vivid-vid-cap.c
@@ -223,9 +223,6 @@ static int vid_cap_start_streaming(struct vb2_queue *vq, unsigned count)
 	if (vb2_is_streaming(&dev->vb_vid_out_q))
 		dev->can_loop_video = vivid_vid_can_loop(dev);
 
-	if (dev->kthread_vid_cap)
-		return 0;
-
 	dev->vid_cap_seq_count = 0;
 	dprintk(dev, 1, "%s\n", __func__);
 	for (i = 0; i < VIDEO_MAX_FRAME; i++)
diff --git a/drivers/media/platform/vivid/vivid-vid-out.c b/drivers/media/platform/vivid/vivid-vid-out.c
index 148b663a6075..a0364ac497f9 100644
--- a/drivers/media/platform/vivid/vivid-vid-out.c
+++ b/drivers/media/platform/vivid/vivid-vid-out.c
@@ -161,9 +161,6 @@ static int vid_out_start_streaming(struct vb2_queue *vq, unsigned count)
 	if (vb2_is_streaming(&dev->vb_vid_cap_q))
 		dev->can_loop_video = vivid_vid_can_loop(dev);
 
-	if (dev->kthread_vid_out)
-		return 0;
-
 	dev->vid_out_seq_count = 0;
 	dprintk(dev, 1, "%s\n", __func__);
 	if (dev->start_streaming_error) {
-- 
2.17.1
