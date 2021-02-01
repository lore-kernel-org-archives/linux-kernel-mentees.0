Return-Path: <SRS0=YUr9=HD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A39FC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Feb 2021 16:51:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C8DE64DE3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Feb 2021 16:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C8DE64DE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F12DE20505;
	Mon,  1 Feb 2021 16:50:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sZEAJ-i0zMit; Mon,  1 Feb 2021 16:50:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 983F020020;
	Mon,  1 Feb 2021 16:50:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 841CBC0174;
	Mon,  1 Feb 2021 16:50:58 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A898C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Feb 2021 16:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7E1E886519
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Feb 2021 16:50:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TeRfks-OF7RR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Feb 2021 16:50:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DF77A864DF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Feb 2021 16:50:56 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id n14so4249250iog.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 01 Feb 2021 08:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0q//F6ZP0U4h6C3Zdskf4kGUQLIK2PK8TU7pLmgs/wg=;
 b=XgPjQenGHfZeQHNjMJLXH7tiEIu7p8F1U4XRhzLrTVZwmzN7kAIaKVwqr2Sdcz5dFO
 wF00Qb+p8Z53/VVAkCJbQvTVnvHd3bOcerxmzrpGUYCE2taKHLRuAYw1LcQDxa3Qwso7
 8mBxGlxMK+0JJ+SDe2WdoMb/X3jG1GKDbVRJFdedFxhcGXSm8eVqW7UOmXIlN6WU/cVz
 YqkJH6pYYPqpkiAPcsVXhdVuHhJ2RC09lW0bhoPjfWMXIDYmH/rpUlARo5GhGEwxswkt
 hpAaQ5wpF0dYzHt/FKHzIhNHNvgD4FjYZAILhdF7aM/ZpSpisJ8zRGuTfSXKAL/xhCq0
 VsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0q//F6ZP0U4h6C3Zdskf4kGUQLIK2PK8TU7pLmgs/wg=;
 b=CUJ1HyexPQNkDdUXJsxONM8IEQ31UcceOW7EqrkzawkdyToqL01W3/kgMLYvfOSH4m
 C50KCqMU/j5MxktZlgN6pLbNqTI3VUIJF+dJh1yeg092A6Pyuo1UCscOBgAOCAp9IO5T
 oHnrYcSTR1gWNoQ4SRXSyE/V10SCiZBwQ9v0nyqIi3cWQEhBOIlSsVHnFzB/ZrHbe77O
 Oyj+sy7N90nOoG7qc7PIBBWNhDEHN0HMBhjrQ0Xexml9Wic6MDdEN/sjXmLn7fturYXb
 5b0Y83OV2RYhzGaFuh54/mbKDnegHUKRRLBBh1RG9N8RfC84OFUL+Z+GsiOEtCTsuJi0
 NC9A==
X-Gm-Message-State: AOAM530eXfOPEOds9OIkKCah0QOh/x2Fh3Ra9KwoZuTsr52YRJup0+Uu
 +BEAdD5nYMnCeU6HewwVvVAyAk3k4K3VflHp434=
X-Google-Smtp-Source: ABdhPJx/nCxdkEX2xbEp9PrEgbMNtKW+kyE5zujTUhU19xGrlzGgyl2CYpPxjNBg90bgLCImXneYa9PAby5d1w4DxQA=
X-Received: by 2002:a5d:84d0:: with SMTP id z16mr4894724ior.114.1612198256195; 
 Mon, 01 Feb 2021 08:50:56 -0800 (PST)
MIME-Version: 1.0
References: <CABJPP5AxB8-kafFEpsMydg8eMx8bH5ooT5g7r0fKWV2T2Hjtng@mail.gmail.com>
 <YBguQ/dENrfvtptJ@kroah.com>
In-Reply-To: <YBguQ/dENrfvtptJ@kroah.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 1 Feb 2021 17:50:45 +0100
Message-ID: <CAKXUXMwtXTYfs_9Asnmpd09zsucg8tRehMi2Shv8V49H-rs4xA@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] Patches from the future - can checkpatch
	help?
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

On Mon, Feb 1, 2021 at 5:37 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, Feb 01, 2021 at 10:04:01PM +0530, Dwaipayan Ray wrote:
> > Hi,
> > on linux-next,
> > $ git log --pretty=format:"%h%x09%ad" | awk '$6>2021 {print $1}'
> > gives:
> > 4a2d78822fdf
> > 12ca45fea91c
> > 09f2724a786f
> >
> > These are patches from the year 2085, 2037 and 2030 respectively.
> >
> > Would a checkpatch rule be helpful for these or are they too
> > isolated to waste runtime on?
>
> Dates come from your email client, not the patch itself, how is
> checkpatch going to catch this?
>

Dwaipayan, there are two ways:
- We build a bot listening to mailing lists and check. I like that
implementation idea for various other checks.
- Stephen Rothwell could include this as a check on linux-next and
inform the git author and committer.

I am wondering though if that is worth the effort, three instances of
a wrong date among 1M commits seems to be very seldom and the harm of
that mistake is quite small as well.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
