Return-Path: <SRS0=u7S/=EL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BACC55178
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Nov 2020 00:24:49 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92FB5208C7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Nov 2020 00:24:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ExvxMxxJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92FB5208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0BD33870E0;
	Thu,  5 Nov 2020 00:24:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id plu5z0e9bGJn; Thu,  5 Nov 2020 00:24:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id ABB16870CF;
	Thu,  5 Nov 2020 00:24:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F67AC088B;
	Thu,  5 Nov 2020 00:24:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37768C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Nov 2020 00:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 334AC87042
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Nov 2020 00:24:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 30ojkh5WiY2M
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Nov 2020 00:24:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C267387029
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Nov 2020 00:24:45 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EBC602080D;
 Thu,  5 Nov 2020 00:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604535885;
 bh=uYtt1Nd+0axqH7yuxo8Tc4Yl1kGBqXxqhhp8NdbBKbw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ExvxMxxJ+ZxeVDpHX1VNEHHr8mx4wPekye0QK5AmFgc+8JfUXPnXN8E5CSRa/Bs2+
 TFOeeF5Ie5/WISQ7G0HdKNXvkGpLS4hH8f8BLNpsRv03sP+smtq3d/vG0nGHLguH3s
 b1fgHmXEybTKMnNwIx7CfTHyKSrTIY/6K8jnORIw=
Date: Wed, 4 Nov 2020 16:24:44 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <20201104162444.66b5cc56@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201102173946.13800-1-anant.thazhemadam@gmail.com>
References: <20201102173946.13800-1-anant.thazhemadam@gmail.com>
MIME-Version: 1.0
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 Oliver Neukum <oneukum@suse.com>, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [RESEND PATCH v3] net: usb: usbnet:
 update __usbnet_{read|write}_cmd() to use new API
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

On Mon,  2 Nov 2020 23:09:46 +0530 Anant Thazhemadam wrote:
> Currently, __usbnet_{read|write}_cmd() use usb_control_msg().
> However, this could lead to potential partial reads/writes being
> considered valid, and since most of the callers of
> usbnet_{read|write}_cmd() don't take partial reads/writes into account
> (only checking for negative error number is done), and this can lead to
> issues.
> 
> However, the new usb_control_msg_{send|recv}() APIs don't allow partial
> reads and writes.
> Using the new APIs also relaxes the return value checking that must
> be done after usbnet_{read|write}_cmd() is called.
> 
> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>

So you're changing the semantics without updating the callers?

I'm confused. 

Is this supposed to be applied to some tree which already has the
callers fixed?

At a quick scan at least drivers/net/usb/plusb.c* would get confused 
as it compares the return value to zero and 0 used to mean "nothing
transferred", now it means "all good", no? 

* I haven't looked at all the other callers
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
