Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127B3C04AA5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Aug 2022 20:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99EAE417BA;
	Wed, 24 Aug 2022 20:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99EAE417BA
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=f6VU8o9Z
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fJD8F_vPh3vA; Wed, 24 Aug 2022 20:12:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 55322417B8;
	Wed, 24 Aug 2022 20:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55322417B8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 149F5C0033;
	Wed, 24 Aug 2022 20:12:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3BB27C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 20:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08A30404C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 20:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08A30404C2
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=f6VU8o9Z
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V5GHLyGUh0Vb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 20:12:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1609401C2
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1609401C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 20:12:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1661371910; cv=none; d=zohomail.in; s=zohoarc; 
 b=C8kXq44ddm3iaKNd1oRbVUneTC5/YlLrbJKbYJFrSyOwIJMx/hjq0CgILBvnIFJPAVQSicL+m8qOpokoVw3ZMaPWfY1DqHUgDEFlLM4BR9i89XFS87vmf19Y8fqV0KN/bA2q4Xjyd0rqGh14dB9VWNk7WC1qPeTFNuguiIM83M8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1661371910;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=o8+2mxY1s6gN8Aqlaw9vhuuz0VwD5wwLUGg9+r5eCc8=; 
 b=a2y/UZCDL2gII40gkzMEX9teyJwQWRpdW3QqwSBCO0+lko9tBStKMq5Y9iXI32kmFCGqO+zsYv0vipLJ0JM4ZtGxGEIimp76gV0RiAH+uLPsBv7xo6taYzrPvLNRJKjocfXPwGu9qkAnzZxJ8hvAraFh47hj1R4DbRzuU/D72L8=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1661371910; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=o8+2mxY1s6gN8Aqlaw9vhuuz0VwD5wwLUGg9+r5eCc8=;
 b=f6VU8o9ZHQIjTgQ3f038x8f+Fkqlna8W0jgLN3dR6uixc8bnzogi1i9up8y56WTy
 RDBnD0ONbiYGEnVYm/gCbndaiFK/AmidbOtlavg2JYTJHdgCJ7krSJGUL/6L26Ttrcr
 6Nbi62weq+h7ahrASJ+PzNuuJedi/aX/74v2u5QI=
Received: from localhost.localdomain (103.249.233.18 [103.249.233.18]) by
 mx.zoho.in with SMTPS id 1661371907172679.3555503675442;
 Thu, 25 Aug 2022 01:41:47 +0530 (IST)
To: Siddh Raman Pant <code@siddh.me>
Message-ID: <20220824201136.182039-1-code@siddh.me>
Subject: Re: [PATCH] wifi: mac80211: Don't finalize CSA in IBSS mode if state
 is disconnected
Date: Thu, 25 Aug 2022 01:41:36 +0530
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814151512.9985-1-code@siddh.me>
References: <20220814151512.9985-1-code@siddh.me>
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Eric Dumazet <edumazet@google.com>, netdev <netdev@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 Paolo Abeni <pabeni@redhat.com>,
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
From: Siddh Raman Pant via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Siddh Raman Pant <code@siddh.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sun, 14 Aug 2022 20:45:12 +0530  Siddh Raman Pant  wrote:
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

Tested-by: syzbot+b6c9fe29aefe68e4ad34@syzkaller.appspotmail.com

Syzbot is now booting properly and the test ran successfully.

Thanks,
Siddh

> Signed-off-by: Siddh Raman Pant <code@siddh.me>
> ---
> The fixes commit is old, and syzkaller shows the problem exists for
> 4.19 and 4.14 as well, so CC'd stable list.
> 
>  net/mac80211/ibss.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/net/mac80211/ibss.c b/net/mac80211/ibss.c
> index d56890e3fabb..9b283bbc7bb4 100644
> --- a/net/mac80211/ibss.c
> +++ b/net/mac80211/ibss.c
> @@ -530,6 +530,10 @@ int ieee80211_ibss_finish_csa(struct ieee80211_sub_if_data *sdata)
>  
>  	sdata_assert_lock(sdata);
>  
> +	/* When not connected/joined, sending CSA doesn't make sense. */
> +	if (ifibss->state != IEEE80211_IBSS_MLME_JOINED)
> +		return -ENOLINK;
> +
>  	/* update cfg80211 bss information with the new channel */
>  	if (!is_zero_ether_addr(ifibss->bssid)) {
>  		cbss = cfg80211_get_bss(sdata->local->hw.wiphy,
> -- 
> 2.35.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
