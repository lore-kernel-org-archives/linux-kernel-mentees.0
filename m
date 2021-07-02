Return-Path: <SRS0=QgwC=L2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4870C07E96
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Jul 2021 19:41:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8177A61411
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Jul 2021 19:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8177A61411
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B01C60BB9;
	Fri,  2 Jul 2021 19:41:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 92wRiloj2yHI; Fri,  2 Jul 2021 19:41:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6C0D860782;
	Fri,  2 Jul 2021 19:41:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3248EC001A;
	Fri,  2 Jul 2021 19:41:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2817AC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 19:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01D1660B95
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 19:41:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cEWeEYWmyOLc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 19:41:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D18160782
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 19:41:15 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so6793261pjo.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 02 Jul 2021 12:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iRPcc3KZxFiOquaZxV8pj049/M7XwQEX+qEAJ1CThqY=;
 b=jZYFtq8t0vu44PTn5Z+yPEuzQOUQUUfO4KZHYczUuYxuQxlT4x311ea4GnY64XtRt1
 e2HxrA7+vGA1rplFWjjwUmAkd2hx2jivqmUPtGQfw5WRIhW7A/GmvuGePBxZARebMzKF
 7vvCHUkjjoGYS6Ps96IocB+M7G69jbvKx08ssSLuX5HBAyAfuwEPRM/TXm9VzqUbXY1P
 LoSHna5097UuNkbBsV1kzOIlD4apjTmwBYjNKcz8Vf+Mjw26+EkJ7/WlZSDqi1W2RfNT
 n99tM3lE+taucZKU5xko37/Ozy2M90SzNb12AXsjRrbLFijk6QitmrrCFMDp9ZmUz6S4
 uIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iRPcc3KZxFiOquaZxV8pj049/M7XwQEX+qEAJ1CThqY=;
 b=l2g4xRcgmX/ptCW0aL3CPumR9TQW4V/3UYIz9r13KiheUxzR9STiXA4whg+B2llxbF
 FcGhSs6qjtwPA3t8hlfpBLwLYzLN+w91CfNx2/9EHNl5y28q8Tu4SAg8/NZw2PJWKtcw
 CBTwVj4UtSZEBUffzvacMp77HFZDlT4ICwwyGf4sD5M2GCZOQTB4wxOndjIUeMQh6eqf
 aaz+9K4ggLd8awMRkVaIZSlRxVbuBTLANWpAUQ61IVRcrp/i9GA2tmbnv2ObNQ6rqcx1
 iDV+4FpjCB0CsVy8f7FOqKfRLX5n+bnIkWUrmrWF/N+5VJAH0AOES2uqXoezB7/2fYN2
 ZM2g==
X-Gm-Message-State: AOAM531eKUyfhCiTFShRrx501n6ahAL0kKjbo/Q5ouUdaVSnCKh5uO1A
 WqsjpxxaqpEsH+HV1g7aOCU=
X-Google-Smtp-Source: ABdhPJwlqv/SX20NxLLJQWxL029/6T76a5hMovPA8WKZ7PJNpejCd2IOwTKiiocwnq+RNntcwk1dqw==
X-Received: by 2002:a17:90a:dc06:: with SMTP id
 i6mr1263098pjv.65.1625254874773; 
 Fri, 02 Jul 2021 12:41:14 -0700 (PDT)
Received: from pn-hyperv.lan (bb42-60-144-185.singnet.com.sg. [42.60.144.185])
 by smtp.gmail.com with ESMTPSA id
 t14sm5283132pgm.9.2021.07.02.12.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 12:41:14 -0700 (PDT)
From: Nguyen Dinh Phi <phind.uet@gmail.com>
To: edumazet@google.com, davem@davemloft.net, yoshfuji@linux-ipv6.org,
 dsahern@kernel.org, kuba@kernel.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, kafai@fb.com, songliubraving@fb.com,
 john.fastabend@gmail.com, kpsingh@kernel.org
Subject: [PATCH v2] tcp: fix tcp_init_transfer() to not reset
 icsk_ca_initialized
Date: Sat,  3 Jul 2021 03:40:33 +0800
Message-Id: <20210702194033.1370634-1-phind.uet@gmail.com>
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

Fixes: commit 8919a9b31eb4 ("tcp: Only init congestion control if not
initialized already")
Reported-by: syzbot+f1e24a0594d4e3a895d3@syzkaller.appspotmail.com
Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
---
V2:	- Modify the Subject line.
	- Adjust the commit message.
	- Add Fixes: tag.

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
