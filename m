Return-Path: <SRS0=5Mz1=BF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF1AC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 20:07:43 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C115206E3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 20:07:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R90fe9DZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C115206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E83808789B;
	Sun, 26 Jul 2020 20:07:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WiPRZ9Jt9Lks; Sun, 26 Jul 2020 20:07:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 15DA287897;
	Sun, 26 Jul 2020 20:07:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC062C0050;
	Sun, 26 Jul 2020 20:07:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63CF1C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 20:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 59E7D862B4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 20:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jFUkKZEbpPw9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 20:07:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 32276862AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 20:07:39 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id q3so11353440ilt.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 13:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hepoEcj03sM0CyU8joldRCATVzSo814tkMYfqpOgn8Q=;
 b=R90fe9DZCZzsKaiZN6ZyStpg7gXNGe8uBdtvnltvSyM1GUusMVJH+adyWtYPGeIQQ5
 mT+8va8Vauu42JeMx8EvhRq0taB4YYKz+HutaLZI1N38fBKQq0lb+885IKovVZKEuyMk
 j1HU1yMnnIgHCo7nBsRwJIJltfsJNnVb/DvjoDDyNnIKvfbPyHrlx1NQdBlmkwkWtxIh
 bIv6nNn8Xe/QrKBXWDgJbvccBox4ItHPIGrIQC/s9YKNirgPktlEB/bLHCe50OJ+bh7w
 UAoOb9+4lAgZmSgAXjYcA75Td/XPNe23b9OTOMO6qrF3NtwzNZD+BKJyDQoAoBdGC+pS
 oI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hepoEcj03sM0CyU8joldRCATVzSo814tkMYfqpOgn8Q=;
 b=Ho2QWV+Ov3f9C7GhzDHdT5gY059nE8jjs++mBPpwfBgjeUv0lSDSVmwH3gStgwzB5P
 djYzLiUcjy0EsoaV7Emhu2IgWxyngxVxCVk+aBJDgRxP8wTD9oK5naALRZS8P0eq9AOf
 StWCaA26cy/cZrf3U74cW17Gk7toEwBGaCwOkTVVWdDcHb6Dsbzj7N+scwb92//rL/7q
 yemmvgqupNFkQMpyQUUIDtJKluNr22xnNq6/wDjWz9UvsKO0znGIndTG1tsEZNmTiBgf
 y3Bb1+BKMvtgDHJFFJ1cBQLOU9wGpcW23LVW4EUxaZucSlkWEakoKWgeFFMR79ygCFVa
 ohGA==
X-Gm-Message-State: AOAM533+MbrKojYZckv7a8cn3Opt7/IuABMJ4FYDf2Ysw9L7KBqjAqpP
 eWVMwzhlw+9VuNsxz2+Ez1BtaahAF4BmZPE+1cI=
X-Google-Smtp-Source: ABdhPJzMdNT6/iybFIAQG6sXZTJJd77PEH+FsQ+sZ/OEpvpeVmZKHQ2bJntZvMLWneIs6gNhhyuhZqAiFnl0QABDUYw=
X-Received: by 2002:a92:9a45:: with SMTP id t66mr18391483ili.268.1595794058048; 
 Sun, 26 Jul 2020 13:07:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200726030855.q6dfjekazfzl5usw@pesu.pes.edu>
 <CAM_iQpUFL7VdCKSgUa6N3pg7ijjZRu6-6UAs2oNosM-EzgXbaQ@mail.gmail.com>
 <CAAhDqq28h9_ji=ANttUyx2Q1Md=bZD3-JVCwQRW06W7aikPN0A@mail.gmail.com>
In-Reply-To: <CAAhDqq28h9_ji=ANttUyx2Q1Md=bZD3-JVCwQRW06W7aikPN0A@mail.gmail.com>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Sun, 26 Jul 2020 13:07:25 -0700
Message-ID: <CAM_iQpX+iw+5AALriNZLfx5P-LV_ratiwhMRiHXmuLE2z81aaw@mail.gmail.com>
To: B K Karthik <bkkarthik@pesu.pes.edu>
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 Linux Kernel Network Developers <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] net: ipv6: fix use-after-free
	Read in __xfrm6_tunnel_spi_lookup
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

On Sat, Jul 25, 2020 at 11:12 PM B K Karthik <bkkarthik@pesu.pes.edu> wrote:
>
> On Sun, Jul 26, 2020 at 11:05 AM Cong Wang <xiyou.wangcong@gmail.com> wrote:
> >
> > On Sat, Jul 25, 2020 at 8:09 PM B K Karthik <bkkarthik@pesu.pes.edu> wrote:
> > > @@ -103,10 +103,10 @@ static int __xfrm6_tunnel_spi_check(struct net *net, u32 spi)
> > >  {
> > >         struct xfrm6_tunnel_net *xfrm6_tn = xfrm6_tunnel_pernet(net);
> > >         struct xfrm6_tunnel_spi *x6spi;
> > > -       int index = xfrm6_tunnel_spi_hash_byspi(spi);
> > > +       int index = xfrm6_tunnel_spi_hash_byaddr((const xfrm_address_t *)spi);
> > >
> > >         hlist_for_each_entry(x6spi,
> > > -                            &xfrm6_tn->spi_byspi[index],
> > > +                            &xfrm6_tn->spi_byaddr[index],
> > >                              list_byspi) {
> > >                 if (x6spi->spi == spi)
> >
> > How did you convince yourself this is correct? This lookup is still
> > using spi. :)
>
> I'm sorry, but my intention behind writing this patch was not to fix
> the UAF, but to fix a slab-out-of-bound.

Odd, your $subject is clearly UAF, so is the stack trace in your changelog.
:)


> If required, I can definitely change the subject line and resend the
> patch, but I figured this was correct for
> https://syzkaller.appspot.com/bug?id=058d05f470583ab2843b1d6785fa8d0658ef66ae
> . since that particular report did not have a reproducer,
> Dmitry Vyukov <dvyukov@google.com> suggested that I test this patch on
> other reports for xfrm/spi .

You have to change it to avoid misleading.

>
> Forgive me if this was the wrong way to send a patch for that
> particular report, but I guessed since the reproducer did not trigger
> the crash
> for UAF, I would leave the subject line as 'fix UAF' :)
>
> xfrm6_spi_hash_by_hash seemed more convincing because I had to prevent
> a slab-out-of-bounds because it uses ipv6_addr_hash.
> It would be of great help if you could help me understand how this was
> able to fix a UAF.

Sure, you just avoid a pointer deref, which of course can fix the UAF,
but I still don't think it is correct in any aspect.

Even if it is a OOB, you still have to explain why it happened. Once
again, I can't see how it could happen either.

>
> >
> > More importantly, can you explain how UAF happens? Apparently
> > the syzbot stack traces you quote make no sense at all. I also
> > looked at other similar reports, none of them makes sense to me.
>
> Forgive me, but I do not understand what you mean by the stack traces
> (this or other similar reports) "make no sense".

Because the stack trace in your changelog clearly shows it is allocated
in tomoyo_init_log(), which is a buffer in struct tomoyo_query, but
none of xfrm paths uses it. Or do you see anything otherwise?

Thanks.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
