Return-Path: <SRS0=/QZw=DF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF561C2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Sep 2020 15:06:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0797B207F7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Sep 2020 15:06:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkEs61PQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0797B207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E60DD2049C;
	Mon, 28 Sep 2020 15:06:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EMtS3G2cSvXa; Mon, 28 Sep 2020 15:06:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AB0562033E;
	Mon, 28 Sep 2020 15:06:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93B59C016F;
	Mon, 28 Sep 2020 15:06:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1DF87C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 15:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 963342044B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 15:06:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9X-XJXjU1hTe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 15:06:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by silver.osuosl.org (Postfix) with ESMTPS id 1ED2F2033E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 15:06:15 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id p15so8998036ejm.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 08:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=4JMUzU1mFp3GMpAIuCZ5kAzf+gyc+aAHO7ni3C8v3DA=;
 b=dkEs61PQrPCNvWQzVSZ0c1wCXYHWYb7ugbePEh2RCCe7a/l3c0VnbSCrufEiRymsB0
 djoT1ATpmh2NpLcJoCkbsth90pmti+2sE9GUmry1vl1qiagbV3adFY6QpArb4Sykh6GV
 ZHgLQqTG/FMP8jlythYNBTrqmD0iZSTIZEX0l4Xc7ZxHcLXyro5j9wl3wztC2r3cjziI
 h+PgSCUkXcC0HecPrxiCWbbSD+Yu7BIxkZCzwrn8Fv5zpnajUqaUv7dAUcQdEjV+MN6n
 NuUDVCCKYSIqCdymJnNCUDF88UAIMHGCMpxnwdVVKaHsSo0tagzKRzt1sXTbv4cnGg8Z
 hU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=4JMUzU1mFp3GMpAIuCZ5kAzf+gyc+aAHO7ni3C8v3DA=;
 b=Ixi+KpR7+033r1tB2AEt3xBNKfCYuVLOSIciSH7WYWFH2pnzUcE7YIuQdRluEaUojo
 +LDbNmWglPILycUHY1cT6cI9VvhbuPo0qTFpopi2A8O8G7VNK65WskLSwjrJqrNyXsPk
 fWol7OA98rBC42eaibwqdlydnR9EVccDK4H/GwrOKDQd0RMr+rIvzMikWY1ZYve8/FKC
 ShLFlIHzpHMTlYJAWU4pGQ3bJtoaZm8PlkcQowpY8EXAD7vVSgDAIIlGUnTYzQgqHsPr
 Wbu5V7HZYL2iqnULp5qr7u9NiLTx6l7XFsxqeVUE892pUBRGFlUacoRTS7xY5jFQT6Qw
 JxhA==
X-Gm-Message-State: AOAM531yITKYKHjXOSKxtc4j8CVBUvwLKQRE1RN7kbrsckMvfgmakVQu
 Jp++yRihGXC0ZwkECmV0fB8=
X-Google-Smtp-Source: ABdhPJw0clwBk+6O032fb16PrmeWMK2DencKutReYsOmipEw1XJp9EhSJBGPN/l3ZHLqgMYwdcjRag==
X-Received: by 2002:a17:906:a985:: with SMTP id
 jr5mr2163157ejb.549.1601305573454; 
 Mon, 28 Sep 2020 08:06:13 -0700 (PDT)
Received: from felia ([2001:16b8:2d9d:5000:7872:7299:adfa:b749])
 by smtp.gmail.com with ESMTPSA id k19sm1543520ejo.40.2020.09.28.08.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 08:06:12 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 28 Sep 2020 17:06:11 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5B8mfAi3MMS4xWbArJe=FcMBTF9U8qvXmaicGj5WKiGBQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009281701520.4154@felia>
