Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3E8C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Jul 2022 09:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D2A041083;
	Tue, 26 Jul 2022 09:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D2A041083
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lC1xEo0g
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nuuch76TRZ-d; Tue, 26 Jul 2022 09:55:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 171354104D;
	Tue, 26 Jul 2022 09:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 171354104D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D328EC0035;
	Tue, 26 Jul 2022 09:55:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41FE5C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jul 2022 09:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 119FE4104D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jul 2022 09:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 119FE4104D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6O1WY3LUsLaq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jul 2022 09:55:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41400403E7
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41400403E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jul 2022 09:55:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1E18E615BB;
 Tue, 26 Jul 2022 09:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83237C341C0;
 Tue, 26 Jul 2022 09:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658829315;
 bh=Cl1l+U2SKW3B5tix69GFq95FJ/iJ6Bont4e7CRkL1v8=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=lC1xEo0gfzzUVwatQxvbSQu4ZGe6NqindV1IGvEglwjzOSmohPBCB+soJ/fBLcSaJ
 PjNUVjMbTgBOusciWMHMkigbnm52nMtBhrC1OEnwIMEB1fq7g3AL1Vki3oiBygD9uz
 AkjOXi8413PMyxk715mnKl945jgdrDpK4ZhqPiQoooeEyP66KusC6kLQZn+p1nRQ93
 5yAY5j14gaVS5iQmGpK08kplSeCcfdTeAnczK5/aZOBWNUuARpz6VQZvT38nJ9/fCd
 66F9OH05vk4CBuvu4GMmKzgxLicZotDiDrL+CNJUYuhJv1n5tnWwkd+DDm6dDmKHRv
 69UUs1C9hfYmg==
From: Kalle Valo <kvalo@kernel.org>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH] net: Fix UAF in ieee80211_scan_rx()
References: <20220701145423.53208-1-code@siddh.me>
Date: Tue, 26 Jul 2022 12:55:06 +0300
In-Reply-To: <20220701145423.53208-1-code@siddh.me> (Siddh Raman Pant's
 message of "Fri, 1 Jul 2022 20:24:23 +0530")
Message-ID: <8735eomc5h.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Cc: netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Siddh Raman Pant <code@siddh.me> writes:

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

The title should be:

wifi: cfg80211: Fix UAF in ieee80211_scan_rx()

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
