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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 262EDC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Aug 2021 04:17:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBB4E6054E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Aug 2021 04:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CBB4E6054E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DC6A40503;
	Tue, 10 Aug 2021 04:17:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZHmxAks6Tj5p; Tue, 10 Aug 2021 04:17:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B81B140493;
	Tue, 10 Aug 2021 04:17:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9987CC0010;
	Tue, 10 Aug 2021 04:17:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EFF2EC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 04:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D25038340C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 04:17:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6IGCjBT2UM2B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 04:17:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5EA3B8333E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 04:17:24 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id q2so19215719plr.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 09 Aug 2021 21:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SvgciiztrVef8p8zryOlzKMWIbOXm14bnkz3tLt2Ce0=;
 b=BUnnRx+X4v+1TL2k/V2JSTPEo9aZKCrlBiUXDBNMmj2qULjq+uWnxD26UxR3lMTexU
 Y1IbO4KeN1RWknPDtprm+kuFAkvtHuy+Rg2EZWtEeeX92R2IW8V/D6ihkMeZaKE4CqQM
 rm/pVNEGvdwzleQzKqxFhcO9U2aBMac2Ej6S7ejapBsZiG/BOsAKi5S+QIplBduWFvYO
 zTo++1I0l9Lcin+KeB25+mLD24fuiBwOk5k9G7jO9dRJ3Hy/R/9HfvPscihKBhpdAQy2
 6chz9ohNsU/noQUo4hIqjIgaynaQheYVolooSqy5Jsnifoced07RTeUbq4xcSgcwhXAn
 KeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SvgciiztrVef8p8zryOlzKMWIbOXm14bnkz3tLt2Ce0=;
 b=cWovxZns9vfxAqhe5q8fGf48lVihOQaJAhuajWmUX/YHQFo5/plW/fjFg9uf16OmTO
 VAsyAwAOkAWboFx0sZyhfylA9MGoEwJfvPkr6Ct7Q6zk7AsFVnnLktEOQXZ9ifkDrIsS
 ZGEiyX0GEvz/Vq9Nfv7hPbWqEXAZFFD69S1Qmx00zVfJKFkyfFmU/82s3d7ejdFdrPxs
 nMNfHcHfzFAQTnlZwjyCYFHIBKm9TGs8m8RBqf/6Cupu4R/14JgNfYLOYRC7wUvHuV6c
 YTLAq50pMFL5/oQQb7GWd8t4bRJyyi8Oe0ggg4Lwaxkr0dR2S5UQDuPF9frDPiLN9u+b
 dU2A==
X-Gm-Message-State: AOAM533fTeFbxw/R6XdcjuWFBdJpbz1Ptq2JR/c9fftGWl/Nov8oMfWY
 xsTDtnW5V01aztIAOhWK7iM=
X-Google-Smtp-Source: ABdhPJyST7kdXNemvcmeYieJUDOCfvnVJRXrwbmK/xqHiFmHBNjJ96w9TdavrCr2KZ6DrKZpwpEcxg==
X-Received: by 2002:a65:6910:: with SMTP id s16mr37421pgq.270.1628569043859;
 Mon, 09 Aug 2021 21:17:23 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id b8sm20132478pjo.51.2021.08.09.21.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 21:17:23 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 davem@davemloft.net, kuba@kernel.org, sudipm.mukherjee@gmail.com
Subject: [PATCH v6 4/6] Bluetooth: serialize calls to sco_sock_{set,
 clear}_timer
Date: Tue, 10 Aug 2021 12:14:08 +0800
Message-Id: <20210810041410.142035-5-desmondcheongzx@gmail.com>
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

Currently, calls to sco_sock_set_timer are made under the locked
socket, but this does not apply to all calls to sco_sock_clear_timer.

Both sco_sock_{set,clear}_timer should be serialized by lock_sock to
prevent unexpected concurrent clearing/setting of timers.

Additionally, since sco_pi(sk)->conn is only cleared under the locked
socket, this change allows us to avoid races between
sco_sock_clear_timer and the call to kfree(conn) in sco_conn_del.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 net/bluetooth/sco.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
index 68b51e321e82..77490338f4fa 100644
--- a/net/bluetooth/sco.c
+++ b/net/bluetooth/sco.c
@@ -453,8 +453,8 @@ static void __sco_sock_close(struct sock *sk)
 /* Must be called on unlocked socket. */
 static void sco_sock_close(struct sock *sk)
 {
-	sco_sock_clear_timer(sk);
 	lock_sock(sk);
+	sco_sock_clear_timer(sk);
 	__sco_sock_close(sk);
 	release_sock(sk);
 	sco_sock_kill(sk);
@@ -1104,8 +1104,8 @@ static void sco_conn_ready(struct sco_conn *conn)
 	BT_DBG("conn %p", conn);
 
 	if (sk) {
-		sco_sock_clear_timer(sk);
 		lock_sock(sk);
+		sco_sock_clear_timer(sk);
 		sk->sk_state = BT_CONNECTED;
 		sk->sk_state_change(sk);
 		release_sock(sk);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
