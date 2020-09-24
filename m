Return-Path: <SRS0=f0b9=DB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 510EAC2D0E2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Sep 2020 16:00:55 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B08BC23600
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Sep 2020 16:00:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="AwScAfRx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B08BC23600
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4D69387517;
	Thu, 24 Sep 2020 16:00:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DoSY-7wgQkbP; Thu, 24 Sep 2020 16:00:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E95F28735B;
	Thu, 24 Sep 2020 16:00:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E570AC0890;
	Thu, 24 Sep 2020 16:00:53 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A9B3C0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 16:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EACF086B18
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 16:00:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qhI_sPLoaCCt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 16:00:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8508E86A0F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 16:00:51 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6ADA3235FD;
 Thu, 24 Sep 2020 16:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600963251;
 bh=r67kiC0WjaNVmOhYLjf6JYjUJqRLU6Z2/EyBhfyzyvU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AwScAfRx9Njhn+CsDf0vIPl1vMTCryCGmJiCCir1LBP2pGPpRObRPiwsIoyRYH6N/
 xUCfZrh4aCjPZwNIHlxf0aMfv2SW539VKPcmv4ErcMaOcXInPHNESLWt4RHU02/Yyp
 fForhBgGlJDyPOtPYa/UHZ89hPiCuqNi9WgX4ljA=
Date: Thu, 24 Sep 2020 18:01:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Petko Manolov <petkan@nucleusys.com>
Message-ID: <20200924160107.GA1174357@kroah.com>
References: <20200923090519.361-1-himadrispandya@gmail.com>
 <20200923090519.361-4-himadrispandya@gmail.com>
 <1600856557.26851.6.camel@suse.com> <20200923144832.GA11151@karbon>
 <2f997848ed05c1f060125f7567f6bc3fae7410bb.camel@suse.com>
 <20200924154026.GA9761@carbon.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200924154026.GA9761@carbon.lan>
Cc: linux-usb@vger.kernel.org, keescook@chromium.org,
 pankaj.laxminarayan.bharadiya@intel.com, Oliver Neukum <oneukum@suse.com>,
 yuehaibing@huawei.com, linux-kernel@vger.kernel.org, ogiannou@gmail.com,
 netdev@vger.kernel.org, kuba@kernel.org,
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

On Thu, Sep 24, 2020 at 06:40:26PM +0300, Petko Manolov wrote:
> On 20-09-24 13:09:05, Oliver Neukum wrote:
> > Am Mittwoch, den 23.09.2020, 17:48 +0300 schrieb Petko Manolov:
> > 
> > > One possible fix is to add yet another argument to usb_control_msg_recv(), 
> > > which would be the GFP_XYZ flag to pass on to kmemdup().  Up to Greg, of 
> > > course.
> > 
> > submitted. The problem is those usages that are very hard to trace. I'd 
> > dislike to just slab GFP_NOIO on them for no obvious reason.
> 
> Do you mean you submitted a patch for usb_control_msg_recv() (because i don't 
> see it on linux-netdev) or i'm reading this all wrong?

It's on the linux-usb list:
	https://lore.kernel.org/r/20200923134348.23862-1-oneukum@suse.com
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
