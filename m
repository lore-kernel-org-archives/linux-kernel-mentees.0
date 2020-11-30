Return-Path: <SRS0=9pg8=FE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C28B9C63777
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 16:16:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A89F206D5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 16:16:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d05oyz5C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A89F206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7B24E87174;
	Mon, 30 Nov 2020 16:16:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id igHnWrdJSjyh; Mon, 30 Nov 2020 16:16:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 08B2D8715E;
	Mon, 30 Nov 2020 16:16:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0B7DC163C;
	Mon, 30 Nov 2020 16:16:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86174C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 16:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6E95021519
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 16:16:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OFylYuDiXgrP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 16:16:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by silver.osuosl.org (Postfix) with ESMTPS id 4410821080
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 16:16:46 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id a9so22693936lfh.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 08:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DUgaPlmL8haaeCTvU+42K7uMbksxZbVAYR3PDLb/abU=;
 b=d05oyz5CwsVHH+4C5EHmnPSQFCZJ2ojVh43c159TmrKs1fmMptNQpw2VhZu5c8Okx4
 rEZbq/Gx8i4dvJXRjU3JdTf1ULavrfZMe4kzbyUFO0K1jl5tmN+d2hbxMp11dbJUBjPn
 6S98oVVEBk4gxgiF2klZPGsQ4VOPtsZegU4Hf9NHdKLc+GGc2zBxhgllggm8Br6zWPF/
 bEVaRHDNJp36qvnmwW3L6dBDKeUrgD49JxEbgMYRqyAMhbowmmmQ7yDkrX8KfwAUgqA5
 a734ilO2P8XZ1ah1wk1qQgBK9DlDDSZsx/ZsmorqSf2hATqU0U8JC3nLX8b18uFFQHtf
 8e8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DUgaPlmL8haaeCTvU+42K7uMbksxZbVAYR3PDLb/abU=;
 b=cAqQUNVk+R5a94zERrUuGp0JOXSA7Hme10gZFJXylxBuboP8RoVGFFSa7+P7Td8cbc
 zVJTkkmpDoKZq3rH9BkWSC0vnTpKHoLidsHwBIukoaRI28WnQqfgBbPpopXQ7lU1EHtc
 wkFRvfN1Q1LTwdwZDq7Myg1GbievK35IhTlAJ4JPWLwkQ+VP8mCUNIwJXqDsz6Yv3Bbc
 UQe7kXYIUKDoB8fG7WUsHse2fP+lG320lPCIDAJkJn2iHKRu+kLrXS20ovxTGjlopPvJ
 i2aj4ZCzU9QVpuWa2+Ds3oq2jbl0JZPoogeRk5biwoa04hqizCeoSLRWf75n6DxbaHZK
 sUEg==
X-Gm-Message-State: AOAM533W6HohT5zh9nQ+M6RaljC2DUlp1R+dNaVCIeuXjFx2wQ3jy0HT
 qMnlkNo3TGqQrDdkZNzBAlk/jNb+2XjAjt9u/j0=
X-Google-Smtp-Source: ABdhPJzmeBu+E9xt0K8NPJYvFZo+uor0hGohPg84S+guM3XQ9fjMAk5ZyGWaKtn3cn8UjtllaRhmyb7fsNZO5U1kS3o=
X-Received: by 2002:a19:c005:: with SMTP id q5mr10376426lff.400.1606753004250; 
 Mon, 30 Nov 2020 08:16:44 -0800 (PST)
MIME-Version: 1.0
References: <CABJPP5CZhURjFi9xE9KpxKSygS2z_8pbnrvhvV0nQGP9+vZ5_g@mail.gmail.com>
 <20201130152329.GA25773@PWN>
 <CAKXUXMxGdWNQy95AEB1Ph8dqBgambD2t6s+--g0aT2VYj0q__g@mail.gmail.com>
 <20201130161326.GA26186@PWN>
In-Reply-To: <20201130161326.GA26186@PWN>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 30 Nov 2020 21:46:15 +0530
Message-ID: <CABJPP5D0gFgRyu-MpyLgcuRVf6sqMcvJpJrkV-uAFCaD2jVD2w@mail.gmail.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Possible new warning for checkpatch
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

On Mon, Nov 30, 2020 at 9:43 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> Hi Lukas,
>
> On Mon, Nov 30, 2020 at 04:51:42PM +0100, Lukas Bulwahn wrote:
> > On Mon, Nov 30, 2020 at 4:23 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > >
> > > On Mon, Nov 30, 2020 at 08:28:23PM +0530, Dwaipayan Ray wrote:
> > > > Hi Lukas,
> > > > I was having a talk with Peilin and a possible new idea came up.
> > > > It's about lines in the commit message that start with a '#'.
> > > >
> > > > Normally if a patch contains lines starting with '#' in the commit
> > > > message, when they are applied they successfully appear in the
> > > > git log. But if a maintainer for some reason decides to rebase and
> > > > reword the commit message for whatever reason, the # lines are gone.
> > >
> > > Thanks for bringing this up Dwaipayan!
> > >
> > > Yes, for example, if one included some code examples (e.g. `#define ...`)
> > > in the commit message, then the maintainer applied, and reworded the
> > > commit to add their own Signed-off-by:, then all the # lines are gone.
> > >
> > > > Peilin had a look at it and he was able to successfully reproduce this
> > > > fault.
> > > >
> > > > Now would it make sense if a warning for such lines starting with '#' in
> > > > the commit message are emitted by checkpatch itself? I have no idea
> > > > what other developers do, so I could be wrong at this point. But I would
> > > > like your opinion.
> > >
> > > I admit it is a beginner's mistake, but I myself learned it in a hard
> > > way (i.e. by having a patch mainline'd then seeing these # lines gone),
> > > so personally I hope this becomes a new feature of checkpatch.
> >
> > I think this makes sense and checkpatch should warn about that;
> > probably the easy way to fix it is just to indent such lines by a few
> > spaces, e.g., four spaces.
>
> Yes, that prevents them from being dropped accidentally. Thank you,
>

Yep, that sounds good to me too. I will send in a patch soon.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
