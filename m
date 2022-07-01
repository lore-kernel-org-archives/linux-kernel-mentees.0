Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4CDC43334
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  1 Jul 2022 14:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26D4984611;
	Fri,  1 Jul 2022 14:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26D4984611
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=QB2xsFvT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MvBJOF4lplWY; Fri,  1 Jul 2022 14:55:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2FC7584022;
	Fri,  1 Jul 2022 14:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FC7584022
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09288C0032;
	Fri,  1 Jul 2022 14:55:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17E6FC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Jul 2022 14:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D72D342477
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Jul 2022 14:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D72D342477
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=QB2xsFvT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NKnnR8b3zfn2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Jul 2022 14:55:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D674E42460
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D674E42460
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Jul 2022 14:55:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1656687325; cv=none; d=zohomail.in; s=zohoarc; 
 b=FiEaSlyeB5dJSM7DRWxy7RLVHSOSwxAuUQwWW/z+v3/iTTBRgQqhqjhn8WsmlaiZdMhy0qQ8Wxt4An/fhPhMXhy3gm7t8kCCus+apZY+9UDadMbP05nMLMOoG6dgIlEkm5lrndF7s2iyaQmkpgdN0QDKFwoAImnDTzZNHsSxq5o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1656687325;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=CrcF49UEX8SWd4LvC7g+h7rckFp6IPoWnRfYza7Wpf4=; 
 b=EQJdwhLyt76VZ7lKH/G1DVNEeFyuhp2Kdj4E61jM1HYf/eu/gw1/lcd3LEp9FmCjJjgs0kp60bKQddBpG4NO0EQl7lCabNdTZWEyRWQwUIwinocRC/TWoamlGroVKDrnEC9R6i3uimRN0bEnjct3DWMxjIVjYLXIDiIHzN3i4s0=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1656687325; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=CrcF49UEX8SWd4LvC7g+h7rckFp6IPoWnRfYza7Wpf4=;
 b=QB2xsFvTFpkZpGWLYG/6EoL1vFDTxljo0BxBdEabq/ZUrVzoHxexceL2nc4VXXJh
 UW//enYAdJiTYS7yuE98h10sTM9umYD6qmp8rljEBDEniUJmAUWr7WPmNk2E8B3C9dO
 05iAWpaiLEtNxDVZW/OK3q3QB9LZ2+z0tPD6iSTU=
Received: from localhost.localdomain (103.250.137.221 [103.250.137.221]) by
 mx.zoho.in with SMTPS id 1656687324349795.6718155316092;
 Fri, 1 Jul 2022 20:25:24 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Johannes Berg <johannes@sipsolutions.net>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Message-ID: <20220701145423.53208-1-code@siddh.me>
Subject: [PATCH] net: Fix UAF in ieee80211_scan_rx()
Date: Fri,  1 Jul 2022 20:24:23 +0530
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

ieee80211_scan_rx() tries to access scan_req->flags after a null check
(see line 303 of mac80211/scan.c), but ___cfg80211_scan_done() uses
kfree() on the scan_req (see line 991 of wireless/scan.c).

This results in a UAF.

ieee80211_scan_rx() is called inside a RCU read-critical section
initiated by ieee80211_rx_napi() (see line 5043 of mac80211/rx.c).

Thus, add an rcu_head to the scan_req struct so as to use kfree_rcu()
instead of kfree() so that we don't free during the critical section.

Bug report (3): https://syzkaller.appspot.com/bug?extid=f9acff9bf08a845f225d
Reported-by: syzbot+f9acff9bf08a845f225d@syzkaller.appspotmail.com
Reported-by: syzbot+6cb476b7c69916a0caca@syzkaller.appspotmail.com
Reported-by: syzbot+9250865a55539d384347@syzkaller.appspotmail.com

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 include/net/cfg80211.h | 2 ++
 net/wireless/scan.c    | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 6d02e12e4702..ba4a49884de8 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -2368,6 +2368,7 @@ struct cfg80211_scan_6ghz_params {
  * @n_6ghz_params: number of 6 GHz params
  * @scan_6ghz_params: 6 GHz params
  * @bssid: BSSID to scan for (most commonly, the wildcard BSSID)
+ * @rcu_head: (internal) RCU head to use for freeing
  */
 struct cfg80211_scan_request {
 	struct cfg80211_ssid *ssids;
@@ -2397,6 +2398,7 @@ struct cfg80211_scan_request {
 	bool scan_6ghz;
 	u32 n_6ghz_params;
 	struct cfg80211_scan_6ghz_params *scan_6ghz_params;
+	struct rcu_head rcu_head;
 
 	/* keep last */
 	struct ieee80211_channel *channels[];
diff --git a/net/wireless/scan.c b/net/wireless/scan.c
index 6d82bd9eaf8c..638b2805222c 100644
--- a/net/wireless/scan.c
+++ b/net/wireless/scan.c
@@ -988,7 +988,7 @@ void ___cfg80211_scan_done(struct cfg80211_registered_device *rdev,
 	kfree(rdev->int_scan_req);
 	rdev->int_scan_req = NULL;
 
-	kfree(rdev->scan_req);
+	kfree_rcu(rdev->scan_req, rcu_head);
 	rdev->scan_req = NULL;
 
 	if (!send_message)
-- 
2.35.1


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
