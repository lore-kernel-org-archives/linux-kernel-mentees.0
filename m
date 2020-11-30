Return-Path: <SRS0=9pg8=FE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02193C64E7B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 16:13:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 268E020679
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 16:13:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCjJNosD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 268E020679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8C64985E79;
	Mon, 30 Nov 2020 16:13:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gDRWwtMxRGya; Mon, 30 Nov 2020 16:13:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 98BC8842CF;
	Mon, 30 Nov 2020 16:13:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E723C163C;
	Mon, 30 Nov 2020 16:13:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12696C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 16:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EDB8B8673D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 16:13:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KcywMbMpQES2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 16:13:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1EE1B8674D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 16:13:37 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id b6so10701043pfp.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 08:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZFF7b9DAdSNhz42LfTrF19+Ci8MOdz7x/vdkHobT0n0=;
 b=bCjJNosDiarj/iJKk9mu4PpRgtmGeZW4Is0hUwLg+TEJp/6N1vnrOGvAletX0tSZQb
 WtlfTASnD9GlpkRCis3YpU5A5RLDG7znQML9fPI4iyYeivySIQ2qkLCtPrdr+sLP1lEw
 xCQ051aluP9lux3TqacRQuTqrHLAUbMj02xC2cj4KJGcQ+mCV04QG89OVL0fsc86IpNZ
 MpHvMu2jA6aIOmdHoDGJgheF0UiGxoSoh/p3vBL1mJVuSh8GhcxK8YqI0j68Zqk3I/VX
 YPfRARSpZjN5fi0eoTh/THqkC/Gy0W0ixd3OF+Q43W3s3pf526lvhqOhMoOBhJX5Om5z
 sCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZFF7b9DAdSNhz42LfTrF19+Ci8MOdz7x/vdkHobT0n0=;
 b=XKr6IIpabQFNmGHHlSKMpn8PWABmlWWIb09ZafcWRqBB7iPQznC/C1GDpLtkiQgLjk
 MSpP+RKF5YG+RR+KuucqLDX2hS04tCKuf6cNQV7ZqT5g9G80EbNHb8nOnz9L35M9rFQ4
 vH0oDKApaJPrtixnuKe367HM4wAUYGNrd9vPOxlh7+EQdES5IY6yhQg1d07NDQe16I6t
 UEtRYIMQT2RKjDSP69I8IMvA8DubcI6E1gIbqrDQTq6fxlXmEvGAG3VciB0IpUZ/ashk
 RQms7nTivrCGl+Oq0QrfBVbvKRYPhFJVFgUYwTPJ8GzDcxvhQb0nBRaJrhGEppsgLq0Z
 UGFQ==
X-Gm-Message-State: AOAM530djHVd4+KL3BaoKnPxyMbnGABJU5mOaiBubH9cCpsQoKL61Kt/
 XFkIKViim5dRh07+kku0MQ==
X-Google-Smtp-Source: ABdhPJzGAGG/j3pudhYYsCj0Biyu/aGfBQ2y7tfKEyAMBzDwzXV8ikExhnryvUsMjTXnM40fZlAggw==
X-Received: by 2002:a62:52d7:0:b029:18b:7093:fb88 with SMTP id
 g206-20020a6252d70000b029018b7093fb88mr19345045pfb.76.1606752816629; 
 Mon, 30 Nov 2020 08:13:36 -0800 (PST)
Received: from PWN (59-125-13-244.HINET-IP.hinet.net. [59.125.13.244])
 by smtp.gmail.com with ESMTPSA id a25sm17535145pfg.138.2020.11.30.08.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 08:13:35 -0800 (PST)
Date: Mon, 30 Nov 2020 11:13:26 -0500
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Message-ID: <20201130161326.GA26186@PWN>
References: <CABJPP5CZhURjFi9xE9KpxKSygS2z_8pbnrvhvV0nQGP9+vZ5_g@mail.gmail.com>
 <20201130152329.GA25773@PWN>
 <CAKXUXMxGdWNQy95AEB1Ph8dqBgambD2t6s+--g0aT2VYj0q__g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKXUXMxGdWNQy95AEB1Ph8dqBgambD2t6s+--g0aT2VYj0q__g@mail.gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Possible new warning for checkpatch
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

Hi Lukas,

On Mon, Nov 30, 2020 at 04:51:42PM +0100, Lukas Bulwahn wrote:
> On Mon, Nov 30, 2020 at 4:23 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> >
> > On Mon, Nov 30, 2020 at 08:28:23PM +0530, Dwaipayan Ray wrote:
> > > Hi Lukas,
> > > I was having a talk with Peilin and a possible new idea came up.
> > > It's about lines in the commit message that start with a '#'.
> > >
> > > Normally if a patch contains lines starting with '#' in the commit
> > > message, when they are applied they successfully appear in the
> > > git log. But if a maintainer for some reason decides to rebase and
> > > reword the commit message for whatever reason, the # lines are gone.
> >
> > Thanks for bringing this up Dwaipayan!
> >
> > Yes, for example, if one included some code examples (e.g. `#define ...`)
> > in the commit message, then the maintainer applied, and reworded the
> > commit to add their own Signed-off-by:, then all the # lines are gone.
> >
> > > Peilin had a look at it and he was able to successfully reproduce this
> > > fault.
> > >
> > > Now would it make sense if a warning for such lines starting with '#' in
> > > the commit message are emitted by checkpatch itself? I have no idea
> > > what other developers do, so I could be wrong at this point. But I would
> > > like your opinion.
> >
> > I admit it is a beginner's mistake, but I myself learned it in a hard
> > way (i.e. by having a patch mainline'd then seeing these # lines gone),
> > so personally I hope this becomes a new feature of checkpatch.
> 
> I think this makes sense and checkpatch should warn about that;
> probably the easy way to fix it is just to indent such lines by a few
> spaces, e.g., four spaces.

Yes, that prevents them from being dropped accidentally. Thank you,

Peilin Ye

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
