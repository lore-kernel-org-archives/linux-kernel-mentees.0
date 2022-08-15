Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622BFC25B0E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Aug 2022 20:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 036F94028D;
	Mon, 15 Aug 2022 20:37:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 036F94028D
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=uxyfTZYO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id afC_8qEJVQhF; Mon, 15 Aug 2022 20:37:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 62E54402B1;
	Mon, 15 Aug 2022 20:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62E54402B1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28FF4C0032;
	Mon, 15 Aug 2022 20:37:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82B48C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 20:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FBE5408B3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 20:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FBE5408B3
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net
 header.a=rsa-sha256 header.s=mail header.b=uxyfTZYO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S_Cq45QqkUnw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 20:37:44 +0000 (UTC)
X-Greylist: delayed 00:39:03 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39284408B7
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39284408B7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 20:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=ys0p+m8vEeM7+pZbwq4AhKTXJmES6U7pjAAivzVVg1k=; 
 t=1660595864; x=1661805464; b=uxyfTZYOWLb93la2QjenGJYDDbDGSA8Ny6UdYC22tdHB0yv
 zjVHlDS72yNvXwvMg2gQ1GtxmHGmmSCoh8cy1pc54ozkSGU8p2S5E5viPXTZPTL8sBNIBbseH9GWp
 EfuJrsY0H35wWxlZeeQXXPsiB+MTiCou4b/i0AXRrt5sC2SrE4HQ5iAjtka4toJ+Owi3zuPtGODxW
 JZusyLiS8PW2CoQs3Yy6u4PmS5PAUWraqSZ38PAQJIZwDrhrCpXlQjSadLtdyuOu4VVfPNLudW3/J
 sdrBrcoggjJYOPUpBiSEEmly0tQrkkjDLLV6w9MgWeo3Om928ae1oEWeLDZ5dNFA==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96) (envelope-from <johannes@sipsolutions.net>)
 id 1oNgEE-008oaX-0G; Mon, 15 Aug 2022 21:58:26 +0200
Message-ID: <18fd9b89d45aedc1504d0cbd299ffb289ae96438.camel@sipsolutions.net>
Subject: Re: [PATCH v2] wifi: cfg80211: Fix UAF in ieee80211_scan_rx()
From: Johannes Berg <johannes@sipsolutions.net>
To: Jakub Kicinski <kuba@kernel.org>, Siddh Raman Pant <code@siddh.me>
Date: Mon, 15 Aug 2022 21:58:24 +0200
In-Reply-To: <20220815094722.3c275087@kernel.org>
References: <20220726123921.29664-1-code@siddh.me>
 <18291779771.584fa6ab156295.3990923778713440655@siddh.me>
 <YvZEfnjGIpH6XjsD@kroah.com>
 <18292791718.88f48d22175003.6675210189148271554@siddh.me>
 <YvZxfpY4JUqvsOG5@kroah.com>
 <18292e1dcd8.2359a549180213.8185874405406307019@siddh.me>
 <20220812122509.281f0536@kernel.org>
 <182980137c6.5665bf61226802.3084448395277966678@siddh.me>
 <20220815094722.3c275087@kernel.org>
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
Cc: eric dumazet <edumazet@google.com>, netdev <netdev@vger.kernel.org>,
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

On Mon, 2022-08-15 at 09:47 -0700, Jakub Kicinski wrote:
> On Sat, 13 Aug 2022 21:49:52 +0530 Siddh Raman Pant wrote:
> > On Sat, 13 Aug 2022 00:55:09 +0530  Jakub Kicinski  wrote:
> > > Similarly to Greg, I'm not very familiar with the code base but one
> > > sure way to move things forward would be to point out a commit which
> > > broke things and put it in a Fixes tag. Much easier to validate a fix
> > > by looking at where things went wrong.  
> > 
> > Thanks, I now looked at some history.
> > 
> > The following commit on 28 Sep 2020 put the kfree call before NULLing:
> > c8cb5b854b40 ("nl80211/cfg80211: support 6 GHz scanning")
> > 
> > The following commit on 19 Nov 2014 introduces RCU:
> > 6ea0a69ca21b ("mac80211: rcu-ify scan and scheduled scan request pointers")
> > 
> > The kfree call wasn't "rcu-ified" in this commit, and neither were
> > RCU heads added.
> > 
> > The following commit on 18 Dec 2014 added RCU head for sched_scan_req:
> > 31a60ed1e95a ("nl80211: Convert sched_scan_req pointer to RCU pointer")
> > 
> > It seems a similar thing might not have been done for scan_req, but I
> > could have also missed commits.
> > 
> > So what should go into the fixes tag, if any? Probably 6ea0a69ca21b?
> 
> That'd be my instinct, too. But do add the full history analysis 
> to the commit message.
> 
> > Also, I probably should use RCU_INIT_POINTER in this patch. Or should
> > I make a patch somewhat like 31a60ed1e95a?
> 
> Yeah, IDK, I'm confused on what the difference between rdev and local
> is. The crash site reads the pointer from local, so other of clearing
> the pointer on rdev should not matter there. Hopefully wireless folks
> can chime in on v3.

Sorry everyone, I always thought "this looks odd" and then never got
around to taking a closer look.

So yeah, I still think this looks odd - cfg80211 doesn't really know
anything about how mac80211 might be doing something with RCU to protect
the pointer.

The patch also leaves the NULL-ing in mac80211 (that is how we reach it)
broken wrt. the kfree_rcu() since it doesn't happen _before_, and the
pointer in rdev isn't how this is reached through RCU (it's not even
__rcu annotated).

I think it might be conceptually better, though not faster, to do
something like https://p.sipsolutions.net/1d23837f455dc4c2.txt which
ensures that from mac80211's POV it can no longer be reached before we
call cfg80211_scan_done().

Yeah, that's slower, but scanning is still a relatively infrequent (and
slow anyway) operation, and this way we can stick to "this is not used
once you call cfg80211_scan_done()" which just makes much more sense?

johannes
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
