Return-Path: <SRS0=w3Lu=NB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE0CC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Aug 2021 04:17:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD44960FC4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Aug 2021 04:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD44960FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4F7840503;
	Tue, 10 Aug 2021 04:17:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1C0aJlTGtQX0; Tue, 10 Aug 2021 04:17:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D3DDE404F2;
	Tue, 10 Aug 2021 04:17:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4435C0010;
	Tue, 10 Aug 2021 04:17:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 550F1C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 04:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 370EE833CD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 04:17:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6maFcDipFaXW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 04:17:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B90F9833A8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 04:17:28 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id d1so19258331pll.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 09 Aug 2021 21:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UwpAuyr31gkKRzWsz22ieldVxq1Gat0ivFQ8uoQ/1c0=;
 b=lq2jd3xIHLY37an7XRk+QppmVqTj4iNl7/RA67QNjQEKC+/uBuVqX14eOxEI5zEPFa
 R2zink3dMmRn6ybKqDCTzCt04j3i7lChM0tXIj2vqUKf5ZdmHPgyRdwpwHJvfWgRcvLL
 ctg9uozZPXx9+7DBQFZs6Iuog3Szc4d6wMYZnLBKO0C2Av1eMz3TJ2bXa1RJAr12/mrf
 5nTgz0rrDIhELW4X2T4Xjtu6hmhnzqRT4CFE0dNMtL75rGicYwDW3yNkNOr3WIgh6rvh
 eAA0FBfdGJwyLrRJtEyD6WtrXCzEiEJ8bLFG1Y7IkyuurbXSuD8p7dEcD372IOg10VOd
 0L3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UwpAuyr31gkKRzWsz22ieldVxq1Gat0ivFQ8uoQ/1c0=;
 b=hdPWCXQJLL90vvphs50YW3/YoymUuXeWoVP+mT/F0lNFzgNO9o4Q06GNSw9EPY15q8
 9tXYGEe3EZI3sjoD1zK6MHl/uNPugEnebl2fbgCl3cjVDQkRqAAa6JfqALJed2KAk8vG
 yB0PZeh4S39yeSLubh9K5eWFBA4C9dhzOyXNCgtD3Hi3EP/OUMvDpah7IOONc6SAluiY
 7s5UTib7tJnZu+5BDIuyUuTer/zHZqHmcWR6ambR3kc7+16BIaBG4fYVvak3JJeqgac7
 gyI/OZv2mJfG84jfRqGyXLQSJa/2xE49ccfgSgRg3jsPqGQGwkTQp0jkOx4Eyl+wbM7X
 Tkhw==
X-Gm-Message-State: AOAM533it3NJ/seJh1P9t+a2Jv5t1TDG9fwhYmDpVaFdYts9zSk53z/s
 pVzf/7EHbWu4uQtdZtEh/5U=
X-Google-Smtp-Source: ABdhPJwfVFJuhXJPcZXKtGefX5s0S/tksX1yVjiMp1lHAxU9y1q4ypqE+xB6yKezuwfNPblMowqt5w==
X-Received: by 2002:a17:90b:3653:: with SMTP id
 nh19mr2695305pjb.169.1628569048241; 
 Mon, 09 Aug 2021 21:17:28 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id b8sm20132478pjo.51.2021.08.09.21.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 21:17:27 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 davem@davemloft.net, kuba@kernel.org, sudipm.mukherjee@gmail.com
Subject: [PATCH v6 5/6] Bluetooth: switch to lock_sock in RFCOMM
Date: Tue, 10 Aug 2021 12:14:09 +0800
Message-Id: <20210810041410.142035-6-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210810041410.142035-1-desmondcheongzx@gmail.com>
References: <20210810041410.142035-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 netdev@vger.kernel.org, Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

Other than rfcomm_sk_state_change and rfcomm_connect_ind, functions in
RFCOMM use lock_sock to lock the socket.

Since bh_lock_sock and spin_lock_bh do not provide synchronization
with lock_sock, these calls should be changed to lock_sock.

This is now safe to do because packet processing is now done in a
workqueue instead of a tasklet, so bh_lock_sock/spin_lock_bh are no
longer necessary to synchronise between user contexts and SOFTIRQ
processing.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 net/bluetooth/rfcomm/sock.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/bluetooth/rfcomm/sock.c b/net/bluetooth/rfcomm/sock.c
index ae6f80730561..2c95bb58f901 100644
--- a/net/bluetooth/rfcomm/sock.c
+++ b/net/bluetooth/rfcomm/sock.c
@@ -70,7 +70,7 @@ static void rfcomm_sk_state_change(struct rfcomm_dlc *d, int err)
 
 	BT_DBG("dlc %p state %ld err %d", d, d->state, err);
 
-	spin_lock_bh(&sk->sk_lock.slock);
+	lock_sock(sk);
 
 	if (err)
 		sk->sk_err = err;
@@ -91,7 +91,7 @@ static void rfcomm_sk_state_change(struct rfcomm_dlc *d, int err)
 		sk->sk_state_change(sk);
 	}
 
-	spin_unlock_bh(&sk->sk_lock.slock);
+	release_sock(sk);
 
 	if (parent && sock_flag(sk, SOCK_ZAPPED)) {
 		/* We have to drop DLC lock here, otherwise
@@ -974,7 +974,7 @@ int rfcomm_connect_ind(struct rfcomm_session *s, u8 channel, struct rfcomm_dlc *
 	if (!parent)
 		return 0;
 
-	bh_lock_sock(parent);
+	lock_sock(parent);
 
 	/* Check for backlog size */
 	if (sk_acceptq_is_full(parent)) {
@@ -1001,7 +1001,7 @@ int rfcomm_connect_ind(struct rfcomm_session *s, u8 channel, struct rfcomm_dlc *
 	result = 1;
 
 done:
-	bh_unlock_sock(parent);
+	release_sock(parent);
 
 	if (test_bit(BT_SK_DEFER_SETUP, &bt_sk(parent)->flags))
 		parent->sk_state_change(parent);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
