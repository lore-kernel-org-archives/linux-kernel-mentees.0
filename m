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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D2EC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Aug 2021 15:48:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D3BC60F14
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Aug 2021 15:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D3BC60F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0621683BA3;
	Wed,  4 Aug 2021 15:48:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05z0UKOt2XO1; Wed,  4 Aug 2021 15:48:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 31C1483926;
	Wed,  4 Aug 2021 15:48:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 114D1C0010;
	Wed,  4 Aug 2021 15:48:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1DA37C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 15:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D9EA83BA3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 15:48:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AEZbkS9DEi_c
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 15:48:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73E6183926
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 15:48:54 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 dw2-20020a17090b0942b0290177cb475142so9345535pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Aug 2021 08:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UwpAuyr31gkKRzWsz22ieldVxq1Gat0ivFQ8uoQ/1c0=;
 b=tEUlbrGx7uWgTk+Yiuzx3PF5upDZnEKvMC7rC8etWlR9ez5J/YDtuPhjqo4v2GebzO
 VLI3xt14nJAIKyLSCDqvNQwd1FYMjV2tlv/6PW3aqrIe5f4gpFIHZGZkDQuZkJZ8puKl
 XoMFqpLQy2XENACDC1UY0nf3A70oZt4JwbhUCdMhejjpwDX7FqcLe/o262ewwjaUVxsC
 iQHBMWJ0UQh7ocqbt5sOKd/Q5rcrB6jOD+XqZueye8QZ8wLWSRWtVdV1Exxq3KHn0ge1
 bcagkhmas9zQxiHT7DBSeIyrmlATtbdAcWEl+pemT6dJLiWmDz054ehJ6fsKYF/ShCdX
 wdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UwpAuyr31gkKRzWsz22ieldVxq1Gat0ivFQ8uoQ/1c0=;
 b=MK9luW01sfr9LbM3jCuLwzABnu3GePOL2sEz0825x5Pyp9SiKI/dkJFz1OZQvNjtMD
 XTOOVBQR7c45KKHdEKNZbpXk7MW819SdyNhNbrZZNev6zvIiw1H5NyBW7r1JC1V1gb1C
 jlw2KhAaDnOJcxCz/h1uemmQoA25SmlzvQp8TzHXgjOxpghxa8W5reibKy4y/o78oMED
 MJT2fVuYIWykObXQHP95X6oS+t6eA8Yr389Zu/wmaHVIGWCIGPcpJ+pKxHhG+dO7ClzS
 5lKJz3MwFMSesr7HuIaUn8IK3rJ8YEZJgpA/FR9qw1pJHJYxNux6bsX2WlTuL2AO97Ub
 MRng==
X-Gm-Message-State: AOAM532QErwfRduL0p7YHqJ9NiamGYsfkpJgePn7dVIydZBpx1qvJVhb
 h4lT/eVST68Ub7xfEdvhBD4=
X-Google-Smtp-Source: ABdhPJy53E2/k6DHqfUA8ASbwd2KosGoA+p9Idp0D8kBhX/RdBw3l0POikQNvzDaf8W3swv+zT9rwQ==
X-Received: by 2002:a63:950a:: with SMTP id p10mr76260pgd.362.1628092133695;
 Wed, 04 Aug 2021 08:48:53 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id b15sm4007274pgj.60.2021.08.04.08.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 08:48:53 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 davem@davemloft.net, kuba@kernel.org, sudipm.mukherjee@gmail.com
Subject: [RESEND PATCH v5 5/6] Bluetooth: switch to lock_sock in RFCOMM
Date: Wed,  4 Aug 2021 23:47:11 +0800
Message-Id: <20210804154712.929986-6-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804154712.929986-1-desmondcheongzx@gmail.com>
References: <20210804154712.929986-1-desmondcheongzx@gmail.com>
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
