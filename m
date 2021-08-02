Return-Path: <SRS0=D/cX=MZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB913C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 06:55:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F32860F5A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 06:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F32860F5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 132DA607EC;
	Mon,  2 Aug 2021 06:55:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vsOJOvxXBMEC; Mon,  2 Aug 2021 06:55:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E2BF7607D3;
	Mon,  2 Aug 2021 06:55:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C32D3C001B;
	Mon,  2 Aug 2021 06:55:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92435C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 06:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74D25836C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 06:55:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 19IzA5UN8Hss
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 06:55:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89C11836A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 06:55:36 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id f26so6304355ybj.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Aug 2021 23:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qCQevkQaggOEZ+Y6vVoaaq1rqULc0l82TJ41ghGnBs0=;
 b=a74Fm6mlKttg6Wlq7s+z+xG1rNnLoCym0JkHguoHukDOMY2RZlNe8iS5mGJ8LzaLee
 E5mDwLfPSgCte8P2fYVd2nfos3ja1lIY8jC3WwO05+CKgBO/MscgF5y6nr5AfvnYsJbb
 aHjwHoMA6XTcNxLOGc6F7Wi16d48YygEPtRK1UVL10s0gjkJh27qw+CjfOxKuFpVcN2q
 IxZ+ArN60Fs/NSQur7KjWCgccygsX5OdXZGv9uVBXIwcfZSB9USjgMQL6cnqeWYSEwJj
 zd/MWne+Gft3/7BvOCoXBdgJ2Bo7N9XR2hg9rxlSlns87AX0A9ARp56OLrSVlWpZDNrR
 q5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qCQevkQaggOEZ+Y6vVoaaq1rqULc0l82TJ41ghGnBs0=;
 b=aNGsCWiyDnwJtJnj0QPkIJLtdsHjdrjYZjrB6hPB0zUnPD09K8Zu4AfJwBD22dkMXB
 anrsnkBk3Ghd4RqGr6p3pSHbWWjIg3eHvdgthOaK7kAWd7+MK2vVeTOJDQOCuacVfkNx
 2Q9QXnsUIESqFT15JLJoyYUBSFOPR2dtstcHlgcn3cQ8adTZsp8q5h0cdSC+ks5UORrg
 jxeRg3RAK9CZ1jNujXQVwyLBhbNEouLYDIF8yjWxIkolk7Xb61Isa86ZemCVwAvVxC5w
 Lb0n3MAVIpnkGW4wDJfBa4fwghXJS4F8b6FHIHrQ02OcyILLCP7w0rbOMS0g+zANyNQ0
 x7Sw==
X-Gm-Message-State: AOAM533rlZ++z1ia0r3MOpFoHDc7rPrIvL1guHI4i2wjtaRN/wfcHjNY
 UXZCpWNNoFAsBYplYu9uudG2Xq6fKvQpHED4Nds=
X-Google-Smtp-Source: ABdhPJximomHmnEzLWyD4fTTtAJV+6ZrJ1pyyZCeo2ejn7PAUm7U8JJYju78IDsWaTDXv1cUGXCgfa1jbFvjR+KwPp0=
X-Received: by 2002:a25:842:: with SMTP id 63mr18756002ybi.518.1627887335412; 
 Sun, 01 Aug 2021 23:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210801230817.19963-1-rahulbalaji78@gmail.com>
In-Reply-To: <20210801230817.19963-1-rahulbalaji78@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 2 Aug 2021 08:57:08 +0200
Message-ID: <CAKXUXMyarnY75c-Y45JbOJ_+RNTY4Ki81kWRb76UFULxCULNuA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Task 2: checkpath.pl documentation mentorship: remove
 semicolon warnings.
