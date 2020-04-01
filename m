Return-Path: <SRS0=IV6d=5R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC851C2D0F2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Apr 2020 00:08:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACA4B2080C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Apr 2020 00:08:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="SkwqLLE+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACA4B2080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 88C2786E5C;
	Wed,  1 Apr 2020 00:08:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S0oLwjtWr9fM; Wed,  1 Apr 2020 00:08:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E75E886E34;
	Wed,  1 Apr 2020 00:08:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0120C1AE2;
	Wed,  1 Apr 2020 00:08:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38914C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 00:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 221BB20506
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 00:08:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sRuC-O3PdOxn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 00:08:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by silver.osuosl.org (Postfix) with ESMTPS id D0D5120413
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 00:08:39 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id a5so20148461qtw.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 17:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=2ZJH2bqoeAK0auR/UMe60BRQ+wnm6Zhq3FSNSqtWLpQ=;
 b=SkwqLLE+Fow7/6Cah0e/j95l9bMReiVaYR4axf2TUigtGS/eaMdShdCnE1kPmtW8xR
 /2az1sR0MrFLXdNwIqYBsyjiDUKNnfELPUgcNOobar7ZtpNdp71qiqvD1LrukFi0CpgA
 J5FAkULaIxv4Ug5J2eypaO5WiiHNqJrCiCqTH4dU1J+r6tnbMHtNkwd7fNCXvIIvklvt
 9KwDKFX3E7bH2UUTKBdZIx/lHXRCJ/+99lUGzjOaXf3lY5oyFAuqifMyjkfjPGhm8ukf
 n88tUjgzfiFmlrNd+in4y5NvLTdL+hVNEBxm7PoZTDrQ9zX6o87y87BT2HzzK8pOTv7n
 /nzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=2ZJH2bqoeAK0auR/UMe60BRQ+wnm6Zhq3FSNSqtWLpQ=;
 b=WN2oI0yrw6Tws+o5VTYikv1A91poLXs/j+h7l5CJA9yNyyu0hIz0m5DwLyItzYs+b9
 RTpr8Hjm6nM+lU4AhHd7YBhiBBquNOWwduIGa+sTv0eV9+nOtYTZH60xYsqgnaZDhs6d
 x0dVe61DoaTLXHBL9RFttK+bz9ckLV4D3k90SVVKs9I+fsSfxT519iXaGAwyfUr4yTVU
 FC1444WYaEjH4KBYuE5bmzlZHLdJQXgYAWCiNcceVFjDrE1fo809MYg49NGYyRwUQ1CN
 e4ze0zeLe8/jGO21bOqk3jLOOD6HjXZpJbjSYvLhsoA2az+jZV1nc/UN8Z4jmrcbsDm/
 cOQQ==
X-Gm-Message-State: ANhLgQ2UhOrJlbmNPusPw6D3MUnjzWMZKrGD6GLBWwxoJp2w/wHx09Ab
 4wO2f/noLe+f/Ld6axYAXwJKFw==
X-Google-Smtp-Source: ADFU+vt+sCovG6L+oIaQ3zQdeuF6yYCHLi+70BqvCcjee5mfo7yd78UD47UhE9xaOFer2GPikk3WbQ==
X-Received: by 2002:ac8:2921:: with SMTP id y30mr7807073qty.161.1585699718754; 
 Tue, 31 Mar 2020 17:08:38 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id b7sm383592qkc.61.2020.03.31.17.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 17:08:38 -0700 (PDT)
Message-ID: <6a307032bbd05a7405c5e6a6629071ae03f62a8c.camel@massaru.org>
From: Vitor Massaru Iha <vitor@massaru.org>
To: Matthew Wilcox <willy@infradead.org>
Date: Tue, 31 Mar 2020 21:08:35 -0300
In-Reply-To: <20200401000439.GE21484@bombadil.infradead.org>
References: <cover.1585693146.git.vitor@massaru.org>
 <637c0379a76fcf4eb6cdde0de3cc727203fd942f.1585693146.git.vitor@massaru.org>
 <20200401000439.GE21484@bombadil.infradead.org>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Cc: corbet@lwn.net, linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/2] Documentation: filesystems:
 Convert sysfs-pci to ReST
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

On Tue, 2020-03-31 at 17:04 -0700, Matthew Wilcox wrote:
> On Tue, Mar 31, 2020 at 07:28:56PM -0300, Vitor Massaru Iha wrote:
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > ---
> >  .../{sysfs-pci.txt => sysfs-pci.rst}          | 40 ++++++++++-----
> > ----
> >  1 file changed, 22 insertions(+), 18 deletions(-)
> >  rename Documentation/filesystems/{sysfs-pci.txt => sysfs-pci.rst}
> > (82%)
> > 
> > diff --git a/Documentation/filesystems/sysfs-pci.txt
> > b/Documentation/filesystems/sysfs-pci.rst
> 
> In addition to Jon's comments, for the next version, I would suggest
> cc'ing the linux-pci@vger.kernel.org mailing list.  
> 
> Also, maybe add:
> 
> F: Documentation/filesystems/sysfs-pci.rst
> 
> to the 'PCI SUBSYSTEM' section of MAINTAINERS.

Thanks Matthew.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
