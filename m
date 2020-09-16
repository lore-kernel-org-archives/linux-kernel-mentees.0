Return-Path: <SRS0=IxsT=CZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9742DC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 07:02:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 087F121655
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 07:02:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nucleusys.com header.i=@nucleusys.com header.b="GjClFFip"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 087F121655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nucleusys.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B326C86A11;
	Wed, 16 Sep 2020 07:02:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mXxbMU7XZFUv; Wed, 16 Sep 2020 07:02:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1831E86A14;
	Wed, 16 Sep 2020 07:02:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07956C0859;
	Wed, 16 Sep 2020 07:02:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3130EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 07:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1FE1187361
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 07:02:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Amavis-Alert: BAD HEADER SECTION, Improper folded header field made up
 entirely of whitespace (char 20 hex): X-Spam-Report: ...that system
 for details.\n \n Content previ[...]
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XX-GXhpGhXHk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 07:02:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from zztop.nucleusys.com (lan.nucleusys.com [92.247.61.126])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9892887346
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 07:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=nucleusys.com; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8fk+I4ZemBY5OogXFdLgsK51XfiRHsT4RBnrN+8HFMs=; b=GjClFFipRMYmH+d63qEmRBuFZk
 tbSOhuRA3TDineS+sjSW56nDqjshXWGsvcDP7vVm93n+woR2YO9knE+1tCYpthCNoAoMySrQDJ15H
 UGW0yStPQHrGcI6Z46aIBOKaZd9vaDN5eAKF15c9OL9kuxkUX4XqF4zKwnEytCz3OKwU=;
Received: from 78-83-68-78.spectrumnet.bg ([78.83.68.78] helo=p310)
 by zztop.nucleusys.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <petkan@nucleusys.com>)
 id 1kIQnC-00058i-Qu; Wed, 16 Sep 2020 09:19:47 +0300
Date: Wed, 16 Sep 2020 09:19:46 +0300
From: Petko Manolov <petkan@nucleusys.com>
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <20200916061946.GA38262@p310>
References: <20200916050540.15290-1-anant.thazhemadam@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916050540.15290-1-anant.thazhemadam@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
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

On 20-09-16 10:35:40, Anant Thazhemadam wrote:
> get_registers() copies whatever memory is written by the
> usb_control_msg() call even if the underlying urb call ends up failing.

Not true, memcpy() is only called if "ret" is positive.

> If get_registers() fails, or ends up reading 0 bytes, meaningless and junk 
> register values would end up being copied over (and eventually read by the 
> driver), and since most of the callers of get_registers() don't check the 
> return values of get_registers() either, this would go unnoticed.

usb_control_msg() returns negative on error (look up usb_internal_control_msg() 
to see for yourself) so it does not go unnoticed.  If for some reason it return 
zero, nothing is copied.  Also, if usb transfer fail no register values are 
being copied anywhere.

Your patch also allows for memcpy() to be called with 'size' either zero or 
greater than the allocated buffer size. Please, look at the code carefully.

> It might be a better idea to try and mirror the PCI master abort
> termination and set memory to 0xFFs instead in such cases.

I wasn't aware drivers are now responsible for filling up the memory with 
anything.  Does not sound like a good idea to me.

> Fixes: https://syzkaller.appspot.com/bug?extid=abbc768b560c84d92fd3
> Reported-by: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com
> Tested-by: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com
> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>

Well, NACK from me.


cheers,
Petko


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
>  
>  	get_registers(dev, IDR, sizeof(node_id), node_id);
>  	memcpy(dev->netdev->dev_addr, node_id, sizeof(node_id));
> -- 
> 2.25.1
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
