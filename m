Return-Path: <SRS0=/QuR=MN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16482C07E9B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Jul 2021 09:39:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C713E611CE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Jul 2021 09:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C713E611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98E3160885;
	Wed, 21 Jul 2021 09:39:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NAp5iTllhodI; Wed, 21 Jul 2021 09:39:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C5A40607C0;
	Wed, 21 Jul 2021 09:39:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4B3BC001A;
	Wed, 21 Jul 2021 09:39:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66C96C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 09:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 550FB402F9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 09:39:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MWmfDCM1xKcO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 09:39:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A9E62402DF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 09:39:13 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id d5so221905pfq.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 02:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PjuFR6HuAqzaOBzOINC7ROg0fkvdUGdT6kDWetuSLNA=;
 b=SSCMiLxpMlxDqbev6KyNKRINcMP3ATB1bD6BU81Vvu2ZLhmmYWvvW7tLTpTRsZwiok
 X/zYaEqz1uBEy4/emehHUpmEcxqHijdIe8NcOQW0Z6Zs7uDseVws5e11QoXA27pSP9Um
 QApdrIp4/agvt8Kapy9jJd0pSsQFh83oL+uBU02Y7gfv2KWuG398YZ7CpCO/TxfBrrhL
 bR6qKXCIc5MiM3fOWgCmmi88NuFSUv46ylmwA7Ozn8qBpzvK9FJ/u1zFsuS+HXJeGGGr
 mu5mj32xp/g019exxf4psjgpRD3lq8noTrPiyVCMZbhdF7nDJPIrIOWiZFgZlCnAsO1B
 BPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PjuFR6HuAqzaOBzOINC7ROg0fkvdUGdT6kDWetuSLNA=;
 b=EP5XFzjIcIZAxbpTiL5grkPA3T7aSyvWsSQ5PUbKMchGoEyjtHQORDYWMJb0nvvajI
 ACG9jYPDElu7o5/v3jzbhg+Kdb+qvGYBRPiMcvSAW+fxOfRX2whuJGtdfnkrG6MLZxYA
 S0xuJMPKZFvhyUgUXOzutCx9avWkk0drftmdDEhpApD10VFWvHNBt3RWAO75hKmkoLq3
 ifSdKXLiNdamAsR4gDqGkGl3dD10UUgmSPT73GSb+GLh96zSfZwEB/+yeev8u99uHN+C
 hAnizk1QWoos9c0QG4Dp5FFHBUag6d0e1s8NGRqU5CPaDHPv673nyk+M/gMPML+/sx21
 m7ZA==
X-Gm-Message-State: AOAM5335NVm2Zc4/vDoTU0jPwIHg/pmVEVR3lQ3CxYsjh6gj5UspDygV
 KXtyEZVB51is4rUpbEK3BBM=
X-Google-Smtp-Source: ABdhPJyLWYQsZQ+eLcP51gJqr+yNhWz6CITIUAHfjWRVt8BqikE1aEmB7DhdUoi1JBVeW317BZfy/A==
X-Received: by 2002:a63:e643:: with SMTP id p3mr34526522pgj.213.1626860353146; 
 Wed, 21 Jul 2021 02:39:13 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id j129sm27311956pfb.132.2021.07.21.02.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 02:39:12 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 davem@davemloft.net, kuba@kernel.org, matthieu.baerts@tessares.net,
 stefan@datenfreihafen.org
Subject: [PATCH v3 2/2] Bluetooth: fix inconsistent lock state in
 rfcomm_connect_ind
Date: Wed, 21 Jul 2021 17:38:32 +0800
Message-Id: <20210721093832.78081-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721093832.78081-1-desmondcheongzx@gmail.com>
References: <20210721093832.78081-1-desmondcheongzx@gmail.com>
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

Commit fad003b6c8e3d ("Bluetooth: Fix inconsistent lock state with
RFCOMM") fixed a lockdep warning due to sk->sk_lock.slock being
acquired without disabling softirq while the lock is also used in
softirq context. This was done by disabling interrupts before calling
bh_lock_sock in rfcomm_sk_state_change.

Later, this was changed in commit e6da0edc24ee ("Bluetooth: Acquire
sk_lock.slock without disabling interrupts") to disable softirqs
only.

However, there is another instance of sk->sk_lock.slock being acquired
without disabling softirq in rfcomm_connect_ind. This patch fixes this
by disabling local bh before the call to bh_lock_sock.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 net/bluetooth/rfcomm/sock.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/bluetooth/rfcomm/sock.c b/net/bluetooth/rfcomm/sock.c
index ae6f80730561..d8734abb2df4 100644
--- a/net/bluetooth/rfcomm/sock.c
+++ b/net/bluetooth/rfcomm/sock.c
@@ -974,6 +974,7 @@ int rfcomm_connect_ind(struct rfcomm_session *s, u8 channel, struct rfcomm_dlc *
 	if (!parent)
 		return 0;
 
+	local_bh_disable();
 	bh_lock_sock(parent);
 
 	/* Check for backlog size */
@@ -1002,6 +1003,7 @@ int rfcomm_connect_ind(struct rfcomm_session *s, u8 channel, struct rfcomm_dlc *
 
 done:
 	bh_unlock_sock(parent);
+	local_bh_enable();
 
 	if (test_bit(BT_SK_DEFER_SETUP, &bt_sk(parent)->flags))
 		parent->sk_state_change(parent);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
