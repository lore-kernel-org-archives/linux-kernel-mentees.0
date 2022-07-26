Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74738C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Jul 2022 10:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3EF983F86;
	Tue, 26 Jul 2022 10:07:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3EF983F86
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kYYITZtL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AZvkiMCeUeJM; Tue, 26 Jul 2022 10:07:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 04E2283F0A;
	Tue, 26 Jul 2022 10:07:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04E2283F0A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC371C0035;
	Tue, 26 Jul 2022 10:07:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B0FDC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jul 2022 10:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C849341BA5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jul 2022 10:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C849341BA5
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20210112 header.b=kYYITZtL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dwV0Q65Bcc4k
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jul 2022 10:07:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9541A417B3
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9541A417B3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jul 2022 10:07:29 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id 7so24612188ybw.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jul 2022 03:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eptp1f76nSR7hEUsePloA5aK8E66pD/xnYvzEDwBNmM=;
 b=kYYITZtLdjINtcyVlpignWgeGX4iav62tqrI7FVm6/Xt9pZ0dSulgYQK9/aL9XNzeg
 Dx3KZBuVwHCKvNENqX0oDFJ/KHlBD/ZtkYZOAi8nzAhseZfsPhCffPh1OZMFqtasLVF0
 GFPP/JDfDjnDFqbw3vcC541SiTSV5CU8bgJkfQhqPhtg31smFhE1Y3BL8Tr+btd4fYj2
 6FbM+ZzgrNAlhlExwG5J2ha4peQEkbO09NncgIVXY2c8+w+oBwn8ErjjZtRxly0UBuYY
 H2KSxJIacnKVSEwvvGNJ3MN4iBKMilSa6XPHab2qXegjhCUX20MSPmgEGGRE8bxh/n2w
 Vcpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eptp1f76nSR7hEUsePloA5aK8E66pD/xnYvzEDwBNmM=;
 b=h1EnJdXdZ/Xmve9rKq8eHAOke2aPqoJcwxafkuXbm0Cj3k+trEkpfaFmWRT0A5yb4o
 zLO/GilE8Y034924sb37dLrA6y+Smb8meEnauG4dsKtILVSAaO0WJ7QCsffd2LQ7aKeL
 H8H6dce0//FraUwv7rueXNSdRiHEaq1Jl4C3f6dCKBlfEMtOq3KZvV0rs+Ioiz1z5qHM
 bLDOl+Tz88VYvfQPSiGQANb4hH6vwpiM/379LC8o0y3v9JEF2xt2o3HOy7wThcUfhgmw
 bT/XOqshmVZlAr4buYo+pSxAdiDirWzkIJ3/91tvwyZW1XUsbFA76Jkv4zvWb/29ayKm
 bbBQ==
X-Gm-Message-State: AJIora8KvgMh5H78KtAagkk5GycIkvSKcdd5/sMODT6v72D6POAIiS7P
 QgFBurftBqVlwYbkWZemWmQgCZcyk8umYvm10r4hVw==
X-Google-Smtp-Source: AGRyM1tUPgbPgGLtSzX4pvr8Ba22P4rYPqMQlG+L2K39fjjMFw2BowaAtAGTwG1EoVhuNFpFgMoVUB+142tJDEbYb8U=
X-Received: by 2002:a05:6902:114b:b0:66f:d0:57c7 with SMTP id
 p11-20020a056902114b00b0066f00d057c7mr12779019ybu.55.1658830048241; Tue, 26
 Jul 2022 03:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220701145423.53208-1-code@siddh.me>
In-Reply-To: <20220701145423.53208-1-code@siddh.me>
Date: Tue, 26 Jul 2022 12:07:16 +0200
Message-ID: <CANn89iLN27NWA7Stkr4ODp6V-Q-3em0dJ2JixDMNcNY7Ap5muA@mail.gmail.com>
Subject: Re: [PATCH] net: Fix UAF in ieee80211_scan_rx()
To: Siddh Raman Pant <code@siddh.me>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 "David S . Miller" <davem@davemloft.net>
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
From: Eric Dumazet via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Eric Dumazet <edumazet@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, Jul 1, 2022 at 4:55 PM Siddh Raman Pant <code@siddh.me> wrote:
>
> ieee80211_scan_rx() tries to access scan_req->flags after a null check
> (see line 303 of mac80211/scan.c), but ___cfg80211_scan_done() uses
> kfree() on the scan_req (see line 991 of wireless/scan.c).
>
> This results in a UAF.
>
> ieee80211_scan_rx() is called inside a RCU read-critical section
> initiated by ieee80211_rx_napi() (see line 5043 of mac80211/rx.c).
>
> Thus, add an rcu_head to the scan_req struct so as to use kfree_rcu()
> instead of kfree() so that we don't free during the critical section.
>
> Bug report (3): https://syzkaller.appspot.com/bug?extid=f9acff9bf08a845f225d
> Reported-by: syzbot+f9acff9bf08a845f225d@syzkaller.appspotmail.com
> Reported-by: syzbot+6cb476b7c69916a0caca@syzkaller.appspotmail.com
> Reported-by: syzbot+9250865a55539d384347@syzkaller.appspotmail.com
>
> Signed-off-by: Siddh Raman Pant <code@siddh.me>
> ---
>  include/net/cfg80211.h | 2 ++
>  net/wireless/scan.c    | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
> index 6d02e12e4702..ba4a49884de8 100644
> --- a/include/net/cfg80211.h
> +++ b/include/net/cfg80211.h
> @@ -2368,6 +2368,7 @@ struct cfg80211_scan_6ghz_params {
>   * @n_6ghz_params: number of 6 GHz params
>   * @scan_6ghz_params: 6 GHz params
>   * @bssid: BSSID to scan for (most commonly, the wildcard BSSID)
> + * @rcu_head: (internal) RCU head to use for freeing
>   */
>  struct cfg80211_scan_request {
>         struct cfg80211_ssid *ssids;
> @@ -2397,6 +2398,7 @@ struct cfg80211_scan_request {
>         bool scan_6ghz;
>         u32 n_6ghz_params;
>         struct cfg80211_scan_6ghz_params *scan_6ghz_params;
> +       struct rcu_head rcu_head;
>
>         /* keep last */
>         struct ieee80211_channel *channels[];
> diff --git a/net/wireless/scan.c b/net/wireless/scan.c
> index 6d82bd9eaf8c..638b2805222c 100644
> --- a/net/wireless/scan.c
> +++ b/net/wireless/scan.c
> @@ -988,7 +988,7 @@ void ___cfg80211_scan_done(struct cfg80211_registered_device *rdev,
>         kfree(rdev->int_scan_req);
>         rdev->int_scan_req = NULL;
>
> -       kfree(rdev->scan_req);
> +       kfree_rcu(rdev->scan_req, rcu_head);
>         rdev->scan_req = NULL;

Note: this is slightly racy.

You are supposed to follow this order in this situation.

1) Clear the pointer

Then:

2) wait an rcu grace period (synchronize_rcu()) or use call_rcu()/kfree_rcu().



>
>         if (!send_message)
> --
> 2.35.1
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
