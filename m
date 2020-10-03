Return-Path: <SRS0=1t5V=DK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334B2C41604
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 19:38:34 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCB95206C1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 19:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCB95206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6416584B8B;
	Sat,  3 Oct 2020 19:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4kQ1IBxJsVOX; Sat,  3 Oct 2020 19:38:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8428A84AF1;
	Sat,  3 Oct 2020 19:38:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B01BC0891;
	Sat,  3 Oct 2020 19:38:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B097CC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 19:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9B8708712C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 19:38:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UTz2Zinfu+eP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 19:38:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0067.hostedemail.com
 [216.40.44.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F34148712B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 19:38:28 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave02.hostedemail.com (Postfix) with ESMTP id C46151800B443
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 19:38:27 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 211BE100E7B42;
 Sat,  3 Oct 2020 19:38:25 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: join71_03142d2271af
X-Filterd-Recvd-Size: 2101
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf14.hostedemail.com (Postfix) with ESMTPA;
 Sat,  3 Oct 2020 19:38:23 +0000 (UTC)
Message-ID: <dbe67fce55c6bbe569cefdc1a01708a0d01b140a.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Date: Sat, 03 Oct 2020 12:38:22 -0700
In-Reply-To: <20201001073221.239618-1-anant.thazhemadam@gmail.com>
References: <20201001073221.239618-1-anant.thazhemadam@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: Petko Manolov <petkan@nucleusys.com>,
 syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] net: usb: rtl8150: prevent
 set_ethernet_addr from setting uninit address
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

On Thu, 2020-10-01 at 13:02 +0530, Anant Thazhemadam wrote:
> When get_registers() fails (which happens when usb_control_msg() fails)
> in set_ethernet_addr(), the uninitialized value of node_id gets copied
> as the address.

unrelated trivia:

> diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
[]
> @@ -274,12 +274,17 @@ static int write_mii_word(rtl8150_t * dev, u8 phy, __u8 indx, u16 reg)
>  		return 1;
>  }
>  
> -static inline void set_ethernet_addr(rtl8150_t * dev)
> +static bool set_ethernet_addr(rtl8150_t *dev)
>  {
>  	u8 node_id[6];

This might be better as:

	u8 node_id[ETH_ALEN];

> +	int ret;
>  
> -	get_registers(dev, IDR, sizeof(node_id), node_id);
> -	memcpy(dev->netdev->dev_addr, node_id, sizeof(node_id));
> +	ret = get_registers(dev, IDR, sizeof(node_id), node_id);
> +	if (ret == sizeof(node_id)) {
> +		memcpy(dev->netdev->dev_addr, node_id, sizeof(node_id));

and
		ether_addr_copy(dev->netdev->dev_addr, node_id);


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
