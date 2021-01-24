Return-Path: <SRS0=cPcG=G3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A823C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jan 2021 16:20:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F217F229F0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jan 2021 16:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F217F229F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C437B871BF;
	Sun, 24 Jan 2021 16:20:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fHwv3SF8V1hN; Sun, 24 Jan 2021 16:20:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 216DC871A9;
	Sun, 24 Jan 2021 16:20:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E214C0FA7;
	Sun, 24 Jan 2021 16:20:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7888C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B6BD2868BB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:20:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q7E4VIIAsedu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:20:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C079B868B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:20:11 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id x21so21606769iog.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 08:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KnnQnqCVdB2y4NAxIIjTl94EE9gPtVCCOUsx0yuFqH0=;
 b=lZghOekrn9CFNkOKdT67zhDIhwJSznUlk6yi2wFNx2/XZbd+xu7e+66KK+51xZbfFM
 BL9h2PbO8SHbOWwbt933qPbk+CVSSkm/MfDp7bBpioO6ywFvgzhNfzcnBL+R0GhVRART
 JDyfSpcUEA+nxLO/DX1M2ZEmFK4GUGKKRi1DlcCgwtstvqCGsT7zWX+VNM+pXjzmngS7
 dnGwpZgu+brH3Wwce51JOhrH/0IZFX/bGkZuMxak9zbNP1HhLM1fPwgVjwckIrRqV0wf
 2xnC0S42L/GnW3CW4s8YSzNyAKeCboKrhmZeaAEnIlZhnXewQMV1TPvAuO7ge2Gwb0o8
 Yc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KnnQnqCVdB2y4NAxIIjTl94EE9gPtVCCOUsx0yuFqH0=;
 b=Kbfz8+2tnP7K0NvKAcFGJ7GKpKVivQJPVikj2O33GwwkEFIrZz8kPD9KoeJ54tqkgB
 c5DwTia/MwXg5bK8cfavJJ9LUb75kewgfXnRVGkBFAAPdV7o9MVZpNGPTE/gd90Pw1xh
 LCzO1p6lK/tXDeVR1ssmLwN36HK4/5wkUMJtz2fzW8NSLVpGTfH7tNLQGlh27YIkslvo
 I584QD7UJKaG27XYnd0kHxb11q4jQTZ+nfdmI4i/ayHqL9S2VoP68SqavR4BRVTTnHQP
 eKSDuTxkz21gWByt3+QKD6tKtOI7Wvy0Z4gFdNI57A6fITqzIdLpx4ONqoc3dXfX5ByK
 i/rg==
X-Gm-Message-State: AOAM5315lPltOeCOimONUUtqh9otHRFRtHmsLvomOtRLR00sIxQ4D+FX
 PJHE8eVD3QUa4yawxUXUoqjSi9JwnYfn33HXE5U=
X-Google-Smtp-Source: ABdhPJxLgR7QZPDB4s5CiIhekB5N+sxJELg4LvgkUEvL0PjyygtIWolxXQUJVkBShzz5ki076Eo7EqUQRWSoW6f7GGg=
X-Received: by 2002:a05:6e02:20c4:: with SMTP id
 4mr124714ilq.221.1611505210937; 
 Sun, 24 Jan 2021 08:20:10 -0800 (PST)
MIME-Version: 1.0
References: <20210124151933.19696-1-dwaipayanray1@gmail.com>
 <CABJPP5C8U-nmrqggR=Ea3drNF9VxqfisG49sVcNQfufTYejp+g@mail.gmail.com>
In-Reply-To: <CABJPP5C8U-nmrqggR=Ea3drNF9VxqfisG49sVcNQfufTYejp+g@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 24 Jan 2021 17:20:00 +0100
Message-ID: <CAKXUXMzvQVud9qiZby3rznLS=JGd+6MKkC8Yrj7X_Bec9YZmmQ@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC 0/3] docs: add documentation
	for checkpatch
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

On Sun, Jan 24, 2021 at 4:29 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> On Sun, Jan 24, 2021 at 8:49 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > This patch series serves to introduce a documentation for kernel script
> > checkpatch.pl (scripts/checkpatch.pl).
> >
> > A top level tools directory has been created in docs which shall contain
> > the documentation related to the kernel tools and scripts.
> >
> > This documentation shall be progressively updated by future patches to
> > document all the message types in checkpatch. Consecutively this
> > documentation itself will be parsed by checkpatch to generate verbose
> > messages.
> >
> > Dwaipayan Ray (3):
> >   docs: add documentation for checkpatch
> >   docs: add documentation for checkpatch
> >   docs: add documentation for checkpatch
> >
> >  Documentation/index.rst            |  11 ++
> >  Documentation/tools/checkpatch.rst | 271 +++++++++++++++++++++++++++++
> >  Documentation/tools/index.rst      |  10 ++
> >  3 files changed, 292 insertions(+)
> >  create mode 100644 Documentation/tools/checkpatch.rst
> >  create mode 100644 Documentation/tools/index.rst
> >
> > --
> > 2.30.0
> >
>
> Hey Lukas,
> This patch series serves to introduce the checkpatch documentation.
> A part of this documentation will be used by checkpatch, I am working
> on that right now. Subsequently all the message types can be documented
> slowly.
>
> The initial plan is to parse the part between
> .. CHECKPATCH_START and .. CHECKPATCH_END.
>

Plan sounds reasonable, we will refine as we go.

Go ahead and implement the checkpatch.pl feature to parse this file
and output the description, and send it as RFC to Joe as well, but
point out what is important to you for his opinion (I think you care
if the checkpatch.pl implementation can be done that way) and what
will we refine and completely rewrite as we move forward (the
documentation is really much more work in progress).

> As for the documentation itself, it would be great to have your review on it!
> I could send the pdfdocs as well if you need it.
>

All fine, I can pick this patch series and generate the documentation
locally myself.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
