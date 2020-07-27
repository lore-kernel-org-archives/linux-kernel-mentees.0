Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26724C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 09:58:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E95DD2075D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 09:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E95DD2075D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=secunet.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C542985CFE;
	Mon, 27 Jul 2020 09:58:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ANjN0Bk3B7uA; Mon, 27 Jul 2020 09:58:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AF56E85CD8;
	Mon, 27 Jul 2020 09:58:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2591C0050;
	Mon, 27 Jul 2020 09:58:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9ED0C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 09:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CE70787B5E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 09:58:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HLjuFmUqTC1R
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 09:58:05 +0000 (UTC)
X-Greylist: delayed 00:07:18 by SQLgrey-1.7.6
Received: from a.mx.secunet.com (a.mx.secunet.com [62.96.220.36])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4E97D87134
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 09:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by a.mx.secunet.com (Postfix) with ESMTP id 64AA420561;
 Mon, 27 Jul 2020 11:50:44 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
 by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ufs28DryHkk0; Mon, 27 Jul 2020 11:50:44 +0200 (CEST)
Received: from cas-essen-01.secunet.de (201.40.53.10.in-addr.arpa
 [10.53.40.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by a.mx.secunet.com (Postfix) with ESMTPS id 01B4920482;
 Mon, 27 Jul 2020 11:50:44 +0200 (CEST)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 27 Jul 2020 11:50:43 +0200
Received: from gauss2.secunet.de (10.182.7.193) by mbx-essen-01.secunet.de
 (10.53.40.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Mon, 27 Jul
 2020 11:50:43 +0200
Received: by gauss2.secunet.de (Postfix, from userid 1000)
 id 671043184651; Mon, 27 Jul 2020 11:50:43 +0200 (CEST)
Date: Mon, 27 Jul 2020 11:50:43 +0200
From: Steffen Klassert <steffen.klassert@secunet.com>
To: Cong Wang <xiyou.wangcong@gmail.com>
Message-ID: <20200727095043.GA20687@gauss3.secunet.de>
References: <20200726030855.q6dfjekazfzl5usw@pesu.pes.edu>
 <CAM_iQpUFL7VdCKSgUa6N3pg7ijjZRu6-6UAs2oNosM-EzgXbaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAM_iQpUFL7VdCKSgUa6N3pg7ijjZRu6-6UAs2oNosM-EzgXbaQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: cas-essen-02.secunet.de (10.53.40.202) To
 mbx-essen-01.secunet.de (10.53.40.197)
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Linux Kernel
 Network Developers <netdev@vger.kernel.org>,
 B K Karthik <bkkarthik@pesu.pes.edu>, LKML <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
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

On Sat, Jul 25, 2020 at 10:35:12PM -0700, Cong Wang wrote:
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

This can not be correct, it takes a u32 spi value and casts it to a
pointer to an IP address.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
