Return-Path: <SRS0=2i/r=M3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DB0C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Aug 2021 11:04:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5773560F43
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Aug 2021 11:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5773560F43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3407D8270B;
	Wed,  4 Aug 2021 11:04:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ePUjn-eSGYi1; Wed,  4 Aug 2021 11:04:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4ACB8823F4;
	Wed,  4 Aug 2021 11:04:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20A1AC001A;
	Wed,  4 Aug 2021 11:04:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90951C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 11:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70EF7403EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 11:04:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D9yPwa11HgIM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 11:04:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B257540241
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 11:04:21 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id d17so2560021plr.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Aug 2021 04:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UwpAuyr31gkKRzWsz22ieldVxq1Gat0ivFQ8uoQ/1c0=;
 b=IM7eV7s8h8oFYEZBdNbbFFs+g+dar5PebK/L8YnXDu3Z5PGgxd77mFB8JWljt0SZnl
 2MLFfuX8mwFlVtwZaehF9jl1g/PHF+WPqcycPWDVhYIgrb/bQX12xkS9sqAaV3rBe3da
 ZdPsjSkjCGoyihie7JzyM8bkgiFjEReMtY0m1kZfbwInoqveOX7pNkT28JxaKz3gpbTd
 9pzmWSmVTSQsw+E/UbbCrrNdHt2s9RsXlVtpIAnDlhp9lucv8DMoK2pN6XmzXXvjrowm
 XH0rRW4hVlGbxyPPP8sVo7LD4fts7oL9rSteKEIbE+iAml+pyQtfskdTsxbc+IwYkKJh
 LXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UwpAuyr31gkKRzWsz22ieldVxq1Gat0ivFQ8uoQ/1c0=;
 b=G7MK4JfEpj2W7rdy3IKHfrDSCCeQ63OzRNM5bk+35VZ0u0bMj+hyUdL6DFKBsdJKJV
 LvgngGZSM6cn6bCLkDZWSlfSxsdF81FILk6w6Zqwo5I9gNu6FEIAH+Z/7akSiL2U++E1
 dbx7L8Am87syopAtvGtv1ngjae8BHJ/F6v0F3vUjj3MjuFQAFLykmiyHJrcJjuUOIYB4
 PT+yu1M6g5LHozLyykpwYoxbH4n4kAT0IUkuIO0Iw47i/aBikltyViANKfk6j7pQg1ud
 gsbQnf7dwOGfJTD56ZPe/TFoCPLvqtZa7jGz+KK95wqZ2iUheUw+Ll3wAz+jJ28ik6Mo
 oJiw==
X-Gm-Message-State: AOAM530BfTABxWaT4pL2tIHXRXspKyYb7SVOfxOIrD8H/RacmKcmn+JP
 FABhXwvGr5UwGlltXTpI5fc=
X-Google-Smtp-Source: ABdhPJyGnCZuFwDmG+LmB5XddxwPsrpPy+oRZJaIgcMNVyhKK2wnXpX3hpbc+tN6NIbFhc9hHe0Aow==
X-Received: by 2002:a17:90a:c003:: with SMTP id
 p3mr27366487pjt.14.1628075061236; 
 Wed, 04 Aug 2021 04:04:21 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id k4sm2206147pjs.55.2021.08.04.04.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 04:04:20 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 davem@davemloft.net, kuba@kernel.org, sudipm.mukherjee@gmail.com
Subject: [PATCH v5 5/6] Bluetooth: switch to lock_sock in RFCOMM
Date: Wed,  4 Aug 2021 19:03:07 +0800
Message-Id: <20210804110308.910744-6-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804110308.910744-1-desmondcheongzx@gmail.com>
References: <20210804110308.910744-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
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
