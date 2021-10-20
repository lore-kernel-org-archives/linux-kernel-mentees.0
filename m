Return-Path: <SRS0=auPP=PI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76DDC433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Oct 2021 15:16:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BA8F61354
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Oct 2021 15:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7BA8F61354
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EAC140581;
	Wed, 20 Oct 2021 15:16:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h-XnjfAe3cZP; Wed, 20 Oct 2021 15:16:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CCDBA4057F;
	Wed, 20 Oct 2021 15:16:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5674BC0025;
	Wed, 20 Oct 2021 15:16:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4C90C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 15:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1AC2607F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 15:16:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nn1YvVcwxKES
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 15:16:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 132E160626
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 15:16:02 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id w17so4525389plg.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 08:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qujnYD+rLkj+9g54TdtVOcj/8gkq3w+B28YjXt9K1II=;
 b=ba3u1RjC7hi3s88Z6bQBlnlILlK6xxeLTntjfPO9o2PRP3bWxtBrsykTIwA0FLiq4q
 +aPIp4LAtTb6R4FcsK3ZzZZrkjrsBCPl6JQcbwqJFUIxjJ9H195GopRl0NIi8RkSGuKn
 l3Bzk8nLcO/cw8EQSu11WIwKaAGdW4XtBJb4jxacifgL5vaTpKozRnidcGjPVLzQKNPM
 3E/DzwEU2sdxz2PdbLObuWJgWdHkCjcbJcHQ/IzAlswSIlUuOTr0BmqfE4hc3XpVMkbx
 QwhUjpZN5Xk4oqH6i684JYrtsFnriJyjL8Ok4RApstA7nQLQiiP/e6W56fmI5ulz5zxH
 T30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qujnYD+rLkj+9g54TdtVOcj/8gkq3w+B28YjXt9K1II=;
 b=HThYLzMvOGNwCPzlKyAXp7MXBNsF0oj3vRTVpI7lkAIRV3YrGWnqIClYJbALlCjb3r
 UqkYHQQxL0IZ2B1KeMzfM3s7ZvAJ+l1WzTlviVSca9gtdUySEiNQ0SeAPt51//N0O+FS
 T3VQodO8TA3eKSlWGJ0el/V1oqYGpqS4f/1PMjxU7NMiv+T0OFuURaIrA1Z7YIqEecl9
 2tvByZRHXDaJ8IPF+BRRjXVp64TtDBpnyre0qbGI/Q7tE57shxtOzkgyIRUUA/LeNq7+
 B4LcIfYuU/Q7ZXirPGDjc0avsOdwAfq5A0h+nFiw0yu8XYZ58O6Obkvzkd9iRwXBq19U
 Xz0w==
X-Gm-Message-State: AOAM532Z4SqRuU8QQT/Wzuz9F6N1AGIvz9FJ6lsXFvDunRv0Xg0HFAnb
 SeK2NyVWhJITqSiLey9q4U8=
X-Google-Smtp-Source: ABdhPJxMAuvyCWcSo+MFcFg8rTFeQqiVAVJiHhQX9Ni7BFVFrJmsTRJ4fAbQ1JXsU1nW5giYZhcIEQ==
X-Received: by 2002:a17:903:246:b0:13f:75bb:cabd with SMTP id
 j6-20020a170903024600b0013f75bbcabdmr27628plh.30.1634742962312; 
 Wed, 20 Oct 2021 08:16:02 -0700 (PDT)
Received: from theprophet ([2406:7400:63:46e9:439a:b490:ed63:26a1])
 by smtp.gmail.com with ESMTPSA id lb9sm320108pjb.25.2021.10.20.08.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 08:16:01 -0700 (PDT)
Date: Wed, 20 Oct 2021 20:45:53 +0530
From: Naveen Naidu <naveennaidu479@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 03/24] PCI: Unify PCI error response checking
Message-ID: <20211020151553.4pu7ib6uo6pk6sr4@theprophet>
References: <cover.1634306198.git.naveennaidu479@gmail.com>
 <da939a6cdb2dea96d16392ae152e1232212877d1.1634306198.git.naveennaidu479@gmail.com>
 <YXAV4bGehjAKK8XO@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YXAV4bGehjAKK8XO@robh.at.kernel.org>
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

