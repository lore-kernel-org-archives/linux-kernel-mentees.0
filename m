Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98063C19F2D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 13 Aug 2022 16:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F2B740989;
	Sat, 13 Aug 2022 16:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F2B740989
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=Df3uVVWB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SeqrNI2u6SCT; Sat, 13 Aug 2022 16:20:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 17FFB40186;
	Sat, 13 Aug 2022 16:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17FFB40186
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D342EC0032;
	Sat, 13 Aug 2022 16:20:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F559C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Aug 2022 16:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39A6A60E30
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Aug 2022 16:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39A6A60E30
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=Df3uVVWB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 32_aSgYrLFQF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Aug 2022 16:20:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97D8C60761
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97D8C60761
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Aug 2022 16:20:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1660407605; cv=none; d=zohomail.in; s=zohoarc; 
 b=LYtSCUqODWDHtBj51efKKORt0d0g0I/kHwHw5VwPHEK5JV8Lxum5HjFup/SWb2vXW5pF1EJTrrFYxZQQcaMpgcHjwaAjYULpP5eB3lrKcplOmb46LgbXPC1VHqkcJ37Z2mnSuDXSmFJQD58c7Ilis3x326WDVIc9ltCh0+QotVE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1660407605;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=U3torEU8ue1d6ut66EvgIXpz48aBqMmo4NWWLjEFBMM=; 
 b=Kxp8AbQulGvoO7w+Q3UIFPNEhau0uskWwPGJCY5SfvR9ag1xR0xLSp4mB1B/9o5ssZim+eYi2xQmCAQqOzz2qXLn3ESW1aqqbJjU7xakVvbuBjPayiGQ3rQ9Kr4LYthATXF+KPa1uV+NZimTiUqrn89X1soo6YFXJM4yU5poy8E=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660407605; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=U3torEU8ue1d6ut66EvgIXpz48aBqMmo4NWWLjEFBMM=;
 b=Df3uVVWBXUIoDMCL+puzzLoUIoh7jD0UuVSUAZpQO47W5tw3m/s46kDkvmNzBMmk
 10XFsSKNcEodQ4JIib9Pde2L22YHccxbCQSazfdGyGzlq3vdIJqky5oqTXmScAO/Oe3
 7aEpts9XZVD2umtCTWFdQzaIJi6Bqx/TvIBn3a1g=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1660407592922781.0334173208613;
 Sat, 13 Aug 2022 21:49:52 +0530 (IST)
Date: Sat, 13 Aug 2022 21:49:52 +0530
To: "Jakub Kicinski" <kuba@kernel.org>
Message-ID: <182980137c6.5665bf61226802.3084448395277966678@siddh.me>
In-Reply-To: <20220812122509.281f0536@kernel.org>
References: <20220726123921.29664-1-code@siddh.me>
 <18291779771.584fa6ab156295.3990923778713440655@siddh.me>
 <YvZEfnjGIpH6XjsD@kroah.com>
 <18292791718.88f48d22175003.6675210189148271554@siddh.me>
 <YvZxfpY4JUqvsOG5@kroah.com>
 <18292e1dcd8.2359a549180213.8185874405406307019@siddh.me>
 <20220812122509.281f0536@kernel.org>
Subject: Re: [PATCH v2] wifi: cfg80211: Fix UAF in ieee80211_scan_rx()
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: syzbot+9250865a55539d384347
 <syzbot+9250865a55539d384347@syzkaller.appspotmail.com>,
 syzbot+6cb476b7c69916a0caca
 <syzbot+6cb476b7c69916a0caca@syzkaller.appspotmail.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, syzbot+f9acff9bf08a845f225d
 <syzbot+f9acff9bf08a845f225d@syzkaller.appspotmail.com>,
 eric dumazet <edumazet@google.com>, netdev <netdev@vger.kernel.org>,
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
From: Siddh Raman Pant via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Siddh Raman Pant <code@siddh.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sat, 13 Aug 2022 00:55:09 +0530  Jakub Kicinski  wrote:
> Similarly to Greg, I'm not very familiar with the code base but one
> sure way to move things forward would be to point out a commit which
> broke things and put it in a Fixes tag. Much easier to validate a fix
> by looking at where things went wrong.

Thanks, I now looked at some history.

The following commit on 28 Sep 2020 put the kfree call before NULLing:
c8cb5b854b40 ("nl80211/cfg80211: support 6 GHz scanning")

The following commit on 19 Nov 2014 introduces RCU:
6ea0a69ca21b ("mac80211: rcu-ify scan and scheduled scan request pointers")

The kfree call wasn't "rcu-ified" in this commit, and neither were
RCU heads added.

The following commit on 18 Dec 2014 added RCU head for sched_scan_req:
31a60ed1e95a ("nl80211: Convert sched_scan_req pointer to RCU pointer")

It seems a similar thing might not have been done for scan_req, but I
could have also missed commits.

So what should go into the fixes tag, if any? Probably 6ea0a69ca21b?

Also, I probably should use RCU_INIT_POINTER in this patch. Or should
I make a patch somewhat like 31a60ed1e95a?

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
