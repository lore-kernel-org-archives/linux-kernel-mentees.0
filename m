Return-Path: <SRS0=9pg8=FE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404D4C64E7B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 17:03:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C4ED20725
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 17:03:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GOW82eGe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C4ED20725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 28D8B86078;
	Mon, 30 Nov 2020 17:03:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 97yvsocvuO-0; Mon, 30 Nov 2020 17:03:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0E46F86031;
	Mon, 30 Nov 2020 17:03:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 009FCC0859;
	Mon, 30 Nov 2020 17:03:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA200C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 17:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8F6CA86B6B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 17:03:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5SM8fyUWphKm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 17:03:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 177E486B3F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 17:03:36 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id j10so19045495lja.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 09:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=50weI0bYloddYiv+R6W9ImnCSftRMUprlRnSViTP+Fs=;
 b=GOW82eGekEAExilGvS1tivJ+ROVME0C8tukpZ5zxI6/JJYCM7rzPM8zlhqszWzdJiU
 Ir5BpAyChcBZjIlei63NiuPOg14sjP+zzqyOJldQyHm4CtMkGQLeayYkyN/hakmyH0zs
 HdD8xeYeZZ+jRZhw/+lS2QVbkUgUeEg3e4gOEFXoMj24M7F7SUNYfEA4yi5d5tzhORR2
 GW2cfU4XoAGHWLpMElbR1KowZmrSp4Wxb7NHUK/3r8FyFf0fQlrzuU9Coqm4lV2wzmDb
 ot/Vrbr60ohAN0KSVYjiiF9v6iMgQ24NUIyfJez7yjviCmUxnJ2P7XPTHw+qrRdWefkj
 cXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=50weI0bYloddYiv+R6W9ImnCSftRMUprlRnSViTP+Fs=;
 b=Papw6j5bautVOBGICbFGVFzz7w272ewUF6dW3hjC0f9phVlRI+Aye9Qx/OwvK+Tyec
 6PanLjj0+NODxCLtnuRx+3nONhZBtRORy9BPBldKYg6bxxrq7xBVQyF5ecN6w7tnPabK
 ucBYvXDgx10WVFrChvsaTa+YCB9X5YlWzcG8mG15+cwhXvmHeO3ijXwrFYWzEwVyADQy
 uAYcg2ttztx6oQLfAG2uA5T5o0lc9s4GOLnD33gQrI/nj4vVcy3a437qIivwlSTJditT
 XQ1aRLxbRbehEnU3O9QB5kEhiqfDf86b/EfXXYfBSomanBuBiQntdZWH64uCiSGDD4Da
 wfVw==
X-Gm-Message-State: AOAM533kbYhQBjI6Ijwyml+wet+S6T9xzyWda7wzoIMV7RnQBafyETPa
 w5LeeU4tIgjOdIMEJx69r1HsJL8rl0UlhiXGkrY=
X-Google-Smtp-Source: ABdhPJyFHR69kHKYran2WCfbGm0UB93xIcfyege3Y/0ePkkwMxnRYkRkTeajxnmBq+B7k8csZr7aiWPCIvbbzMdpqXU=
X-Received: by 2002:a2e:3210:: with SMTP id y16mr10171277ljy.395.1606755814157; 
 Mon, 30 Nov 2020 09:03:34 -0800 (PST)
MIME-Version: 1.0
References: <20201130144515.8320-1-dwaipayanray1@gmail.com>
 <c8eeab847fc09368ce270ea3e06ea0bbbd7d1b7f.camel@perches.com>
In-Reply-To: <c8eeab847fc09368ce270ea3e06ea0bbbd7d1b7f.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 30 Nov 2020 22:33:06 +0530
Message-ID: <CABJPP5BLjbx3FbvB3nAOiHfkRLUo7s0n-vboE+AXJqrZXseUNQ@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix TYPO_SPELLING
	check for words with apostrophe
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

On Mon, Nov 30, 2020 at 10:13 PM Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2020-11-30 at 20:15 +0530, Dwaipayan Ray wrote:
> > checkpatch reports a false TYPO_SPELLING warning for some words
> > containing an apostrophe.
> >
> > A false positive is "doesn't". Occurrence of the word causes
> > checkpatch to emit the following warning:
> >
> > "WARNING: 'doesn'' may be misspelled - perhaps 'doesn't'?"
> >
> > Check the word boundary for such cases so that words like
> > "doesn't", "zig-zag", etc. aren't misinterpreted due to wrong
> > splitting of the word by the \b regex metacharacter.
> []
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > @@ -3106,7 +3106,7 @@ sub process {
> >  # Check for various typo / spelling mistakes
> >               if (defined($misspellings) &&
> >                   ($in_commit_log || $line =~ /^(?:\+|Subject:)/i)) {
> > -                     while ($rawline =~ /(?:^|[^a-z@])($misspellings)(?:\b|$|[^a-z@])/gi) {
> > +                     while ($rawline =~ /(?:^|[^a-z@])($misspellings)(?:\b(?![^\w]?[a-z@]+)|$|[^a-z@])/gi) {
>
> Wouldn't it be simpler to change the existing [^a-z@] blocks to [^a-z@'-] ?
>
Hi,
I tried it and it doesn't seem to work. Probably because the first
group already causes the
word to be captured. In this case `doesn'` was already captured
because of the \b group.

Is the first group modification perhaps okay? Or would you suggest
something else?

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
