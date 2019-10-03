From: hverkuil at xs4all.nl (Hans Verkuil)
Date: Thu, 3 Oct 2019 09:24:47 +0200
Subject: [Linux-kernel-mentees] [PATCH 1/2] v4l2-core: Add new metadata
	format
In-Reply-To: <20191003071856.23664-2-bnvandana@gmail.com>
References: <20191003071856.23664-1-bnvandana@gmail.com>
	<20191003071856.23664-2-bnvandana@gmail.com>
Message-ID: <9439560a-dbc7-9aeb-a27b-314ace85dc81@xs4all.nl>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On 10/3/19 9:18 AM, Vandana BN wrote:
> Add new metadata format to support metadata output in vivid.
> 
> Signed-off-by: Vandana BN <bnvandana at gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
>  include/uapi/linux/videodev2.h       | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 20b3107dd4e8..34c1a2bd7f28 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1340,6 +1340,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_VSP1_HGT:	descr = "R-Car VSP1 2-D Histogram"; break;
>  	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
>  	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
> +	case V4L2_META_FMT_VIVID:       descr = "Vivid Output Metadata"; break;

Drop 'Output'. As mentioned in my previous reply, this format can be used for capture
as well (and I think we should implement this).

>  
>  	default:
>  		/* Compressed formats */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 530638dffd93..a32335fcd064 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -755,6 +755,7 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
>  #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
>  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
> +#define V4L2_META_FMT_VIVID	  v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Output Metadata */

Drop 'Output' in the comment.

>  
>  /* priv field value to indicates that subsequent fields are valid. */
>  #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
> 

Regards,

	Hans
