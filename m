Return-Path: <SRS0=5Mz1=BF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4401DC433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 06:13:13 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19E6420578
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 06:13:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pesu-pes-edu.20150623.gappssmtp.com header.i=@pesu-pes-edu.20150623.gappssmtp.com header.b="Oq/JKnUl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19E6420578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=pesu.pes.edu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D4B4B860F2;
	Sun, 26 Jul 2020 06:13:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WKLs22D74C4n; Sun, 26 Jul 2020 06:13:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 56D91860EA;
	Sun, 26 Jul 2020 06:13:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46637C004D;
	Sun, 26 Jul 2020 06:13:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 354B9C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 06:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A8C2387E5C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 06:12:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q0MMdvo4x-yd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 06:12:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8C45187861
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 06:12:56 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id b25so13901187ljp.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 23:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pesu-pes-edu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mjFcFPkYV6UQ15e1Sw/cnOMTT80K9lOv0sYuMsnpbg8=;
 b=Oq/JKnUlAX9SgNCIN2rS3ntngRStgdIT5wRDVT1qa5YLa6Xljk4gSLakcYqNbwrf4A
 rNXx4HHTqH0Jh2YjKKQi/eGniW+FMfKa74XyMOhhUKiBGr82wanEaf2ej/YPHZ84/MW5
 IHBmbmbvb1UHIJB1PK9YIzeRm6OE5HEoJJgJ8zslayrKOxWXPkl+goJIUta9pEsJw4PF
 gl3g15nkqfCCvCDV2tY9EKe6VG/4n5Fgzyi8abxE7bayEIU9QrSCUWM1V+jBAqIWoaYx
 jGT5pKGDbSu1KJX+0PtRUxOKXmPipyez2I/Qew4fXGDxujA6P6TVWTEg0HHlL3Q2D3DE
 P06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mjFcFPkYV6UQ15e1Sw/cnOMTT80K9lOv0sYuMsnpbg8=;
 b=br5B7ZTt6FnQ105iZzYYP9sk5ANnQPyGPDZcnAw/lMJcg0WuAI2NOaSKBwszjIeaop
 MJepwvfKT7vSfwl9oSR1w20nO1Pf6hJ5Cnx4OEYe3wTLilN9/jII6OBpsgvo6MlEWylE
 K8b1x87Li9W843FCgE8Ci0vemBhpM9yvJFc4U2H3x5jLhZ4gOV8wY0xJwbq6T51dj4Bb
 jNH1yB2oRCnbbpuC5FbRfeM40o1UIIGbz/oesRDO4O0VeXBZ9Rz0sLduv9gKGb0nv19X
 xGmacmpSGjPlFgkWRuyPDf9k+qi/QBnROfDcFwAvlZ2W+5CCqFY7Er9i1cn6BezwNVJD
 b6WQ==
X-Gm-Message-State: AOAM531TScVXiul6o8FSgXZkgpAJCzZaNsKjlPGeaWClfDyjHUxVrWXY
 UDn2fmZ6XuUFGhImjxCrXq8FMLJJDAZi4Hhd8Aay2w==
X-Google-Smtp-Source: ABdhPJzLAZZeMuZM0RtO55UD2RjUIs4qLuxl6cAGSb+bhh8HpFUnkvUeSQFum4N/+Mm8ZHnpyXRsev9eXIbtReWvkS8=
X-Received: by 2002:a2e:9c59:: with SMTP id t25mr7286391ljj.402.1595743974346; 
 Sat, 25 Jul 2020 23:12:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200726030855.q6dfjekazfzl5usw@pesu.pes.edu>
 <CAM_iQpUFL7VdCKSgUa6N3pg7ijjZRu6-6UAs2oNosM-EzgXbaQ@mail.gmail.com>
In-Reply-To: <CAM_iQpUFL7VdCKSgUa6N3pg7ijjZRu6-6UAs2oNosM-EzgXbaQ@mail.gmail.com>
From: B K Karthik <bkkarthik@pesu.pes.edu>
Date: Sun, 26 Jul 2020 11:42:43 +0530
Message-ID: <CAAhDqq28h9_ji=ANttUyx2Q1Md=bZD3-JVCwQRW06W7aikPN0A@mail.gmail.com>
To: Cong Wang <xiyou.wangcong@gmail.com>
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

On Sun, Jul 26, 2020 at 11:05 AM Cong Wang <xiyou.wangcong@gmail.com> wrote:
>
> On Sat, Jul 25, 2020 at 8:09 PM B K Karthik <bkkarthik@pesu.pes.edu> wrote:
> > @@ -103,10 +103,10 @@ static int __xfrm6_tunnel_spi_check(struct net *net, u32 spi)
> >  {
> >         struct xfrm6_tunnel_net *xfrm6_tn = xfrm6_tunnel_pernet(net);
> >         struct xfrm6_tunnel_spi *x6spi;
> > -       int index = xfrm6_tunnel_spi_hash_byspi(spi);
> > +       int index = xfrm6_tunnel_spi_hash_byaddr((const xfrm_address_t *)spi);
> >
> >         hlist_for_each_entry(x6spi,
> > -                            &xfrm6_tn->spi_byspi[index],
> > +                            &xfrm6_tn->spi_byaddr[index],
> >                              list_byspi) {
> >                 if (x6spi->spi == spi)
>
> How did you convince yourself this is correct? This lookup is still
> using spi. :)

I'm sorry, but my intention behind writing this patch was not to fix
the UAF, but to fix a slab-out-of-bound.
If required, I can definitely change the subject line and resend the
patch, but I figured this was correct for
https://syzkaller.appspot.com/bug?id=058d05f470583ab2843b1d6785fa8d0658ef66ae
. since that particular report did not have a reproducer,
Dmitry Vyukov <dvyukov@google.com> suggested that I test this patch on
other reports for xfrm/spi .

Forgive me if this was the wrong way to send a patch for that
particular report, but I guessed since the reproducer did not trigger
the crash
for UAF, I would leave the subject line as 'fix UAF' :)

xfrm6_spi_hash_by_hash seemed more convincing because I had to prevent
a slab-out-of-bounds because it uses ipv6_addr_hash.
It would be of great help if you could help me understand how this was
able to fix a UAF.

>
> More importantly, can you explain how UAF happens? Apparently
> the syzbot stack traces you quote make no sense at all. I also
> looked at other similar reports, none of them makes sense to me.

Forgive me, but I do not understand what you mean by the stack traces
(this or other similar reports) "make no sense".

I apologise if this message was hurtful / disrespectful in any manner.
thanks,

karthik
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
