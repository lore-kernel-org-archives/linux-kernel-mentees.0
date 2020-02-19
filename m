Return-Path: <SRS0=HLeX=4H=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F56AC3404D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Feb 2020 09:12:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 231012465D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Feb 2020 09:12:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6gHGceS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 231012465D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D8BD520343;
	Wed, 19 Feb 2020 09:12:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y0okuEBeyC8Q; Wed, 19 Feb 2020 09:12:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5FB401FEB7;
	Wed, 19 Feb 2020 09:12:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E0D3C1D80;
	Wed, 19 Feb 2020 09:12:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6B2EC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 09:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C043C8620F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 09:12:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lv85QRQkkVR6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 09:12:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1B10485F96
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 09:12:33 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id d9so12415140pgu.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 01:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mn4zsjlzynntfOs5YFb07oY3dWpb5D0zaBJYwASVQWY=;
 b=G6gHGceS0yAmiHRQ/TMZbsluyMQ1XzeYXax7LBY7adHSvicxi2bo/GVfPp7ucUV/TS
 LyMb5uocPPTHdhXzuKMCff0rZI8EupnzAxxLE8h/rrp/k7yaj6Wl0WOA9pnVuBuW6vp4
 aNJ/sEFRM5pTwAlDWEcwnD8935Eupw7rX2OXFD1XOaZQsxliVpzCfUzSgZGrghz9uYOb
 +Gqgkll4YMjV9s8GQQAtbnxLrj2kaRdYec4FTp8H4hN49EYjKtjIneSIxvCqAzEyVWQV
 VU5TxIj93vH1Q4l5DWndMunaR1aWkNIBzz0sCRk9B+n4AozUTdy72qyCXUpXaWODLbcS
 ZPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mn4zsjlzynntfOs5YFb07oY3dWpb5D0zaBJYwASVQWY=;
 b=ts1UXXRXQUjxc0uG7zW5Hdd9JvpNaOISUF/MAOyOHe031+VVIGspX54y4GEBM42GDv
 3nG27RiCDEmRTLILVEWCa1lrS2QZk+xbNq+bZSWB+SHivf0gyRA2OqnSX6QQNt1Ei6zO
 eNYMnVIzowZAWYhnJzSKTPysxdVCGKAMkhNChDrqIzDu4aqFGyykCjiJFv67uBVBbn5R
 /zj5N+58hddQQt4Oh9earXHaQcsWVZWfZJfktc+J5cDq54PSIfau9g9EQB+Fz5Vg3gNE
 sJIGwVCnznZThXMaeL46jVHFb+qS0lVtCxoMO1sOwdXnMP944axc4uxgYHN4kg/zUJay
 c/rA==
X-Gm-Message-State: APjAAAVkV8XJaXAsNkDTm5/sZ15/2iT/yavUySes16e4UwUyHQD/49DC
 3wF6PNFzceFLZIeiU1VTHAM=
X-Google-Smtp-Source: APXvYqysCxVXMoTrskLDknj6A+zYSggTxDmnhSSnVmwhyNIO6fwm//kfNy0Yb6rVqHQj9Fsr5aKc2Q==
X-Received: by 2002:a65:5281:: with SMTP id y1mr26294515pgp.327.1582103552650; 
 Wed, 19 Feb 2020 01:12:32 -0800 (PST)
Received: from localhost.localdomain ([146.196.37.220])
 by smtp.googlemail.com with ESMTPSA id b18sm2074688pfb.116.2020.02.19.01.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 01:12:32 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 19 Feb 2020 14:41:04 +0530
Message-Id: <20200219091102.10709-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] cfg80211: Pass lockdep expression to
	RCU lists
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

rdev->sched_scan_req_list maybe traversed using list_for_each_entry_rcu
outside an RCU read-side critical section but under the protection
of rtnl_mutex.

Hence, add corresponding lockdep expression to silence false-positive
warnings, and harden RCU lists.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 net/wireless/scan.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/net/wireless/scan.c b/net/wireless/scan.c
index aef240fdf8df..7f1af8f347b1 100644
--- a/net/wireless/scan.c
+++ b/net/wireless/scan.c
@@ -556,9 +556,8 @@ cfg80211_find_sched_scan_req(struct cfg80211_registered_device *rdev, u64 reqid)
 {
 	struct cfg80211_sched_scan_request *pos;
 
-	WARN_ON_ONCE(!rcu_read_lock_held() && !lockdep_rtnl_is_held());
-
-	list_for_each_entry_rcu(pos, &rdev->sched_scan_req_list, list) {
+	list_for_each_entry_rcu(pos, &rdev->sched_scan_req_list, list,
+				lockdep_rtnl_is_held()) {
 		if (pos->reqid == reqid)
 			return pos;
 	}
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
