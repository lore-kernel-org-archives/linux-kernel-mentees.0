Return-Path: <SRS0=IxsT=CZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF4EC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 06:21:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EB7D221E3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 06:21:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DujFdqAh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EB7D221E3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id ADE3E85754;
	Wed, 16 Sep 2020 06:21:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hnSJYWhIWJ9d; Wed, 16 Sep 2020 06:21:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3C5DE85740;
	Wed, 16 Sep 2020 06:21:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28F31C0859;
	Wed, 16 Sep 2020 06:21:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 10757C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 06:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 04B582342E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 06:21:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KMiB0FU+--IR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 06:21:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 2AD9520010
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 06:21:53 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1419A2067C;
 Wed, 16 Sep 2020 06:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600237312;
 bh=uJRg3V5jemoM77QzifyzTeMiwLxju00kO9REccN1WMY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DujFdqAhT1OQ3IRITXYlfsxdYOZL2VkULfVuEtbvzYXPW/m7rri6WMT2RUJjzFf6b
 eTQtttNQmPq5MX9cyCYupPwWkn9T5Q1EBSBt/mh82kezqtg+pW35+r9TK/Egnxy1F3
 x/tXW4WOzOHx+Yx7GuP8z3svgmc6aeMtJvg315zo=
Date: Wed, 16 Sep 2020 08:22:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <20200916062227.GD142621@kroah.com>
References: <20200916050540.15290-1-anant.thazhemadam@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916050540.15290-1-anant.thazhemadam@gmail.com>
Cc: Petko Manolov <petkan@nucleusys.com>,
 syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH] rtl8150: set memory to all 0xFFs
 on failed register reads
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

On Wed, Sep 16, 2020 at 10:35:40AM +0530, Anant Thazhemadam wrote:
> get_registers() copies whatever memory is written by the
> usb_control_msg() call even if the underlying urb call ends up failing.
> 
> If get_registers() fails, or ends up reading 0 bytes, meaningless and 
> junk register values would end up being copied over (and eventually read 
> by the driver), and since most of the callers of get_registers() don't 
> check the return values of get_registers() either, this would go unnoticed.
> 
> It might be a better idea to try and mirror the PCI master abort
> termination and set memory to 0xFFs instead in such cases.

It would be better to use this new api call instead of
usb_control_msg():
	https://lore.kernel.org/r/20200914153756.3412156-1-gregkh@linuxfoundation.org

How about porting this patch to run on top of that series instead?  That
should make this logic much simpler.



> 
> Fixes: https://syzkaller.appspot.com/bug?extid=abbc768b560c84d92fd3
> Reported-by: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com
> Tested-by: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com
> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> ---
>  drivers/net/usb/rtl8150.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
> index 733f120c852b..04fca7bfcbcb 100644
> --- a/drivers/net/usb/rtl8150.c
> +++ b/drivers/net/usb/rtl8150.c
> @@ -162,8 +162,13 @@ static int get_registers(rtl8150_t * dev, u16 indx, u16 size, void *data)
>  	ret = usb_control_msg(dev->udev, usb_rcvctrlpipe(dev->udev, 0),
>  			      RTL8150_REQ_GET_REGS, RTL8150_REQT_READ,
>  			      indx, 0, buf, size, 500);
> -	if (ret > 0 && ret <= size)
> +
> +	if (ret < 0)
> +		memset(data, 0xff, size);
> +
> +	else
>  		memcpy(data, buf, ret);
> +
>  	kfree(buf);
>  	return ret;
>  }
> @@ -276,7 +281,7 @@ static int write_mii_word(rtl8150_t * dev, u8 phy, __u8 indx, u16 reg)
>  
>  static inline void set_ethernet_addr(rtl8150_t * dev)
>  {
> -	u8 node_id[6];
> +	u8 node_id[6] = {0};

This should not be needed to be done.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
