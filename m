Return-Path: <SRS0=UocX=PA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 436EDC433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Oct 2021 16:05:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEABF60F23
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Oct 2021 16:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DEABF60F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A872E40710;
	Tue, 12 Oct 2021 16:05:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kw9Iegxo4Jlu; Tue, 12 Oct 2021 16:05:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BD0EB40212;
	Tue, 12 Oct 2021 16:05:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3EB8C000F;
	Tue, 12 Oct 2021 16:05:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74B0DC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Oct 2021 16:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 558B7607E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Oct 2021 16:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IYDRuMy_y32o
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Oct 2021 16:05:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0DD460724
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Oct 2021 16:05:29 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id q5so6247917pgr.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Oct 2021 09:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mMOxU6+YA/sNdOBxrd9xR6DIR92SPqX/cAtPGdDmVKU=;
 b=bDwa7qIkxxY4j1mjJTPYMU69RjYrf7BqhXHN8j96S+Q1bdbHT0UGhaGhYsTUiJzcgW
 Q+h23U6lvfXttX1Xr5f4SLw+YP6GMI8ma5BcESwFQjnv19d5Pzkx+Nf0QYEODQ4eEgJM
 5eEeI8PtE9M6SItS3znLiYEW5weFDD26ChmXer5Ekg1TKqcfTRSTZYQ1a1pv4TQLck5V
 znNWK4tc3AIMqY1oL4iNthKN5YOrxIq7RNDXuI1p9eWy6AjxderpQclUoKUtMnKWpIT+
 XYfzMq2vtlyWT7YiLP0mG+SqRjbsaj9tPcfTahwelLVbv5cjqooIZZTyX26bKICf8NhH
 ZyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mMOxU6+YA/sNdOBxrd9xR6DIR92SPqX/cAtPGdDmVKU=;
 b=iGHVhnorvL0M7mCYLgKfuTEXLjxaDBfn2uUEmJvUEbIFRcKszGuwV7uG17FljM5eNy
 nAwZ8yt12Vl6uWzAp9dqK7o4ooVBK+dCxQlKxp0I13Y4dt4BlZkOPtgtd48h65Cjm9FM
 CFH088n7S/ybgI063fpPW/yifg2MC+6LtMG4vPtUvEpsgVEdUrj00iPpaKcGVW8TKYkz
 fIoe8N8E3NsuvnCDFlfS3MaY63gcV2Hrmq3qEBoyYG1gMkrjww8frbOFVxh3PQA84AnF
 8V84Nr6/RSnpeXNQz683pMXTnoURNM28YOBdm7rZ8/1ikRe3o5iREfN2Bwt9I1McQw/D
 QLrw==
X-Gm-Message-State: AOAM530rlGzwBbKW5zsXRaJjjx0Xmj2VwPuTRmt4EGAUDJDq55ItHvJT
 uUcexNrYaTNtO9l5M2PpzA0=
X-Google-Smtp-Source: ABdhPJw1IJ/QU67iU8+q118FcNosA5aecym8ZP3I99NBl9Ql4AcFwhi6Y+1cS+L7U0m4T9btUbxwfg==
X-Received: by 2002:a63:2b4b:: with SMTP id r72mr23056190pgr.57.1634054728858; 
 Tue, 12 Oct 2021 09:05:28 -0700 (PDT)
Received: from theprophet ([2406:7400:63:cada:3b09:6c3b:61f5:2cfd])
 by smtp.gmail.com with ESMTPSA id m186sm11857248pfb.165.2021.10.12.09.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:05:27 -0700 (PDT)
Date: Tue, 12 Oct 2021 21:35:13 +0530
From: Naveen Naidu <naveennaidu479@gmail.com>
To: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 16/22] PCI: pciehp: Use RESPONSE_IS_PCI_ERROR() to check
 read from hardware
Message-ID: <20211012160505.3dov6gjnmxdq5lz6@theprophet>
References: <cover.1633972263.git.naveennaidu479@gmail.com>
 <36c7c3005c4d86a6884b270807d84433a86c0953.1633972263.git.naveennaidu479@gmail.com>
 <20211011194740.GA14357@wunner.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211011194740.GA14357@wunner.de>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, bhelgaas@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On 11/10, Lukas Wunner wrote:
> On Mon, Oct 11, 2021 at 11:37:33PM +0530, Naveen Naidu wrote:
> > An MMIO read from a PCI device that doesn't exist or doesn't respond
> > causes a PCI error.  There's no real data to return to satisfy the
> > CPU read, so most hardware fabricates ~0 data.
> > 
> > Use RESPONSE_IS_PCI_ERROR() to check the response we get when we read
> > data from hardware.
> 
> Actually what happens is that PCI read transactions *time out*,
> so the host controller fabricates a response.
>

Ah! yes. Now that I look at it, RESPONSE_IS_PCI_TIMEOUT() does indeed
seem like a better option to RESPONSE_IS_PCI_ERROR(), since it's more
specfic and depicts the actual condition. 

I'll wait for sometime and see if others have any objection/a better
name for the macro and then redo the patch with that.

Thank you very much for the review ^^ 

> By contrast, a PCI *error* usually denotes an Uncorrectable or
> Correctable Error as specified in section 6.2.2 of the PCIe Base Spec.
> 
> Thus something like RESPONSE_IS_PCI_TIMEOUT() or IS_PCI_TIMEOUT() would
> probably be more appropriate.  I'll leave the exact bikeshed color for
> others to decide. :-)
> 
> 
> > Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> > ---
> >  drivers/pci/hotplug/pciehp_hpc.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> Acked-by: Lukas Wunner <lukas@wunner.de>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
