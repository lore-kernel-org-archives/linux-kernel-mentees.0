Return-Path: <SRS0=XjTA=CY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67EA0C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 13:35:17 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C290222BA
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 13:35:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C290222BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2424C87136;
	Tue, 15 Sep 2020 13:35:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B-UQUFTEjjzX; Tue, 15 Sep 2020 13:35:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A0E1887089;
	Tue, 15 Sep 2020 13:35:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78107C0864;
	Tue, 15 Sep 2020 13:35:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12D68C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 13:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F1C3A8711C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 13:35:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NhO5AciiThv6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 13:35:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 534CF87089
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 13:35:12 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id t76so3841617oif.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 06:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nhx4zaRbvHv02wDkLtCiRzQ+T/cexy7Wy6YPEzIW6L4=;
 b=qVQiY8ATyMsEj0HhQLruJT1p7NAbnO3Vu7/TsXJsLHXd92+AsInABr4l4lOnHwJ9+Q
 vByXNwD9DiGVmnBntCOulkqOzeiZzOkVTLGeIE6DLCYSC0uqlbP0KncR7qd4DSUAWjtL
 GX3v1C+xVIeHciGIPzJDqG0dobmHipu+Y83LI4orlO7r8wwtjvP1S3jDnMxwtCUxpF8t
 qgAWKJtpxfXSgbOIFFjjogJHJvc44X8WgvJTVPQrQ22X594+E9E/vv39TAxaS2Lzi4S2
 2aU0Tas5oWAxySOv8wR+qoa68WCov7OukrnbeLgKmmAwtEkKqYHjWnyxG4inVeMywB7H
 xk+w==
X-Gm-Message-State: AOAM530EaTO5gWqUzb/XLpEtGGdg9igZ93heNShrORNbPhwPAsj0/N7E
 fFQFnwXc72rlh9dM/h/AQzUYKZJ0AMmI975oCy4=
X-Google-Smtp-Source: ABdhPJxjE7IZ1One9Nuag6nu0xEcQ8hWElbOe5QqICw2V/z+/yMb27HXjCabVPJXPjj9Z11F/OFVwDPyo408IPTG/6I=
X-Received: by 2002:aca:4441:: with SMTP id r62mr3178255oia.153.1600176911589; 
 Tue, 15 Sep 2020 06:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2009151345001.31296@ramsan.of.borg>
 <EA89ED5D-E477-4464-B523-D729796CE0D0@getmailspring.com>
In-Reply-To: <EA89ED5D-E477-4464-B523-D729796CE0D0@getmailspring.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Sep 2020 15:35:00 +0200
Message-ID: <CAMuHMdVfoQ-vW3VeO8vDVALNREBV1afaSnwnc0jnkoXmvw6xhQ@mail.gmail.com>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc: "mchehab+huawei@kernel.org" <mchehab+huawei@kernel.org>,
 "r.verdejo@samsung.com" <r.verdejo@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [v10 3/4] media: vidtv: add a bridge
	driver
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

Hi Daniel,

On Tue, Sep 15, 2020 at 3:26 PM Daniel W. S. Almeida
<dwlsalmeida@gmail.com> wrote:
> >> +    u32 nbytes = 0;  /* the number of bytes written by this function */
> >> +
> >> +    u64 nbytes_expected; /* the number of bytes we should have written */
> >> +    u64 nbytes_streamed; /* the number of bytes we actually wrote */
> >> +    u32 num_null_pkts; /* number of null packets to bridge the gap */
> >> +
> >> +    u64 elapsed_time_msecs = jiffies_to_usecs(m->timing.current_jiffies -
> >> +                                              m->timing.past_jiffies);
> >> +
> >> +    elapsed_time_msecs = min(elapsed_time_msecs,
> >> (u64)VIDTV_MAX_SLEEP_USECS / 1000);
> >> +    nbytes_expected = div64_u64(m->mux_rate_kbytes_sec * 1000, MSEC_PER_SEC);
> >
> > Seriously?!?
> >
> > You multiply by 1000 first, followed by a division by 1000 using an
> > expensive 64-by-64 division?
>
> This entire function is broken and needs a do-over :)
>
> > using an expensive 64-by-64 division?
>
> I am new to kernel development. I wasn't even aware that this was
> expensive, to be honest.

All divisions involving 64-bit data are expensive, especially on 32-bit
platforms.  That's why we have the helpers in <linux/math.h>.  Most
of them implement simplified variants, which are less expensive.

> >> +    if (nbytes_streamed < nbytes_expected) {
> >> +            /* can't write half a packet: roundup to a 188 multiple */
> >> +            nbytes_expected  = roundup(nbytes_expected - nbytes_streamed, TS_PACKET_LEN);
> >
> > drivers/media/test-drivers/vidtv/vidtv_mux.o: In function `vidtv_mux_tick':
> > vidtv_mux.c:(.text+0x788): undefined reference to `__udivdi3'
> >
> > This is a 64-by-32 division, hence it should use a helper from
> > <linux/math64.h>.
> >
> > However, I'm wondering if "nbytes_expected - nbytes_streamed" is
> > guaranteed to be a "small" number, hence a 32-by-32 division would be
> > sufficient?
>
> I think so.
>
> I will send a patch to address the things you pointed out in this email.

Thanks, looking forward to it!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
