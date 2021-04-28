Return-Path: <SRS0=jYeA=JZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2846C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Apr 2021 14:21:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EF3861139
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Apr 2021 14:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EF3861139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF6CE60B9E;
	Wed, 28 Apr 2021 14:21:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M_3bZPOqSzLb; Wed, 28 Apr 2021 14:21:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4A9E60673;
	Wed, 28 Apr 2021 14:21:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8200BC0022;
	Wed, 28 Apr 2021 14:21:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13692C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 14:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 020D260A52
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 14:21:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xwn9aQLuP0yX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 14:21:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96F7360673
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 14:21:48 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id l4so94873218ejc.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 07:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:in-reply-to:message-id:date;
 bh=B0oHdP1qt7DjxDmtusxbvrHI0SunvRrrfB3A86s6gRA=;
 b=TK5UNXSlLpa/zo8RtbohCRJHMo6UitVVzIgn+hk+joceZrAppOIGuAbULdZlGRuFuk
 7yyPsNXve49a/1FYyvD8lNVva1PTZkkdTkmOagq6U9LEnFHtxXQaWVQ0b8J3Gi7HOB3y
 8gVc/B6kv4b1uDEVa+ratEfXz29undFbGUcq9NFB/cVSHecCCbAiyPPbK+cvbWmogizG
 WEmP17Y5qfOq0r/waARfQYkiFhi8bzfSedKsZBTBh37HH1aBQpiL0+4F4sCbn/x79sii
 noTIYXRDMizkM5MkllGEnwEFmdiRFKOFMGG2xAQ9gS0H0Hg4hdPwgaRAdZzy1+QbM5/f
 ohSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:in-reply-to:message-id:date;
 bh=B0oHdP1qt7DjxDmtusxbvrHI0SunvRrrfB3A86s6gRA=;
 b=TLUMzweD/FmqNuSe6SMA6N/aMxHUrAgyv2SspiM/1hr35RfOOXU9Tipb26P9wdBW8d
 ibYzdnlI9QWZsCteNeMN5tJNxatl5Mp6SWdhkK8U20/qL7Z8QdVx9Gc06JC+Ce6piY9B
 TIJObtyu6p8096aInp3eXVMAHh/mJkwpZXhdM1pLxMPeibng6ag/64uBXZgXiEYQzbQZ
 wYkmhEPZG9AQsY7wxRz2ymg177tR0Xl739GDVWIS5OlaXlh3EXsu2OCCgONT0nCqESUE
 lKtjJzC/iMelAvaUQVIv8QR7azURa66JHT6234ml2psk2HYov8GtAoxTd5vYMb8xPT1K
 T+nw==
X-Gm-Message-State: AOAM530+GKa/2U7zyyf+e4qPAeT1bwPTc26Io1XdUzhTyWRNCuOqVFdZ
 78ydbjeNkG/9K2oOWZvUeGw=
X-Google-Smtp-Source: ABdhPJzNHriwCmIXJM1JAqeBNJgh/bSmTgY8SQ3Wnk4ODDtBic/ncsHoLa9Zbz8cpIoMYqHXvMoXQg==
X-Received: by 2002:a17:906:1519:: with SMTP id
 b25mr29418902ejd.254.1619619706810; 
 Wed, 28 Apr 2021 07:21:46 -0700 (PDT)
Received: from localhost ([83.218.172.57])
 by smtp.gmail.com with ESMTPSA id j7sm5048556edv.40.2021.04.28.07.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 07:21:46 -0700 (PDT)
From: Kurt Manucredo <fuzzybritches0@gmail.com>
X-Google-Original-From: "Kurt Manucredo" <fuzzybritches0@gmail.com
Subject: Re: Starting a Wiki for Syzkaller Bug Fixing Resources
To: esmethedev@gmail.com
In-Reply-To: <9e7e0cda-a078-d550-c4d5-bb5ca8702bd4@gmail.com>
Message-Id: <14592-28742-curtm@phaethon>
Date: Wed, 28 Apr 2021 16:15:00 +0200
Cc: syzkaller@googlegroups.com, linux-kernel-mentees@lists.linuxfoundation.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


On  Wed, 28 Apr 2021 21:55:06 +0800  Esme Xuan Lim <esmethedev@gmail.com> wrote:
> 
> On 28/04/2021 21:13, Kurt Manucredo wrote:
> > On  Wed, 28 Apr 2021 04:50:18 +0800  Esme Xuan Lim <esmethedev@gmail.com> wrote:
> >> Hi there,
> >>
> >> Having been on the bug fixing mentorship, I've been collating a bunch of
> >> resources that helped me as I was going. I've been thinking that there
> >> might be a big gap in resources in where interns might be looking and
> >> was keen on trying to put one together. Given the current conversation
> >> Greg has brought up about syzkaller bugs needing more attention, I
> >> figured this could help fix it if interns are the only ones available
> >> for this task.
> >>
> >> I think it'd help the kernel mentees current and future sink their teeth
> >> quicker into fixing bugs, and less into helping themselves learn what is
> >> needed. This appears to be a big gap that would really help if it were
> >> filled. Resources are heavily abundant for the Linux kernel, but a good
> >> level of curation and maintained resources could help with bug fixing.
> >> Resources look old, but are incredibly insightful. I would have skipped
> >> looking at these resources given my experience with more modern
> >> frameworks and toolkits (which is that it would be best to avoid
> >> outdated ones as APIs change very quickly - but this is not the case
> >> with the kernel)
> >>
> >> I've got links and things but I've been wondering if it made sense to
> >> build on the Kernel Mentees or to build a wiki (and host it) on
> >> something more modern like github.
> >>
> >> I'd love to hear suggestions for how best to go about this, and if
> >> anyone would like to contribute to it too.
> >>
> > I would love to contribute. I've started my blog on:
> >
> > https://fuzzybritches0.github.io/
> >
> > If any of these entries I made are helpful, I'd love to help you
> > incorporate them into your wiki. I'd also love to get feedback on these
> > entries. Count me in.
> >
> > thanks and kind regards
> >
> > Kurt Manucredo
> >
> (Resent to the mailing list; first email went only to Kurt - that was a mistake)
> 
> Hey Kurt,
> 
> If you join the discord, I guess we're having a fairly casual
> conversation of how things should go. I'm writing up the structure of
> the wiki at the moment and I'll have it up for pull requests in a bit:)
> 
I've joined discord and the dedicated channel, my username is
fuzzybritches. I hope I'm doing everything right, I'm new to discord.

kind regards

Kurt Manucredo
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
