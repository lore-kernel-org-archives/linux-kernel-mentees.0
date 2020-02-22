Return-Path: <SRS0=qNNM=4K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 739FDC35666
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Feb 2020 13:39:40 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29D4220702
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Feb 2020 13:39:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXLKlRfc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29D4220702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D66E3203B8;
	Sat, 22 Feb 2020 13:39:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pJv+ZbMyQ6wx; Sat, 22 Feb 2020 13:39:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B937F2039B;
	Sat, 22 Feb 2020 13:39:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AEB34C1AE2;
	Sat, 22 Feb 2020 13:39:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8995C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 13:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9F6DE8673C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 13:39:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cihfsQDVZ10K
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 13:39:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 097FB86689
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 13:39:37 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 7so418845pgr.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 05:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vpxT9jClDrKoKxPt0kmgtgiiuZoHxIxpAJPkebvXON0=;
 b=GXLKlRfcHhBTYgl1ilH4o6mibl1xTvcNCPXZFQNec8/NOTrpQtsfA1JP8KaNs3aYYg
 IKfHktkagA44VixY1m/yaksXVZI5mnnwvskjvQ1JJWZKSVnvNsI/JcinID87RR5f7yjq
 rHGb0hKXst4/I4k0njMJlneWTL1tuJdQbyMx/seEwj0Zf3U4AsBFvjnM2hGQyFL6APOV
 TtrndIYAHC20+ueeYgIK9XVKf6e1xpCSPWecjH8LXHahEI3yc98+initYn99IdzOFo27
 yid+lJqWR0oJoKtaGJcH7Tp8DfuMUG4Vdg6vkiq9v8McSlvmfVPiknC3XDMcYiyKlgA6
 ASdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vpxT9jClDrKoKxPt0kmgtgiiuZoHxIxpAJPkebvXON0=;
 b=Vaoi0i/spLKoj8/aFG6F+EjTxnMpvbcQCtZl9ypHd2nYcVy9Qcd0/Y19ZkWO4+Noya
 G1jENTo1AgPnxWy3aGsIjXGUbHNpimsi3ui/JOnhtlOIHsCnAZjpkRIVa6kstDFCxuZD
 6eddHqAn96iwxDCwKjiBC0/CWBJx68K4D8Sbxd8aCbYid4ehH3neo7tRx3DvhysUaLQi
 9c3xY7o7oSJffB6NrP7Yipp9mxjzqv2ENvDjlAM5dPih/UAq10HdTEm0CS6L7OZhg8oZ
 xOwYx0dlMGb9aJNJwTZI7I5GIOD3qR47InKoZx88Xte12jdWJang+gk2pwdbUct+IoM4
 9/FA==
X-Gm-Message-State: APjAAAU2jKDW02BlS8FAeqXsb6LgbGOgQ2IBAysS30TCiD9pgtZql/C1
 YSX7AxLtNhPGGbEjkx4NnQ==
X-Google-Smtp-Source: APXvYqwEKQ41EVLj6CR4+LTHf/M95sWALC35qShHEDBl/TpwOUcje2MB0Kb3HNksVa1H25ZDOgRBJg==
X-Received: by 2002:a62:f243:: with SMTP id y3mr43858640pfl.146.1582378776499; 
 Sat, 22 Feb 2020 05:39:36 -0800 (PST)
Received: from madhuparna-HP-Notebook ([42.109.145.199])
 by smtp.gmail.com with ESMTPSA id b12sm6517235pfr.26.2020.02.22.05.39.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 22 Feb 2020 05:39:35 -0800 (PST)
From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Google-Original-From: Madhuparna Bhowmik <change_this_user_name@gmail.com>
Date: Sat, 22 Feb 2020 19:09:28 +0530
To: Johannes Berg <johannes@sipsolutions.net>
Message-ID: <20200222133928.GA10397@madhuparna-HP-Notebook>
References: <20200222101831.8001-1-madhuparnabhowmik10@gmail.com>
 <f1913847671d0b7e19aaa9bef1e1eb89febfa942.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f1913847671d0b7e19aaa9bef1e1eb89febfa942.camel@sipsolutions.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, madhuparnabhowmik10@gmail.com,
 joel@joelfernandes.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net
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

On Sat, Feb 22, 2020 at 01:53:25PM +0100, Johannes Berg wrote:
> On Sat, 2020-02-22 at 15:48 +0530, madhuparnabhowmik10@gmail.com wrote:
> > From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> > 
> > list_for_each_entry_rcu() has built-in RCU and lock checking.
> > 
> > Pass cond argument to list_for_each_entry_rcu() to silence
> > false lockdep warning when CONFIG_PROVE_RCU_LIST is enabled
> > by default.
> 
> Umm. What warning?
>
If list_for_each_entry_rcu() is called from non rcu protection
i.e without holding rcu_read_lock, but under the protection of
a different lock then we can pass that as the condition for lockdep checking
because otherwise lockdep will complain if list_for_each_entry_rcu()
is used without rcu protection. So, if we do not pass this argument
(cond) it may lead to false lockdep warnings.

> > +++ b/net/mac80211/rx.c
> > @@ -3547,7 +3547,8 @@ static void ieee80211_rx_cooked_monitor(struct ieee80211_rx_data *rx,
> >  	skb->pkt_type = PACKET_OTHERHOST;
> >  	skb->protocol = htons(ETH_P_802_2);
> >  
> > -	list_for_each_entry_rcu(sdata, &local->interfaces, list) {
> > +	list_for_each_entry_rcu(sdata, &local->interfaces, list,
> > +				lockdep_is_held(&rx->local->rx_path_lock)) {
> >  		if (!ieee80211_sdata_running(sdata))
> >  			continue;
> 
> This is not related at all.

I analysed the following traces:
ieee80211_rx_handlers() -> ieee80211_rx_handlers_result() -> ieee80211_rx_cooked_monitor()

here ieee80211_rx_handlers() is holding the rx->local->rx_path_lock and
therefore I used this for the cond argument.

 If this is not right, can you help me in figuring out that which other
 lock is held?

and 
__ieee80211_rx_handle_packet() -> ieee80211_prepare_and_rx_handle() -> ieee80211_invoke_rx_handlers() -> 
ieee80211_rx_handlers_result() -> ieee80211_rx_cooked_monitor()

Here __ieee80211_rx_handle_packet() should be called under
rcu_read_lock protection.
So this trace seems okay and no need to pass any cond.

I may have missed something, please correct me in that case.

> > @@ -4114,7 +4115,8 @@ void __ieee80211_check_fast_rx_iface(struct ieee80211_sub_if_data *sdata)
> >  
> >  	lockdep_assert_held(&local->sta_mtx);
> >  
> > -	list_for_each_entry_rcu(sta, &local->sta_list, list) {
> > +	list_for_each_entry_rcu(sta, &local->sta_list, list,
> > +				lockdep_is_held(&local->sta_mtx)) {
> 
> And this isn't even a real RCU iteration, since we _must_ hold the mutex
> here.
>
Yeah exactly, dropping _rcu (use list_for_each_entry()) would be a good option in this case.
Let me know if that is alright and I will send a new patch with all the
changes required.

Thank you,
Madhuparna

> johannes
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
