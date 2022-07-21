Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F21C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Jul 2022 10:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01CB58476B;
	Thu, 21 Jul 2022 10:11:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01CB58476B
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=FtYIS5s2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7_5SrBdbcnId; Thu, 21 Jul 2022 10:11:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E080884076;
	Thu, 21 Jul 2022 10:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E080884076
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6F61C0035;
	Thu, 21 Jul 2022 10:11:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1C8F4C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Jul 2022 10:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF3B660EB9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Jul 2022 10:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF3B660EB9
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=FtYIS5s2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IVJuuoH0Yxdj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Jul 2022 10:10:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4361A60A9B
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4361A60A9B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Jul 2022 10:10:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1658398238; cv=none; d=zohomail.in; s=zohoarc; 
 b=TuUjark3ZoO1ybUFDWDoKYnf85FuMcmZLMl4Rz1RsJggUJTi6Y9/0dD8VwsVQpkw8mw9hF6N0EF+uIBhTv2d6rXWG8Wo0/rAovaWJFml1TPd11bVMfL5CoqlD/mzG82/HxasCiety+ElNEM6QpGBgQdqeUkZVG5MBkZotT6j6qs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1658398238;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=S9vlg9DupEI3hGrDSSYRxpjlOWor/7zZq6QR1lSaYFM=; 
 b=Z8uhq08Da9Q6wotWXUh2hBo8Y+5ZUjmkTAFLUqYscQpa5Lm2C80dA2Jf5l9OIlsLOGF/RPsQGtBaV7ZP3B6o54nhRlvhKdOADkUUh0WuudzYzeo877l8m5VyDLPJuHgv7Nd+iNcFsniGBon9cHgrDX5jUkNRgTCFWlEMS7d99h4=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658398238; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=S9vlg9DupEI3hGrDSSYRxpjlOWor/7zZq6QR1lSaYFM=;
 b=FtYIS5s2p8VbWn0R/g+5uRbdwRq8z9NiOCNP4/mUZiuIzoUq7U57AX0g1BmmF5yT
 tS6mem/olhmalsEebm/Bn2MTzXvSw8MgoVDQr0L2oXyH4d7ZF/cNMA8hWWWUJOQZm48
 RI27Jnk8IRVa9jpFbVMORbk6F7VsZhbl88yJ/nFI=
Received: from localhost.localdomain (103.250.137.143 [103.250.137.143]) by
 mx.zoho.in with SMTPS id 1658398236739503.344263611177;
 Thu, 21 Jul 2022 15:40:36 +0530 (IST)
To: Johannes Berg <johannes@sipsolutions.net>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Message-ID: <20220721101018.17902-1-code@siddh.me>
Subject: [RESEND PATCH] net: Fix UAF in ieee80211_scan_rx()
Date: Thu, 21 Jul 2022 15:40:18 +0530
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: netdev <netdev@vger.kernel.org>,
 syzbot+6cb476b7c69916a0caca@syzkaller.appspotmail.com,
 linux-wireless <linux-wireless@vger.kernel.org>,
 syzbot+f9acff9bf08a845f225d@syzkaller.appspotmail.com,
 syzbot+9250865a55539d384347@syzkaller.appspotmail.com,
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
Resending because didn't get any reply from maintainers for more
than 2 weeks.

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
