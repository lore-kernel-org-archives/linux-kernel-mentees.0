Return-Path: <SRS0=c8zi=BA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_05,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C346DC433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 12:35:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9412F2077D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 12:35:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vLLnf6t5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9412F2077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 71E2A88A9E;
	Tue, 21 Jul 2020 12:35:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0-FQzLb50jJI; Tue, 21 Jul 2020 12:35:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0BF1288A93;
	Tue, 21 Jul 2020 12:35:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9909C089F;
	Tue, 21 Jul 2020 12:35:55 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E97FBC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 12:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E5184886BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 12:35:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s5zcfxTlSfmO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 12:35:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 914538868D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 12:35:54 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id l6so10192089plt.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 05:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gCQik/w6NvDdgNRdHXsXwHB1wNmqYh2Zx4LCsjaGWiI=;
 b=vLLnf6t5/T2tqBlgQAYehbNEpNHSpijVkc2zu4ZRcx6T+cMqS1wGL9f9IP4ap4t2fM
 M06DIM+6dvXOmdBK0DXen4OMwV4f/OcLYpz6SvRPUTf49H4Y8e3bzAwJvkaudVxw13/v
 SottDmIgB1aI6EoJY7Ms5Z5Je4IMhECiSBxiiwKOB7TXK3sbdnvIxYHaVkQZO/gIgrZ9
 rgPUBBwsUqVPIer8GXRJ2zLe2OPjG2Mby4hY1ZjMmo2RYjNEBnhhB9wQqu6Rf1oUGgJ3
 jEBTWGfAa9i6z1WhkRIVdxzal18h9RxddQb2K1+EVyq59E1eMRPmT/sRFIPr/e9hK9LH
 gWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gCQik/w6NvDdgNRdHXsXwHB1wNmqYh2Zx4LCsjaGWiI=;
 b=qUy9NR3uyTi7Uiafr7kBe8WDHPvu3Vh01dOi7HXLwtopay3BTEwE0zFkkF8VgT2uvO
 +ULZX57XMtbnjEiNuZYnJgwQALWPrN/8mSqeOyWxk7LlomHdkzKhEgcUMOgWE2JapGZz
 g1T6AoYnX++bOhuoXatYbBa1RyvazjOHWQTY/iu23qTyhNzoO3f9MMvPNUMchqVUxRRl
 fNB58r8RHrReNAMnWIG47Km0X2t21BSb1NelCY6SYn/oay450y2gpl2Jwx5VAMr7fuq7
 eWg1xNiUqoNGm3uTfxaoYWHM4tdM3KiYS9AB7GbGMjVJY3CrWNTRwPi9pozdz5hQbZvh
 a/pQ==
X-Gm-Message-State: AOAM53068hnRaATs+YMdyKzzPoH0y92GOJ5e6EZHMjUVpypQ6euAcuiJ
 0hGlPR0gjiQYY2uUQ4kCo/E=
X-Google-Smtp-Source: ABdhPJymd9DtK/2SkX4MtHN9+uSyoq9kDhMgE8/1XnEKsQ9TtAeeFWXz2uSNqVGGr3IdOKocLxm7zg==
X-Received: by 2002:a17:90a:750:: with SMTP id
 s16mr4534280pje.218.1595334954155; 
 Tue, 21 Jul 2020 05:35:54 -0700 (PDT)
Received: from gmail.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id j13sm3180858pjz.8.2020.07.21.05.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 05:35:53 -0700 (PDT)
Date: Tue, 21 Jul 2020 18:04:25 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Herbert Xu <herbert@gondor.apana.org.au>
Message-ID: <20200721123425.GA81853@gmail.com>
References: <20200721123146.81710-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721123146.81710-1-vaibhavgupta40@gmail.com>
Cc: linux-crypto@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] crypto: ccp: sp-pci: use
	generic power management
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

The Patch is Compile-tested only.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
