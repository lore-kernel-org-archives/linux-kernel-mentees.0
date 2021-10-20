Return-Path: <SRS0=auPP=PI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B352C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Oct 2021 13:42:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1F3560273
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Oct 2021 13:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B1F3560273
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BDBD607C1;
	Wed, 20 Oct 2021 13:42:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qmt4vAs3SiHH; Wed, 20 Oct 2021 13:42:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 99618606B9;
	Wed, 20 Oct 2021 13:42:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78921C000F;
	Wed, 20 Oct 2021 13:42:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7EDDAC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 13:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B0C9401B1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 13:42:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hLbrn8aanZPW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 13:42:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7A0B400B9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 13:42:28 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id q129so9775894oib.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 06:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=C3zm8nKj/VABcyLNvlJFABEEbLCD2W5bXoiX6pdtUtw=;
 b=WuGefO0xS7erakhGUZ4lUi+2C5viiOVPhPsYwYzo6+qaoLwAYppp0sFCOV2jfzLTmU
 06hGEcuyizORS2PfFXJ54L3vmpg8PqsWpDN+t6YPV8HXR7Bw/s009R8uhki/+HQWZ/TY
 uXSOHaGyzJuY9koRrL4ZoOLUs0+N6QNuGrpKM9aXY7tDGl9mSSI+SdcD3jo84pOCiTod
 cl/rrOKDD3fMsnvuFcKw+sXhD1T4dIkSn1+OEYUZDHevPUX+jK/oVYVWrWUCz6CdWfex
 LPZ89ehXcdK/xzxiHMADV2NzYZt1hLaVd1ydlwd9XuYdphvooy7+VQTaRQ99odQsrKdK
 i5OA==
X-Gm-Message-State: AOAM532OYmaVPjNLH5DpZTepY8JVUmlzyFZIXAzZChC7ANpFv8CkHXaA
 kZmeOVnjhl4nU0dPRZMUqg==
X-Google-Smtp-Source: ABdhPJy8z4v0lJpsQMD8Slg1JZ9MvgPFDcFKsDrCYO60tYePf2Ras0QIpJseUJhBtzS/Z/i4z8BVYQ==
X-Received: by 2002:aca:3c87:: with SMTP id j129mr9607754oia.157.1634737347723; 
 Wed, 20 Oct 2021 06:42:27 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id k4sm436183oic.48.2021.10.20.06.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 06:42:27 -0700 (PDT)
Received: (nullmailer pid 2248211 invoked by uid 1000);
 Wed, 20 Oct 2021 13:42:26 -0000
Date: Wed, 20 Oct 2021 08:42:26 -0500
From: Rob Herring <robh@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH v2 04/24] PCI: Remove redundant error fabrication when
 device read fails
Message-ID: <YXAcws0S2xBvjsDb@robh.at.kernel.org>
References: <cover.1634306198.git.naveennaidu479@gmail.com>
 <0114a4a44ceacfbd6a7859d8613ca5942f5b35d7.1634306198.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0114a4a44ceacfbd6a7859d8613ca5942f5b35d7.1634306198.git.naveennaidu479@gmail.com>
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

On Fri, Oct 15, 2021 at 08:08:45PM +0530, Naveen Naidu wrote:
> An MMIO read from a PCI device that doesn't exist or doesn't respond
> causes a PCI error. There's no real data to return to satisfy the
> CPU read, so most hardware fabricates ~0 data.
> 
> The host controller drivers sets the error response values (~0) and
> returns an error when faulty hardware read occurs. But the error
> response value (~0) is already being set in PCI_OP_READ and
> PCI_USER_READ_CONFIG whenever a read by host controller driver fails.
> 
> Thus, it's no longer necessary for the host controller drivers to
> fabricate any error response.
> 
> This helps unify PCI error response checking and make error check
> consistent and easier to find.
> 
> Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> ---
>  drivers/pci/access.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
