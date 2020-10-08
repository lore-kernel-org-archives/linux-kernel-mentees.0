Return-Path: <SRS0=Bf+q=DP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33881C4363C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  8 Oct 2020 13:35:55 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 877D120754
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  8 Oct 2020 13:35:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSRbKf40"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 877D120754
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DC37387499;
	Thu,  8 Oct 2020 13:35:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ij+9J7PhAWKy; Thu,  8 Oct 2020 13:35:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CF29687494;
	Thu,  8 Oct 2020 13:35:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD34AC016F;
	Thu,  8 Oct 2020 13:35:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5017DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 13:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 456C120409
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 13:35:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e7vcC9EmKAs1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 13:35:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 1B4BA20402
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 13:35:50 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id s66so5509336otb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 08 Oct 2020 06:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2gxPFYsnlZ12+GaKZv8ppvoZXQ2lPcKEK4w6wsUjhc0=;
 b=kSRbKf40XqV0l411+b4zQLVQOonAxtlSNecMg/T80Ukzk/KBIGsRMiYozaRMGoE+I9
 YZmlnArjYcsAzdbyx0eta8P4gSWpJbKAhs27GS76bvi65Rcy4AY+0UdOZC7/n7OXPDeT
 5hzrbN9EFrDCH25BySerKQbgk1zAmjMvBw9xJfEeBwH3PtB1toIzKqjMeaKdBmeSKqia
 rBU9PocD6IY/c5DQlp8rLF28OQWJP1wpS0dJ/LWb7qJGrh0iXG4ocuKveN5Cf6U0u6Ne
 RySDT935UhaAeEOjgYjc69aSLmrUQsvz8eiSO02I21uVOOmt+NG8vHiSSEgD12NLAEYA
 xFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2gxPFYsnlZ12+GaKZv8ppvoZXQ2lPcKEK4w6wsUjhc0=;
 b=K5SmGDs0jpLRLXgLNbZoATLe+AJnwqoIge6FD+nYkXxM6GYfhZFyzJae2HjisAf+PH
 5+E80d7RR0n+xVtlO/4ds+vc365x3wgDyRTrlL/X+mtkIL0nx1R9QBjqi9fXByVwecLB
 2N3q0+P9WV/sk1cKFL8vZinKc7Xc21dSsskVFq9Pecpgts4Org3wZWSGqBic7VifWZgH
 /72Fb/PGWLFihH8+QeM7dlPkea8CNFbLFbHZMWY05a/ybZYbu9y18JM1rxEP0yn81ubc
 Zl5scYWZGB7O6L3mF1CQXe7wF5aFs0lTEuZrWNwvaLaZYMCeYgYoKlBkDd7q7i+I5TVe
 9djw==
X-Gm-Message-State: AOAM5329MGuoSXJZWtarSHChHxEX3NWHfDJpo1NztYkppFUdulhEOlr9
 sS9VoKyedJFNioexk5A8n8m6JCt4SHghpPEk11U=
X-Google-Smtp-Source: ABdhPJyYy+WNZqpUVoS3/U9Ws1pjVAS/8vxjphuMpLvUmDDtWyupvbqAY21CaP4FFp4pAZs0DrEfziADasHV/mPsWiY=
X-Received: by 2002:a9d:6c4b:: with SMTP id g11mr3476386otq.265.1602164149001; 
 Thu, 08 Oct 2020 06:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2010081247510.19461@felia>
 <b6cd81b936671a8868fe98536d7c80771bdfd61c.camel@perches.com>
In-Reply-To: <b6cd81b936671a8868fe98536d7c80771bdfd61c.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 8 Oct 2020 19:05:24 +0530
Message-ID: <CABJPP5DLhdOfuOX=Ls0-726-ECL3+o4pkVtcRY0gqk2EvLsByg@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] checkpatch.pl: REPEATED_WORD: massive
	false positive in MAINTAINERS
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

On Thu, Oct 8, 2020 at 6:18 PM Joe Perches <joe@perches.com> wrote:
>
> On Thu, 2020-10-08 at 13:50 +0200, Lukas Bulwahn wrote:
> > Dear Joe, dear Dwaipayan,
> >
> > while maintaining MAINTAINERS, I noticed that the REPEATED_WORD check,
> > which in general is a great addition to checkpatch.pl, generates a massive
> > number of warnings due to one specific pattern in the MAINTAINERS file:
>
> I didn't actually check if there were many
> new false positives, but
> clearly that's one.
>
> Maybe exclude the MAINTAINERS file?
>
> -               if ($rawline =~ /^\+/ || $in_commit_log) {
> +               if (($rawline =~ /^\+/ || $in_commit_log) && $realfile ne "MAINTAINERS") {
>
> Maybe add git to the check for "long long"?
>
> -                               next if ($first eq 'long');
> +                               next if ($first =~ /^(?:long|git)$/);
>
>
>

Hi,
It does resolve all the warnings concerned.
But could we also exclude documentation type blocks like:
/**
* @size size of access
*/
There were quite a few of these in include/linux/instrumented.

And also it isn't case sensitive. So the line
"the the word is repeated" generates a warning, but
"The the word is repeated" doesn't generate anything.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
