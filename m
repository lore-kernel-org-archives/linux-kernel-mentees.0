Return-Path: <SRS0=5Mz1=BF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F2BC433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 05:35:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71F4420663
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 05:35:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p6kSFEZY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71F4420663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1C58388292;
	Sun, 26 Jul 2020 05:35:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AyKL0OwCsO9T; Sun, 26 Jul 2020 05:35:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8E7C388262;
	Sun, 26 Jul 2020 05:35:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67603C004E;
	Sun, 26 Jul 2020 05:35:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB0F1C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 05:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C12CE87A2D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 05:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VNJy9WQvPD8o
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 05:35:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1CC3087A1A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 05:35:24 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id l17so247164ilq.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 22:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x1bARMh5GgpfdkzzJHqPV/cESh0NbR22EC4SzVKdkYw=;
 b=p6kSFEZYt44mpd6mt6sRfe1gbGQm+sb7NNXOGEEVW10+D6qbBWsQQ6rBnbKYaVsXKP
 C5r0Rwy0vj1kBkkeWZ9dIiXIgsZg2Ic5Ro7ojiN2qGj3nFkDTmwlEsA3D/II4kPHSYzZ
 4TgcpSJgRCVSynfB1+FO6NHRsvJLbqMA2k2QOV1Q2oAhCfFeTVLXbSh3m7tOVZHNFen5
 S3VQWtI6A+7N/gUfCmWiBfD4eL72fh9ZB1xDejmbIezHBKGlq//JTJYjSUCtBxpBrLot
 jbikCZOCwtKPswMwG6QpMb7yDOFmxhuzT2+dswy893jMoLbzhDOsdsI4GFSpdf5uYDIg
 edcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x1bARMh5GgpfdkzzJHqPV/cESh0NbR22EC4SzVKdkYw=;
 b=JdzRz8fN9YTif8fQRa5D6MQlhFl3Sfczq+KuCCgLKCdR2fQZasWOdiqaAT/Kx3XvSt
 WoMjRJga17MzQ+RBVebGsXJ6wCt306lXZ8lz6OxpSnELGC1m1nClpYCnhzM+WmQen8dt
 8LKPxQlj7We7j3NNFqNpETitVZqtkrkdE1z1v83KUUvMZcfueeooEziNQX+IR0+dGEvk
 KEQ8wKJkv9sYQlO4kBH3p4f5XAP5hQlai2hqbsUXqnUHjCXMfvyozxe30rWbeYgsBVlo
 dnwKtpLAGyjYhyZxPDoAn7rAj0E8Yyvuit/bCJBKygTQPGUSXgmZ1WxWdixxr52sH9Wb
 xM9Q==
X-Gm-Message-State: AOAM532KfOay5S7DS+hRLgv/dylL8LOL2x/xFH8pdKTPnhTe9vg7MpPh
 KitaLAVl6rJ8xlzfl01kRhrD+ZOybuKVdmN1OLQ=
X-Google-Smtp-Source: ABdhPJz0GntQMpIOmrj4GRVMLIZcTc3W7DE9ss2ffHETJ+m2psB6WMCmh23STzGSMAgSFeZ48bxWY3UKFovKuCJpomo=
X-Received: by 2002:a05:6e02:788:: with SMTP id
 q8mr9248511ils.22.1595741723422; 
 Sat, 25 Jul 2020 22:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200726030855.q6dfjekazfzl5usw@pesu.pes.edu>
In-Reply-To: <20200726030855.q6dfjekazfzl5usw@pesu.pes.edu>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Sat, 25 Jul 2020 22:35:12 -0700
Message-ID: <CAM_iQpUFL7VdCKSgUa6N3pg7ijjZRu6-6UAs2oNosM-EzgXbaQ@mail.gmail.com>
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

On Sat, Jul 25, 2020 at 8:09 PM B K Karthik <bkkarthik@pesu.pes.edu> wrote:
> @@ -103,10 +103,10 @@ static int __xfrm6_tunnel_spi_check(struct net *net, u32 spi)
>  {
>         struct xfrm6_tunnel_net *xfrm6_tn = xfrm6_tunnel_pernet(net);
>         struct xfrm6_tunnel_spi *x6spi;
> -       int index = xfrm6_tunnel_spi_hash_byspi(spi);
> +       int index = xfrm6_tunnel_spi_hash_byaddr((const xfrm_address_t *)spi);
>
>         hlist_for_each_entry(x6spi,
> -                            &xfrm6_tn->spi_byspi[index],
> +                            &xfrm6_tn->spi_byaddr[index],
>                              list_byspi) {
>                 if (x6spi->spi == spi)

How did you convince yourself this is correct? This lookup is still
using spi. :)

More importantly, can you explain how UAF happens? Apparently
the syzbot stack traces you quote make no sense at all. I also
looked at other similar reports, none of them makes sense to me.

Thanks.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
