Return-Path: <SRS0=Dbq6=DA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3845C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 14:49:04 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D766206FB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 14:49:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nucleusys.com header.i=@nucleusys.com header.b="RSQ+DQS4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D766206FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nucleusys.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9ECD484DF6;
	Wed, 23 Sep 2020 14:49:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZTYSAee8U_ED; Wed, 23 Sep 2020 14:49:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7CC9484E1A;
	Wed, 23 Sep 2020 14:49:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 65B61C0859;
	Wed, 23 Sep 2020 14:49:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA2AEC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 14:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C804C87285
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 14:49:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Amavis-Alert: BAD HEADER SECTION, Improper folded header field made up
 entirely of whitespace (char 20 hex): X-Spam-Report: ...that system
 for details.\n \n Content previ[...]
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K9IHgd4w0Akf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 14:48:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from zztop.nucleusys.com (lan.nucleusys.com [92.247.61.126])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1E84086FF5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 14:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=nucleusys.com; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4DYJKE8l8EdESOXVwsp+gos89esEsmURD8s5B4Bsfec=; b=RSQ+DQS4PaLen4FanX1zUpusmC
 OHWXejqIFItnVTGDp+b/dg12zVaDRxod2M2lHqBTd1wuU9VdN4tAlPOYuXIbLyW6webaKVGsHb4sU
 +Zv3/lgtW70dj7YK6MLfjmP/UtcK+EgPmtQCn+YK7eXj64c571iIXke3Ne1v7OP9dCYU=;
Received: from [94.26.108.4] (helo=karbon)
 by zztop.nucleusys.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <petkan@nucleusys.com>)
 id 1kL64P-0005m4-T2; Wed, 23 Sep 2020 17:48:34 +0300
Date: Wed, 23 Sep 2020 17:48:32 +0300
From: Petko Manolov <petkan@nucleusys.com>
To: Oliver Neukum <oneukum@suse.com>
Message-ID: <20200923144832.GA11151@karbon>
References: <20200923090519.361-1-himadrispandya@gmail.com>
 <20200923090519.361-4-himadrispandya@gmail.com>
 <1600856557.26851.6.camel@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1600856557.26851.6.camel@suse.com>
Cc: keescook@chromium.org, pankaj.laxminarayan.bharadiya@intel.com,
 linux-usb@vger.kernel.org, yuehaibing@huawei.com, linux-kernel@vger.kernel.org,
 ogiannou@gmail.com, netdev@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
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

On 20-09-23 12:22:37, Oliver Neukum wrote:
> Am Mittwoch, den 23.09.2020, 14:35 +0530 schrieb Himadri Pandya:
> 
> Hi,
> 
> > Many usage of usb_control_msg() do not have proper error check on return
> > value leaving scope for bugs on short reads. New usb_control_msg_recv()
> > and usb_control_msg_send() nicely wraps usb_control_msg() with proper
> > error check. Hence use the wrappers instead of calling usb_control_msg()
> > directly.
> > 
> > Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> Nacked-by: Oliver Neukum <oneukum@suse.com>
> 
> > ---
> >  drivers/net/usb/rtl8150.c | 32 ++++++--------------------------
> >  1 file changed, 6 insertions(+), 26 deletions(-)
> > 
> > diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
> > index 733f120c852b..e3002b675921 100644
> > --- a/drivers/net/usb/rtl8150.c
> > +++ b/drivers/net/usb/rtl8150.c
> > @@ -152,36 +152,16 @@ static const char driver_name [] = "rtl8150";
> >  */
> >  static int get_registers(rtl8150_t * dev, u16 indx, u16 size, void *data)
> >  {
> > -	void *buf;
> > -	int ret;
> > -
> > -	buf = kmalloc(size, GFP_NOIO);
> 
> GFP_NOIO is used here for a reason. You need to use this helper
> while in contexts of error recovery and runtime PM.
> 
> > -	if (!buf)
> > -		return -ENOMEM;
> > -
> > -	ret = usb_control_msg(dev->udev, usb_rcvctrlpipe(dev->udev, 0),
> > -			      RTL8150_REQ_GET_REGS, RTL8150_REQT_READ,
> > -			      indx, 0, buf, size, 500);
> > -	if (ret > 0 && ret <= size)
> > -		memcpy(data, buf, ret);
> > -	kfree(buf);
> > -	return ret;
> > +	return usb_control_msg_recv(dev->udev, 0, RTL8150_REQ_GET_REGS,
> > +				    RTL8150_REQT_READ, indx, 0, data,
> > +				    size, 500);
> 
> This internally uses kmemdup() with GFP_KERNEL.
> You cannot make this change. The API does not support it.
> I am afraid we will have to change the API first, before more
> such changes are done.

One possible fix is to add yet another argument to usb_control_msg_recv(), which 
would be the GFP_XYZ flag to pass on to kmemdup().  Up to Greg, of course.


cheers,
Petko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
