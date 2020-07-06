Return-Path: <SRS0=kxRd=AR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211A0C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 18:21:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E17C42053B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 18:21:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQxVWHcj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E17C42053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BE7FC879FE;
	Mon,  6 Jul 2020 18:21:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h-gepCVy8si8; Mon,  6 Jul 2020 18:21:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 55D50879F1;
	Mon,  6 Jul 2020 18:21:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3633BC0891;
	Mon,  6 Jul 2020 18:21:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1294BC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 18:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0E3CC879F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 18:21:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BjhO-tj8pN-e
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 18:21:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5A66E877A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 18:21:17 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id k6so33727032ili.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Jul 2020 11:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V0UyprzGOpJCrvSRMTeiKdKQODoWH/Ul9V8rM2fcjek=;
 b=NQxVWHcjXotZUs9osvV8QUiCAoR4tgGZHVto/QVWnE0/gvvZ/6BbHfRgDABY5x7aRH
 wEjq6u56xD5ttDRD+QN8gI96K4JYZ+1bTu6k3KxUAJLKV332WUUOmFkawijGXlCgzffl
 dWChdPB+z/ZSX+AAVk7SALZYVvlJkdKBlaYOWZPzhcbIFrZ0W3d/mhZGvngoEgbDi5bO
 1QbHKlFdAsfOeicqSqbieDFyV5R4mUNsaylwX0RbxLVQJa97thInsGJuUxMV8kCck8gb
 d4vPb6QR+LqA+viO/qYinJH/bc/4tx8y1OMMuWMfbgO3EvKr+Ct5SuStM2TGUulxYHr9
 3hNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V0UyprzGOpJCrvSRMTeiKdKQODoWH/Ul9V8rM2fcjek=;
 b=fM50A49diwoOyNnz4sSAQzgo69rEGBxSAj19qSClKO7m7oGA8nd5wHZ3pKdyLn77FU
 cK7wYc9IANU5l4Vih5BFqz0Kb0jEsmXCuez2lGoYGQ5cxGsXzV+2uDTXnfxmUIFCsPnP
 +MiK+yTPDXQxwK08czGAPG8sCjhEclvOgRgJw2pTmK5OMfcJAX1jOyRfM5miGQZxqnyF
 uINOqJ0YiaH9jrJihnHnQMmkG6rZPi6HSF/H8FubgiQArbya8mio87pbWJrpu8No/XLV
 /s1onXrs/3c0cFFkzp3ftl6XRC79R3WQs3dImhI5jBq0SapfG0VctD+T5UH8z77Obuul
 vUlA==
X-Gm-Message-State: AOAM532kvhlN1eNX+y55anPIU1xzRdPkNgjs1Ec7W6BZzC0sx0n+5ViD
 yPBbwu4qVEko8ZBjYUlCZGTXhj0vh/yn+dr3wVc=
X-Google-Smtp-Source: ABdhPJyoUpqQP7ExvgQg6jlWGuD67jd+pPKzAlGa3XPHsroQPCFsp38zhEGfcVb52hJVx5RhRxmhKo1NuYqZ7YP9TJs=
X-Received: by 2002:a05:6e02:1086:: with SMTP id
 r6mr29456065ilj.158.1594059676475; 
 Mon, 06 Jul 2020 11:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200706180010.29032-1-puranjay12@gmail.com>
 <20200706121407.6c24f537@lwn.net>
In-Reply-To: <20200706121407.6c24f537@lwn.net>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Mon, 6 Jul 2020 23:51:05 +0530
Message-ID: <CANk7y0h0p+OjYvtFbGf-C7FeOdgf3HBtd=jVdDTHYP5eKv2uvQ@mail.gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Documentation List <linux-doc@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] Security: Documentation: fix:
	`make htmldocs` warnings
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

On Mon, Jul 6, 2020 at 11:44 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Mon,  6 Jul 2020 23:30:10 +0530
> Puranjay Mohan <puranjay12@gmail.com> wrote:
>
> > Remove extra ')' after function name to fix warnings.
> > It solves following warning :
> > WARNING: Unparseable C cross-reference: 'groups_sort)'
> > Invalid C declaration: Expected end of definition. [error at 11]
> >
> > Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
> > ---
> >  Documentation/security/credentials.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/security/credentials.rst b/Documentation/security/credentials.rst
> > index 282e79feee6a..d51e42b92395 100644
> > --- a/Documentation/security/credentials.rst
> > +++ b/Documentation/security/credentials.rst
> > @@ -455,7 +455,7 @@ When replacing the group list, the new list must be sorted before it
> >  is added to the credential, as a binary search is used to test for
> >  membership.  In practice, this means :c:func:`groups_sort` should be
> >  called before :c:func:`set_groups` or :c:func:`set_current_groups`.
> > -:c:func:`groups_sort)` must not be called on a ``struct group_list`` which
> > +:c:func:`groups_sort` must not be called on a ``struct group_list`` which
> >  is shared as it may permute elements as part of the sorting process
> >  even if the array is already sorted.
>
> So this is a great fix, thanks for sending it.  That said, there are a
> couple of ways in which this fix can be made even better:
>
>  - The simpler of the two is to change the subject line of the patch.
>    "Fix a warning" is almost never a good description of what you're
>    doing; what you are actually doing is fixing a broken cross reference.
>    So the subject line should say that.
>
>  - In this case, though, there is a much better thing to do.  We
>    deprecated the use of :c:func: around a year ago; the docs build system
>    can now do the right thing automatically.  So a fix that would both
>    eliminate the warning and improve the document as a whole would be to
>    replace every instance of:
>
>         :c:func:`function_name`
>
>    with:
>
>         function_name()
>
> Is there any chance I could get you to send a patch that does that?
Yes! I have started working on it.
>
> Thanks,
>
> jon
Thanks,
Puranjay
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