On 20/10, Rob Herring wrote:
> On Fri, Oct 15, 2021 at 08:08:44PM +0530, Naveen Naidu wrote:
> > An MMIO read from a PCI device that doesn't exist or doesn't respond
> > causes a PCI error.  There's no real data to return to satisfy the
> > CPU read, so most hardware fabricates ~0 data.
> > 
> > Use SET_PCI_ERROR_RESPONSE() to set the error response and
> > RESPONSE_IS_PCI_ERROR() to check the error response during hardware
> > read.
> > 
> > These definitions make error checks consistent and easier to find.
> > 
> > Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> > ---
> >  drivers/pci/access.c | 18 +++++++++---------
> >  1 file changed, 9 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/pci/access.c b/drivers/pci/access.c
> > index b3b2006ed1d2..03712866c818 100644
> > --- a/drivers/pci/access.c
> > +++ b/drivers/pci/access.c
> > @@ -417,10 +417,10 @@ int pcie_capability_read_word(struct pci_dev *dev, int pos, u16 *val)
> >  		ret = pci_read_config_word(dev, pci_pcie_cap(dev) + pos, val);
> >  		/*
> >  		 * Reset *val to 0 if pci_read_config_word() fails, it may
> > -		 * have been written as 0xFFFF if hardware error happens
> > -		 * during pci_read_config_word().
> > +		 * have been written as 0xFFFF (PCI_ERROR_RESPONSE) if hardware error
> > +		 * happens during pci_read_config_word().
> >  		 */
> > -		if (ret)
> > +		if (RESPONSE_IS_PCI_ERROR(val))
> 
> What if there is no error (in ret) and the register value was actually 
> ~0? We'd be corrupting the value.
> 
> In general, I think we should rely more on the error codes and less on 
> the ~0 value.
> 

Thank you for the review. I'll fix this up when I send v3 for this patch
series.

> >  			*val = 0;
> >  		return ret;
> >  	}
> > @@ -452,10 +452,10 @@ int pcie_capability_read_dword(struct pci_dev *dev, int pos, u32 *val)
> >  		ret = pci_read_config_dword(dev, pci_pcie_cap(dev) + pos, val);
> >  		/*
> >  		 * Reset *val to 0 if pci_read_config_dword() fails, it may
> > -		 * have been written as 0xFFFFFFFF if hardware error happens
> > -		 * during pci_read_config_dword().
> > +		 * have been written as 0xFFFFFFFF (PCI_ERROR_RESPONSE) if hardware
> > +		 * error happens during pci_read_config_dword().
> >  		 */
> > -		if (ret)
> > +		if (RESPONSE_IS_PCI_ERROR(val))
> >  			*val = 0;
> >  		return ret;
> >  	}
> > @@ -529,7 +529,7 @@ EXPORT_SYMBOL(pcie_capability_clear_and_set_dword);
> >  int pci_read_config_byte(const struct pci_dev *dev, int where, u8 *val)
> >  {
> >  	if (pci_dev_is_disconnected(dev)) {
> > -		*val = ~0;
> > +		SET_PCI_ERROR_RESPONSE(val);
> >  		return PCIBIOS_DEVICE_NOT_FOUND;
> >  	}
> >  	return pci_bus_read_config_byte(dev->bus, dev->devfn, where, val);
> > @@ -539,7 +539,7 @@ EXPORT_SYMBOL(pci_read_config_byte);
> >  int pci_read_config_word(const struct pci_dev *dev, int where, u16 *val)
> >  {
> >  	if (pci_dev_is_disconnected(dev)) {
> > -		*val = ~0;
> > +		SET_PCI_ERROR_RESPONSE(val);
> >  		return PCIBIOS_DEVICE_NOT_FOUND;
> >  	}
> >  	return pci_bus_read_config_word(dev->bus, dev->devfn, where, val);
> > @@ -550,7 +550,7 @@ int pci_read_config_dword(const struct pci_dev *dev, int where,
> >  					u32 *val)
> >  {
> >  	if (pci_dev_is_disconnected(dev)) {
> > -		*val = ~0;
> > +		SET_PCI_ERROR_RESPONSE(val);
> >  		return PCIBIOS_DEVICE_NOT_FOUND;
> >  	}
> >  	return pci_bus_read_config_dword(dev->bus, dev->devfn, where, val);
> > -- 
> > 2.25.1
> > 
> > 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
