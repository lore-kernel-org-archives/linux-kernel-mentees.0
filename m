Return-Path: <SRS0=5Mz1=BF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C641C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 17:31:00 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC7D82065C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 17:30:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J/V3fRTO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC7D82065C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AAA1E20796;
	Sun, 26 Jul 2020 17:30:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iVU+Ef1Mdfrn; Sun, 26 Jul 2020 17:30:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A515E2010F;
	Sun, 26 Jul 2020 17:30:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7DF98C004F;
	Sun, 26 Jul 2020 17:30:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1C3E5C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 17:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 055378641E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 17:30:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PnGhRKu9dqco
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 17:30:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BD9EF863FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 17:30:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AFC9304;
 Sun, 26 Jul 2020 19:30:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595784652;
 bh=UdBOdl3zi/qG8vkxOz0jQ4rKn6Xodg91lx+efNqwElY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J/V3fRTO7HzhURiH6YBF1+ryMV1bVsyzMJ/yr/LDzwQt8mkyIqOIOIkmkNBhiVu+w
 v8ngpJxW6rFXsCmpghPtyUeYGt6zUEsNzlQxefX38gYQOrSCR+gWcFe298cnmgIJKb
 Gcu1qf9iNVEjObczqVrP099+3n8lpZChOJdhsRm4=
Date: Sun, 26 Jul 2020 20:30:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
Message-ID: <20200726173044.GA14755@pendragon.ideasonboard.com>
References: <20200726164439.48973-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200726164439.48973-1-yepeilin.cs@gmail.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Arnd Bergmann <arnd@arndb.de>, syzkaller-bugs@googlegroups.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vandana BN <bnvandana@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] media/v4l2-core: Fix
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

On Sun, Jul 26, 2020 at 12:44:39PM -0400, Peilin Ye wrote:
> video_put_user() is copying uninitialized stack memory to userspace. Fix
> it by initializing `vb32` using memset().

What makes you think this will fix the issue ? When initializing a
structure at declaration time, the fields that are not explicitly
specified should be initialized to 0 by the compiler. See
https://www.ibm.com/support/knowledgecenter/en/SSLTBW_2.3.0/com.ibm.zos.v2r3.cbclx01/strin.htm:

If a structure variable is partially initialized, all the uninitialized
structure members are implicitly initialized to zero no matter what the
storage class of the structure variable is. See the following example:

struct one {
    int a;
    int b;
    int c;
};

void main() {
    struct one z1;         // Members in z1 do not have default initial values.
    static struct one z2;  // z2.a=0, z2.b=0, and z2.c=0.
    struct one z3 = {1};   // z3.a=1, z3.b=0, and z3.c=0.
}

> Reported-and-tested-by: syzbot+79d751604cb6f29fbf59@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 32 +++++++++++++++-------------
>  1 file changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index a556880f225a..08909f58dc80 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -3210,21 +3210,23 @@ static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
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
