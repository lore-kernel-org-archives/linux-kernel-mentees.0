Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0D7C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 12 Aug 2022 15:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 142B382951;
	Fri, 12 Aug 2022 15:28:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 142B382951
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=KobhE0oA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fZdvqM-ngKkS; Fri, 12 Aug 2022 15:28:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3250882890;
	Fri, 12 Aug 2022 15:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3250882890
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11058C0032;
	Fri, 12 Aug 2022 15:28:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68285C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 15:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3684F41862
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 15:28:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3684F41862
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=KobhE0oA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 93QS5z6iA0b8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 15:28:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5026C4185A
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5026C4185A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 15:28:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8985C6147D;
 Fri, 12 Aug 2022 15:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C47C433C1;
 Fri, 12 Aug 2022 15:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1660318080;
 bh=Js90lG2a8CweNtF1ZgBlqyryGecyyYI5L5XDv9jU1pw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KobhE0oAhe5CUh6J0+dCswDw2xxhwa7nkHxFglctgM1+T6exPV0IQp2feT6W6xJao
 fcdt0YCo+oB9DfCD2VeRPnAQnmiGfwMIfwDjCfCYj5DsOUNPeVL15cJAbw8nSxoMMB
 p7hYC6DPcda76poYonlcnU2DZq/6k4d2y6V/M8Js=
Date: Fri, 12 Aug 2022 17:27:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH v2] wifi: cfg80211: Fix UAF in ieee80211_scan_rx()
Message-ID: <YvZxfpY4JUqvsOG5@kroah.com>
References: <20220726123921.29664-1-code@siddh.me>
 <18291779771.584fa6ab156295.3990923778713440655@siddh.me>
 <YvZEfnjGIpH6XjsD@kroah.com>
 <18292791718.88f48d22175003.6675210189148271554@siddh.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18292791718.88f48d22175003.6675210189148271554@siddh.me>
Cc: netdev <netdev@vger.kernel.org>, syzbot+6cb476b7c69916a0caca
 <syzbot+6cb476b7c69916a0caca@syzkaller.appspotmail.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, syzbot+f9acff9bf08a845f225d
 <syzbot+f9acff9bf08a845f225d@syzkaller.appspotmail.com>,
 eric dumazet <edumazet@google.com>, syzbot+9250865a55539d384347
 <syzbot+9250865a55539d384347@syzkaller.appspotmail.com>,
 jakub kicinski <kuba@kernel.org>, johannes berg <johannes@sipsolutions.net>,
 paolo abeni <pabeni@redhat.com>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 "david s. miller" <davem@davemloft.net>
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

On Fri, Aug 12, 2022 at 08:03:05PM +0530, Siddh Raman Pant wrote:
> On Fri, 12 Aug 2022 17:45:58 +0530  Greg KH  wrote:
> > The merge window is for new features to be added, bugfixes can be merged
> > at any point in time, but most maintainers close their trees until after
> > the merge window is closed before accepting new fixes, like this one.
> > 
> > So just relax, wait another week or so, and if there's no response,
> > resend it then.
> > 
> 
> Okay, sure.
> 
> > Personally, this patch seems very incorrect, but hey, I'm not the wifi
> > subsystem maintainer :)
> 
> Why do you think so?

rcu just delays freeing of an object, you might just be delaying the
race condition.  Just moving a single object to be freed with rcu feels
very odd if you don't have another reference somewhere.

Anyway, I don't know this codebase, so I could be totally wrong.

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
