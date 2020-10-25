Return-Path: <SRS0=kzO3=EA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5A1C55178
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 08:33:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9229E208B3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 08:33:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mr4mn1+F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9229E208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1A888874F5;
	Sun, 25 Oct 2020 08:33:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JZcix9MIIrHO; Sun, 25 Oct 2020 08:33:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EE85F874E7;
	Sun, 25 Oct 2020 08:33:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE371C0859;
	Sun, 25 Oct 2020 08:33:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C04FDC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 08:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B815286A8E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 08:33:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZgsUyVmy-7k3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 08:33:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 98B4386929
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 08:33:02 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id k65so6814683oih.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 01:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HLu2puIBJMzkzJcyETQ70Rj2NF1EgRhiqjPv9k4/Hbw=;
 b=Mr4mn1+FR3HZCuyy4+0BMHkQ8h0CUi7LYMc3AAeQMtqHJZd+KqerUdOini7ZQgZ53f
 RwOoDlyX4Wc03dLjDEp06Aa5gQP4dFUldP8+oPMnONo1/64I27vEFDQMxfKKvn4a5W8w
 3k1TzqvDfCnudR9MuPoXazebofCkG16abo+msgiQdFl0Tw9Jph3QBiMLVaH7kP1HHICF
 Jaw8qr6gWz/0JfR6/e7Ds3E3TmWq6oAoBXr/IFlCst/Hyp9aRIya4DYW++6sNhjPSmqG
 yJWBjadSxi3UyW+r5S781nMOi8FdtgG6UAN/42aG28lxqsqqTfgBNPJrhhaqolHRM+Zr
 KULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HLu2puIBJMzkzJcyETQ70Rj2NF1EgRhiqjPv9k4/Hbw=;
 b=fRMRZU+Npp8LSm4+FmKz5IOiczsJMXkEKEDS+WRgtzFqcY2SRhtiW45z9cIPfXXQH3
 YsrNq2/OI+J8oIMI+GUvhdyeBXwMGaO+90BqPYOBoc5mNsC+ilb6ewfsY5RXyKXLxtXs
 6zT3d6JwVlRUJRWtWOMHquZCU8c6t/WBkbV7rWA5p+fI9LixlfCAr3n6fZAABLKRcaQr
 gShaMmaI65KvBvqstePqdboZZy4vL4IHNzebPHsZ6oKVRSZY6BcjkjHlPYHJpeqA62gO
 /9BFCYE9TAtbm7jiqKalUVzJBr/VycuYhXP5ttPcrlJeja6Wl24yw7oG8pqcno5fyhW5
 PUyQ==
X-Gm-Message-State: AOAM532bc6k7P1OTpkLqnui4H2wz0Es4OYH73lEPUv9F0mjb8sfQwzy5
 dqLfCxMH9DEpaY2F4XgMgsQVNs9KlLhTruA47kk=
X-Google-Smtp-Source: ABdhPJyDyXw2oz1MklvsLGfAzReADRUl/YEU8DSnSp18ZEZTrTns8VmzGmn6PBUuALmQ1HSl8wr12ngyhGjRSNEieIE=
X-Received: by 2002:aca:420a:: with SMTP id p10mr7002175oia.117.1603614781589; 
 Sun, 25 Oct 2020 01:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201025065134.21737-1-dwaipayanray1@gmail.com>
 <e96f8306d57e9a2ce7118b545db197e819e97b19.camel@perches.com>
In-Reply-To: <e96f8306d57e9a2ce7118b545db197e819e97b19.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 25 Oct 2020 14:02:32 +0530
Message-ID: <CABJPP5D9ziuyPpPPyPM+n101vT1LGEjHj+JQjOhdN533t8Ud7w@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v4] checkpatch: extend attributes
	check to handle more patterns
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

On Sun, Oct 25, 2020 at 1:52 PM Joe Perches <joe@perches.com> wrote:
>
> On Sun, 2020-10-25 at 12:21 +0530, Dwaipayan Ray wrote:
> > It is generally preferred that the macros from
> > include/linux/compiler_attributes.h are used, unless there
> > is a reason not to.
> >
> > checkpatch currently checks __attribute__ for each of
> > packed, aligned, printf, scanf, and weak. Other declarations
> > in compiler_attributes.h are not handled.
> >
> > Add a generic test to check the presence of such attributes.
> > Some attributes require more specific handling and are kept
> > separate.
> []
> > Also add fixes for the generic attributes check.
> []
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > +                             if (exists($attr_list{$curr_attr})) {
> > +                                     my $new = $attr_list{$curr_attr};
> > +                                     if (WARN("PREFER_DEFINED_ATTRIBUTE_MACRO",
> > +                                              "$new$params is preferred over __attribute__(($attr))\n" . $herecurr) &&
> > +                                             $fix) {
> > +                                             $fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*\Q$attr\E\s*\)\s*\)/$new$params/;
>
> Thanks.
>
> This fix would only work for the single conversions
> and would not work for multiple attributes like:
>
>         __attribute__((aligned(4), packed))
>
> It would be nice to be able to convert this to
>
>         __aligned(4) __packed
>
> One mechanism to do that might be to:
>
>         create an empty array
>         for each attr
>                 push(@array, conversion)
>         s/__attribute__(...)/join(' ', @array)/
>
> if all attrs were converted.
>

Okay sure I will try doing that.

I think I need to also change the test to correctly display
the warning for those having multiple attributes too.
Because now only single attributes are reported.

And also do you think there should be a separate check
for __alias__(#symbol)? I think it expects a string and that should
be trimmed in the fix.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
