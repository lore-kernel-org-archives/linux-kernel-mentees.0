From: hverkuil@xs4all.nl (Hans Verkuil)
Date: Mon, 9 Sep 2019 11:19:35 +0200
Subject: [Linux-kernel-mentees] [PATCH] vivid: Set vid_cap_streaming and
 vid_out_streaming to true
In-Reply-To: <20190909091147.6596-1-bnvandana@gmail.com>
References: <20190909091147.6596-1-bnvandana@gmail.com>
Message-ID: <841cf7a9-2e5f-17c8-1595-56c911b7f35d@xs4all.nl>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190909091935.h_InamJ0I3IHQJqEPnwo6dUDScQEmZcOKng9-IOQJt8@z>

Hi Vandana,

The patch is right, but the commit log can be improved:

On 9/9/19 11:11 AM, Vandana BN wrote:
> when vbi/meta stream is started, followed by video streaming,

Since this patch will be applied before the patch that adds metadata,
you can't refer to meta yet. Just stick to vbi.

Also: 'when' -> 'When'

> the vid_cap_streaming and vid_out_streaming were not being set to true,
> which would cause the video stream to stop when vbi/meta stream is stopped.

Drop /meta here as well.

> This patch allows to set vid_cap_streaming and vid_out_streaming to true.

You can add a line here saying:

"According to Hans Verkuil it appears that these 'if (dev->kthread_vid_cap)'
checks are a left-over from the original vivid development and should never
have been there."

> 
> Signed-off-by: Vandana BN <bnvandana at gmail.com>

Add this line:

Cc: <stable at vger.kernel.org>      # for v3.18 and up

Since this is a fix valid for all kernels that support vivid.

Regards,

	Hans

> ---
>  drivers/media/platform/vivid/vivid-vid-cap.c | 3 ---
>  drivers/media/platform/vivid/vivid-vid-out.c | 3 ---
>  2 files changed, 6 deletions(-)
> 
> diff --git a/drivers/media/platform/vivid/vivid-vid-cap.c b/drivers/media/platform/vivid/vivid-vid-cap.c
> index 8cbaa0c998ed..2d030732feac 100644
> --- a/drivers/media/platform/vivid/vivid-vid-cap.c
> +++ b/drivers/media/platform/vivid/vivid-vid-cap.c
> @@ -223,9 +223,6 @@ static int vid_cap_start_streaming(struct vb2_queue *vq, unsigned count)
>  	if (vb2_is_streaming(&dev->vb_vid_out_q))
>  		dev->can_loop_video = vivid_vid_can_loop(dev);
>  
> -	if (dev->kthread_vid_cap)
> -		return 0;
> -
>  	dev->vid_cap_seq_count = 0;
>  	dprintk(dev, 1, "%s\n", __func__);
>  	for (i = 0; i < VIDEO_MAX_FRAME; i++)
> diff --git a/drivers/media/platform/vivid/vivid-vid-out.c b/drivers/media/platform/vivid/vivid-vid-out.c
> index 148b663a6075..a0364ac497f9 100644
> --- a/drivers/media/platform/vivid/vivid-vid-out.c
> +++ b/drivers/media/platform/vivid/vivid-vid-out.c
> @@ -161,9 +161,6 @@ static int vid_out_start_streaming(struct vb2_queue *vq, unsigned count)
>  	if (vb2_is_streaming(&dev->vb_vid_cap_q))
>  		dev->can_loop_video = vivid_vid_can_loop(dev);
>  
> -	if (dev->kthread_vid_out)
> -		return 0;
> -
>  	dev->vid_out_seq_count = 0;
>  	dprintk(dev, 1, "%s\n", __func__);
>  	if (dev->start_streaming_error) {
> 
