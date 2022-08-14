Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867E3C25B06
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Aug 2022 15:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F3F460BE2;
	Sun, 14 Aug 2022 15:15:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F3F460BE2
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=qG2uwrkj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fd26uUwWzgbu; Sun, 14 Aug 2022 15:15:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B27D760BED;
	Sun, 14 Aug 2022 15:15:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B27D760BED
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B846C0032;
	Sun, 14 Aug 2022 15:15:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5BC19C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 15:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0421C83E9F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 15:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0421C83E9F
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=qG2uwrkj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1zMM4mjlom7A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 15:15:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D8BD83E9B
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D8BD83E9B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 15:15:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1660490136; cv=none; d=zohomail.in; s=zohoarc; 
 b=P0DMXelA8rZr+5tpNnF6yG45AYFNAp+orQVwMoEoNU36lj2KNLAhBcqvPXhkEjeaFoYq6MyA17DiK4I0A3l17aI/Lcm0KOsEbGKV5jbMC8riMgRKjxS2PEYjW843EE7WGsU05zUu5E6wQsFB2XVPdJni+tSv+msrN2YrzSoclTY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1660490136;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=Vc8f/bR6BhLdNYT+B1nN0BGO6y9fqlas6nlpvef1JJI=; 
 b=VRRsUlpu/kFkS0lDXXYrUkehylNrf7iAPHo4MhQ6629Ix5dlK5WtWiBQbsHnsmh8+jlqi2YGX0ij1iXcHuDCKlUA7eqEW39lU9wisFQ/7TA9zvN2kMSi4QrwQdMJx2NlI99y8BvlGYCHt1w5Jd4rAEiLCGLOf4NmWNW+qdVJdU8=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660490136; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=Vc8f/bR6BhLdNYT+B1nN0BGO6y9fqlas6nlpvef1JJI=;
 b=qG2uwrkjvQvVaLteAYiN06fRfAxokADh32VxkVKlEj5gbvGV2+0KZ3Z3txOfNqxk
 7VxKz4tR79W2AhHUmjXzy3d27m/S57hs9Di5avdO4IlNXP071ru8ub+sUc6uAAnKk6d
 aojkofVw/A5JbzeUyiW8ooQ96PJCRe5ETeU1Eg7Q=
Received: from localhost.localdomain (103.86.19.140 [103.86.19.140]) by
 mx.zoho.in with SMTPS id 1660490133725920.3510862995147;
 Sun, 14 Aug 2022 20:45:33 +0530 (IST)
To: Johannes Berg <johannes@sipsolutions.net>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Message-ID: <20220814151512.9985-1-code@siddh.me>
Subject: [PATCH] wifi: mac80211: Don't finalize CSA in IBSS mode if state is
 disconnected
Date: Sun, 14 Aug 2022 20:45:12 +0530
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
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

When we are not connected to a channel, sending channel "switch"
announcement doesn't make any sense.

The BSS list is empty in that case. This causes the for loop in
cfg80211_get_bss() to be bypassed, so the function returns NULL
(check line 1424 of net/wireless/scan.c), causing the WARN_ON()
in ieee80211_ibss_csa_beacon() to get triggered (check line 500
of net/mac80211/ibss.c), which was consequently reported on the
syzkaller dashboard.

Thus, check if we have an existing connection before generating
the CSA beacon in ieee80211_ibss_finish_csa().

Fixes: cd7760e62c2a ("mac80211: add support for CSA in IBSS mode")
Bug report: https://syzkaller.appspot.com/bug?id=05603ef4ae8926761b678d2939a3b2ad28ab9ca6
Reported-by: syzbot+b6c9fe29aefe68e4ad34@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
The fixes commit is old, and syzkaller shows the problem exists for
4.19 and 4.14 as well, so CC'd stable list.

 net/mac80211/ibss.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/mac80211/ibss.c b/net/mac80211/ibss.c
index d56890e3fabb..9b283bbc7bb4 100644
--- a/net/mac80211/ibss.c
+++ b/net/mac80211/ibss.c
@@ -530,6 +530,10 @@ int ieee80211_ibss_finish_csa(struct ieee80211_sub_if_data *sdata)
 
 	sdata_assert_lock(sdata);
 
+	/* When not connected/joined, sending CSA doesn't make sense. */
+	if (ifibss->state != IEEE80211_IBSS_MLME_JOINED)
+		return -ENOLINK;
+
 	/* update cfg80211 bss information with the new channel */
 	if (!is_zero_ether_addr(ifibss->bssid)) {
 		cbss = cfg80211_get_bss(sdata->local->hw.wiphy,
-- 
2.35.1


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
