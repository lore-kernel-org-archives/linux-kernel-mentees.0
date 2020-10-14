Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9292DC43457
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 19:01:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC74520691
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 19:01:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N4ycceOK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC74520691
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 35E80877AB;
	Wed, 14 Oct 2020 19:01:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 34uRK6K-m6aO; Wed, 14 Oct 2020 19:01:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A649E8750F;
	Wed, 14 Oct 2020 19:01:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C779C0052;
	Wed, 14 Oct 2020 19:01:09 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91350C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 19:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 72376877AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 19:01:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0e5LxZI2FG6h
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 19:01:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 83ACB8750F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 19:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602702066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p+JrADlr5t+YAAhULA0pqV3ZIZBiEjPrGaYhwMVIKV4=;
 b=N4ycceOKEzHurJ8/X7qy86oRImwQFDPaONqSISxRHQvpQVL3kEezQs9ttrD02wfS3eb3Ly
 D+gcIgIefVtWcYNojeLDI9EDqbHKfYx2z6V/hJMYoCLZj04+V2/ArEgStOkHCI9EZw/8Bx
 FIU2nBpF0sAY7kxxlIkCSZ2bow5GyFU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-VWoO4hjHNNyVXO1UITt0Iw-1; Wed, 14 Oct 2020 15:01:04 -0400
X-MC-Unique: VWoO4hjHNNyVXO1UITt0Iw-1
Received: by mail-wr1-f71.google.com with SMTP id r8so92988wrp.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 12:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p+JrADlr5t+YAAhULA0pqV3ZIZBiEjPrGaYhwMVIKV4=;
 b=oMJ7scrXfxzR6ivDCWZd4H+OMi1WvFY+GNxLTtI9IdF7yGFowC1Wz4A6b4geR454Pg
 8urotl48EkzVhnkbD1aXsbtJjNwOYq2II9aOtCjCamV1udDivGdczhcw5s1dMDZoy+0W
 ySihhF37rxzDjrqo33HNE7pBBlB0bANQhoTlo8NmmNpBdqycSsG0aN9h4sVLjAyd0saC
 1zI1hLG5cmGKDAUVCmLgiVc3JRtHVVctFQtuZ5RnCdDm5aW2GfeqDlpj7gqOKtc/GIJ/
 ZWSZU6ZSsD7R6OqC6kBup4OKg5WMgALnElSPmVuEDK+P7oPZVWaXOrpnXxl2rMaPvmFU
 lN4g==
X-Gm-Message-State: AOAM533G1CuHE6CxtVh0pQtl3vQQuXMgbUEw6KFV8sR464YmIizBU+q/
 6U/r5vGXM6t0MMSFXYzjvftfgv1b+lGkZC/Gxu3APm4e+FDrhKIgiu3+5oG45j4rdkhdSSXMV9B
 xoCYDDl6K4dRJNX6S8Zg3mepxQdWs1f++Tv+GMIXqnH/FPFcDh9Txt6GsV91MggJD
X-Received: by 2002:a5d:458c:: with SMTP id p12mr186319wrq.329.1602702063050; 
 Wed, 14 Oct 2020 12:01:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxh2JO2W6NeN0RV0lJkM57TwsR/X2vWR2a922i5/AIOwJDPP4K8W/FoMQAz+75TJkFLDN3hGuG8+rsCNlnVocI=
X-Received: by 2002:a5d:458c:: with SMTP id p12mr186290wrq.329.1602702062813; 
 Wed, 14 Oct 2020 12:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201014163109.98739-1-anant.thazhemadam@gmail.com>
In-Reply-To: <20201014163109.98739-1-anant.thazhemadam@gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 14 Oct 2020 21:00:51 +0200
Message-ID: <CAHc6FU5s3xL745-gUueSW3JO+V78ySsk1ueZ6tT-jrc6w5FD5g@mail.gmail.com>
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=agruenba@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: syzbot+af90d47a37376844e731@syzkaller.appspotmail.com,
 Fox Chen <foxhlchen@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 syzbot+a5e2482a693e6b1e444b@syzkaller.appspotmail.com,
 cluster-devel <cluster-devel@redhat.com>, Andrew Price <anprice@redhat.com>,
 Bob Peterson <rpeterso@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] fs: gfs2: add validation
	checks for size of superblock
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

Anant,

On Wed, Oct 14, 2020 at 6:31 PM Anant Thazhemadam
<anant.thazhemadam@gmail.com> wrote:
> In gfs2_check_sb(), no validation checks are performed with regards to
> the size of the superblock.
> syzkaller detected a slab-out-of-bounds bug that was primarily caused
> because the block size for a superblock was set to zero.
> A valid size for a superblock is a power of 2 between 512 and PAGE_SIZE.
> Performing validation checks and ensuring that the size of the superblock
> is valid fixes this bug.
>
> Reported-by: syzbot+af90d47a37376844e731@syzkaller.appspotmail.com
> Tested-by: syzbot+af90d47a37376844e731@syzkaller.appspotmail.com
> Suggested-by: Andrew Price <anprice@redhat.com>
> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> ---
>
> Changes in v2:
>
>         * Completely dropped the changes proposed in v1. Instead,
>           validity checks for superblock size have been introduced.
>           (Suggested by Andrew Price<anprice@redhat.com>)
>
>         * Addded a "Suggested-by" tag accrediting the patch idea to
>           Andrew. If there's any issue with that, please let me know.
>
>         * Changed the commit header and commit message appropriately.
>
>         * Updated "Reported-by" and "Tested-by" tags to the same instance
>           of the bug that was detected earlier (non consequential change).
>
>
>  fs/gfs2/ops_fstype.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index 6d18d2c91add..f0605fae2c4c 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -169,6 +169,13 @@ static int gfs2_check_sb(struct gfs2_sbd *sdp, int silent)
>                 return -EINVAL;
>         }
>
> +       /* Check if the size of the block is valid - a power of 2 between 512 and  PAGE_SIZE */
> +       if (sb->sb_bsize < 512 || sb->sb_bsize > PAGE_SIZE || (sb->sb_bsize & (sb->sb_bsize - 1))) {
> +               if (!silent)
> +                       pr_warn("Invalid superblock size\n");
> +               return -EINVAL;
> +       }
> +

I'll add that to for-next.

Thanks,
Andreas

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
