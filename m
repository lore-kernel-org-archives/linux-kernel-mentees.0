Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8891CC38145
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Sep 2022 16:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FCED41B4A;
	Fri,  2 Sep 2022 16:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FCED41B4A
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RbDUf6dO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RGdoEow7h_dZ; Fri,  2 Sep 2022 16:37:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D526B41B44;
	Fri,  2 Sep 2022 16:37:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D526B41B44
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D1EBC007F;
	Fri,  2 Sep 2022 16:37:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0AB5DC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 16:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8225400FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 16:47:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8225400FD
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=RbDUf6dO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hSAvuuqn2gLH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 16:47:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBA41400A6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CBA41400A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 16:47:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D659CCE11BE;
 Mon, 15 Aug 2022 16:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5243C433C1;
 Mon, 15 Aug 2022 16:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660582044;
 bh=Ozb6TGtSxpGY394xWutXsO6KHBs/5utbn5g1hFNEBJg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RbDUf6dOYQzhjQQtaxMYtiqK0i/oHrxsBjjcAdSgetjrIXLtbHYfPVXu7g/B7MUa/
 02TCcFr+ThexxoVrF78U8lssJu2MROpHMprEPhBzEHOQo1ANyakg2bu0NZxVb8wlm9
 VXHIZNZkt5gsNzXxKh4WegUIx2vmHlIdcI+j8rjnG19U9yYciuSng11aAq2fDJ1WWo
 h5fGarZEiPk5iur90/4kx4ueGFxzF4ZGL0hAtM/M+6g/r9Lcd8fojJFri+d/LUwp7V
 rttAZRHMPaqBNmDg+FpYvMmxQwbNGVi8AkyUT2WKUap5I3eOynUvD1fJtMu5hF5fkJ
 yNsGfccP1ozrw==
Date: Mon, 15 Aug 2022 09:47:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH v2] wifi: cfg80211: Fix UAF in ieee80211_scan_rx()
Message-ID: <20220815094722.3c275087@kernel.org>
In-Reply-To: <182980137c6.5665bf61226802.3084448395277966678@siddh.me>
References: <20220726123921.29664-1-code@siddh.me>
 <18291779771.584fa6ab156295.3990923778713440655@siddh.me>
 <YvZEfnjGIpH6XjsD@kroah.com>
 <18292791718.88f48d22175003.6675210189148271554@siddh.me>
 <YvZxfpY4JUqvsOG5@kroah.com>
 <18292e1dcd8.2359a549180213.8185874405406307019@siddh.me>
 <20220812122509.281f0536@kernel.org>
 <182980137c6.5665bf61226802.3084448395277966678@siddh.me>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 02 Sep 2022 16:37:11 +0000
Cc: syzbot+6cb476b7c69916a0caca@lists.linuxfoundation.org,
	"          <syzbot+6cb476b7c69916a0caca@syzkaller.appspotmail.com>, , eric  dumazet <edumazet@google.com>, netdev <netdev@vger.kernel.org>,  johannes berg <johannes@sipsolutions.net>, paolo abeni <pabeni@redhat.com>,  "@lists.linuxfoundation.org,
	david@lists.linuxfoundation.org, s.miller@lists.linuxfoundation.org,
	" <davem@davemloft.net>"@lists.linuxfoundation.org
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

On Sat, 13 Aug 2022 21:49:52 +0530 Siddh Raman Pant wrote:
> On Sat, 13 Aug 2022 00:55:09 +0530  Jakub Kicinski  wrote:
> > Similarly to Greg, I'm not very familiar with the code base but one
> > sure way to move things forward would be to point out a commit which
> > broke things and put it in a Fixes tag. Much easier to validate a fix
> > by looking at where things went wrong.  
> 
> Thanks, I now looked at some history.
> 
> The following commit on 28 Sep 2020 put the kfree call before NULLing:
> c8cb5b854b40 ("nl80211/cfg80211: support 6 GHz scanning")
> 
> The following commit on 19 Nov 2014 introduces RCU:
> 6ea0a69ca21b ("mac80211: rcu-ify scan and scheduled scan request pointers")
> 
> The kfree call wasn't "rcu-ified" in this commit, and neither were
> RCU heads added.
> 
> The following commit on 18 Dec 2014 added RCU head for sched_scan_req:
> 31a60ed1e95a ("nl80211: Convert sched_scan_req pointer to RCU pointer")
> 
> It seems a similar thing might not have been done for scan_req, but I
> could have also missed commits.
> 
> So what should go into the fixes tag, if any? Probably 6ea0a69ca21b?

That'd be my instinct, too. But do add the full history analysis 
to the commit message.

> Also, I probably should use RCU_INIT_POINTER in this patch. Or should
> I make a patch somewhat like 31a60ed1e95a?

Yeah, IDK, I'm confused on what the difference between rdev and local
is. The crash site reads the pointer from local, so other of clearing
the pointer on rdev should not matter there. Hopefully wireless folks
can chime in on v3.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
