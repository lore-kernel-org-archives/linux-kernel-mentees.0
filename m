Return-Path: <SRS0=5Mz1=BF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27977C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 22:11:15 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8F9B204EA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 22:11:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qWX7qbUt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8F9B204EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A38132202E;
	Sun, 26 Jul 2020 22:11:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FxZOVOz1PIUF; Sun, 26 Jul 2020 22:11:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8C87B21556;
	Sun, 26 Jul 2020 22:11:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6DF07C0050;
	Sun, 26 Jul 2020 22:11:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9730C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 22:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 93A608808D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 22:11:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vl7RMqrxDQ7W
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 22:11:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B798B880A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 22:11:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F85051D;
 Mon, 27 Jul 2020 00:11:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595801464;
 bh=RjRackuP7ppvbWcf8GQqwdpQm304xRlLj+BnHq8KwrY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qWX7qbUtDABljqUxc29jNYY6LFIWwzzNovCteIYAyrBJ22N89q+e2GzcIQpzHfP2T
 oZ6HFGXANO1MerJUPuk6YwCymvy94eVW5a0mujqkvrPBTn8Fiy2x+K5rIOxThhKaxQ
 mLu3LMMbHJLGkOzwDKP2TVG4oK8KmEVNcUnYJtCI=
Date: Mon, 27 Jul 2020 01:10:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
Message-ID: <20200726221056.GJ28704@pendragon.ideasonboard.com>
References: <20200726164439.48973-1-yepeilin.cs@gmail.com>
 <20200726220557.102300-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200726220557.102300-1-yepeilin.cs@gmail.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Arnd Bergmann <arnd@arndb.de>, syzkaller-bugs@googlegroups.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vandana BN <bnvandana@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi Peilin,

Thank you for the patch.

On Sun, Jul 26, 2020 at 06:05:57PM -0400, Peilin Ye wrote:
> video_put_user() is copying uninitialized stack memory to userspace. Fix
> it by initializing `ev32` and `vb32` using memset().

How about mentioning that this is caused by the compiler not
initializing the holes ? Maybe something along the lines of

video_put_user() is copying uninitialized stack memory to userspace due
to the compiler not initializing holes in the structures declared on the
stack. Fix it by initializing the structures using memset().

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Reported-and-tested-by: syzbot+79d751604cb6f29fbf59@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> ---
> Change in v2:
>     - Do the same thing for `case VIDIOC_DQEVENT_TIME32`.
> 
>  drivers/media/v4l2-core/v4l2-ioctl.c | 50 +++++++++++++++-------------
>  1 file changed, 27 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index a556880f225a..e3a25ea913ac 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -3189,14 +3189,16 @@ static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
>  #ifdef CONFIG_COMPAT_32BIT_TIME
>  	case VIDIOC_DQEVENT_TIME32: {
>  		struct v4l2_event *ev = parg;
> -		struct v4l2_event_time32 ev32 = {
> -			.type		= ev->type,
> -			.pending	= ev->pending,
> -			.sequence	= ev->sequence,
> -			.timestamp.tv_sec  = ev->timestamp.tv_sec,
> -			.timestamp.tv_nsec = ev->timestamp.tv_nsec,
> -			.id		= ev->id,
> -		};
> +		struct v4l2_event_time32 ev32;
> +
> +		memset(&ev32, 0, sizeof(ev32));
> +
> +		ev32.type	= ev->type;
> +		ev32.pending	= ev->pending;
> +		ev32.sequence	= ev->sequence;
> +		ev32.timestamp.tv_sec	= ev->timestamp.tv_sec;
> +		ev32.timestamp.tv_nsec	= ev->timestamp.tv_nsec;
> +		ev32.id		= ev->id;
>  
>  		memcpy(&ev32.u, &ev->u, sizeof(ev->u));
>  		memcpy(&ev32.reserved, &ev->reserved, sizeof(ev->reserved));
> @@ -3210,21 +3212,23 @@ static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
>  	case VIDIOC_DQBUF_TIME32:
>  	case VIDIOC_PREPARE_BUF_TIME32: {
>  		struct v4l2_buffer *vb = parg;
> -		struct v4l2_buffer_time32 vb32 = {
> -			.index		= vb->index,
> -			.type		= vb->type,
> -			.bytesused	= vb->bytesused,
> -			.flags		= vb->flags,
> -			.field		= vb->field,
> -			.timestamp.tv_sec	= vb->timestamp.tv_sec,
> -			.timestamp.tv_usec	= vb->timestamp.tv_usec,
> -			.timecode	= vb->timecode,
> -			.sequence	= vb->sequence,
> -			.memory		= vb->memory,
> -			.m.userptr	= vb->m.userptr,
> -			.length		= vb->length,
> -			.request_fd	= vb->request_fd,
> -		};
> +		struct v4l2_buffer_time32 vb32;
> +
> +		memset(&vb32, 0, sizeof(vb32));
> +
> +		vb32.index	= vb->index;
> +		vb32.type	= vb->type;
> +		vb32.bytesused	= vb->bytesused;
> +		vb32.flags	= vb->flags;
> +		vb32.field	= vb->field;
> +		vb32.timestamp.tv_sec	= vb->timestamp.tv_sec;
> +		vb32.timestamp.tv_usec	= vb->timestamp.tv_usec;
> +		vb32.timecode	= vb->timecode;
> +		vb32.sequence	= vb->sequence;
> +		vb32.memory	= vb->memory;
> +		vb32.m.userptr	= vb->m.userptr;
> +		vb32.length	= vb->length;
> +		vb32.request_fd	= vb->request_fd;
>  
>  		if (copy_to_user(arg, &vb32, sizeof(vb32)))
>  			return -EFAULT;

-- 
Regards,

Laurent Pinchart
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
