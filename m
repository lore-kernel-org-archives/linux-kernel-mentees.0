Return-Path: <SRS0=Q14B=L3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6946BC07E98
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Jul 2021 08:47:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19B8B613FB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Jul 2021 08:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19B8B613FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7C668436A;
	Sat,  3 Jul 2021 08:47:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Wxov7tuTxne; Sat,  3 Jul 2021 08:47:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 02E7E83E04;
	Sat,  3 Jul 2021 08:47:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C33ABC001A;
	Sat,  3 Jul 2021 08:47:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59A6DC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Jul 2021 08:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54FFB84366
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Jul 2021 08:47:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H1vTo7EHvaPp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Jul 2021 08:47:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C034A83E04
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Jul 2021 08:47:13 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id q91so8016404pjk.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 03 Jul 2021 01:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X5LqaHOTleUwEc8rezvK4+11SzDVWy9M2nq3QHqzO1A=;
 b=JmksDk+G/11lCWwdFtloFd5ErcfB70in1PJ8teXH827oRb1YG9b5QnMaMSA/l/3NwA
 VVYj5slobUkbtaJDdvQtd+OFd3BTpzfAtSpd9rSGgs0kODZqe5j5WyHbnNeBKb0mGemP
 0Kin+cgjF/yw/vXYSqrGex5qH89vLWcKilbKVL6m4XHhQ4CS5EGtS7JlclGzraL0+SLf
 IM2k5af5hs6PGPe4ZigHWrzVB5/xNeQGvEsTBF94q0kBGuBDwBiTbZTUHJgYqXALFgUd
 e/eC6kNfH0fpe7eWOBn5x5UTeI5dOLO2/D4UYHKOZVmXV/8NLzRJeWKC4JgYa1sjhg1/
 dttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X5LqaHOTleUwEc8rezvK4+11SzDVWy9M2nq3QHqzO1A=;
 b=R41PpGA+lIzenDb9e+Z4mn/EXj5R/gQJhkillHJ23BBSugSllk+ukFXD7d28oHLL9A
 yd+02e7YBqss7k6W5J3NgIt3cIqxsgZcPAkfxc+d4q5E3IvsM+3W4ynJTXp2YNCDRyji
 KSOHPdyIpSb1jaf0QoNTqzd92K+jimEv/ajgnrLO/kCoZie2MccBvARunjab/JxP33TR
 yaub9yUuHpbtLfI0ZigYbTb9ISxTiyD0maWMY9p6Hg5PFsKQhrSWeHw45N3SXiX1k/1W
 tx1Zo7Nmj/RXpROXFerQHCtER1OZOTSJRPIqw6KAOgTxV4Is563Nsi5hS4EP7VGhL3jJ
 /0yw==
X-Gm-Message-State: AOAM532yqEhjwlE4jkvFs8LoFPeX4YZDE5NFwzkjRELRDEAvTrseLUhG
 iPyhvh0ri85jXCbW8MA7iAg=
X-Google-Smtp-Source: ABdhPJy4kQ82sVIVkMMbUFzKmgZYCcgMjoMXW0PnOfLEgnWYrWhHK49npgVaZbBi1xJ2U3+Pt8IvIw==
X-Received: by 2002:a17:90b:4d81:: with SMTP id
 oj1mr3609967pjb.153.1625302033236; 
 Sat, 03 Jul 2021 01:47:13 -0700 (PDT)
Received: from pn-hyperv.lan (bb42-60-144-185.singnet.com.sg. [42.60.144.185])
 by smtp.gmail.com with ESMTPSA id
 h27sm6557907pfr.171.2021.07.03.01.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jul 2021 01:47:12 -0700 (PDT)
From: Nguyen Dinh Phi <phind.uet@gmail.com>
To: yhs@fb.com, edumazet@google.com, davem@davemloft.net,
 yoshfuji@linux-ipv6.org, dsahern@kernel.org, kuba@kernel.org,
 ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, kafai@fb.com,
 songliubraving@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org
Subject: [PATCH v3] tcp: fix tcp_init_transfer() to not reset
 icsk_ca_initialized
Date: Sat,  3 Jul 2021 16:47:00 +0800
Message-Id: <20210703084700.1546968-1-phind.uet@gmail.com>
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
V3:	- Fix netdev/verify_fixes format error.

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
