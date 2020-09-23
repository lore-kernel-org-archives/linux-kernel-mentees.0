Return-Path: <SRS0=Dbq6=DA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63795C47420
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 10:23:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0404723787
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 10:23:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.b="rUuUIJ0j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0404723787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A42CF86F8D;
	Wed, 23 Sep 2020 10:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KXsi-nC64c6T; Wed, 23 Sep 2020 10:23:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0DE2086FAD;
	Wed, 23 Sep 2020 10:23:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EFAF3C0859;
	Wed, 23 Sep 2020 10:23:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66D53C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 55BF886053
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:22:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WQYqu7XMKfSN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:22:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 870BA84820
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:22:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600856577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jbE3xqWmrav8NliPhuXnwoHoxrt72ZS1tqSJlMbrbqs=;
 b=rUuUIJ0j6ln/3DCMxMrtfIeELX/iS75yliSp+iYcNLunbappoz/0BURyQiFr1m7mjZq7WL
 xDiiqnO3Kz9T5khtGzgVo7s9tFvcvmbLWu0IBTMncSxWcCxcAtMNSNwaIsax54twjDHMs2
 nUgOTeGhu7fNiGKZdzBacZ6kxIggVyo=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 504AFB009;
 Wed, 23 Sep 2020 10:23:34 +0000 (UTC)
Message-ID: <1600856557.26851.6.camel@suse.com>
From: Oliver Neukum <oneukum@suse.com>
To: Himadri Pandya <himadrispandya@gmail.com>, davem@davemloft.net, 
 kuba@kernel.org, pankaj.laxminarayan.bharadiya@intel.com,
 keescook@chromium.org,  yuehaibing@huawei.com, petkan@nucleusys.com,
 ogiannou@gmail.com
Date: Wed, 23 Sep 2020 12:22:37 +0200
In-Reply-To: <20200923090519.361-4-himadrispandya@gmail.com>
References: <20200923090519.361-1-himadrispandya@gmail.com>
 <20200923090519.361-4-himadrispandya@gmail.com>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 3/4] net: usb: rtl8150: use
 usb_control_msg_recv() and usb_control_msg_send()
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

Am Mittwoch, den 23.09.2020, 14:35 +0530 schrieb Himadri Pandya:

Hi,

> Many usage of usb_control_msg() do not have proper error check on return
> value leaving scope for bugs on short reads. New usb_control_msg_recv()
> and usb_control_msg_send() nicely wraps usb_control_msg() with proper
> error check. Hence use the wrappers instead of calling usb_control_msg()
> directly.
> 
> Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
Nacked-by: Oliver Neukum <oneukum@suse.com>

> ---
>  drivers/net/usb/rtl8150.c | 32 ++++++--------------------------
>  1 file changed, 6 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
> index 733f120c852b..e3002b675921 100644
> --- a/drivers/net/usb/rtl8150.c
> +++ b/drivers/net/usb/rtl8150.c
> @@ -152,36 +152,16 @@ static const char driver_name [] = "rtl8150";
>  */
>  static int get_registers(rtl8150_t * dev, u16 indx, u16 size, void *data)
>  {
> -	void *buf;
> -	int ret;
> -
> -	buf = kmalloc(size, GFP_NOIO);

GFP_NOIO is used here for a reason. You need to use this helper
while in contexts of error recovery and runtime PM.

> -	if (!buf)
> -		return -ENOMEM;
> -
> -	ret = usb_control_msg(dev->udev, usb_rcvctrlpipe(dev->udev, 0),
> -			      RTL8150_REQ_GET_REGS, RTL8150_REQT_READ,
> -			      indx, 0, buf, size, 500);
> -	if (ret > 0 && ret <= size)
> -		memcpy(data, buf, ret);
> -	kfree(buf);
> -	return ret;
> +	return usb_control_msg_recv(dev->udev, 0, RTL8150_REQ_GET_REGS,
> +				    RTL8150_REQT_READ, indx, 0, data,
> +				    size, 500);

This internally uses kmemdup() with GFP_KERNEL.
You cannot make this change. The API does not support it.
I am afraid we will have to change the API first, before more
such changes are done.

I would suggest dropping the whole series for now.

	Regards
		Oliver

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
