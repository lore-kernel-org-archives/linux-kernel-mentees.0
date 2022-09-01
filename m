Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF6CECAAD1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Sep 2022 07:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37B60416C9;
	Thu,  1 Sep 2022 07:04:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37B60416C9
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ffOiZdh+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s3grzYYfw3VK; Thu,  1 Sep 2022 07:04:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B9D23416AC;
	Thu,  1 Sep 2022 07:04:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9D23416AC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78EFFC0032;
	Thu,  1 Sep 2022 07:04:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DFF67C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Sep 2022 07:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C121E410CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Sep 2022 07:04:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C121E410CC
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ffOiZdh+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o17wRquRuNdp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Sep 2022 07:04:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16408410C6
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16408410C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Sep 2022 07:04:06 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id q81so13832808iod.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Sep 2022 00:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=i383AFik6yhsG3iX8RnrTI6xwTdG+YMrBsOjo22c5D0=;
 b=ffOiZdh+jXh3qPYSKprm0GZhBE7CDrzYPAQGXFDWZxwlLLJoNTCVqwXaGa5WgDKTc+
 Zt5y/pM/SYacoDCtW6mw9azEBvAxi4fdA35C5FkYPeGmpcTjziE2SenK/l2HoxQiOGNr
 ZxMsJB2PPXzrzG/D0Pl2iCk4Qzy4f5mvBpklYarIMYp8BT6z46ZY2orBhMXiPLgBLllw
 DmiGxMcysqbSX5yDTHCD9RG2FGAuLbHT5ffTwngf1w2MPhIMCFKydng0pdQmx9Ltp0Xr
 UsJhcPwMDwFtaFZ7+57STIUQHRAv0/xwxOrHqRMrXGW8/SargF7R9f0ZKGU8H/6nkntA
 z/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=i383AFik6yhsG3iX8RnrTI6xwTdG+YMrBsOjo22c5D0=;
 b=LJ3s25FdUw1Zeaw42Ao+LSWkWynYNDL33uWocK5Vr23YA9BGpTJWrqi0w9V+iaIzF6
 y8tvvsvkYhyl4xWwSDG1XUo48vUMCi7ar3BPSLHtG4qMuqspE7B4zDVIfoSbS/8naZO8
 VXsjTQz84i2Z2bwIE1UThkVCzfqUD2nir6o/OQzwXMf/oOnKmj0yTjs3QtQVys7H+g9m
 m2J09ZjDQSZPJ/ZzDR9bi2NGm75dRUGku0kNMCNpTquBhygB/YvvdTJGp7i6sC7XXr3t
 RHRuQUfO+dgPPzEsLOaM56y0g8ZbQMozfn5nfKgtoBtpNy4XNbIVFrK8n0l+sZH2BG8q
 FIjg==
X-Gm-Message-State: ACgBeo352SlaOowImVu2fmI9jEl1//Y6Fcyz2L/INsXOhA9IvlieqBlM
 yHBZ7GEiplXTE+SH1MtPv6ec3x8lKhOkR41QzHo=
X-Google-Smtp-Source: AA6agR6mveoPidXd7UAaBrslM4w5PmPciUvkUWfEG9bL0YPOzXuVhofd+d8O8emP0wcVtN4LDpgeOq+eDdozuUXJ+0I=
X-Received: by 2002:a6b:5f08:0:b0:688:9846:2f61 with SMTP id
 t8-20020a6b5f08000000b0068898462f61mr13831703iob.65.1662015845142; Thu, 01
 Sep 2022 00:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000092839d0581fd74ad@google.com>
 <20220901040307.4674-1-khalid.masum.92@gmail.com>
 <YxAyd6++6oWPu9L1@gondor.apana.org.au>
In-Reply-To: <YxAyd6++6oWPu9L1@gondor.apana.org.au>
From: Khalid Masum <khalid.masum.92@gmail.com>
Date: Thu, 1 Sep 2022 13:03:53 +0600
Message-ID: <CAABMjtGgv1GP0F9TJCMFN2psx7ok23BR9pEOyemWHeKvc_LfqA@mail.gmail.com>
Subject: Re: [PATCH v3] xfrm: Update ipcomp_scratches with NULL if not
 allocated
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
 "open list:NETWORKING \[GENERAL\]" <netdev@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 syzbot+5ec9bb042ddfe9644773@syzkaller.appspotmail.com
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

On Thu, Sep 1, 2022 at 10:18 AM Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Thu, Sep 01, 2022 at 10:03:07AM +0600, Khalid Masum wrote:
> >
> > diff --git a/net/xfrm/xfrm_ipcomp.c b/net/xfrm/xfrm_ipcomp.c
> > index cb40ff0ff28d..3774d07c5819 100644
> > --- a/net/xfrm/xfrm_ipcomp.c
> > +++ b/net/xfrm/xfrm_ipcomp.c
> > @@ -203,6 +203,7 @@ static void ipcomp_free_scratches(void)
> >               vfree(*per_cpu_ptr(scratches, i));
> >
> >       free_percpu(scratches);
> > +     ipcomp_scratches = NULL;
> >  }
>
> Good catch! This is probably the root cause of all the crashes.
>
> >  static void * __percpu *ipcomp_alloc_scratches(void)
> > @@ -215,7 +216,7 @@ static void * __percpu *ipcomp_alloc_scratches(void)
> >
> >       scratches = alloc_percpu(void *);
> >       if (!scratches)
> > -             return NULL;
> > +             return ipcomp_scratches = NULL;
>
> This is unnecessary as with your first hunk, ipcomp_scratches
> is guaranteed to be NULL.
>
> Thanks,
> --

You are right. Instead of setting it to NULL at both places, it makes
more sense to
do it when memory is freed.

I shall send a v4 with the suggested change.

thanks,
 -- Khalid Masum
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
