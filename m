Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952E8C43334
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Jul 2022 12:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21AD4418E5;
	Tue, 26 Jul 2022 12:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21AD4418E5
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=LqDgFxJ4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id omYbECPUbS3a; Tue, 26 Jul 2022 12:39:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 76622418DA;
	Tue, 26 Jul 2022 12:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76622418DA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3BDF1C0033;
	Tue, 26 Jul 2022 12:39:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69D8AC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jul 2022 12:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F989610B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jul 2022 12:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F989610B2
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=LqDgFxJ4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rcLzBcVaDiR8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jul 2022 12:39:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A2E560B0B
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A2E560B0B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jul 2022 12:39:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1658839167; cv=none; d=zohomail.in; s=zohoarc; 
 b=UkfuxHVLOwO/vn5hQmBft+g6uXh5aUV1+rD/VBC9ql1x2s1rMdkRKWSULiAbebxfR/MSK+qdzn+OnOf7NMUnOHQ57oCU3HX3xhwMVDOQf9vIJGoBfgRxVp8aKGU7AVIpjLOSrw1PbOSXUYaDZSMEXO48ClWDs+Lfl4+WG0RO89c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1658839167;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=UWd274VYR1WKzP/YgplPfzV3z+zLp7Z125urE755fUM=; 
 b=QvZvg9dVjsKln67kWE0aija4i5+ghMJp5YfYaJk2KYHmUrfh8Kg9WksFSajUUOUZZziuDuHwnr8V9guDo3eVd7ycHdr8xbJf/CCp2vy5vnigA1qCU4i1lRuBIUa+h2uwBC7eR4tSl10hgATJPR+pagwAzDzA2CNUa7VA1Y3M+sw=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658839167; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=UWd274VYR1WKzP/YgplPfzV3z+zLp7Z125urE755fUM=;
 b=LqDgFxJ4AeYBp4bkbR6w70NQ2bdc9fL3GxdkQIHkMTSd9yxCamFTE4AtO1bzE1Zu
 NX7Tu4CmcOyQ2dTUYqyxAkbTkmY8bgd1ruIHZcOcZRQM/9JDcWw+y746el1eKOLYZry
 5rQbUZEEZJv/9CMfr1eYdtCzNHHSusI33CNGf2Ag=
Received: from localhost.localdomain (103.240.204.132 [103.240.204.132]) by
 mx.zoho.in with SMTPS id 1658839166242252.82637890145338;
 Tue, 26 Jul 2022 18:09:26 +0530 (IST)
To: Johannes Berg <johannes@sipsolutions.net>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Message-ID: <20220726123921.29664-1-code@siddh.me>
Subject: [PATCH v2] wifi: cfg80211: Fix UAF in ieee80211_scan_rx()
Date: Tue, 26 Jul 2022 18:09:21 +0530
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
initiated by ieee80211_rx_napi() (see line 5044 of mac80211/rx.c).

Thus, add an rcu_head to the scan_req struct, so that we can use
kfree_rcu() instead of kfree() and thus not free during the critical
section.

We can clear the pointer before freeing here, since scan_req is
accessed using rcu_dereference().

Bug report (3): https://syzkaller.appspot.com/bug?extid=f9acff9bf08a845f225d
Reported-by: syzbot+f9acff9bf08a845f225d@syzkaller.appspotmail.com
Reported-by: syzbot+6cb476b7c69916a0caca@syzkaller.appspotmail.com
Reported-by: syzbot+9250865a55539d384347@syzkaller.appspotmail.com

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
Changes since v1 as requested:
- Fixed commit heading and better commit message.
- Clear pointer before freeing.

 include/net/cfg80211.h | 2 ++
 net/wireless/scan.c    | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 80f41446b1f0..7e0b448c4cdb 100644
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
index 6d82bd9eaf8c..6cf58fe6dea0 100644
--- a/net/wireless/scan.c
+++ b/net/wireless/scan.c
@@ -988,8 +988,8 @@ void ___cfg80211_scan_done(struct cfg80211_registered_device *rdev,
 	kfree(rdev->int_scan_req);
 	rdev->int_scan_req = NULL;
 
-	kfree(rdev->scan_req);
 	rdev->scan_req = NULL;
+	kfree_rcu(rdev_req, rcu_head);
 
 	if (!send_message)
 		rdev->scan_msg = msg;
-- 
2.35.1


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
