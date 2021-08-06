Return-Path: <SRS0=Fc4Z=M5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9117BC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Aug 2021 19:12:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FB0E60F70
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Aug 2021 19:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0FB0E60F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0CD740697;
	Fri,  6 Aug 2021 19:12:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B2pRY2NgJFq5; Fri,  6 Aug 2021 19:12:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A593340687;
	Fri,  6 Aug 2021 19:12:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B462C0010;
	Fri,  6 Aug 2021 19:12:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D59F6C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 19:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C008083870
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 19:12:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z3UO8nnKtgej
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 19:12:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC9D28382D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 19:12:09 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 u5-20020a17090ae005b029017842fe8f82so10105042pjy.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Aug 2021 12:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=enKVtfy+bGCUlHGxN1S81nqMrqDXDDI8zRXHj7c4Uy4=;
 b=ajFW7vQ07hnvFhdryVONTLk6d9cEgwZ72Q9pjLbwyaAeNL/kpVbduZSbLCwSpGFlet
 gJ73iYSj+2DBwfcS+Gcqdd1ZBGxTadoAJMnnV2UXuizZYPmLFFfpgsFD/rZWeo7FEVTE
 FSEG2a59NIy/xX4KHzLX5rjTM3+72iw/2/dTGGIesjwRGrQjinG+xo8HEtk1RLdve4Vn
 2JHa1FizRfN0u77+RvTcNZfZgfI8kTyHtyayVNSsQOae2pq79RLM6ES3+/V8kqu9XpdQ
 Q1TGfWlFjbyN9meEAxeY09z4Oz/GZNQjY7SgtENnBHposYnxbQUgfS045SieR5wSFBDu
 wCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=enKVtfy+bGCUlHGxN1S81nqMrqDXDDI8zRXHj7c4Uy4=;
 b=fYAedLLszlkJSMKI+/zW8XKNA4byfD08o9K/jK6SKkd3Y4BL8TiPBHIZzsTAtc2JXJ
 xa80zbKR6EZlYKNkt/IdjjCv3WzjdNwDcLBdSdIQX6RA1t5ygoVZ+arYLRKduc8Dz8KA
 Vs4hlctF4DMWyv1dIgd/RYK+hI1szOBMPPGoKhNO6Xrex5RF/0kjGcagJrJ6fY/Iv3Fc
 D2cDZjwJyWtxZDYtYev56jbFdOn17An9IhWOvZHpyA6ckydfaakRec4TWdnMdYAP5hRv
 X02uJMYRX3hfHbnDzdqGOr6bLcuH7Es032oXaTu3RRph/bViYAetmQhHchFtgS9EzbhX
 2PAg==
X-Gm-Message-State: AOAM530DFjuxVNh77j8uQR3Xz2qOHBxeC0rsgYpE7m1x3XrlBppfsWlF
 hfGmXHdJZkDRa+40dljR3ok=
X-Google-Smtp-Source: ABdhPJypyR/z3cvepph6dDulWNpwYJV5VjhHu7iV9x3NUVodtKeXgTM6f2BUIYFXAT1jzOtHvoxFkw==
X-Received: by 2002:a63:ef12:: with SMTP id u18mr601608pgh.331.1628277129191; 
 Fri, 06 Aug 2021 12:12:09 -0700 (PDT)
Received: from uver-laptop ([2405:201:6006:a148:daf1:7357:b291:d057])
 by smtp.gmail.com with ESMTPSA id m21sm11360503pfo.159.2021.08.06.12.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 12:12:08 -0700 (PDT)
Date: Sat, 7 Aug 2021 00:42:04 +0530
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] USB: serial: iuu_phoenix: Replace symbolic permissions
 by octal permissions
Message-ID: <20210806191204.GB6736@uver-laptop>
References: <CAKXUXMymBWUcy53a38hA9b3VYL0af2vpDW0=xsCEWuiiUQQn-w@mail.gmail.com>
 <20210803142131.17192-1-utkarshverma294@gmail.com>
 <CAKXUXMxJ9CKP1nftTWmP-UTaMMyuOtoNYz4SQYrDPP9PdaRp4A@mail.gmail.com>
 <20210804191242.GA4956@uver-laptop>
 <CAKXUXMyPWbP1zQWOg6o2jGcE0tOMBvTXfWw0Bk3edy2s_WY+Ug@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKXUXMyPWbP1zQWOg6o2jGcE0tOMBvTXfWw0Bk3edy2s_WY+Ug@mail.gmail.com>
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

On Thu, Aug 05, 2021 at 11:26:49AM +0200, Lukas Bulwahn wrote:
> On Wed, Aug 4, 2021 at 9:12 PM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
> >
> > On Tue, Aug 03, 2021 at 08:11:28PM +0200, Lukas Bulwahn wrote:
> > > On Tue, Aug 3, 2021 at 4:21 PM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
> > > >
> > > > This fixed the below checkpatch issue:
> > >
> > > Use imperative; you can drop "below" here.
> > >
> > > > WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred.
> > > > Consider using octal permissions '0644'.
> > > >
> > > > Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
> > > > Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > >
> > > Usually it is Suggested-by first, then Signed-off-by at the end.
> > >
> > > Do you find a pointer for this order of tags on the commit message in
> > > the documentation, e.g., in
> > > Documentation/process/submitting-patches.rst?
> >
> > No, I didn't found any such rule in the Documentation files.
> >
> 
> I think you could try to create a patch to add that information on the
> ordering of these tags here:
> 
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#the-canonical-patch-format
> 
> You will find the source of that documentation at
> Documentation/process/submitting-patches.rst.
> 
> Do you want to give that a quick try?
> 

Unfortunately, I didn't find any rule for the sequence of the tags.
Tried searching for discussions on the mailing lists but to no avail.

Generally, Suggested-by is first, then Signed-off-by is used, but it is
not a hard and fast rule. Many patches do not follow this order, and the
tags can be put in any sequence. For example:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=39652741c80bb0006214cf81ba9707d2dc372292
https://lore.kernel.org/linux-devicetree/20210221174930.27324-10-nramas@linux.microsoft.com/


Regards,
Utkarsh Verma
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
