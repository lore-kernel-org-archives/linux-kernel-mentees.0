Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427CEC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  7 Jul 2022 11:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCD2E611D0;
	Thu,  7 Jul 2022 11:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCD2E611D0
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=RY90JevP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fUI3sXNvk3Kr; Thu,  7 Jul 2022 11:51:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B161860F48;
	Thu,  7 Jul 2022 11:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B161860F48
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 990B7C0033;
	Thu,  7 Jul 2022 11:51:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84D33C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Jul 2022 11:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE2ED41526
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Jul 2022 11:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE2ED41526
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=RY90JevP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BtWV2vBz27jS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Jul 2022 11:51:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC17541A29
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC17541A29
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Jul 2022 11:51:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4669162320;
 Thu,  7 Jul 2022 11:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CC58C341C6;
 Thu,  7 Jul 2022 11:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1657194659;
 bh=TP53YBQef1ChOsCkOpSzExLmVlTCAif4oYcWv8otfSQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RY90JevPl0TVo4BTTieT6ZL52OQT5su34lvywU81tRT6kkTGLstayMyXXQcZuFVyG
 MDLsn4a0S3IdSYHnoK8RJI7dhnSKgVlCHWv5qbrByWNpKELFCjfwiy08a23EdGBti1
 I1aBblLBvsgcFHXQY9d0i5A1QccI6jCOTMg1ERGs=
Date: Thu, 7 Jul 2022 13:50:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: Ping: [PATCH] net: Fix UAF in ieee80211_scan_rx()
Message-ID: <YsbIoB5KTqdRva6g@kroah.com>
References: <20220701145423.53208-1-code@siddh.me>
 <181d8729017.4900485b8578.8329491601163367716@siddh.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <181d8729017.4900485b8578.8329491601163367716@siddh.me>
Cc: netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 "David S . Miller" <davem@davemloft.net>
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

On Thu, Jul 07, 2022 at 05:06:35PM +0530, Siddh Raman Pant via Linux-kernel-mentees wrote:
> Ping?

context-less pings, on a patch that was sent less than 1 week ago, are
usually not a good idea.  Normally wait for 2 weeks and then resend if
you have not heard anything back.

good luck!

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
