Return-Path: <SRS0=nCKz=6I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68684C2BA1A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:42:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A1C420736
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A1C420736
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 04199879DB;
	Fri, 24 Apr 2020 09:42:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e1Smow1U1agx; Fri, 24 Apr 2020 09:42:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6E8C3821AB;
	Fri, 24 Apr 2020 09:42:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55DF8C089E;
	Fri, 24 Apr 2020 09:42:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33F1AC0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 11ED1203D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:42:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DC+XkpGsAKLU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:42:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
 by silver.osuosl.org (Postfix) with ESMTPS id 5CBD220013
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:42:18 +0000 (UTC)
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.93) (envelope-from <johannes@sipsolutions.net>)
 id 1jRuU9-00FRAm-SI; Fri, 24 Apr 2020 11:19:01 +0200
Message-ID: <89476ee074e782175d453038396543f193f8e5fd.camel@sipsolutions.net>
From: Johannes Berg <johannes@sipsolutions.net>
To: madhuparnabhowmik10@gmail.com, davem@davemloft.net, kuba@kernel.org
Date: Fri, 24 Apr 2020 11:18:59 +0200
In-Reply-To: <20200409082822.27314-1-madhuparnabhowmik10@gmail.com>
 (sfid-20200409_102851_270381_8F58A5E1)
References: <20200409082822.27314-1-madhuparnabhowmik10@gmail.com>
 (sfid-20200409_102851_270381_8F58A5E1)
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/4] net: mac80211: util.c: Fix
	RCU list usage warnings
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

Hi,

> This patch fixes the following warning (CONIG_PROVE_RCU_LIST)
> in ieee80211_check_combinations().

Thanks, and sorry for the delay.


> +++ b/net/mac80211/util.c
> @@ -254,7 +254,7 @@ static void __ieee80211_wake_txqs(struct ieee80211_sub_if_data *sdata, int ac)
>  
>  	sdata->vif.txqs_stopped[ac] = false;
>  
> -	list_for_each_entry_rcu(sta, &local->sta_list, list) {
> +	list_for_each_entry(sta, &local->sta_list, list) {
>  		if (sdata != sta->sdata)
>  			continue;

In this case, for example, I don't even understand why the warning would
happen, because certainly the only caller of this (_ieee80211_wake_txqs)
does rcu_read_lock()?

I'm also not convinced that the necessary lock is actually held here,
this comes from a tasklet that doesn't hold any locks?
 
I'd appreciate if you could add comments/explain why you think the
changes were right, or ideally even add "lockdep_assert_held()"
annotations. That would make it much easier to check this patch.

> @@ -3931,7 +3932,7 @@ int ieee80211_check_combinations(struct ieee80211_sub_if_data *sdata,
>  		params.num_different_channels++;
>  	}
>  
> -	list_for_each_entry_rcu(sdata_iter, &local->interfaces, list) {
> +	list_for_each_entry(sdata_iter, &local->interfaces, list) {
>  		struct wireless_dev *wdev_iter;
>  
>  		wdev_iter = &sdata_iter->wdev;
> @@ -3982,7 +3983,7 @@ int ieee80211_max_num_channels(struct ieee80211_local *local)
>  			ieee80211_chanctx_radar_detect(local, ctx);
>  	}
>  
> -	list_for_each_entry_rcu(sdata, &local->interfaces, list)
> +	list_for_each_entry(sdata, &local->interfaces, list)
>  		params.iftype_num[sdata->wdev.iftype]++;

These changes correct, as far as I can tell, in that they rely on the
RTNL now - but can you perhaps document that as well?

There doesn't seem to be any multi-lock version of lockdep_assert_held()
or is there? That'd be _really_ useful here, because I want to get rid
of some RTNL reliance in the longer term, and having annotation here
saying "either RTNL or iflist_mtx is fine" would be good.

johannes

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
