Return-Path: <SRS0=f0b9=DB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BCC2C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Sep 2020 15:41:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D6C62220C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Sep 2020 15:41:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nucleusys.com header.i=@nucleusys.com header.b="bcW/P9rA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D6C62220C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nucleusys.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A91AA86B90;
	Thu, 24 Sep 2020 15:41:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7uM-etoO+66U; Thu, 24 Sep 2020 15:41:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7F74D86B72;
	Thu, 24 Sep 2020 15:41:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 662A5C0890;
	Thu, 24 Sep 2020 15:41:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 132ECC0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 15:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EFE352046B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 15:41:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Amavis-Alert: BAD HEADER SECTION, Improper folded header field made up
 entirely of whitespace (char 20 hex): X-Spam-Report: ...that system
 for details.\n \n Content previ[...]
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ViAVDWM7GtXr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 15:40:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from zztop.nucleusys.com (lan.nucleusys.com [92.247.61.126])
 by silver.osuosl.org (Postfix) with ESMTPS id 2D3F120453
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 15:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=nucleusys.com; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q/o5cuCHNMfZCC5DXURaTMfkvGumctmEhF5/EQbiobo=; b=bcW/P9rAhkU6dQ/Y+qika/Jg25
 ECxp3eVyEuMkpAf9XsRDNWEZKhx3qRYj3Z2ZZZfQdIafBMGmLaBgbGOM/uKEXifVGoiqk4whfC9ld
 9XywUqHm1tgliViap8mdaLSrl2EjqaqPD88EO4NwYqd5j6nfohlGOq8xmMkwbAGlybc0=;
Received: from [94.26.108.4] (helo=carbon.lan)
 by zztop.nucleusys.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <petkan@nucleusys.com>)
 id 1kLTMC-0000QU-Sy; Thu, 24 Sep 2020 18:40:29 +0300
Date: Thu, 24 Sep 2020 18:40:26 +0300
From: Petko Manolov <petkan@nucleusys.com>
To: Oliver Neukum <oneukum@suse.com>
Message-ID: <20200924154026.GA9761@carbon.lan>
References: <20200923090519.361-1-himadrispandya@gmail.com>
 <20200923090519.361-4-himadrispandya@gmail.com>
 <1600856557.26851.6.camel@suse.com> <20200923144832.GA11151@karbon>
 <2f997848ed05c1f060125f7567f6bc3fae7410bb.camel@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2f997848ed05c1f060125f7567f6bc3fae7410bb.camel@suse.com>
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

On 20-09-24 13:09:05, Oliver Neukum wrote:
> Am Mittwoch, den 23.09.2020, 17:48 +0300 schrieb Petko Manolov:
> 
> > One possible fix is to add yet another argument to usb_control_msg_recv(), 
> > which would be the GFP_XYZ flag to pass on to kmemdup().  Up to Greg, of 
> > course.
> 
> submitted. The problem is those usages that are very hard to trace. I'd 
> dislike to just slab GFP_NOIO on them for no obvious reason.

Do you mean you submitted a patch for usb_control_msg_recv() (because i don't 
see it on linux-netdev) or i'm reading this all wrong?


		Petko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
