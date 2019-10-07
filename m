From: hverkuil at xs4all.nl (Hans Verkuil)
Date: Mon, 7 Oct 2019 16:31:44 +0200
Subject: [Linux-kernel-mentees] [PATCH v9] vivid: Add metadata capture
	support
In-Reply-To: <20191004102457.27611-1-bnvandana@gmail.com>
References: <0e9fb478-18b7-22a4-2eaf-c19ae57678e0@xs4all.nl>
	<20191004102457.27611-1-bnvandana@gmail.com>
Message-ID: <96d53360-5520-f253-db8e-995bf5920746@xs4all.nl>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On 10/4/19 12:24 PM, Vandana BN wrote:
> +void vivid_meta_cap_fillbuff(struct vivid_dev *dev,
> +			     struct vivid_buffer *buf, u32 soe)

soe should have been a u64 since f_time is a u64.

> +{
> +	struct vivid_uvc_meta_buf *meta = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
> +	int buf_off = 0;
> +
> +	buf->vb.sequence = dev->meta_cap_seq_count;
> +	if (dev->field_cap == V4L2_FIELD_ALTERNATE)
> +		buf->vb.sequence /= 2;
> +	memset(meta, 1, vb2_plane_size(&buf->vb.vb2_buf, 0));
> +
> +	meta->ns = ktime_get_ns();
> +	meta->sof = buf->vb.sequence * 30;
> +	meta->length = sizeof(*meta) - offsetof(struct vivid_uvc_meta_buf, length);
> +	meta->flags = UVC_STREAM_EOH | UVC_STREAM_EOF;
> +
> +	if ((buf->vb.sequence % 2) == 0)
> +		meta->flags |= UVC_STREAM_FID;
> +
> +	dprintk(dev, 2, "%s ns:%llu sof:%4d len:%u flags: 0x%02x",
> +		__func__, meta->ns, meta->sof, meta->length, meta->flags);
> +	if (dev->meta_pts) {
> +		meta->flags |= UVC_STREAM_PTS;
> +		meta->buf[0] = soe / VIVID_META_CLOCK_UNIT;

Use div_u64() here.

> +		buf_off = 4;
> +		dprintk(dev, 2, " pts: %u\n", *(__u32 *)(meta->buf));
> +	}
> +
> +	if (dev->meta_scr) {
> +		meta->flags |= UVC_STREAM_SCR;
> +		meta->buf[buf_off] = (soe + dev->cap_frame_eof_offset)
> +					/ VIVID_META_CLOCK_UNIT;

Same here (and this is the cause of the kbuild error).

> +
> +		meta->buf[buf_off + 4] = (buf->vb.sequence * 30) % 1000;
> +		dprintk(dev, 2, " stc: %u, sof counter: %u\n",
> +			*(__u32 *)(meta->buf + buf_off),
> +			*(__u16 *)(meta->buf + buf_off + 4));
> +	}
> +	dprintk(dev, 2, "\n");
> +}

Regards,

	Hans
