Return-Path: <SRS0=wOYV=5D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9857C1975A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Mar 2020 03:01:25 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A187E20738
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Mar 2020 03:01:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="IHTT0YwY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A187E20738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 757D9871F0;
	Wed, 18 Mar 2020 03:01:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SujPlK41YJZu; Wed, 18 Mar 2020 03:01:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4CEEA8719C;
	Wed, 18 Mar 2020 03:01:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3405CC18DA;
	Wed, 18 Mar 2020 03:01:24 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8609BC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 03:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6DE2122BA3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 03:01:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N6c9muQ+0Jwf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 03:01:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by silver.osuosl.org (Postfix) with ESMTPS id F2E032048B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 03:01:21 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id e11so36366146qkg.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Mar 2020 20:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=ydkM02gA1lv2jXZ+vVnjGn/g5VzXdwCSm+r9ur1CJPs=;
 b=IHTT0YwYPoS8iMmX0qpmgTqBgRe4WcF01YbL2TEUEwWqZdjOAZwHvbArCyepsxfcs0
 5RhcvvUs+1Nhtw8Q6FHiVx6OPM4knOtgscqJG4CCaIjYfENTn8BQGSfU8HnjNQ0Au5q5
 fCJ1bE1qbheMPOHu5Rx+kKtWBcbtX1E1cUtDYKEmYlLrkxgQNFYTrzM5p90radr5v1Do
 uKvdEWktYiutwnbjOklODkdp0T+wqHzG0jkZ1uC+yH67D/mYvJ0vRtYBv6vLNZnQN5rh
 lsF+ZTSX4PkQQneVutZwIkM59OL6A9ALmdJbMV/E2fIKiRfxHbcRzHn0n78WLUHNuXvy
 MMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=ydkM02gA1lv2jXZ+vVnjGn/g5VzXdwCSm+r9ur1CJPs=;
 b=XpB7hbjs73swOnjKPIBK9rN6zoPXLw07rGiRzDCVmAct6OdDcZLXNmmpspaZAb8KxZ
 NPl8Q8/k3OOV4WzkCAWudGZk70vpEOwRRj6qtKqt4Ni8zyzOaX7hUGWrAhiNxx3cexVX
 sVJodeOvg/6CpqGsrcoznzG0od4LP0yc1E1hNKnPbHXhKYU0pFlVBEbkqhwXwtj6IVKT
 ixlT6tU5QJdftLGrYkxCU6fWsHz0lvuCPdhuZlpkjLhVpGPFuCxZTczvvI3t9Z4oC1za
 iRaZjLi76+h6DCScsnbBZLZYZ3IIFFJRC3Il4P/RHxuvmu+sW8Xxoj4kGmE1UyD31IgY
 foGw==
X-Gm-Message-State: ANhLgQ32R3owhe1MZXzDumAPLxKUYCTOn5Efr2igjkAh18XDJ2zmgFLb
 ZDdqmALeEASIPXmvpl/LW3uECw==
X-Google-Smtp-Source: ADFU+vvoBQmPUjD+nO2M86aMQl7VYth980jIKigj6jVHrMsul9eZMS8ExL6RHyTxp/EV9PKXlpRWrQ==
X-Received: by 2002:a37:6244:: with SMTP id w65mr2061863qkb.350.1584500480945; 
 Tue, 17 Mar 2020 20:01:20 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id i4sm3478217qtr.41.2020.03.17.20.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 20:01:20 -0700 (PDT)
Message-ID: <3ffd63b480b47aa572a9f95ba620eb4d0ce93f34.camel@massaru.org>
From: Vitor Massaru Iha <vitor@massaru.org>
To: Matthew Wilcox <willy@infradead.org>
Date: Wed, 18 Mar 2020 00:01:17 -0300
In-Reply-To: <20200318015553.GG22433@bombadil.infradead.org>
References: <cover.1584494902.git.vitor@massaru.org>
 <7efa62f727eb176341fc0cdfcd47c890ff424451.1584494902.git.vitor@massaru.org>
 <20200318015553.GG22433@bombadil.infradead.org>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 2/2] xarray: Add missing blank
	line after declaration
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

Hi Matthew,

On Tue, 2020-03-17 at 18:55 -0700, Matthew Wilcox wrote:
> On Tue, Mar 17, 2020 at 10:43:03PM -0300, Vitor Massaru Iha wrote:
> > @@ -1624,6 +1624,7 @@ static inline unsigned int
> > xas_find_chunk(struct xa_state *xas, bool advance,
> >  	if (XA_CHUNK_SIZE == BITS_PER_LONG) {
> >  		if (offset < XA_CHUNK_SIZE) {
> >  			unsigned long data = *addr & (~0UL << offset);
> > +
> >  			if (data)
> >  				return __ffs(data);
> >  		}
> 
> Do you seriously think this makes the function in any way more
> legible?

Sorry. I was in doubt whether it would actually improve. I did some
research in older patches and I found something like this.



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
