Return-Path: <SRS0=Swos=DS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF4DC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 19:31:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F8902083B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 19:31:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nucleusys.com header.i=@nucleusys.com header.b="nPqyL0SK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F8902083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nucleusys.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 367F685BE4;
	Sun, 11 Oct 2020 19:31:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hh6VqamDJyeD; Sun, 11 Oct 2020 19:31:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7646785B73;
	Sun, 11 Oct 2020 19:31:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6963AC07FF;
	Sun, 11 Oct 2020 19:31:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 385A5C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 19:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 26AA685BB5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 19:31:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Amavis-Alert: BAD HEADER SECTION, Improper folded header field made up
 entirely of whitespace (char 20 hex): X-Spam-Report: ...that system
 for details.\n \n Content previ[...]
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9DyhtuHJsY8K
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 19:31:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from zztop.nucleusys.com (lan.nucleusys.com [92.247.61.126])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 786BB85B73
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 19:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=nucleusys.com; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lfk8Bx8ZAaoT2rdzuE84wdKCTPTT1fgZZGAXDO2auPE=; b=nPqyL0SK9P/XrtyKOaMoUKTbsZ
 xRYgVjG8lNxwEy1FVQuILLK6LVFkNT/94RWWgrAA/k77UvxU3yrKlBY9HOozL6Qf5vZF6+nFO0Pce
 KyKp6tbXGyNRzOl/OpmTfvS/Bw+c79ZjIMEqJyenZ8b5RTfuh1hNzw75fV1Cxn1Da/pU=;
Received: from 78-83-68-78.spectrumnet.bg ([78.83.68.78] helo=p310)
 by zztop.nucleusys.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <petkan@nucleusys.com>)
 id 1kRh3v-0007ru-He; Sun, 11 Oct 2020 22:31:19 +0300
Date: Sun, 11 Oct 2020 22:31:19 +0300
From: Petko Manolov <petkan@nucleusys.com>
To: Joe Perches <joe@perches.com>
Message-ID: <20201011193119.GA4061@p310>
References: <20201010064459.6563-1-anant.thazhemadam@gmail.com>
 <20201011173030.141582-1-anant.thazhemadam@gmail.com>
 <20201011105934.5c988cd3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <6307397bd43636fea2e7341d24417cbbc3aaf922.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6307397bd43636fea2e7341d24417cbbc3aaf922.camel@perches.com>
Cc: sfr@canb.auug.org.au, Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH v2] net: usb: rtl8150: don't
 incorrectly assign random MAC addresses
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

On 20-10-11 11:33:00, Joe Perches wrote:
> On Sun, 2020-10-11 at 10:59 -0700, Jakub Kicinski wrote:
> > On Sun, 11 Oct 2020 23:00:30 +0530 Anant Thazhemadam wrote:
> > > In set_ethernet_addr(), if get_registers() succeeds, the ethernet address
> > > that was read must be copied over. Otherwise, a random ethernet address
> > > must be assigned.
> > > 
> > > get_registers() returns 0 if successful, and negative error number
> > > otherwise. However, in set_ethernet_addr(), this return value is
> > > incorrectly checked.
> > > 
> > > Since this return value will never be equal to sizeof(node_id), a
> > > random MAC address will always be generated and assigned to the
> > > device; even in cases when get_registers() is successful.
> > > 
> > > Correctly modifying the condition that checks if get_registers() was
> > > successful or not fixes this problem, and copies the ethernet address
> > > appropriately.
> 
> There are many unchecked uses of set_registers and get_registers
>  in this file.
> 
> If failures are really expected, then it might be better to fix
> them up too.

Checking the return value of each get/set_registers() is going to be a PITA and
not very helpful.  Doing so when setting the MAC address _does_ make sense as in
that case it is not a hard error.

In almost all other occasions if usb_control_msg_send/recv() return an error i'd
rather dump an error message (from within get/set_registers()) and let the user
decide whether to get rid of this adapter or start debugging it.


cheers,
Petko


> $ git grep -w '[gs]et_registers' drivers/net/usb/rtl8150.c
> drivers/net/usb/rtl8150.c:static int get_registers(rtl8150_t * dev, u16 indx, u16 size, void *data)
> drivers/net/usb/rtl8150.c:static int set_registers(rtl8150_t * dev, u16 indx, u16 size, const void *data)
> drivers/net/usb/rtl8150.c:      set_registers(dev, PHYADD, sizeof(data), data);
> drivers/net/usb/rtl8150.c:      set_registers(dev, PHYCNT, 1, &tmp);
> drivers/net/usb/rtl8150.c:              get_registers(dev, PHYCNT, 1, data);
> drivers/net/usb/rtl8150.c:              get_registers(dev, PHYDAT, 2, data);
> drivers/net/usb/rtl8150.c:      set_registers(dev, PHYADD, sizeof(data), data);
> drivers/net/usb/rtl8150.c:      set_registers(dev, PHYCNT, 1, &tmp);
> drivers/net/usb/rtl8150.c:              get_registers(dev, PHYCNT, 1, data);
> drivers/net/usb/rtl8150.c:      ret = get_registers(dev, IDR, sizeof(node_id), node_id);
> drivers/net/usb/rtl8150.c:      set_registers(dev, IDR, netdev->addr_len, netdev->dev_addr);
> drivers/net/usb/rtl8150.c:      get_registers(dev, CR, 1, &cr);
> drivers/net/usb/rtl8150.c:      set_registers(dev, CR, 1, &cr);
> drivers/net/usb/rtl8150.c:              set_registers(dev, IDR_EEPROM + (i * 2), 2,
> drivers/net/usb/rtl8150.c:      set_registers(dev, CR, 1, &cr);
> drivers/net/usb/rtl8150.c:      set_registers(dev, CR, 1, &data);
> drivers/net/usb/rtl8150.c:              get_registers(dev, CR, 1, &data);
> drivers/net/usb/rtl8150.c:      set_registers(dev, RCR, 1, &rcr);
> drivers/net/usb/rtl8150.c:      set_registers(dev, TCR, 1, &tcr);
> drivers/net/usb/rtl8150.c:      set_registers(dev, CR, 1, &cr);
> drivers/net/usb/rtl8150.c:      get_registers(dev, MSR, 1, &msr);
> drivers/net/usb/rtl8150.c:      get_registers(dev, CR, 1, &cr);
> drivers/net/usb/rtl8150.c:      set_registers(dev, CR, 1, &cr);
> drivers/net/usb/rtl8150.c:      get_registers(dev, CSCR, 2, &tmp);
> drivers/net/usb/rtl8150.c:      set_registers(dev, IDR, 6, netdev->dev_addr);
> drivers/net/usb/rtl8150.c:      get_registers(dev, BMCR, 2, &bmcr);
> drivers/net/usb/rtl8150.c:      get_registers(dev, ANLP, 2, &lpa);
> 
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
