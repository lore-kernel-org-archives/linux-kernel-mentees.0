Return-Path: <SRS0=DYSW=L5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F31AC07E99
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Jul 2021 17:18:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E20396196C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Jul 2021 17:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E20396196C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A714C606E5;
	Mon,  5 Jul 2021 17:18:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WlwD6tUYmrQn; Mon,  5 Jul 2021 17:18:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CC81060646;
	Mon,  5 Jul 2021 17:18:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A21F6C001A;
	Mon,  5 Jul 2021 17:18:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47079C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Jul 2021 17:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35B7B60692
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Jul 2021 17:18:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mcGhN2Xb8Spy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Jul 2021 17:18:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69F4160646
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Jul 2021 17:18:42 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id o18so18234853pgu.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 05 Jul 2021 10:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8AsOPg4uvziFNGy4LwJbOa0Julbheb6cKC2U9CBvyi8=;
 b=upNQc2CcpFBftWiYE6Px2uScC9wQC67aHGAdWpMcWEUpbU+a9XaRFECmqLlUbxDM9m
 uP6wB+P6LsRPHlGn+k4pZtEx/R5+oTlbl9Y5VF+a+fyos7kwxCm1RD6yNutR/P+IFiyn
 4TGigeKDNE6KCBnH0PfR8LpOW/uYhBUny3CcQHmODyuZUa9qM9X8QugLAl6UD5X1TtJF
 y+V8mD9x/ciCVuqqzYAFx8AV2J0iD/3vJM9wnDGBICaRyRmFCweTbkkINDU3NHDEltzg
 /lFSS53bYMQvFfxyeTuvBxa3aIw7FBn1DwzjRersxWRKyJOiQxFhofUjqX/pOvZMpCja
 ELSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8AsOPg4uvziFNGy4LwJbOa0Julbheb6cKC2U9CBvyi8=;
 b=Pg92aCIYl2lRRxDmwKYM+qQWVvqEfZYpi0Sc3RJtTX3QbVEqs7e938sqaZqwfp7deW
 XXS8+d4hfBEgUszs+K1aj/4cwClzv+ZwcOEQGXu1QiqSAGFYrcWoYFzG74mo5yXtxz7C
 cqrQ5k6EPfSF3wMXAq4rNJyAp7rArUxXmFF40+sMFmQLot462c2yC9F8Uk9N2rFG9OIe
 wjw9+FIvZFjy4uQkbb0d5iM5cH4hAafEPXLlEYsKAoEjr5jcmQ+3NA9Z6XmsrHIu2CsW
 Ah+gQ4m4SvwcaoSBs4PtLX4GP7Tbt8TxdtoRPwKVOSSx6k6vAJKrBFb3YMDXW6Ftlyt8
 nX7Q==
X-Gm-Message-State: AOAM530QshUS+QRu+CpycAurFC0X5gKxogk+T84IGOe9YYO2T89wUMW5
 R0rZ3Jq6R739ZqlMu9FDJRY=
X-Google-Smtp-Source: ABdhPJxs/nY4JyPTwoilJvNPBltEPhPrGuUa2VABDHNtmXi9TLeDaL/dlTprvVj8RoPbhY9AglqMcQ==
X-Received: by 2002:a63:e214:: with SMTP id q20mr15107616pgh.437.1625505521847; 
 Mon, 05 Jul 2021 10:18:41 -0700 (PDT)
Received: from pn-hyperv.lan (bb42-60-144-185.singnet.com.sg. [42.60.144.185])
 by smtp.gmail.com with ESMTPSA id
 w123sm14059300pff.152.2021.07.05.10.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 10:18:41 -0700 (PDT)
From: Nguyen Dinh Phi <phind.uet@gmail.com>
To: yhs@fb.com, edumazet@google.com, davem@davemloft.net,
 yoshfuji@linux-ipv6.org, dsahern@kernel.org, kuba@kernel.org,
 ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, kafai@fb.com,
 songliubraving@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org,
 ycheng@google.com, ncardwell@google.com, yyd@google.com
Subject: [PATCH v5] tcp: fix tcp_init_transfer() to not reset
 icsk_ca_initialized
Date: Tue,  6 Jul 2021 01:18:23 +0800
Message-Id: <20210705171823.524171-1-phind.uet@gmail.com>
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

This commit fixes a bug (found by syzkaller) that could cause spurious
double-initializations for congestion control modules, which could cause
memory leaks orother problems for congestion control modules (like CDG)
that allocate memory in their init functions.

The buggy scenario constructed by syzkaller was something like:

(1) create a TCP socket
(2) initiate a TFO connect via sendto()
(3) while socket is in TCP_SYN_SENT, call setsockopt(TCP_CONGESTION),
    which calls:
       tcp_set_congestion_control() ->
         tcp_reinit_congestion_control() ->
           tcp_init_congestion_control()
(4) receive ACK, connection is established, call tcp_init_transfer(),
    set icsk_ca_initialized=0 (without first calling cc->release()),
    call tcp_init_congestion_control() again.

Note that in this sequence tcp_init_congestion_control() is called
twice without a cc->release() call in between. Thus, for CC modules
that allocate memory in their init() function, e.g, CDG, a memory leak
may occur. The syzkaller tool managed to find a reproducer that
triggered such a leak in CDG.

The bug was introduced when that commit 8919a9b31eb4 ("tcp: Only init
congestion control if not initialized already")
introduced icsk_ca_initialized and set icsk_ca_initialized to 0 in
tcp_init_transfer(), missing the possibility for a sequence like the
one above, where a process could call setsockopt(TCP_CONGESTION) in
state TCP_SYN_SENT (i.e. after the connect() or TFO open sendmsg()),
which would call tcp_init_congestion_control(). It did not intend to
reset any initialization that the user had already explicitly made;
it just missed the possibility of that particular sequence (which
syzkaller managed to find).

Fixes: 8919a9b31eb4 (tcp: Only init congestion control if not initialized already)
Reported-by: syzbot+f1e24a0594d4e3a895d3@syzkaller.appspotmail.com
Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
---
V2:     - Modify the Subject line.
        - Adjust the commit message.
        - Add Fixes: tag.
V3:     - Fix netdev/verify_fixes format error.
V4:     - Add blamed authors to receiver list.
V5:	- Add comment about the congestion control initialization.
 net/ipv4/tcp_input.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 7d5e59f688de..84c70843b404 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -5922,8 +5922,8 @@ void tcp_init_transfer(struct sock *sk, int bpf_op, struct sk_buff *skb)
 		tp->snd_cwnd = tcp_init_cwnd(tp, __sk_dst_get(sk));
 	tp->snd_cwnd_stamp = tcp_jiffies32;

-	icsk->icsk_ca_initialized = 0;
 	bpf_skops_established(sk, bpf_op, skb);
+	/* Initialize congestion control unless BPF initialized it already: */
 	if (!icsk->icsk_ca_initialized)
 		tcp_init_congestion_control(sk);
 	tcp_init_buffer_space(sk);
--
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
