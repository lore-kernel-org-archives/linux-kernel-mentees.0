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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B58CAC07E9A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Jul 2021 09:34:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44789613CF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Jul 2021 09:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44789613CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F26E14020C;
	Sat,  3 Jul 2021 09:34:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Cp6MmypaW7E; Sat,  3 Jul 2021 09:34:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DB7DA40171;
	Sat,  3 Jul 2021 09:34:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2E7DC0010;
	Sat,  3 Jul 2021 09:34:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0ABFFC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Jul 2021 09:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7F1360615
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Jul 2021 09:34:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yee_twvRBYDJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Jul 2021 09:34:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A784605E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Jul 2021 09:34:25 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id d12so12442399pgd.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 03 Jul 2021 02:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NA2FyDBb7VVZ1//gW7vJlp4ZAiXUzh99M3RwT57vTIw=;
 b=Az5UIhl/sRLYFP7/l98uaxO8255cP2jLQFPASm7wIL8pcr4SkuEctY2ZXYCRWe6PYE
 Q8MKV/+5JjaVrkibRAlQVwwTbz287kc0JfkE0QG/Fpk7yGcZV9Xb0pAA8SdAf0hP+3BK
 nAZuI+V9p5GvL4HhqZdarEMj7b+0IH3xJ/D1Li5xnjtXJSUjhKfblPJylh3IyZFPtBtd
 9rIiKYQaHcw73Osh/cFoCqva612gT1Yv3DcJmC3bDw1NcK6kcbmjUOKZzHn9kcwsdXeI
 4M3mafEiCNk6pxelGcMhseZmhGyTBwVW2PzJ61aQ22GfgO01682JTKHfS+ObcA+SYA0i
 v1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NA2FyDBb7VVZ1//gW7vJlp4ZAiXUzh99M3RwT57vTIw=;
 b=rXYTSjpfYfjcAWigvqu0W/xOiNrp21tQCBPgOU8UdSRNC07T+P7hSLFVjLixrEykq2
 sXtbpBcTSFttyBVnKeZGgYOHjujZ5Ch4mBQcu977A1qP6WyjWyQ2SYacDLJOyTOZM4VB
 xA9vWCa2VqJyuJBlMOHT++QrBViz/VrGo8nVxPgFzU8yeVbXwpovrDPtfFh5t8YBUyGl
 gWis2UozQ+6ChDVChEXpTtOgIklzwwgXTkMYuDYU0U72qCLMwIuhv19dJBU1IHA5OjvY
 pIlSIR6x04vLAdI17ySZFsIQ4h+ObLsi0olekFFfJV5mQfSGBv4gUOEP8DLPi7JvJMsr
 qxHQ==
X-Gm-Message-State: AOAM531yR3rxRNPIBOmivKZkd+0HW6R2MuE5VevbwlY1VeRZeFpLI8rC
 449rRFLUv+simXN31Dp/JJY=
X-Google-Smtp-Source: ABdhPJxyffHwZGoXuXPFOyFpbw/YsOfSYAd3+uayOwhxVr3lCsxNRoB+lGmlEXPjCN7XJPH6dKOCmg==
X-Received: by 2002:a62:8286:0:b029:2fc:812d:2e70 with SMTP id
 w128-20020a6282860000b02902fc812d2e70mr3813374pfd.24.1625304864568; 
 Sat, 03 Jul 2021 02:34:24 -0700 (PDT)
Received: from pn-hyperv.lan (bb42-60-144-185.singnet.com.sg. [42.60.144.185])
 by smtp.gmail.com with ESMTPSA id
 144sm7200562pgg.4.2021.07.03.02.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jul 2021 02:34:24 -0700 (PDT)
From: Nguyen Dinh Phi <phind.uet@gmail.com>
To: yhs@fb.com, edumazet@google.com, davem@davemloft.net,
 yoshfuji@linux-ipv6.org, dsahern@kernel.org, kuba@kernel.org,
 ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, kafai@fb.com,
 songliubraving@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org,
 ycheng@google.com, ncardwell@google.com, yyd@google.com
Subject: [PATCH v4] tcp: fix tcp_init_transfer() to not reset
 icsk_ca_initialized
Date: Sat,  3 Jul 2021 17:34:17 +0800
Message-Id: <20210703093417.1569943-1-phind.uet@gmail.com>
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
V4:	- Add blamed authors to receiver list.

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
