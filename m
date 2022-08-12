Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0E3C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 12 Aug 2022 09:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B991610D3;
	Fri, 12 Aug 2022 09:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B991610D3
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=eXa6Z+JT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M-BzqtNdZcVW; Fri, 12 Aug 2022 09:52:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CE47C60B4D;
	Fri, 12 Aug 2022 09:52:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE47C60B4D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B509CC0032;
	Fri, 12 Aug 2022 09:52:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C549C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 09:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB0EA403FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 09:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB0EA403FD
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=eXa6Z+JT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6w2YcDzskgJv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 09:52:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1726C400D1
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1726C400D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 09:52:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1660297921; cv=none; d=zohomail.in; s=zohoarc; 
 b=Cd/xypIKHG364pNv0fHs7deIiXlvrE1YCUkE2ad1GSEJQwy7BIy+umQ0jeKVf2aZ3rnlf0a81212o1uXfr4QaaSA2hhP24UMycriS8DbAU0LRrxggeiJIJKANll+9M68mfwPHM30N9UjlhPEF4sPGeq5WkiOkBmD6Y+doMqTjAg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1660297921;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=JDFuru950tXWa6BmvXRLViFwR94Hwhfx/5+AvH3uJNM=; 
 b=Lu4/xacnp4XRTCFanncfZVgKqCLxlYOQzU1xhEO0jFQ9UgXDdgLDLiyoW0hmp15vii531u6G0YnGWKtpfUxuP/39dmhqWAyzg4DZ2dXIuvgesGREyBzB7zqkk15EjobKovjdnPQHa7UB9HR6OWqpi6m+atocr0z0Zo10wpL7gnk=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660297921; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=JDFuru950tXWa6BmvXRLViFwR94Hwhfx/5+AvH3uJNM=;
 b=eXa6Z+JTKAI7iMG3tj4n29sU4xYUuhooMASeJl2mNzDtJN9EDEIgVR7LU7vlhKux
 C6s6TRZAn3r6K7S5Qt0ocmHjDGz3ruRao/OD4bpHyqjvhxMiV9sl7JjYx0SEMvKQu8i
 ArvaKRUW3WQdyoThY+GkbMyUeAP0QBd9hvQnVPxs=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1660297910208203.65727225521607;
 Fri, 12 Aug 2022 15:21:50 +0530 (IST)
Date: Fri, 12 Aug 2022 15:21:50 +0530
To: "Johannes Berg" <johannes@sipsolutions.net>,
 "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>
Message-ID: <18291779771.584fa6ab156295.3990923778713440655@siddh.me>
In-Reply-To: <20220726123921.29664-1-code@siddh.me>
References: <20220726123921.29664-1-code@siddh.me>
Subject: Re: [PATCH v2] wifi: cfg80211: Fix UAF in ieee80211_scan_rx()
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: netdev <netdev@vger.kernel.org>, syzbot+6cb476b7c69916a0caca
 <syzbot+6cb476b7c69916a0caca@syzkaller.appspotmail.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, syzbot+f9acff9bf08a845f225d
 <syzbot+f9acff9bf08a845f225d@syzkaller.appspotmail.com>,
 syzbot+9250865a55539d384347
 <syzbot+9250865a55539d384347@syzkaller.appspotmail.com>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
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

On Tue, 26 Jul 2022 18:09:21 +0530  Siddh Raman Pant  wrote:
> ieee80211_scan_rx() tries to access scan_req->flags after a null check
> (see line 303 of mac80211/scan.c), but ___cfg80211_scan_done() uses
> kfree() on the scan_req (see line 991 of wireless/scan.c).
> 
> This results in a UAF.
> 
> ieee80211_scan_rx() is called inside a RCU read-critical section
> initiated by ieee80211_rx_napi() (see line 5044 of mac80211/rx.c).
> 
> Thus, add an rcu_head to the scan_req struct, so that we can use
> kfree_rcu() instead of kfree() and thus not free during the critical
> section.
> 
> We can clear the pointer before freeing here, since scan_req is
> accessed using rcu_dereference().
> 
> Bug report (3): https://syzkaller.appspot.com/bug?extid=f9acff9bf08a845f225d
> Reported-by: syzbot+f9acff9bf08a845f225d@syzkaller.appspotmail.com
> Reported-by: syzbot+6cb476b7c69916a0caca@syzkaller.appspotmail.com
> Reported-by: syzbot+9250865a55539d384347@syzkaller.appspotmail.com
> 
> Signed-off-by: Siddh Raman Pant code@siddh.me>
> ---
> Changes since v1 as requested:
> - Fixed commit heading and better commit message.
> - Clear pointer before freeing.
> 
>  include/net/cfg80211.h | 2 ++
>  net/wireless/scan.c    | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
> index 80f41446b1f0..7e0b448c4cdb 100644
> --- a/include/net/cfg80211.h
> +++ b/include/net/cfg80211.h
> @@ -2368,6 +2368,7 @@ struct cfg80211_scan_6ghz_params {
>   * @n_6ghz_params: number of 6 GHz params
>   * @scan_6ghz_params: 6 GHz params
>   * @bssid: BSSID to scan for (most commonly, the wildcard BSSID)
> + * @rcu_head: (internal) RCU head to use for freeing
>   */
>  struct cfg80211_scan_request {
>  	struct cfg80211_ssid *ssids;
> @@ -2397,6 +2398,7 @@ struct cfg80211_scan_request {
>  	bool scan_6ghz;
>  	u32 n_6ghz_params;
>  	struct cfg80211_scan_6ghz_params *scan_6ghz_params;
> +	struct rcu_head rcu_head;
>  
>  	/* keep last */
>  	struct ieee80211_channel *channels[];
> diff --git a/net/wireless/scan.c b/net/wireless/scan.c
> index 6d82bd9eaf8c..6cf58fe6dea0 100644
> --- a/net/wireless/scan.c
> +++ b/net/wireless/scan.c
> @@ -988,8 +988,8 @@ void ___cfg80211_scan_done(struct cfg80211_registered_device *rdev,
>  	kfree(rdev->int_scan_req);
>  	rdev->int_scan_req = NULL;
>  
> -	kfree(rdev->scan_req);
>  	rdev->scan_req = NULL;
> +	kfree_rcu(rdev_req, rcu_head);
>  
>  	if (!send_message)
>  		rdev->scan_msg = msg;
> -- 
> 2.35.1
> 

Hello,

Probably the above quoted patch was missed, which can be found on
https://lore.kernel.org/linux-wireless/20220726123921.29664-1-code@siddh.me/

This patch was posted more than 2 weeks ago, with changes as requested.

With the merge window almost ending, may I request for another look at
this patch?

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
