Return-Path: <SRS0=s8/Q=LW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE4BEC49361
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Jun 2021 14:49:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 607C461151
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Jun 2021 14:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 607C461151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23CD76067D;
	Mon, 28 Jun 2021 14:49:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sfrF3lxgOXas; Mon, 28 Jun 2021 14:49:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4F721606BE;
	Mon, 28 Jun 2021 14:49:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22D33C001A;
	Mon, 28 Jun 2021 14:49:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F022C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 14:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E27F4019A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 14:49:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3vuA5rq5wrek
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 14:49:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 051EA40003
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 14:49:15 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id d12so15656334pgd.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 07:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xiDXnE8T2Ig5kLEgxQ1DfTJKMTQe2R8bhbRnEAoK84s=;
 b=Vrq/Ea6qGJUhzc7gcvNXr57zCRefc4FYl6MasfCkZZ8WaC0yPEEnfdg1z8CR/Ykoph
 KM2apzV6fPdUogvpTes/NWICoQWmZ9nqHa4/Jd15l13BQbzMRGqgupSCSUeaa8ujaAaf
 Xj1BYIshZxIF9exy9WTevwciw9WZzkOx1fTbDujJ3oJiKWhqcKltHoiKRpjMay24gkDN
 nrS74Xt7HJdLwsIuUfeMavUi92C5rUF8yD9gdi3ZUZHI7pn11nufYoY9fB6muo0H06i0
 ezDWdzWmk2A09w1NWjiR2Ahn4STqPGxwme4TocaRRSQafPPcRC8XP+WGzCkKfDxOaYc6
 STJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xiDXnE8T2Ig5kLEgxQ1DfTJKMTQe2R8bhbRnEAoK84s=;
 b=dnzPC75fOKF00Zyb/mzK/HD6hYBgbBuJ137Sbb8CsDEA6oMr3izJBNyh3WAJ6DQqqt
 1kuR2v3gBQSPFatLaZr0AecOCiJIMKZojBCXiSIlqqVj7Si10e5BSwqjLVp/LLn4ixHl
 16AJPotP18cHKITYaRNCvuDFvewlqIHS+AVSlgcYPnjE+KJoZ3xLcs1fRiAmGv/b7iN0
 vfTDwNdxKY0WaSkawljNkrNvSQ/q/Q6yQWxBL3EtvGVFxiZDpyfVOZjxWP7C4ZSv0Z41
 oQpim3kytiF96WQubMhYbxYNZLmiw2AghZr4X+rfWAjqBHs3QVXMamWRCKXPRZWS+dBr
 K+6A==
X-Gm-Message-State: AOAM532Rc2NYcbeQhhvJt0zos5yQVOdk2RSkPsr+6sZ+Usx7TZ0EEGlc
 mfAWqW4FFzHHgdioT+BAjYw=
X-Google-Smtp-Source: ABdhPJwKRrblBM25Q0gWgepFLowuQ9Gnaf0uLSdgkLD8VmLcQUsMzPzn0e2TSPMDaIbzr3Q8UTXvxQ==
X-Received: by 2002:aa7:999c:0:b029:308:7e6e:6fbc with SMTP id
 k28-20020aa7999c0000b02903087e6e6fbcmr22364879pfh.10.1624891755408; 
 Mon, 28 Jun 2021 07:49:15 -0700 (PDT)
Received: from pn-hyperv.lan (bb42-60-144-185.singnet.com.sg. [42.60.144.185])
 by smtp.gmail.com with ESMTPSA id
 j24sm14695331pfe.58.2021.06.28.07.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 07:49:15 -0700 (PDT)
From: Nguyen Dinh Phi <phind.uet@gmail.com>
To: edumazet@google.com, davem@davemloft.net, yoshfuji@linux-ipv6.org,
 dsahern@kernel.org, kuba@kernel.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, kafai@fb.com, songliubraving@fb.com,
 john.fastabend@gmail.com, kpsingh@kernel.org
Subject: [PATCH] tcp: Do not reset the icsk_ca_initialized in
 tcp_init_transfer.
Date: Mon, 28 Jun 2021 22:49:08 +0800
Message-Id: <20210628144908.881499-1-phind.uet@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: syzbot+f1e24a0594d4e3a895d3@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
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

icsk_ca_initialized be always set to zero before we examine it in if
block, this makes the congestion control module's initialization be
called even if the CC module was initialized already.
In case the CC module allocates and setups its dynamically allocated
private data in its init() function, e.g, CDG, the memory leak may occur.

Reported-by: syzbot+f1e24a0594d4e3a895d3@syzkaller.appspotmail.com

Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
---
 net/ipv4/tcp_input.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 7d5e59f688de..855ada2be25e 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -5922,7 +5922,6 @@ void tcp_init_transfer(struct sock *sk, int bpf_op, struct sk_buff *skb)
 		tp->snd_cwnd = tcp_init_cwnd(tp, __sk_dst_get(sk));
 	tp->snd_cwnd_stamp = tcp_jiffies32;

-	icsk->icsk_ca_initialized = 0;
 	bpf_skops_established(sk, bpf_op, skb);
 	if (!icsk->icsk_ca_initialized)
 		tcp_init_congestion_control(sk);
--
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