To: Rahul Balaji <rahulbalaji78@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Mon, Aug 2, 2021 at 1:09 AM Rahul Balaji <rahulbalaji78@gmail.com> wrote:
>
> i changed the lines such that they no longer evoke the (ONE_SEMICOLON) warning
> where possible.
>
> there were 7 files with true positive violation.
>
> drivers/mtd/ubi/block.c:408: WARNING:ONE_SEMICOLON: Statements
> terminations use 1 semicolon
>
> drivers/gpu/drm/nouveau/nouveau_gem.c:342: WARNING:ONE_SEMICOLON:
> Statements terminations use 1 semicolon
>
> fs/block_dev.c:1269: WARNING:ONE_SEMICOLON: Statements terminations
> use 1 semicolon
>
> (for fs/block_dev.c, the error was actually on line 1271 for me, not on 1269)
>
> include/trace/events/iocost.h:163: WARNING:ONE_SEMICOLON: Statements
> terminations use 1 semicolon
>
> net/sched/cls_rsvp.h:231: WARNING:ONE_SEMICOLON: Statements
> terminations use 1 semicolon
>
> net/sched/cls_u32.c:782: WARNING:ONE_SEMICOLON: Statements
> terminations use 1 semicolon
>
> drivers/net/ethernet/mediatek/mtk_star_emac.c:1089:
> WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
>
> the rest of the files given below i think are false positives, as they repeatedly use ";;" in their code.
> so i guess it is necessary in their case.

Can you explain your guess? Why should the number of occurrences in
one file be an indicator for a true positive or false positive?

