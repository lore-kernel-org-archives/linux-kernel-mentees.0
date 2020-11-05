Return-Path: <SRS0=u7S/=EL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A8DC5517A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Nov 2020 15:56:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E61002078E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Nov 2020 15:56:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwLJVzbY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E61002078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5E7F286D85;
	Thu,  5 Nov 2020 15:56:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2+do3x4Z44xf; Thu,  5 Nov 2020 15:56:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E6FC386D2D;
	Thu,  5 Nov 2020 15:56:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D083CC088B;
	Thu,  5 Nov 2020 15:56:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 325A9C0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Nov 2020 15:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 19C9486D2D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Nov 2020 15:56:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zwJu4IFo3mAl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Nov 2020 15:56:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 06B0986D41
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Nov 2020 15:56:28 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id w20so289246pjh.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 05 Nov 2020 07:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0TyRW4uWJJtZcAW80DlztYPoMgVPukL6fuFYNjjkzDE=;
 b=CwLJVzbYeqMzwKr8N4c0irQdu/f97dx0RKkTorEdzvvTffs+0V8F7lfwdH4jpz7v0V
 4hY8MG81Xn4RgMBDNj5Icl/qMMibAXHmp1sdvvMX4IYVBQ32MFzzbGwAkT/mJhdHZy3L
 eHToAsxrCiRFUC15wNY0WrGDOavL5b3+xW5jaORefVxjMmZOk9Hka9w8tzBeeuas/jAT
 htExxA1jMPlWsGImkT25mD8uMsWLarf5hglLSBrLETRPtJiBpRSAZV49spj9nX1XcyUF
 QDrnaYexaB3zFCCVfGwFS4xNDa47SImXc8JBORQhIHNcQ6BaqZAopm5n30JhAaKZ1F9d
 1t3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0TyRW4uWJJtZcAW80DlztYPoMgVPukL6fuFYNjjkzDE=;
 b=CQ3CCHEIQqPY+oZuTGt9IwUfpKGhT2ZJa6fYg5k+7s9tTerLXTXGHXLX9v+KxYraWV
 W1ZiSa+IBeUU4gBEVuxdlL+hsM5cp/wqKuc/D0hx6talqwvrFxfgsdBlT1qb8RYppZe0
 Y5iUcpFKXKzuTk6hnoYa52K9LGiSK59W91KTiIYMMnqEfXuFsxrkxluLi+BBDruFKdlC
 bKmE7baWMbQW/tQGO/CthyJt5LT+TAgZJF8ffZ6+aytKDM6WI/Jd81D44lI0ujV7en5O
 sK6NiNAfnaxX9/Ow62Oep8J2Cnf52b7L6umq7hlDRisoulBnrHvNHA+tq+HyTeSY3GBs
 lvUg==
X-Gm-Message-State: AOAM533EATIHh00+nNh1XFSKm8Hxz3aJb2IoXacI5+1Pnj0WKgi1EEqE
 XduyF9ebUTMy0hehLg3xZ3k=
X-Google-Smtp-Source: ABdhPJwUYkZrB2yh0Ep+0HNwhtXh6FsGHYcWVuYvcSY3LanQmju6FwFNaW+0fMaSheXxulRl4zNhOw==
X-Received: by 2002:a17:90a:62c1:: with SMTP id
 k1mr3093670pjs.135.1604591787299; 
 Thu, 05 Nov 2020 07:56:27 -0800 (PST)
Received: from localhost.localdomain ([45.118.167.194])
 by smtp.googlemail.com with ESMTPSA id nv5sm2600029pjb.54.2020.11.05.07.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 07:56:26 -0800 (PST)
From: Anmol Karn <anmol.karan123@gmail.com>
To: ralf@linux-mips.org,
	davem@davemloft.net,
	kuba@kernel.org
Date: Thu,  5 Nov 2020 21:26:00 +0530
Message-Id: <20201105155600.9711-1-anmol.karan123@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 syzbot+a1c743815982d9496393@syzkaller.appspotmail.com, netdev@vger.kernel.org,
 linux-hams@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 net] rose: Fix Null pointer
	dereference in rose_send_frame()
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

rose_send_frame() dereferences `neigh->dev` when called from
rose_transmit_clear_request(), and the first occurance of the `neigh`
is in rose_loopback_timer() as `rose_loopback_neigh`, and it is initialized
in rose_add_loopback_neigh() as NULL. i.e when `rose_loopback_neigh` used in 
rose_loopback_timer() its `->dev` was still NULL and rose_loopback_timer() 
was calling rose_rx_call_request() without checking for NULL.

- net/rose/rose_link.c
This bug seems to get triggered in this line:

rose_call = (ax25_address *)neigh->dev->dev_addr;

Fix it by adding NULL checking for `rose_loopback_neigh->dev` in rose_loopback_timer(). 

Reported-and-tested-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com 
Link: https://syzkaller.appspot.com/bug?id=9d2a7ca8c7f2e4b682c97578dfa3f236258300b3 
Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
---
 net/rose/rose_loopback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
index 7b094275ea8b..cd7774cb1d07 100644
--- a/net/rose/rose_loopback.c
+++ b/net/rose/rose_loopback.c
@@ -96,7 +96,7 @@ static void rose_loopback_timer(struct timer_list *unused)
 		}
 
 		if (frametype == ROSE_CALL_REQUEST) {
-			if ((dev = rose_dev_get(dest)) != NULL) {
+			if (rose_loopback_neigh->dev && (dev = rose_dev_get(dest)) != NULL) {
 				if (rose_rx_call_request(skb, dev, rose_loopback_neigh, lci_o) == 0)
 					kfree_skb(skb);
 			} else {
-- 
2.29.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
