Return-Path: <SRS0=AIAE=EJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 991A7C2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 15:35:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F64F20735
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 15:35:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5Jj1YtJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F64F20735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A714120525;
	Tue,  3 Nov 2020 15:35:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aqs40FIqZwRe; Tue,  3 Nov 2020 15:35:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E37F720485;
	Tue,  3 Nov 2020 15:35:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE224C088B;
	Tue,  3 Nov 2020 15:35:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9479CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 15:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 796C120485
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 15:35:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J+VDnTG2umtz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 15:35:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 64860203EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 15:35:08 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id a20so16462785ilk.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 07:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JwPVeSQELcfGrT7v+A9dKnR4heE9yxRuNZgRZNmaFR0=;
 b=f5Jj1YtJqaSDq7dOoojXdhyNHpakEFuoK2M2uYr9VkjSz1pmzar99upfzD+RDOko2Z
 d6oFnWHZWg9h26hjnLi7IkpZo0LiT2PzYyd2tCQ/0pTtFJM/ONF99h1dnIvnx/pDudHe
 xkjVk+PZLPrjbgrW+PQMLQoguERrR3AwHhSkgYl3KgligMN6v00l2v++4TD+wYBjWgge
 7nrDbBh0ZDEszL0H5ny4mlLfsefNWswcHLBMZ4z1dnpH/sZRaSDP3wmgZCfzNSZKmBxU
 cYAF8oM7v5gjv64pDSGHtkUyRIEun6sScaD4b0YeNP4dIUPNZbsTphiSKlHOIZKqkQmS
 BwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JwPVeSQELcfGrT7v+A9dKnR4heE9yxRuNZgRZNmaFR0=;
 b=h8LgTSYHNVw4vjR8G5JNDqHhY1Yi+nXYS4AAVzeZ5vv+xYTpad+2yV9kJB5li/n/c5
 8agl7lDt3nUCZ2Re/CmKfOjsqSvztY95PJi6v/gHv9ib3zpjimibVwQo4PtHdAE6Qztr
 v/IirmSqirl/XwIzDZfkI1oPfxen3CXQOoNo7k9rf5jBXik22p0EbFu6m4gpsic+GVYi
 PtsMtBMwLs00gFfPoSedJ/giFtfR+3UpYEZ6+Hmqa6A5JIVbXowsyUbe9ajx3LyRLwGa
 vzjGnUjV960yUN/sLl1nmYndKdUEkiSnoZlyx1O22p2dz45Q80Frro7IjEC0Xf2ssGJu
 a2yA==
X-Gm-Message-State: AOAM533/12Gs5jmnD8xsPOJiiwjehjmbXFl87Gp6mUIab+rhGSNhCnJ4
 ko3R0tP1YH0GA7ucY7nS9+61dnkingCnSlHldDGt+EwLQKJQfQ==
X-Google-Smtp-Source: ABdhPJyGqTH/5dppWsyjp2TBr7Vos6RHBzFGEC//KDYpJHDdIkNEKFojKH+tbzT7L3S/rZPPPtyYa0wb86I5YHmBhO8=
X-Received: by 2002:a92:35c7:: with SMTP id c68mr3257360ilf.251.1604417707342; 
 Tue, 03 Nov 2020 07:35:07 -0800 (PST)
MIME-Version: 1.0
References: <20201103133052.21053-1-yashsri421@gmail.com>
 <CAKXUXMx9nYkFBy3RYf-LY9VYUeWcf4FuQpT9F3=_p=9baBQikA@mail.gmail.com>
 <9d2a5a04-fd6e-f805-2036-2ab68358fbf4@gmail.com>
In-Reply-To: <9d2a5a04-fd6e-f805-2036-2ab68358fbf4@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 3 Nov 2020 16:34:51 +0100
Message-ID: <CAKXUXMyigTJoFAbwp=dE-4QEpOyUkMT=87UMJ3HZub35azb_4g@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fixes for
	BAD_SIGN_OFF
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

On Tue, Nov 3, 2020 at 3:47 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 3/11/20 7:09 pm, Lukas Bulwahn wrote:
> > On Tue, Nov 3, 2020 at 2:31 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
> >>
> >> Currently, checkpatch warns if the author signs-off two or more times
> >> for the same role.
> >> E.g., for commit 6dd47d9754ff ("mac80211: fix
> >> ieee80211_txq_setup_flows() failure path") we get warning:
> >>
> >> WARNING: Duplicate signature
> >> Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> >>
> >> Here there are two Signed-off-by lines present for the same user. So,
> >> we get a warning to remove one.
> >>
> >> Similarly, we get warning if the author of the commit signs-off under
> >> co-developed-by.
> >> E.g. for commit 6e88559470f5 ("Documentation: Add section about
> >> CPU vulnerabilities for Spectre") we get:
> >>
> >> WARNING: Co-developed-by: should not be used to attribute nominal
> >> patch author 'Tim Chen <tim.c.chen@linux.intel.com>'
> >> Co-developed-by: Tim Chen <tim.c.chen@linux.intel.com>
> >>
> >> Provide fixes by removing the duplicate signature line and the
> >> co-developed-by line from the commit
> >>
> >
> >
> > The duplicate signature fix is simply wrong, because the indication of
> > the duplicate signature is imprecise.
> >
> > Probably, we would first really need to understand the valid cases of
> > duplicate signature warnings compared to the invalid ones.
> >
> > Please rework.
> >
> >
> > Lukas
> >
>
> Oh, Alright. I get it now.
> I ran a script over WARNING: Duplicate signature.
> I found out that it is occurring with these prefixes and their
> frequencies:
>
> Acked-by -- 6
> Signed-off-by -- 218
> Tested-by -- 3
> Reported-by -- 1
> Reviewed-by -- 8
> Cc -- 28
>
> IMO largely Signed-off-by warnings in this frequency might be false
> positives. This is so because we are simply checking for duplicate
> occurrences in the sign-offs in checkpatch.pl
>
> > Probably, we would first really need to understand the valid cases
> > of duplicate signature warnings compared to the invalid ones.
> >
>
> Is there any way I can know that the second sign-off is intended?
>
> In my observation, this particular commit was prefixed by '^Link:.*$'
> Alternatively, we could use maintainers list to ensure that the signer
> is maintainer and avoid this warning.
>

That is somehow difficult to say, but probably it is best to
deactivate this multiple Signed-off-by: warning on git commits.

On patches it makes sense to warn about duplicate Signed-off-by: ; on
commits, not so much.

> How about other prefixes. Can we remove them?
>

Can you show the duplicate Tested-by, Acked-by, Reported-by,
Reviewed-by, Cc in some structured format to quickly check those?

Probably for those, we can really assess them to be all true positives
(maybe we can find out the reasons as well) and hence a fix for them
would make sense.

> I observed one of the 'Tested-by' warnings and it was because of these
> sign offs:
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Tested-by:Liang Yang <liang.yang@amlogic.com>
> Acked-by: Liang Yang <liang.yang@amlogic.com>
> Tested-by:Liang Yang <liang.yang@amlogic.com>
> Acked-by: Liang Yang <liang.yang@amlogic.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> Here tested-by is occurring 2 times.
>

That example seems to be a clear true positive. It would be
interesting to see how that happened to be added twice in a commit.
What was the state on the mailing list and what did the maintainer do
to add these tags twice (was this done manually or is there some
automatic tool involved?).


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
