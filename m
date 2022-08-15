Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3030C25B0E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Aug 2022 07:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DE2E81B17;
	Mon, 15 Aug 2022 07:00:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DE2E81B17
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=pPS4pehk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bHfyqJH-nI-R; Mon, 15 Aug 2022 07:00:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 303E381A24;
	Mon, 15 Aug 2022 07:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 303E381A24
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA01FC0032;
	Mon, 15 Aug 2022 07:00:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 471ECC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 07:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1397581A5C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 07:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1397581A5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R4Ol9UvHqltC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 07:00:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4359B81A24
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4359B81A24
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 07:00:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2CFBC60D3D;
 Mon, 15 Aug 2022 07:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1374C433D6;
 Mon, 15 Aug 2022 07:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1660546817;
 bh=5spCSdjW5x7ryIsjMw7hTdUHSF4GOoGP5GO8fxvWqC4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pPS4pehk4pfLxmtO3uvTEt4K2DMkgSjtTqLY9xDR4n60Z/rVeHK3ErdQajCiLocI4
 FTkdyBwrAinsAp0RR7KPycBZHIYFgVkTWZjeK/P+bpCcORz8iWWPWrHDLGWJQkS9UQ
 IhTCpQqu9AdDuUJJQnsdRcrjUiYdkui1ABc6AaSI=
Date: Mon, 15 Aug 2022 09:00:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH] wifi: mac80211: Don't finalize CSA in IBSS mode if state
 is disconnected
Message-ID: <Yvnu/WT1Z+K36UwW@kroah.com>
References: <20220814151512.9985-1-code@siddh.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220814151512.9985-1-code@siddh.me>
Cc: netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 syzbot+b6c9fe29aefe68e4ad34@syzkaller.appspotmail.com
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

On Sun, Aug 14, 2022 at 08:45:12PM +0530, Siddh Raman Pant via Linux-kernel-mentees wrote:
> When we are not connected to a channel, sending channel "switch"
> announcement doesn't make any sense.
> 
> The BSS list is empty in that case. This causes the for loop in
> cfg80211_get_bss() to be bypassed, so the function returns NULL
> (check line 1424 of net/wireless/scan.c), causing the WARN_ON()
> in ieee80211_ibss_csa_beacon() to get triggered (check line 500
> of net/mac80211/ibss.c), which was consequently reported on the
> syzkaller dashboard.
> 
> Thus, check if we have an existing connection before generating
> the CSA beacon in ieee80211_ibss_finish_csa().
> 
> Fixes: cd7760e62c2a ("mac80211: add support for CSA in IBSS mode")
> Bug report: https://syzkaller.appspot.com/bug?id=05603ef4ae8926761b678d2939a3b2ad28ab9ca6
> Reported-by: syzbot+b6c9fe29aefe68e4ad34@syzkaller.appspotmail.com
> Cc: stable@vger.kernel.org
> 
> Signed-off-by: Siddh Raman Pant <code@siddh.me>

Please no blank line before your signed-off-by line or the tools will
not like it.

And did sysbot verify that this change solved the problem?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
