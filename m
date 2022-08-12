Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3425C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 12 Aug 2022 16:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74DA24021E;
	Fri, 12 Aug 2022 16:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74DA24021E
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=eHNSW7Wo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ftfg7Tim5Hv5; Fri, 12 Aug 2022 16:28:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2B586401BB;
	Fri, 12 Aug 2022 16:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B586401BB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D93B8C0033;
	Fri, 12 Aug 2022 16:28:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB290C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 16:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF5FA83E31
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 16:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF5FA83E31
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=eHNSW7Wo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z3zYqex-R5SQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 16:28:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44D3B83E30
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44D3B83E30
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 16:28:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1660321662; cv=none; d=zohomail.in; s=zohoarc; 
 b=TIgpFcuFRXdiCpes87hIIXQ1Wghp5OVWIe4nAx5WXJaOYHU9wRXjYHq3Se3qitu8+FUy+VvTryNkdXB6pXzkBDapNgLU7zvNwh13zsz+sxzsnwnzYKsXBJ2sKjbYK6L6D+PPlvkDFehWxOL0djZHrok1BQ8/CS9Lyt+8p916rDo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1660321662;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=MJyv8/T3AsC5yGTNAapmuhGn+zH2Um3nfzqkYfPuPP8=; 
 b=Lrf/qyekzRv0v+9jKCySkNuvUn1IS8CAvJSuYwlSNV7ieNCRblN+ZJuTt2izrO1H/iApvFU9hvfUl23azD0fgTbNuQOcUltGloqoA7MObnsHa2QqQ+RG5B09qQvZeQ7IMhTAt0j69vI6Gm9jBi2pKjXQhQtKI9pPa592naQC4vg=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660321662; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=MJyv8/T3AsC5yGTNAapmuhGn+zH2Um3nfzqkYfPuPP8=;
 b=eHNSW7WorTicEALoMtyy5z1MibmL3rbRlfw6YRakdsUSHN9KNBEsrQBwtZlk54dh
 +uPa8hy4gYw/wXbS6Tgy7Rcz3eGgiRYJiZuBcPov+m4YgdYxdfJ0zer8vc+zsYKFjly
 7/EBC+S49yXN3O1VKRs+Ru/ULy7EEDWsmGnFo6Y4=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1660321651956275.37477643119485;
 Fri, 12 Aug 2022 21:57:31 +0530 (IST)
Date: Fri, 12 Aug 2022 21:57:31 +0530
To: "Greg KH" <gregkh@linuxfoundation.org>
Message-ID: <18292e1dcd8.2359a549180213.8185874405406307019@siddh.me>
In-Reply-To: <YvZxfpY4JUqvsOG5@kroah.com>
References: <20220726123921.29664-1-code@siddh.me>
 <18291779771.584fa6ab156295.3990923778713440655@siddh.me>
 <YvZEfnjGIpH6XjsD@kroah.com>
 <18292791718.88f48d22175003.6675210189148271554@siddh.me>
 <YvZxfpY4JUqvsOG5@kroah.com>
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
 eric dumazet <edumazet@google.com>, syzbot+9250865a55539d384347
 <syzbot+9250865a55539d384347@syzkaller.appspotmail.com>,
 jakub kicinski <kuba@kernel.org>, johannes berg <johannes@sipsolutions.net>,
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
From: Siddh Raman Pant via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Siddh Raman Pant <code@siddh.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, 12 Aug 2022 20:57:58 +0530  Greg KH  wrote:
> rcu just delays freeing of an object, you might just be delaying the
> race condition.  Just moving a single object to be freed with rcu feels
> very odd if you don't have another reference somewhere.

As mentioned in patch message, in net/mac80211/scan.c, we have:
        void ieee80211_scan_rx(struct ieee80211_local *local, struct sk_buff *skb)
        {
                ...
                scan_req = rcu_dereference(local->scan_req);
                sched_scan_req = rcu_dereference(local->sched_scan_req);

                if (scan_req)
                        scan_req_flags = scan_req->flags;
                ...
        }

So scan_req is probably supposed to be protected by RCU.

Also, in ieee80211_local's definition at net/mac80211/ieee80211_i.h, we have:
        struct cfg80211_scan_request __rcu *scan_req;

Thus, scan_req is indeed supposed to be protected by RCU, which this patch
addresses by adding a RCU head to the type's struct, and using kfree_rcu().

The above snippet is where the UAF happens (you can refer to syzkaller's log),
because __cfg80211_scan_done() is called and frees the pointer.

Thanks,
Siddh

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
