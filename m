Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182FBC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 12:50:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFCF8206D8
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 12:50:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tGdMuCgb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFCF8206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A484D87EB5;
	Tue, 28 Jul 2020 12:50:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4vVZf4HnaNqD; Tue, 28 Jul 2020 12:50:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1C28187EB0;
	Tue, 28 Jul 2020 12:50:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B546C0050;
	Tue, 28 Jul 2020 12:50:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15E4CC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0534886265
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:50:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M7mKI4-HSM8E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:50:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BA16986288
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:50:24 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id h21so8279333qtp.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 05:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GgtMyjeO4HLpQBw/exS2AHiDSiKY8Aj2c/cuRUlzRaM=;
 b=tGdMuCgbBf+xUH44MOqwqObI23V3rvUFzUFZI/QjbU42CBRhT+wgaqwZjd+kldED/Q
 ki01CNPPE0cfaK1npzMluvdLLHCpwL7fueCxjK8z/Q5T/ADUxgNVkIE4jQGGxlZBkSyC
 rgNVakvPQRiTg3RM3l2UKUnlO+SZ21CLUor6vXSKVYvp21NE2OFHAhjboShkXKLD/aGH
 WLz9W94j70D1ynUHaVzpHD9eX2ZrJR2Zx/glrW3ICbYTos8ZHd0nJwTWLiZtOOK0vjGH
 rVAEGR7jE1neaho/frDgI5cLckZWRrb4jgz28e9aRtTGaSKlPRlz/nleXZGC9cgSpenP
 Q6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GgtMyjeO4HLpQBw/exS2AHiDSiKY8Aj2c/cuRUlzRaM=;
 b=rTcFrHVsiRoR6/H0rC/FNetThicLJB8vyl0U7bk0BNlf+DVwcYDQe6R/Foa6wVKdDj
 YQG6fDldT0GTy+7xAjDcQeGORkTIs6fJNoXI9ScT+B323bNYi3rll322etjT9iM+c7Vx
 Qd2jUPKbk7PGaGeOXKLb1AAaVXV6vH1dFakeYAISHCiofswC75v40gM2clkSdG6rwYIV
 ibSlhcwz16LXNQksaUL/ezd38i99+aYB7yx86vGTr9CgeuLbtQGncly/ZDmTOxBy5cww
 dr7t3MbvzT9yBgqf/KwCxp6uMJHv7VT1IT/zLofWkGjLIPmNHVec6PNTGz+CvawEjq9M
 ZVug==
X-Gm-Message-State: AOAM533iIaXvhWsg3hUdJDQBIiJ0EwrpOKyjYoQzHhNaXATT5okQTKpZ
 o2uhywviqEXmplC2N+SK/w==
X-Google-Smtp-Source: ABdhPJxtmQcEAy5Fs04CmF0q3XaPWDqDwnhC4OEWLtN3cKQJP31ESmu5OAHSU7gHukiYE7G/FcVVeQ==
X-Received: by 2002:ac8:73d9:: with SMTP id v25mr13958369qtp.82.1595940623774; 
 Tue, 28 Jul 2020 05:50:23 -0700 (PDT)
Received: from PWN (c-76-119-149-155.hsd1.ma.comcast.net. [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id c70sm20373613qke.109.2020.07.28.05.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 05:50:23 -0700 (PDT)
Date: Tue, 28 Jul 2020 08:50:21 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: David Laight <David.Laight@ACULAB.COM>
Message-ID: <20200728125021.GA409978@PWN>
References: <20200728014343.341303-1-yepeilin.cs@gmail.com>
 <20200728115210.408486-1-yepeilin.cs@gmail.com>
 <3058d741282b463d8aa7c8aff62e4326@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3058d741282b463d8aa7c8aff62e4326@AcuMS.aculab.com>
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] drm/bufs: Prevent
 kernel-infoleak in copy_one_buf()
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

On Tue, Jul 28, 2020 at 12:35:17PM +0000, David Laight wrote:
> From: Peilin Ye
> > Sent: 28 July 2020 12:52
> > Currently `struct drm_buf_desc` is defined as follows:
> > 
> > struct drm_buf_desc {
> > 	int count;
> > 	int size;
> > 	int low_mark;
> > 	int high_mark;
> > 	enum {
> > 		_DRM_PAGE_ALIGN = 0x01,
> > 		_DRM_AGP_BUFFER = 0x02,
> > 		_DRM_SG_BUFFER = 0x04,
> > 		_DRM_FB_BUFFER = 0x08,
> > 		_DRM_PCI_BUFFER_RO = 0x10
> > 	} flags;
> > 	unsigned long agp_start;
> > };
> > 
> > copy_one_buf() is potentially copying uninitialized kernel stack memory
> > to userspace, since the compiler may leave such "holes" (around `.flags`
> > and `.agp_start` fields) in this statically allocated structure. Prevent
> > it by initializing `v` with memset().
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 5c7640ab6258 ("switch compat_drm_infobufs() to drm_ioctl_kernel()")
> > Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > ---
> > Change in v2:
> >     - Improve commit description. (Suggested by Arnd Bergmann
> >       <arnd@arndb.de>)
> > 
> >  drivers/gpu/drm/drm_bufs.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> > index a0735fbc144b..f99cd4a3f951 100644
> > --- a/drivers/gpu/drm/drm_bufs.c
> > +++ b/drivers/gpu/drm/drm_bufs.c
> > @@ -1349,10 +1349,14 @@ static int copy_one_buf(void *data, int count, struct drm_buf_entry *from)
> >  {
> >  	struct drm_buf_info *request = data;
> >  	struct drm_buf_desc __user *to = &request->list[count];
> > -	struct drm_buf_desc v = {.count = from->buf_count,
> > -				 .size = from->buf_size,
> > -				 .low_mark = from->low_mark,
> > -				 .high_mark = from->high_mark};
> > +	struct drm_buf_desc v;
> > +
> > +	memset(&v, 0, sizeof(v));
> > +
> > +	v.count = from->buf_count;
> > +	v.size = from->buf_size;
> > +	v.low_mark = from->low_mark;
> > +	v.high_mark = from->high_mark;
> > 
> >  	if (copy_to_user(to, &v, offsetof(struct drm_buf_desc, flags)))
> >  		return -EFAULT;
> 
> The memset() isn't needed.
> The copy_to_user() stops after the 4 'int' values so no 'random'
> kernel stack can get copied.

You are right, I overlooked that. Thank you for pointing this out!

Peilin Ye

> Quite why it is 'right' to leave the remaining part of each
> userspace structure unchanged is another matter.
> 
> 	David.
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