References: <alpine.DEB.2.21.2009181157160.14717@felia>
 <CABJPP5DGpep-S5F+J=dxdhBBDp2J9wQBrJvH_Ys6uJDj3AfRRA@mail.gmail.com>
 <alpine.DEB.2.21.2009181238230.14717@felia>
 <CABJPP5A8kaaFqR9Sm-rS6uuWb6CdbnkLLPXWpgp8XeEgC9uOJw@mail.gmail.com>
 <alpine.DEB.2.21.2009211112460.7483@felia>
 <CABJPP5B6D2ttt5D1ROrQNy7BDMcp+CBg6QB3vFRac4H10CkvCw@mail.gmail.com>
 <alpine.DEB.2.21.2009222028250.20644@felia>
 <CABJPP5B9RsGXCCAHxve2hxmCSyPX3C5aO_5MU9QMtNm08cXiNg@mail.gmail.com>
 <alpine.DEB.2.21.2009230925520.6068@felia>
 <CABJPP5CQxXdAD5fFRZaApjh2GJJ_2Dd1Q=6phS-61iLrU5qb9Q@mail.gmail.com>
 <alpine.DEB.2.21.2009230941250.6068@felia>
 <CABJPP5B8GJWPBqeb1RhJknN-4Q0_nQfU9M=Oy+K=Fwe02cgoag@mail.gmail.com>
 <alpine.DEB.2.21.2009250854230.5992@felia>
 <CABJPP5Chc5+tNda3af88=pUC2XN8bEga4FiP=+KBwyx0UWOmyA@mail.gmail.com>
 <alpine.DEB.2.21.2009250930570.5992@felia>
 <CABJPP5B8mfAi3MMS4xWbArJe=FcMBTF9U8qvXmaicGj5WKiGBQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch.pl investigation:
	NO_AUTHOR_SIGN_OFF issues
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



On Sat, 26 Sep 2020, Dwaipayan Ray wrote:

> > > Yes, that should help I think. Currently checkpatch is very vague
> > > about Author sign offs, so subclassing it will really be helpful.
> > > But at the same point I don't think it should become
> > > too complex either.
> >
> > Agree, that is where the evaluation will help (what is really happening,
> > what do we need to consider) and the severity comes into play (if we
> > consider all subclasses of same severity, we do not need to differentiate
> > between them.)
> >
> > >
> > > I have already prepared a patch for the basic two classes:
> > > 1) same name, different address
> > > 2) same address, different name
> > >
> > > It would be great to have your feedback on this.
> >
> > Okay, I suggest to run this script on a larger set of commits and see.
> >
> > Probably, you can speed it your evaluation with checkpatch.pl by
> > restricting it to the AUTHOR_SIGN_OFF type. I will try that over the
> > weekend as well.
> >
> > Lukas
> 
> Hi,
> So I did run my script to evaluate the type of errors that were generated.
> My results are from commits between v5.7 and v5.8
>

Okay, good so far. How about running this on a larger set of commits?
 
> 1) Same address, different name
> 
> There were 32 such instances. In general, there was no regularity in the
> specific error.
> 
> There were some cases with letter case mismatch. Like there was one
> committer who used the names "Arend Van Spriel", and "Arend van Spriel".
> I believe this error should not be generated and matching be made case
> neutral.
> 
> Apart from this, the rest of the cases in this category were some with missing
> first or last names, using names in other languages or having commas in
> one name, using initials etc. These should be warned about.
>

Agree. Let us making this WARNING, but not ERROR.

> 2) Same name, different address
> 
> There were 204 such instances. Most of them were of the form in which they
> used a completely different email address.
>

I guess we would need to understand in more detail why developers do that 
and if .mailmap helps here.
  
> Only one case was found with an email extension.
> <hpeter@gmail.com>
> <hpeter+linux_kernel@gmail.com>
> in commit 423d9118c624
> 
> So in general I think most email mismatches should be specified by a WARN
> and for email extension there should be a --strict CHECK.
> 
> What do you think of this?
>

Basically, I agree. How about proposing a patch to Joe and lkml and then 
we see...

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
