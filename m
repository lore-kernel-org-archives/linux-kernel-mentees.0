Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE0BC00140
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 12 Aug 2022 12:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0BE861131;
	Fri, 12 Aug 2022 12:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0BE861131
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=paLTCH++
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8LLseBsMUETO; Fri, 12 Aug 2022 12:16:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C485C6112A;
	Fri, 12 Aug 2022 12:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C485C6112A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9776DC0033;
	Fri, 12 Aug 2022 12:16:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D857C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 12:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 079ED40122
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 12:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 079ED40122
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=paLTCH++
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tZVhC--7dAu3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 12:16:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81E21400E3
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81E21400E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 12:16:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 93777B80502;
 Fri, 12 Aug 2022 12:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B793FC433D6;
 Fri, 12 Aug 2022 12:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1660306561;
 bh=cDPXyw+0tZdATJeb97wbb8Q8vKGfySScZQ9VpUoFvk0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=paLTCH++EckJIU4uEojjfTmtYcEz3socVkzqTh4eohsbCA1/+4U1k/vNZQXLA8q6c
 N7V78szUNV3pGj+bZbfpXYCD6er1jiC8xkZ2H8cmEZoE0xDdyM5d/he57JEHbwQJO8
 OyR0Dmf1/TQQ4gy2er5Jav380HFrCA2HDJMOBXw8=
Date: Fri, 12 Aug 2022 14:15:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH v2] wifi: cfg80211: Fix UAF in ieee80211_scan_rx()
Message-ID: <YvZEfnjGIpH6XjsD@kroah.com>
References: <20220726123921.29664-1-code@siddh.me>
 <18291779771.584fa6ab156295.3990923778713440655@siddh.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18291779771.584fa6ab156295.3990923778713440655@siddh.me>
Cc: netdev <netdev@vger.kernel.org>, syzbot+6cb476b7c69916a0caca
 <syzbot+6cb476b7c69916a0caca@syzkaller.appspotmail.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, syzbot+f9acff9bf08a845f225d
 <syzbot+f9acff9bf08a845f225d@syzkaller.appspotmail.com>,
 Eric Dumazet <edumazet@google.com>, syzbot+9250865a55539d384347
 <syzbot+9250865a55539d384347@syzkaller.appspotmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 Paolo Abeni <pabeni@redhat.com>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>
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

On Fri, Aug 12, 2022 at 03:21:50PM +0530, Siddh Raman Pant via Linux-kernel-mentees wrote:
> On Tue, 26 Jul 2022 18:09:21 +0530  Siddh Raman Pant  wrote:
> > ieee80211_scan_rx() tries to access scan_req->flags after a null check
> > (see line 303 of mac80211/scan.c), but ___cfg80211_scan_done() uses
> > kfree() on the scan_req (see line 991 of wireless/scan.c).
> > 
> > This results in a UAF.
> > 
> > ieee80211_scan_rx() is called inside a RCU read-critical section
> > initiated by ieee80211_rx_napi() (see line 5044 of mac80211/rx.c).
> > 
> > Thus, add an rcu_head to the scan_req struct, so that we can use
> > kfree_rcu() instead of kfree() and thus not free during the critical
> > section.
> > 
> > We can clear the pointer before freeing here, since scan_req is
> > accessed using rcu_dereference().
> > 
> > Bug report (3): https://syzkaller.appspot.com/bug?extid=f9acff9bf08a845f225d
> > Reported-by: syzbot+f9acff9bf08a845f225d@syzkaller.appspotmail.com
> > Reported-by: syzbot+6cb476b7c69916a0caca@syzkaller.appspotmail.com
> > Reported-by: syzbot+9250865a55539d384347@syzkaller.appspotmail.com
> > 
> > Signed-off-by: Siddh Raman Pant code@siddh.me>
> > ---
> > Changes since v1 as requested:
> > - Fixed commit heading and better commit message.
> > - Clear pointer before freeing.
> > 
> >  include/net/cfg80211.h | 2 ++
> >  net/wireless/scan.c    | 2 +-
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
> > index 80f41446b1f0..7e0b448c4cdb 100644
> > --- a/include/net/cfg80211.h
> > +++ b/include/net/cfg80211.h
> > @@ -2368,6 +2368,7 @@ struct cfg80211_scan_6ghz_params {
> >   * @n_6ghz_params: number of 6 GHz params
> >   * @scan_6ghz_params: 6 GHz params
> >   * @bssid: BSSID to scan for (most commonly, the wildcard BSSID)
> > + * @rcu_head: (internal) RCU head to use for freeing
> >   */
> >  struct cfg80211_scan_request {
> >  	struct cfg80211_ssid *ssids;
> > @@ -2397,6 +2398,7 @@ struct cfg80211_scan_request {
> >  	bool scan_6ghz;
> >  	u32 n_6ghz_params;
> >  	struct cfg80211_scan_6ghz_params *scan_6ghz_params;
> > +	struct rcu_head rcu_head;
> >  
> >  	/* keep last */
> >  	struct ieee80211_channel *channels[];
> > diff --git a/net/wireless/scan.c b/net/wireless/scan.c
> > index 6d82bd9eaf8c..6cf58fe6dea0 100644
> > --- a/net/wireless/scan.c
> > +++ b/net/wireless/scan.c
> > @@ -988,8 +988,8 @@ void ___cfg80211_scan_done(struct cfg80211_registered_device *rdev,
> >  	kfree(rdev->int_scan_req);
> >  	rdev->int_scan_req = NULL;
> >  
> > -	kfree(rdev->scan_req);
> >  	rdev->scan_req = NULL;
> > +	kfree_rcu(rdev_req, rcu_head);
> >  
> >  	if (!send_message)
> >  		rdev->scan_msg = msg;
> > -- 
> > 2.35.1
> > 
> 
> Hello,
> 
> Probably the above quoted patch was missed, which can be found on
> https://lore.kernel.org/linux-wireless/20220726123921.29664-1-code@siddh.me/
> 
> This patch was posted more than 2 weeks ago, with changes as requested.
> 
> With the merge window almost ending, may I request for another look at
> this patch?

The merge window is for new features to be added, bugfixes can be merged
at any point in time, but most maintainers close their trees until after
the merge window is closed before accepting new fixes, like this one.

So just relax, wait another week or so, and if there's no response,
resend it then.

Personally, this patch seems very incorrect, but hey, I'm not the wifi
subsystem maintainer :)

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
