Return-Path: <SRS0=Dbq6=DA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31608C52D75
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 10:23:14 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAC2121BE5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 10:23:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="K1hQRymb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAC2121BE5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A909886FAD;
	Wed, 23 Sep 2020 10:23:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zkivDQS71LRW; Wed, 23 Sep 2020 10:23:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2805386F8D;
	Wed, 23 Sep 2020 10:23:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1142CC0859;
	Wed, 23 Sep 2020 10:23:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03C12C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DF523866EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:23:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vZpcNcNIcfpq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:23:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5449686655
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:23:11 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 70D10238D7;
 Wed, 23 Sep 2020 10:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600856591;
 bh=vbe7KhLEZRy4OEuhFJNKIUNqjK+4f7n+EAp2CYmrpyI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K1hQRymbnkZkbCaJfs7jUvv1JxrUwU4Z6Nl9qJwa5StOAbwQv4gM3cVnqrE6VuDr1
 6ymn5CiB7/D1c0bpifdyydecHdfJWw6nTtOlgZMLUX4FNTzjUheVGgGtb/s+VFJtAz
 DacfhjfPQxE1VqvdcGhcmTkd30hsdFOknC4gcMoI=
Date: Wed, 23 Sep 2020 12:23:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Himadri Pandya <himadrispandya@gmail.com>
Message-ID: <20200923102330.GB3154647@kroah.com>
References: <20200923090519.361-1-himadrispandya@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200923090519.361-1-himadrispandya@gmail.com>
Cc: linux-usb@vger.kernel.org, keescook@chromium.org,
 pankaj.laxminarayan.bharadiya@intel.com, oneukum@suse.com,
 yuehaibing@huawei.com, linux-kernel@vger.kernel.org, ogiannou@gmail.com,
 netdev@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net,
 petkan@nucleusys.com
Subject: Re: [Linux-kernel-mentees] [PATCH 0/4] net: usb: avoid using
	usb_control_msg() directly
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

On Wed, Sep 23, 2020 at 02:35:15PM +0530, Himadri Pandya wrote:
> A recent bug-fix shaded light on possible incorrect use of
> usb_control_msg() without proper error check. This resulted in
> introducing new usb core api wrapper functions usb_control_msg_send()
> and usb_control_msg_recv() by Greg KH. This patch series continue the
> clean-up using the new functions.
> 
> Himadri Pandya (4):
>   net: usbnet: use usb_control_msg_recv() and usb_control_msg_send()
>   net: sierra_net: use usb_control_msg_recv()
>   net: usb: rtl8150: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   net: rndis_host: use usb_control_msg_recv() and usb_control_msg_send()
> 
>  drivers/net/usb/rndis_host.c | 44 +++++++++++++---------------------
>  drivers/net/usb/rtl8150.c    | 32 +++++--------------------
>  drivers/net/usb/sierra_net.c | 17 ++++++-------
>  drivers/net/usb/usbnet.c     | 46 ++++--------------------------------
>  4 files changed, 34 insertions(+), 105 deletions(-)
> 

Note, all of these depend on a set of patches in my usb tree, so they
should probably wait to be sent to the networking developers until after
5.10-rc1 is out.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
