Return-Path: <SRS0=MU2n=DU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A45EC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 18:03:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7B382539E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 18:03:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="pVQ+55Ft"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7B382539E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 31F8986FE2;
	Tue, 13 Oct 2020 18:03:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IeIsWYkYu8fT; Tue, 13 Oct 2020 18:03:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9029286FB4;
	Tue, 13 Oct 2020 18:03:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7982FC0052;
	Tue, 13 Oct 2020 18:03:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C007C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 18:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0391D2E13C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 18:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RgbgAniCMrY9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 18:03:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com
 [210.131.2.91])
 by silver.osuosl.org (Postfix) with ESMTPS id D2F392043C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 18:03:23 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id 09DI3898019746
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 03:03:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 09DI3898019746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1602612188;
 bh=ZdabOmTJd4TzuNZj+GhBAWjpxu8eB+TtqLnoZkWEOvA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pVQ+55Ft0I2oIQNjlToQcpQJ+nXbkkTHrzf6yeQSHKjk0H8mzD6yEuxwABmrF7x2a
 pLftiYcAnELcxH2Zyl+IZiDaS9fbvdHmFlpy91xEeGcZp6j8vyNptqSUETAMphHuYa
 TcxVZHvJTWzeIn+0gwVgiiuKH1hORqTn4LaWsWVsMAO8K0wlR4YSfwRClxQCGHk/g/
 igFuoH5r2ySnhtjvG+QphmQY0v7mkVOlNSCCAEjcNPJYJL4bOYmXbsn9b5r+R/PsEO
 aUnsqHUQ4ZcW37gEF3yHataND3NYSL/8PSJfA7fAqcWjs8annVLIS8vUXFIBXN/Ha3
 skyNEqcXv/QXg==
X-Nifty-SrcIP: [209.85.210.176]
Received: by mail-pf1-f176.google.com with SMTP id a200so244277pfa.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 11:03:08 -0700 (PDT)
X-Gm-Message-State: AOAM530id33ZjtLghg+gWnezA/pe5rDBe5to35kw20uot4EYjhwu9E7l
 +Bj+I+gIfAo8TeZpRUOEDWPqWPn8E8MH8hmgnHc=
X-Google-Smtp-Source: ABdhPJz9b0OWNsXKxkGpr+N8kc5HAWmcGlPA3yZZdhkMKnRbdsfcW0A53EomwMrN1fGDuOP1Keg/5EfQ9vdMQ3DHQw4=
X-Received: by 2002:a63:778f:: with SMTP id s137mr599296pgc.7.1602612187843;
 Tue, 13 Oct 2020 11:03:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201001075723.24246-1-lukas.bulwahn@gmail.com>
 <CAK7LNARXirw-DZg1-Dwq0NhWtqyS9PCpFhzjL7bfZjQt5-dL6A@mail.gmail.com>
In-Reply-To: <CAK7LNARXirw-DZg1-Dwq0NhWtqyS9PCpFhzjL7bfZjQt5-dL6A@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 14 Oct 2020 03:02:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR+W9h95sUZFwRHiyiDbUxn9b7KN5P1zKOAdR2emxp7=g@mail.gmail.com>
Message-ID: <CAK7LNAR+W9h95sUZFwRHiyiDbUxn9b7KN5P1zKOAdR2emxp7=g@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ujjwal Kumar <ujjwalkumar0501@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] kbuild: doc: describe proper
	script invocation
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

On Tue, Oct 13, 2020 at 11:31 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Thu, Oct 1, 2020 at 4:57 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > During an investigation to fix up the execute bits of scripts in the kernel
> > repository, Andrew Morton and Kees Cook pointed out that the execute bit
> > should not matter, and that build scripts cannot rely on that. Kees could
> > not point to any documentation, though.
> >
> > Masahiro Yamada explained the convention of setting execute bits to make it
> > easier for manual script invocation.
> >
> > Provide some basic documentation how the build shall invoke scripts, such
> > that the execute bits do not matter, and acknowledge that execute bits
> > are useful nonetheless.
> >
> > This serves as reference for further clean-up patches in the future.
> >
> > Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
> > Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
> > Link: https://lore.kernel.org/linux-kbuild/CAK7LNAQdrvMkDA6ApDJCGr+5db8SiPo=G+p8EiOvnnGvEN80gA@mail.gmail.com/
> >
> > Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> > Suggested-by: Kees Cook <keescook@chromium.org>
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>
>
> Applied to linux-kbuild.
> Thanks.
>

No, not really.

I will re-think if this is the right thing to do.




--
Best Regards
Masahiro Yamada
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
