Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFD4C32771
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Aug 2022 20:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE75B40B55;
	Fri, 19 Aug 2022 20:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE75B40B55
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=Neex3bMT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5S0kBWOPuyPW; Fri, 19 Aug 2022 20:05:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B165740222;
	Fri, 19 Aug 2022 20:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B165740222
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7BF1BC0033;
	Fri, 19 Aug 2022 20:05:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1FF63C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Aug 2022 20:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6D646115F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Aug 2022 20:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6D646115F
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=Neex3bMT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ehe_juxatBpF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Aug 2022 20:05:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48CD361149
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48CD361149
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Aug 2022 20:05:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1660939524; cv=none; d=zohomail.in; s=zohoarc; 
 b=YmzNaWO54q/8fCTIN4jaIZ5Ndxwp9+YSr/ByeZ1N7fM3t9mAdvJ8y6JVwVmhL749gAw2Crf1yFMBP/hmDlyxgG/vh5Z+ClbSGKiIy3i2NJwXvskTK6FyVe5N4KEHj2guGG5g6uEOd1go6jtRcc5iu0jDV2Sp2RVUv6Q4zeceEyk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1660939524;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=ZbOmMhea6mo0GiKmo4Riv4/f27wDQaFeMZfT8F4TkaM=; 
 b=OTX/jA3DUnqGI4oQNVaV6ZBR9X9H6EIAEQjLXa/wZaMOl2Z3TZz6wxSZaDXy6qqFp6N63Js0NPNTVCPXH/86DU53MrALzPgxdKM/rLiqEHfJ+Mwd1ibKenRYgvk9gbnU3Bpi+dALQyCOps/2DnjxwkyK+0mLveRSoXh3t9vdtSg=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660939524; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=ZbOmMhea6mo0GiKmo4Riv4/f27wDQaFeMZfT8F4TkaM=;
 b=Neex3bMTcjTpaHR6LmwPqzEz9gmMywdSnuGnLC4/0PQxWQHeQgjvg/vIyndPhGIP
 g5dCrqPdTnxpeuhMSYF1XsLA1i8oN+RIhwNXtxznyHNgESUSm8EUXMycuICmyI0cgU/
 tX8mu62ADEKmBazZSC65bTiBd2o0Fmvhr3jTdaC0=
Received: from localhost.localdomain (103.86.19.2 [103.86.19.2]) by mx.zoho.in
 with SMTPS id 1660939523728629.6711836985853;
 Sat, 20 Aug 2022 01:35:23 +0530 (IST)
To: Johannes Berg <johannes@sipsolutions.net>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Message-ID: <20220819200340.34826-1-code@siddh.me>
Subject: [PATCH v3] wifi: mac80211: Fix UAF in ieee80211_scan_rx()
Date: Sat, 20 Aug 2022 01:33:40 +0530
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 syzbot+f9acff9bf08a845f225d@syzkaller.appspotmail.com,
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

ieee80211_scan_rx() tries to access scan_req->flags after a
null check, but a UAF is observed when the scan is completed
and __ieee80211_scan_completed() executes, which then calls
cfg80211_scan_done() leading to the freeing of scan_req.

Since scan_req is rcu_dereference()'d, prevent the racing in
__ieee80211_scan_completed() by ensuring that from mac80211's
POV it is no longer accessed from an RCU read critical section
before we call cfg80211_scan_done().

Bug report: https://syzkaller.appspot.com/bug?extid=f9acff9bf08a845f225d
Reported-by: syzbot+f9acff9bf08a845f225d@syzkaller.appspotmail.com
Suggested-by: Johannes Berg <johannes@sipsolutions.net>
Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
Changes in v3:
Use Johannes Berg's suggestion as-it-is:
https://lore.kernel.org/netdev/18fd9b89d45aedc1504d0cbd299ffb289ae96438.camel@sipsolutions.net/

v2 is now obsolete since it was an incorrect way to go about things.

 net/mac80211/scan.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/net/mac80211/scan.c b/net/mac80211/scan.c
index fa8ddf576bc1..c4f2aeb31da3 100644
--- a/net/mac80211/scan.c
+++ b/net/mac80211/scan.c
@@ -469,16 +469,19 @@ static void __ieee80211_scan_completed(struct ieee80211_hw *hw, bool aborted)
 	scan_req = rcu_dereference_protected(local->scan_req,
 					     lockdep_is_held(&local->mtx));
 
-	if (scan_req != local->int_scan_req) {
-		local->scan_info.aborted = aborted;
-		cfg80211_scan_done(scan_req, &local->scan_info);
-	}
 	RCU_INIT_POINTER(local->scan_req, NULL);
 	RCU_INIT_POINTER(local->scan_sdata, NULL);
 
 	local->scanning = 0;
 	local->scan_chandef.chan = NULL;
 
+	synchronize_rcu();
+
+	if (scan_req != local->int_scan_req) {
+		local->scan_info.aborted = aborted;
+		cfg80211_scan_done(scan_req, &local->scan_info);
+	}
+
 	/* Set power back to normal operating levels. */
 	ieee80211_hw_config(local, 0);
 
-- 
2.35.1


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
