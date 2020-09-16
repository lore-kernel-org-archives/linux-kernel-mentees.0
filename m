Return-Path: <SRS0=IxsT=CZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30745C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 06:39:35 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07D4E221E7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 06:39:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nucleusys.com header.i=@nucleusys.com header.b="pqmtaaTv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07D4E221E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nucleusys.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D1F3E86A0E;
	Wed, 16 Sep 2020 06:39:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gxNJmTCVOhdL; Wed, 16 Sep 2020 06:39:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3B90486599;
	Wed, 16 Sep 2020 06:39:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2F337C0859;
	Wed, 16 Sep 2020 06:39:33 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0AC4CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 06:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id ED4DD86599
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 06:39:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Amavis-Alert: BAD HEADER SECTION, Improper folded header field made up
 entirely of whitespace (char 20 hex): X-Spam-Report: ...that system
 for details.\n \n Content previ[...]
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lgVfBSHKRLUz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 06:39:30 +0000 (UTC)
X-Greylist: delayed 00:19:36 by SQLgrey-1.7.6
Received: from zztop.nucleusys.com (lan.nucleusys.com [92.247.61.126])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4E90A85621
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 06:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=nucleusys.com; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wtu7UwIuDippJJwE5jWzvgh91CAIDjoUM/4pw51EOEc=; b=pqmtaaTvkLHf6V1EmHjEox/Z0I
 HvraRytcLRb1olVf6GUtBPM7FbCviCPkC2x7Cspnzm5G1hi/hPR0Ax2FifJ295RGrksZZM4xx/BEW
 GsW+Lw8ce7T4uheXR30LEcxT/xm+1jmG79erCMq1xZpmneERgwtKTlcp/sftGbZTzu/0=;
Received: from 78-83-68-78.spectrumnet.bg ([78.83.68.78] helo=p310)
 by zztop.nucleusys.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <petkan@nucleusys.com>)
 id 1kIR6D-0005AO-Oi; Wed, 16 Sep 2020 09:39:25 +0300
Date: Wed, 16 Sep 2020 09:39:25 +0300
From: Petko Manolov <petkan@nucleusys.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20200916063925.GC38262@p310>
References: <20200916050540.15290-1-anant.thazhemadam@gmail.com>
 <20200916062227.GD142621@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916062227.GD142621@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>,
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

On 20-09-16 08:22:27, Greg KH wrote:
> On Wed, Sep 16, 2020 at 10:35:40AM +0530, Anant Thazhemadam wrote:
> > get_registers() copies whatever memory is written by the
> > usb_control_msg() call even if the underlying urb call ends up failing.
> > 
> > If get_registers() fails, or ends up reading 0 bytes, meaningless and 
> > junk register values would end up being copied over (and eventually read 
> > by the driver), and since most of the callers of get_registers() don't 
> > check the return values of get_registers() either, this would go unnoticed.
> > 
> > It might be a better idea to try and mirror the PCI master abort
> > termination and set memory to 0xFFs instead in such cases.
> 
> It would be better to use this new api call instead of
> usb_control_msg():
> 	https://lore.kernel.org/r/20200914153756.3412156-1-gregkh@linuxfoundation.org

Heh, wasn't aware of the new api.

> How about porting this patch to run on top of that series instead?  That 
> should make this logic much simpler.

I'll need to check if in this case 'size' is the right amount of bytes expected 
and not an upper limit.  Then i'll convert it to the new api.


cheers,
Petko


> > Fixes: https://syzkaller.appspot.com/bug?extid=abbc768b560c84d92fd3
> > Reported-by: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com
> > Tested-by: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com
> > Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> > ---
> >  drivers/net/usb/rtl8150.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
> > index 733f120c852b..04fca7bfcbcb 100644
> > --- a/drivers/net/usb/rtl8150.c
> > +++ b/drivers/net/usb/rtl8150.c
> > @@ -162,8 +162,13 @@ static int get_registers(rtl8150_t * dev, u16 indx, u16 size, void *data)
> >  	ret = usb_control_msg(dev->udev, usb_rcvctrlpipe(dev->udev, 0),
> >  			      RTL8150_REQ_GET_REGS, RTL8150_REQT_READ,
> >  			      indx, 0, buf, size, 500);
> > -	if (ret > 0 && ret <= size)
> > +
> > +	if (ret < 0)
> > +		memset(data, 0xff, size);
> > +
> > +	else
> >  		memcpy(data, buf, ret);
> > +
> >  	kfree(buf);
> >  	return ret;
> >  }
> > @@ -276,7 +281,7 @@ static int write_mii_word(rtl8150_t * dev, u8 phy, __u8 indx, u16 reg)
> >  
> >  static inline void set_ethernet_addr(rtl8150_t * dev)
> >  {
> > -	u8 node_id[6];
> > +	u8 node_id[6] = {0};
> 
> This should not be needed to be done.
> 
> thanks,
> 
> greg k-h
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
