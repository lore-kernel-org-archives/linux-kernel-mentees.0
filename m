Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BE4C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 12 Aug 2022 19:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A33A660BCE;
	Fri, 12 Aug 2022 19:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A33A660BCE
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fubw96tY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qYSf3ZtUFewR; Fri, 12 Aug 2022 19:25:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8B25E60ABD;
	Fri, 12 Aug 2022 19:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B25E60ABD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62EFBC0032;
	Fri, 12 Aug 2022 19:25:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88821C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 19:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 296CF4167E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 19:25:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 296CF4167E
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=fubw96tY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bvDvlfqWiHk3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 19:25:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 341914151A
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 341914151A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 19:25:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1D4E7B82338;
 Fri, 12 Aug 2022 19:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DD6C433D6;
 Fri, 12 Aug 2022 19:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660332310;
 bh=0+lCa3Lw/uI704NKn0CRHe4OSa4UTxWw50oFGOX9HPg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fubw96tYs+TNoIY57YLdw2X/9/wamLfGw6T4Gp5DcLWcTXIsu8xSztR2sQMLD9+6d
 mrpfYAlDqgJjpSgfA1LhdpgShoWZYAUB8+Rq4Daia6Qz7xRYdserWqUvN4ojoh/OAV
 X1TOkfA8t+rj9JItHxJcU97eS0GHWdptXHZZDAiaowp2+zmSfc/vFB0yd9j10qIg4j
 xz406CH15OzHuDdgPXpM5J0foB9+khbHrLmtOhpc2Iu3H1VK5BWi2B/Cjejin4Nk4s
 jDepratPaH6Lo5SNUw81L6ewXjUXpREXL7y67MDEkPG5QBYfAQ8ftLu9GNK06+8IAD
 1H0izDxAH92Aw==
Date: Fri, 12 Aug 2022 12:25:09 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH v2] wifi: cfg80211: Fix UAF in ieee80211_scan_rx()
Message-ID: <20220812122509.281f0536@kernel.org>
In-Reply-To: <18292e1dcd8.2359a549180213.8185874405406307019@siddh.me>
References: <20220726123921.29664-1-code@siddh.me>
 <18291779771.584fa6ab156295.3990923778713440655@siddh.me>
 <YvZEfnjGIpH6XjsD@kroah.com>
 <18292791718.88f48d22175003.6675210189148271554@siddh.me>
 <YvZxfpY4JUqvsOG5@kroah.com>
 <18292e1dcd8.2359a549180213.8185874405406307019@siddh.me>
MIME-Version: 1.0
Cc: syzbot+9250865a55539d384347
 <syzbot+9250865a55539d384347@syzkaller.appspotmail.com>,
 syzbot+6cb476b7c69916a0caca
 <syzbot+6cb476b7c69916a0caca@syzkaller.appspotmail.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, syzbot+f9acff9bf08a845f225d
 <syzbot+f9acff9bf08a845f225d@syzkaller.appspotmail.com>, eric
 dumazet <edumazet@google.com>, netdev <netdev@vger.kernel.org>,
 johannes berg <johannes@sipsolutions.net>, paolo abeni <pabeni@redhat.com>,
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

On Fri, 12 Aug 2022 21:57:31 +0530 Siddh Raman Pant wrote:
> On Fri, 12 Aug 2022 20:57:58 +0530  Greg KH  wrote:
> > rcu just delays freeing of an object, you might just be delaying the
> > race condition.  Just moving a single object to be freed with rcu feels
> > very odd if you don't have another reference somewhere.  
> 
> As mentioned in patch message, in net/mac80211/scan.c, we have:
>         void ieee80211_scan_rx(struct ieee80211_local *local, struct sk_buff *skb)
>         {
>                 ...
>                 scan_req = rcu_dereference(local->scan_req);
>                 sched_scan_req = rcu_dereference(local->sched_scan_req);
> 
>                 if (scan_req)
>                         scan_req_flags = scan_req->flags;
>                 ...
>         }
> 
> So scan_req is probably supposed to be protected by RCU.
> 
> Also, in ieee80211_local's definition at net/mac80211/ieee80211_i.h, we have:
>         struct cfg80211_scan_request __rcu *scan_req;
> 
> Thus, scan_req is indeed supposed to be protected by RCU, which this patch
> addresses by adding a RCU head to the type's struct, and using kfree_rcu().
> 
> The above snippet is where the UAF happens (you can refer to syzkaller's log),
> because __cfg80211_scan_done() is called and frees the pointer.

Similarly to Greg, I'm not very familiar with the code base but one
sure way to move things forward would be to point out a commit which
broke things and put it in a Fixes tag. Much easier to validate a fix
by looking at where things went wrong.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
