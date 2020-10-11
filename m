Return-Path: <SRS0=Swos=DS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49749C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 18:33:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFFC02145D
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 18:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFFC02145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5E4C8204D8;
	Sun, 11 Oct 2020 18:33:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rrY5biXXqinl; Sun, 11 Oct 2020 18:33:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 65EF4204C2;
	Sun, 11 Oct 2020 18:33:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B59CC0052;
	Sun, 11 Oct 2020 18:33:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA8AFC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 18:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B26D185B99
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 18:33:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id We9yfjlJYSxM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 18:33:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0206.hostedemail.com
 [216.40.44.206])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BA5AA85008
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 18:33:04 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 72AC518224D6B;
 Sun, 11 Oct 2020 18:33:03 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: smell48_4f01435271f4
X-Filterd-Recvd-Size: 4300
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf04.hostedemail.com (Postfix) with ESMTPA;
 Sun, 11 Oct 2020 18:33:01 +0000 (UTC)
Message-ID: <6307397bd43636fea2e7341d24417cbbc3aaf922.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Jakub Kicinski <kuba@kernel.org>, Anant Thazhemadam
 <anant.thazhemadam@gmail.com>
Date: Sun, 11 Oct 2020 11:33:00 -0700
In-Reply-To: <20201011105934.5c988cd3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20201010064459.6563-1-anant.thazhemadam@gmail.com>
 <20201011173030.141582-1-anant.thazhemadam@gmail.com>
 <20201011105934.5c988cd3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: sfr@canb.auug.org.au, petkan@nucleusys.com, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net
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

On Sun, 2020-10-11 at 10:59 -0700, Jakub Kicinski wrote:
> On Sun, 11 Oct 2020 23:00:30 +0530 Anant Thazhemadam wrote:
> > In set_ethernet_addr(), if get_registers() succeeds, the ethernet address
> > that was read must be copied over. Otherwise, a random ethernet address
> > must be assigned.
> > 
> > get_registers() returns 0 if successful, and negative error number
> > otherwise. However, in set_ethernet_addr(), this return value is
> > incorrectly checked.
> > 
> > Since this return value will never be equal to sizeof(node_id), a
> > random MAC address will always be generated and assigned to the
> > device; even in cases when get_registers() is successful.
> > 
> > Correctly modifying the condition that checks if get_registers() was
> > successful or not fixes this problem, and copies the ethernet address
> > appropriately.

There are many unchecked uses of set_registers and get_registers
 in this file.

If failures are really expected, then it might be better to fix
them up too.

$ git grep -w '[gs]et_registers' drivers/net/usb/rtl8150.c
drivers/net/usb/rtl8150.c:static int get_registers(rtl8150_t * dev, u16 indx, u16 size, void *data)
drivers/net/usb/rtl8150.c:static int set_registers(rtl8150_t * dev, u16 indx, u16 size, const void *data)
drivers/net/usb/rtl8150.c:      set_registers(dev, PHYADD, sizeof(data), data);
drivers/net/usb/rtl8150.c:      set_registers(dev, PHYCNT, 1, &tmp);
drivers/net/usb/rtl8150.c:              get_registers(dev, PHYCNT, 1, data);
drivers/net/usb/rtl8150.c:              get_registers(dev, PHYDAT, 2, data);
drivers/net/usb/rtl8150.c:      set_registers(dev, PHYADD, sizeof(data), data);
drivers/net/usb/rtl8150.c:      set_registers(dev, PHYCNT, 1, &tmp);
drivers/net/usb/rtl8150.c:              get_registers(dev, PHYCNT, 1, data);
drivers/net/usb/rtl8150.c:      ret = get_registers(dev, IDR, sizeof(node_id), node_id);
drivers/net/usb/rtl8150.c:      set_registers(dev, IDR, netdev->addr_len, netdev->dev_addr);
drivers/net/usb/rtl8150.c:      get_registers(dev, CR, 1, &cr);
drivers/net/usb/rtl8150.c:      set_registers(dev, CR, 1, &cr);
drivers/net/usb/rtl8150.c:              set_registers(dev, IDR_EEPROM + (i * 2), 2,
drivers/net/usb/rtl8150.c:      set_registers(dev, CR, 1, &cr);
drivers/net/usb/rtl8150.c:      set_registers(dev, CR, 1, &data);
drivers/net/usb/rtl8150.c:              get_registers(dev, CR, 1, &data);
drivers/net/usb/rtl8150.c:      set_registers(dev, RCR, 1, &rcr);
drivers/net/usb/rtl8150.c:      set_registers(dev, TCR, 1, &tcr);
drivers/net/usb/rtl8150.c:      set_registers(dev, CR, 1, &cr);
drivers/net/usb/rtl8150.c:      get_registers(dev, MSR, 1, &msr);
drivers/net/usb/rtl8150.c:      get_registers(dev, CR, 1, &cr);
drivers/net/usb/rtl8150.c:      set_registers(dev, CR, 1, &cr);
drivers/net/usb/rtl8150.c:      get_registers(dev, CSCR, 2, &tmp);
drivers/net/usb/rtl8150.c:      set_registers(dev, IDR, 6, netdev->dev_addr);
drivers/net/usb/rtl8150.c:      get_registers(dev, BMCR, 2, &bmcr);
drivers/net/usb/rtl8150.c:      get_registers(dev, ANLP, 2, &lpa);


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