>
> arch/ia64/include/asm/mca_asm.h:139: WARNING:ONE_SEMICOLON: Statements
> terminations use 1 semicolon
>
> arch/ia64/include/asm/mca_asm.h:213: WARNING:ONE_SEMICOLON: Statements
> terminations use 1 semicolon
>
> arch/ia64/include/asm/native/inst.h:79: WARNING:ONE_SEMICOLON:
> Statements terminations use 1 semicolon
>
> arch/ia64/kernel/minstate.h:14: WARNING:ONE_SEMICOLON: Statements
> terminations use 1 semicolon
>
> arch/ia64/kernel/minstate.h:151: WARNING:ONE_SEMICOLON: Statements
> terminations use 1 semicolon
>
> arch/ia64/kernel/minstate.h:213: WARNING:ONE_SEMICOLON: Statements
> terminations use 1 semicolon
> ---
>  drivers/gpu/drm/nouveau/nouveau_gem.c         | 2 +-
>  drivers/net/ethernet/mediatek/mtk_star_emac.c | 2 +-
>  fs/block_dev.c                                | 2 +-
>  include/trace/events/iocost.h                 | 2 +-
>  net/sched/cls_rsvp.h                          | 2 +-
>  net/sched/cls_u32.c                           | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 5b27845075a1..d476940ee97c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -339,7 +339,7 @@ nouveau_gem_set_domain(struct drm_gem_object *gem, uint32_t read_domains,
>         struct ttm_buffer_object *bo = &nvbo->bo;
>         uint32_t domains = valid_domains & nvbo->valid_domains &
>                 (write_domains ? write_domains : read_domains);
> -       uint32_t pref_domains = 0;;
> +       uint32_t pref_domains = 0;
>
>         if (!domains)
>                 return -EINVAL;
> diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
> index 96d2891f1675..0a445dde67ae 100644
> --- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
> +++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
> @@ -1086,7 +1086,7 @@ static void mtk_star_tx_complete_all(struct mtk_star_priv *priv)
>
>         spin_lock(&priv->lock);
>
> -       for (pkts_compl = 0, bytes_compl = 0;;
> +       for (pkts_compl = 0, bytes_compl = 0;
>              pkts_compl++, bytes_compl += ret, wake = true) {

Was this driver buggy?

Do you intend to modify the behavior of this driver?

Are you sure that your change does not modify the behaviour of this
driver? Is it a purely syntactic change here? Does it even compile
after your change?

>                 if (!mtk_star_ring_descs_available(ring))
>                         break;
> diff --git a/fs/block_dev.c b/fs/block_dev.c
> index 9ef4f1fc2cb0..61b938fa5d5b 100644
> --- a/fs/block_dev.c
> +++ b/fs/block_dev.c
> @@ -1268,7 +1268,7 @@ static int blkdev_get_whole(struct block_device *bdev, fmode_t mode)
>         if (test_bit(GD_NEED_PART_SCAN, &disk->state))
>                 bdev_disk_changed(disk, false);
>         bdev->bd_openers++;
> -       return 0;;
> +       return 0;
>  }
>
>  static void blkdev_put_whole(struct block_device *bdev, fmode_t mode)
> diff --git a/include/trace/events/iocost.h b/include/trace/events/iocost.h
> index e282ce02fa2d..6d1626e7a4ce 100644
> --- a/include/trace/events/iocost.h
> +++ b/include/trace/events/iocost.h
> @@ -160,7 +160,7 @@ TRACE_EVENT(iocost_ioc_vrate_adj,
>
>         TP_fast_assign(
>                 __assign_str(devname, ioc_name(ioc));
> -               __entry->old_vrate = atomic64_read(&ioc->vtime_rate);;
> +               __entry->old_vrate = atomic64_read(&ioc->vtime_rate);
>                 __entry->new_vrate = new_vrate;
>                 __entry->busy_level = ioc->busy_level;
>                 __entry->read_missed_ppm = missed_ppm[READ];
> diff --git a/net/sched/cls_rsvp.h b/net/sched/cls_rsvp.h
> index 27a4b6dbcf57..b7929dfcca1f 100644
> --- a/net/sched/cls_rsvp.h
> +++ b/net/sched/cls_rsvp.h
> @@ -228,7 +228,7 @@ static void rsvp_replace(struct tcf_proto *tp, struct rsvp_filter *n, u32 h)
>
>         for (s = rtnl_dereference(head->ht[h1]); s;
>              s = rtnl_dereference(s->next)) {
> -               for (ins = &s->ht[h2], pins = rtnl_dereference(*ins); ;
> +               for (ins = &s->ht[h2], pins = rtnl_dereference(*ins);

Again:

Was this code buggy?

Do you intend to modify the behavior of this code?

Are you sure that your change does not modify the behaviour of this
code? Is it a purely syntactic change here? Does it even compile after
your change?


>                      ins = &pins->next, pins = rtnl_dereference(*ins)) {
>                         if (pins->handle == h) {
>                                 RCU_INIT_POINTER(n->next, pins->next);
> diff --git a/net/sched/cls_u32.c b/net/sched/cls_u32.c
> index 6e1abe805448..290359f6ce6f 100644
> --- a/net/sched/cls_u32.c
> +++ b/net/sched/cls_u32.c
> @@ -779,7 +779,7 @@ static void u32_replace_knode(struct tcf_proto *tp, struct tc_u_common *tp_c,
>         /* The node must always exist for it to be replaced if this is not the
>          * case then something went very wrong elsewhere.
>          */
> -       for (pins = rtnl_dereference(*ins); ;
> +       for (pins = rtnl_dereference(*ins);
>              ins = &pins->next, pins = rtnl_dereference(*ins))

Again:

Was this code buggy?

Do you intend to modify the behavior of this code?

Are you sure that your change does not modify the behaviour of this
code? Is it a purely syntactic change here? Does it even compile after
your change?

>                 if (pins->handle == n->handle)
>                         break;
> --
> 2.25.1
>

Overall: please think more critically about what code you are
modifying and why. Just that checkpatch mentions some pattern, does
not mean that the change is always reasonable (Think for yourself!).
Maybe, you can think about a change to the rule so that a certain
pattern is not indicated anymore... and after some discussion, show
that you can IMPLEMENT such change to checkpatch. You want to
contribute improvements to checkpatch and WE WANT you to contribute as
well.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
