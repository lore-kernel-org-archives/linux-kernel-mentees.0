Return-Path: <SRS0=qNNM=4K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21129C35671
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Feb 2020 12:53:49 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD1C8206EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Feb 2020 12:53:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD1C8206EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A51AA8767B;
	Sat, 22 Feb 2020 12:53:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9VgYV6kPoqnf; Sat, 22 Feb 2020 12:53:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 29567875B3;
	Sat, 22 Feb 2020 12:53:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 127D9C1D81;
	Sat, 22 Feb 2020 12:53:47 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18C5EC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 12:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EE2B320382
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 12:53:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gSJbXcNj3TOu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 12:53:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
 by silver.osuosl.org (Postfix) with ESMTPS id 2418B20363
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 12:53:45 +0000 (UTC)
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.93) (envelope-from <johannes@sipsolutions.net>)
 id 1j5UHe-000fEg-Jf; Sat, 22 Feb 2020 13:53:26 +0100
Message-ID: <f1913847671d0b7e19aaa9bef1e1eb89febfa942.camel@sipsolutions.net>
From: Johannes Berg <johannes@sipsolutions.net>
To: madhuparnabhowmik10@gmail.com, davem@davemloft.net
Date: Sat, 22 Feb 2020 13:53:25 +0100
In-Reply-To: <20200222101831.8001-1-madhuparnabhowmik10@gmail.com>
 (sfid-20200222_112140_052707_ACC75C29)
References: <20200222101831.8001-1-madhuparnabhowmik10@gmail.com>
 (sfid-20200222_112140_052707_ACC75C29)
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31) 
MIME-Version: 1.0
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] net: mac80211: rx.c: Use
	built-in RCU list checking
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

On Sat, 2020-02-22 at 15:48 +0530, madhuparnabhowmik10@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> 
> list_for_each_entry_rcu() has built-in RCU and lock checking.
> 
> Pass cond argument to list_for_each_entry_rcu() to silence
> false lockdep warning when CONFIG_PROVE_RCU_LIST is enabled
> by default.

Umm. What warning?

> +++ b/net/mac80211/rx.c
> @@ -3547,7 +3547,8 @@ static void ieee80211_rx_cooked_monitor(struct ieee80211_rx_data *rx,
>  	skb->pkt_type = PACKET_OTHERHOST;
>  	skb->protocol = htons(ETH_P_802_2);
>  
> -	list_for_each_entry_rcu(sdata, &local->interfaces, list) {
> +	list_for_each_entry_rcu(sdata, &local->interfaces, list,
> +				lockdep_is_held(&rx->local->rx_path_lock)) {
>  		if (!ieee80211_sdata_running(sdata))
>  			continue;

This is not related at all.
 
> @@ -4114,7 +4115,8 @@ void __ieee80211_check_fast_rx_iface(struct ieee80211_sub_if_data *sdata)
>  
>  	lockdep_assert_held(&local->sta_mtx);
>  
> -	list_for_each_entry_rcu(sta, &local->sta_list, list) {
> +	list_for_each_entry_rcu(sta, &local->sta_list, list,
> +				lockdep_is_held(&local->sta_mtx)) {

And this isn't even a real RCU iteration, since we _must_ hold the mutex
here.

johannes

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
