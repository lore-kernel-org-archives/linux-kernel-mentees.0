Return-Path: <SRS0=IxsT=CZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C62C35256
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 07:06:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AD3222206
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 07:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AD3222206
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0D4388705C;
	Wed, 16 Sep 2020 07:06:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V5Vvo8dMtHRY; Wed, 16 Sep 2020 07:06:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8962487054;
	Wed, 16 Sep 2020 07:06:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C273C0859;
	Wed, 16 Sep 2020 07:06:20 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2757AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 07:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1C3A98705C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 07:06:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1wo-J04G+TKY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 07:06:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0AB2387054
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 07:06:18 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id a2so5693084otr.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 00:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LsQvtHeib1atrvvp2feLEjcTV2UF2/kU0aaYslA7vbY=;
 b=GdFtxGb5qjXk4hd/WvCGNAGNE8JEcEKoIRvkta9e42wUOYvryc2eYohr/QxiLFNUfI
 UOT63Koopzj0txoWtFaQEYM3kv134aljJCX/go+jFRxdSQ5g3K8GoW9KLXiza6UB/a8H
 B+ZPmmXRX0KE+bmaeFRAfKzJQrBg580vvE4eXur2Yuk8WxZvq74Ar/sznRsC9gx19pjR
 RHxPO1b/eE0+gOOndWBlMIAjJLFIOVv7sn2eTfUhXizKZo4Tj14B1zaPCt030BMbiMqG
 TrTtsMmrGRDmO54d7qLxxVeRS/k4m0SqOO/4Jk9VRMtBG6q9isRcIs+8++A2AgP/PzWg
 hhJA==
X-Gm-Message-State: AOAM532BdOvEEqsf29rZkw3+w65t873RAvMJG9G8TsWx/JvvemSn4Z6J
 zjsinihlg9DiI5nGBkQLpB64gby+xrTsB5aLetg=
X-Google-Smtp-Source: ABdhPJxKmwKiMQprL5cUYhYw8TtCpuH52UjOz5tY3oy5rjo3bFWSZ4m127dVecTxjDzhROsJWJLoZIyaiNxs2MyUSSk=
X-Received: by 2002:a9d:3b76:: with SMTP id
 z109mr15872454otb.250.1600239977269; 
 Wed, 16 Sep 2020 00:06:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200915180509.2661572-1-dwlsalmeida@gmail.com>
 <20200916084036.09e8f3c8@coco.lan>
In-Reply-To: <20200916084036.09e8f3c8@coco.lan>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Sep 2020 09:06:06 +0200
Message-ID: <CAMuHMdXjA7q-v-mYY9DChC0XQbv9vfW6c3Vfn07-H-FgBr+izA@mail.gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, r.verdejo@samsung.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, nicolas@ndufresne.ca,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] media: vidtv: fix build on 32bit
	architectures
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

Hi Mauro, Daniel,

On Wed, Sep 16, 2020 at 8:40 AM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
> Em Tue, 15 Sep 2020 15:05:09 -0300
> "Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:
> > From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> >
> > Fix the following error for builds on 32bit architectures:
> >
> > ERROR: modpost: "__udivdi3"
> > [drivers/media/test-drivers/vidtv/dvb-vidtv-bridge.ko] undefined!
> >
> > Which is due to 64bit divisions that did not go through the helpers
> > in linux/math64.h
> >
> > As vidtv_mux_check_mux_rate was not operational in its current form,
> > drop the entire function  while it is not fixed properly.
> >
> > For now, call vidtv_mux_pad_with_nulls with a constant number of packets
> > to avoid warnings due to unused functions when building this driver.
> >
> > Fixes: f90cf6079bf67988 ("media: vidtv: add a bridge driver")
> > Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # build-tested

> > --- a/drivers/media/test-drivers/vidtv/vidtv_s302m.c
> > +++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
> > @@ -285,12 +285,12 @@ static void vidtv_s302m_compute_pts(struct vidtv_encoder *e)
> >  {
> >       u64 count = e->sample_count;
> >       struct vidtv_access_unit *au = e->access_units;
> > +     u32 duration = CLOCK_UNIT_90KHZ / e->sampling_rate_hz;
> >
> >       while (au) {
> >               count += au->num_samples;
> >
> > -             au->pts = count *
> > -                       CLOCK_UNIT_90KHZ / e->sampling_rate_hz;
> > +             au->pts = count * duration;
>
> That doesn't seem to be the right thing to do here.
>
> Assuming that sampling rate is 48 kHz, you'll
> have duration = 1.875, which would be rounded to 1.
>
> In other words, the above is identical to:
>
>         au->pts = count
>
> Now, I don't know from where that CLOCK_UNIT_90KHZ came from.
>
> If such constant is not needed anymore, just drop it.
>
> If, on the other hand, this is required by the specs, then
> you may need to do a 64 bits division, e. g. using
> div64_u64() or do_div().

As vidtv_encoder.sampling_rate_hz is u32, there's fortunately no need
to use div64_u64() (64-by-64), so div_u64() (64-by-32) is fine.

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
