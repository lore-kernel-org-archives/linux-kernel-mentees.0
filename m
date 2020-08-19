Return-Path: <SRS0=uOMe=B5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C468C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 15:17:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6A34207FF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 15:17:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cV1u7p0w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6A34207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B94668598E;
	Wed, 19 Aug 2020 15:17:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RDgWml5NIsZS; Wed, 19 Aug 2020 15:17:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4CDCE85910;
	Wed, 19 Aug 2020 15:17:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47F83C0889;
	Wed, 19 Aug 2020 15:17:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A157C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 15:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 295FB86F21
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 15:17:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8akXnyhj2Le1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 15:17:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9989786F58
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 15:17:26 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id g15so7072539plj.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 08:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zmZ0nR+0stasAUqGKga9eB9ZFWY9muOXfNZAhE4dBCo=;
 b=cV1u7p0wvXmqtQLXfxc15Ws4Qo4Zt6uUGQKQdnWwMiD37QPnpsYZ35tUxZW0DLjC2F
 +DRi5ji/RLdDM5HuTLrg/vCsSsZSIr6f5Y/sG6t3cHpJsMcZJABAyXLH0INlx2A1IQu1
 3HOcqdKTiqaVmjLVvF1LqSYOn4IjbEqAfyzY5pVuanO01IeEzMcJGd0jBFJrjAbks2TV
 PfbjuFX4KkVmeoNUatXXTq9sbXlWbvfmIGeCSCxKNMOnUN8ni6M9HyGDqjcD/PKfHVcr
 haMoVmXzA9dWws5GrRZemCI1FNXhC+9VcZwhEnPuDE+Hj+0zrnjO1jE595bSr3jFEtiu
 xrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zmZ0nR+0stasAUqGKga9eB9ZFWY9muOXfNZAhE4dBCo=;
 b=TFZ1+GL6wg3+KoImxhPSxesmnutnARGNijD8ljZTTWn97Zbi8ki5KaULrxVYV3ql7D
 7QB0weRBuiffA8EuQcxXBf2NjqOFk1vIbv86NsDN6P9ISPYTMH8wfULTMvYPv6Z31qKp
 QFqJtHtqXTnTE1XAvkI43aGtZrz+Frx7KI3UmaAW2RT7UB3c3cwtHasBeYpAMyhkKzeH
 tKIIF9LFLOAv7uZ3YmL3zIR04eIgVscrICbRx4HZMWsZeIcTVO31IR9H/IrQe0FTJlXF
 7gwofRKVk01e1zSX3MH09XxrGlk0iJS/JwiEFSYAcpQCJV1jBnlSv46z+leajpf/GW1t
 AUWw==
X-Gm-Message-State: AOAM531tl1J07BGQtAHG9lyjhfk/wBjnhANgf2GLVG8UYvpE6USAvP5s
 HW0Bb4nJNm4OsPOCt7kuuw==
X-Google-Smtp-Source: ABdhPJyIOb9pNzAosEPNXQ9tef9OxRKUmm6zMqaUbTiiSDJ2RtWwlz1pjDLcFQ9c9klXpmg53OhF9A==
X-Received: by 2002:a17:902:eb51:: with SMTP id
 i17mr19791500pli.278.1597850246185; 
 Wed, 19 Aug 2020 08:17:26 -0700 (PDT)
Received: from PWN ([2600:3c01::f03c:91ff:fe6e:64cd])
 by smtp.gmail.com with ESMTPSA id g23sm28739438pfo.95.2020.08.19.08.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 08:17:25 -0700 (PDT)
Date: Wed, 19 Aug 2020 11:16:56 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <20200819151656.GA106705@PWN>
References: <20200810050532.640075-1-yepeilin.cs@gmail.com>
 <774bcf2d-c8eb-086a-3569-c7e530d8a63d@xs4all.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <774bcf2d-c8eb-086a-3569-c7e530d8a63d@xs4all.nl>
Cc: syzkaller-bugs@googlegroups.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] v4l2-tpg: Fix
 global-out-of-bounds read in precalculate_color()
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

Hi Mr. Verkuil,

On Wed, Aug 19, 2020 at 04:26:28PM +0200, Hans Verkuil wrote:
> Hi Peilin,
> 
> On 10/08/2020 07:05, Peilin Ye wrote:
> > precalculate_color() is reading out of `sin` since `tpg->hue` is not being
> > properly checked. Fix it. `cos` is safe, as long as `tpg->hue` is higher
> > than or equal to -192.
> 
> Thank you for this patch, but there is something I don't understand, namely
> just *how* tpg->hue can be out-of-range.
> 
> From what I can see vivid sets hue via tpg_s_hue() when the V4L2_CID_HUE control
> is set. But that control has a range of -128...128, so ctrl->val should always be in
> that range.
> 
> I would really like to know 1) what the value of tpg->hue actually is when it goes
> out of range, and 2) who is changing it to that value. Can you do a bit more digging?

Sure, of course! I will try to figure that out first.

Thank you,
Peilin

> That said, it makes sense that precalculate_color() avoids reading out-of-bounds.
> 
> > 
> > Fixes: 63881df94d3e ("[media] vivid: add the Test Pattern Generator")
> > Reported-and-tested-by: syzbot+02d9172bf4c43104cd70@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?id=db50123c788e2cc5a9d90de569c398b66293ee48
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > ---
> >  drivers/media/common/v4l2-tpg/v4l2-tpg-core.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
> > index 50f1e0b28b25..52205fe096f7 100644
> > --- a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
> > +++ b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
> > @@ -930,6 +930,9 @@ static void precalculate_color(struct tpg_data *tpg, int k)
> >  		/* Implement these operations */
> >  		int tmp_cb, tmp_cr;
> >  
> > +		if (tpg->hue < -128 || tpg->hue > 128)
> > +			return;
> 
> Rather than returning here, I prefer to just clamp tpg->hue to the valid range.
> 
> I'd be willing to merge a patch that clamps tpg->hue (it certainly doesn't hurt),
> but I also would like to understand how it can be out of range in the first place.
> I have the feeling that this is a symptom of another problem elsewhere.
> 
> Regards,
> 
> 	Hans
> 
> > +
> >  		/* First convert to YCbCr */
> >  
> >  		color_to_ycbcr(tpg, r, g, b, &y, &cb, &cr);
> > 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
