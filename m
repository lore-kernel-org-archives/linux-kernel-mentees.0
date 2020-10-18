Return-Path: <SRS0=+KdI=DZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CAFBC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Oct 2020 06:40:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3FD120EDD
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Oct 2020 06:40:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pgbBFNxm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3FD120EDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5A46087895;
	Sun, 18 Oct 2020 06:40:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rETOoEDHj5R1; Sun, 18 Oct 2020 06:40:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 911DD87833;
	Sun, 18 Oct 2020 06:40:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 766FCC088B;
	Sun, 18 Oct 2020 06:40:35 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 325C3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 06:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1EA332152E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 06:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MjVuUOjjFWS0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 06:40:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 39B342151E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 06:40:33 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id i12so7446140ota.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 23:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gRbfK/w/58D7qQC029pKGSVGRS/jDpu6/Ih6yqOrFPw=;
 b=pgbBFNxmzAveeohnIeVe72J6Fj9OmClKe5Onk/chFEEwwGPAAxITS6RYPA+IdoWxBR
 fxdKCYXov+Hl5vYxrnH5sxbNa5oA7F3P0Jlei2LEz70yjNXWv7VzDRZvDVM509G3LQ1x
 dqbbw3oMe1FxvaHMvQ554xOS/orM6/X/jdFdaBrYh45H+Ymy/C8jmdAotaFcR7NHIq6y
 Nq9sqHR0HMyzGqWQh1c0SwTsGAAqdy5y3fSFu90LXDPhE//99S4G6ZY9d2REhvwSfUkP
 Luro/6LxBmyrRhvU1A0VJK7H48WCsH7AbAaaAAxsnnRred0Yn6ejzVazFrqXhohu2R6j
 S09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gRbfK/w/58D7qQC029pKGSVGRS/jDpu6/Ih6yqOrFPw=;
 b=GuyPXRtjkyySoMSewQmDYS++pDXMmQc880QeYUyZp03T27i7Bzr7SzfwZTJedmFu1P
 nCefyGaZetcgf/eWyvUaQFxy4YPuEo0FtOP6dOp4Cp4NeMgOb9UQ+NXfIXO1HSaCzODN
 Cmju2+XJBiAxHbPHSoHXqdWhA/mwXgAbmUY/DsfvE22Bh0phq+z0V/JmF52XiyHxnVuS
 ZPAzuFuqyT8Ec86vPOspw0tCcIulVMpE85mt6xN4pMPPXNzPQFSB+CiYxdVTZQRU1SEQ
 6x+7ddErDy41s1lIVAtg0Ha/Kw7ydB6GZGWJ3ouC/aWBqt6atlIvSfRCjMTegV4pmDQf
 2VMQ==
X-Gm-Message-State: AOAM532syuljUzG7JlByxeHDuSSbYd7/bhFGKBmYGP6FqNlZDqllnQk5
 5usMcHVcEEtF5ABlMXyW/Dl8TdW8gFRjkABLXCs=
X-Google-Smtp-Source: ABdhPJzv+aywb1TLkB0Yr+2VkEg95gln7XVwiV7WFMjyYd0QnPl1yTkfJaIA8BLBC6ru8TwO5kfNXq8r5KFIrXHAbH8=
X-Received: by 2002:a9d:53cc:: with SMTP id i12mr8061129oth.215.1603003232248; 
 Sat, 17 Oct 2020 23:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201017162732.152351-1-dwaipayanray1@gmail.com>
 <1ad9c5f49e10a192f0c6efb1116f3f0d31adce74.camel@perches.com>
 <CABJPP5DuQ_Y0LLS5BzNXUWyxjzp9ts5kgEH-3+7Pn7PPjq0Ljg@mail.gmail.com>
 <eda7a64b4af42ba1fb66a5b3704780cf3f761951.camel@perches.com>
In-Reply-To: <eda7a64b4af42ba1fb66a5b3704780cf3f761951.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 18 Oct 2020 12:10:05 +0530
Message-ID: <CABJPP5Cr3giDJkJvBDd62iwx6y6r1dFhaVXp9jYXS8Y6k9b09A@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v5] checkpatch: add new exception
	to repeated word check
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

On Sun, Oct 18, 2020 at 11:50 AM Joe Perches <joe@perches.com> wrote:
>
> On Sat, 2020-10-17 at 22:19 +0530, Dwaipayan Ray wrote:
> > On Sat, Oct 17, 2020 at 10:03 PM Joe Perches <joe@perches.com> wrote:
> > > On Sat, 2020-10-17 at 21:57 +0530, Dwaipayan Ray wrote:
> > > > Recently, commit 4f6ad8aa1eac ("checkpatch: move repeated word test")
> > > > moved the repeated word test to check for more file types. But after
> > > > this, if checkpatch.pl is run on MAINTAINERS, it generates several
> > > > new warnings of the type:
> > >
> > > NAK.
> > >
> > > Slow down and test before you send more patch versions.
> > >
> > > > +                             next if (index(" \t.,;?!", $end_char) == -1);
> > >
> > > what does this do?
> >
> > Um, it checks if end_char is not present in " \t.,;?!".
> > If end_char doesn't belong to this list, then the check shall
> > skip. That is the test will skip for "word word:", but will produce
> > a warning for "word word." or "word word?", etc.
> >
> > Shouldn't this itself be the case or am I perhaps going wrong
> > somewhere?
>
> No, you were right, I was being a numbskull.
>
> btw: I think this should set
>         my $end_char = ' ';
> not ''
>
> so that if the last word on a line is a
> repeat the test still works.
>
Hi,
Umm, index() function seems to return 0 when an empty string is
passed. I tried this:

print index(" \t.,;?!", '');

It output 0 in my case. So last words on a line seems to work.
I don't know if this changes with the perl version though.

So given this, will it be necessary to change end_char to ' ' ?
or perhaps change both start_char and end_char to a ' ' to maintain
uniformity?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
