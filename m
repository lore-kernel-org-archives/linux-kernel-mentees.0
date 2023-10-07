Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE33E92FFD
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Oct 2023 07:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DB1242D4A;
	Sat,  7 Oct 2023 07:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DB1242D4A
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XWBPjaQk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZVX2n1C-991Y; Sat,  7 Oct 2023 07:52:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B01FB42D30;
	Sat,  7 Oct 2023 07:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B01FB42D30
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93963C0039;
	Sat,  7 Oct 2023 07:52:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4795C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 07:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CC144026E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 07:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CC144026E
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XWBPjaQk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yJcWsxcjqkMT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 07:52:51 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 345D7401B1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 07:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 345D7401B1
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-53b8f8c6b1fso117935a12.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 07 Oct 2023 00:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696665169; x=1697269969;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FYYo8GR3oiE1tO7of8Zj0AJ+1K2a6alvRcy0hRc5+D0=;
 b=XWBPjaQkaL2pOjnU3bkf4ce2ltnX4cBZhuMdoYQbmR0c8QWu1dsWmSKrJ3cMGr0QJN
 WRS9/cakJKowW0qPams2q3QQRQ0LRsoL6xqDKdX9q18PDbVXsDmRT5KLF7V9GlJdmKO2
 yP0CAaQn8WxiPWclSy01EaO2e3gE4ud7n3603FDFnUlmN0FTnF/9Nd/9t3NkSmiVV2zB
 MXgMXUyAH/tkYVxe2uBQ5J57/S0JuKXG8SEsptxn58d9WDeLE8l7wnbJtoZyscLeYECf
 3n/Zqe+YVL5wsRIgB7j3/A+LNM4qEcF5oYkragxsn4auyePaVpLfHowIqBCpyqfOLvdD
 Dzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696665169; x=1697269969;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FYYo8GR3oiE1tO7of8Zj0AJ+1K2a6alvRcy0hRc5+D0=;
 b=MI33gVvjCjclxPgLTCdn8qB/vwZInt0uIKs4dDS48MzQgPS3V2HjBQNmpjDtFf0fAo
 x0jXH8aLPFhmPDV/qLV5L+czJErmjeXUJI6nTDyaT9ICyQq8KUHMRdIJ1dHJsQksGpqC
 XKDJh3Dzde8sHcj/MALQQXWCocOZekYd5H0ZgKUjY72NPrJAozVcZn/TQLu7S87lIAWc
 0Fz7Mj6NDjwqCDUXWU/fOKeGeZR24l0jXFnjKUSaCm/wBs1UI6Lzk8upwojqjW6gfIsn
 ksmQFj9uTQ1BVAqonST0xLNH8BuykzxPYHSOtXS/cRmttHTzW85bp6Bpubd/ysTEa6yB
 OnNw==
X-Gm-Message-State: AOJu0YyTA3K+TN/BqNM+2hOvjoRJ36Z1P3rASJ6pi5kG7fgyinnJwKJ/
 /bOqXJxKF1/cd52NIKaEkeg=
X-Google-Smtp-Source: AGHT+IEa0d+g1RmX9uc9gMWr0k5mS4QILCecL+NREQqJlgOannZCmyfEkeEcOEKCxv16TAPphXhn1Q==
X-Received: by 2002:a50:ee1a:0:b0:530:a0a9:ee36 with SMTP id
 g26-20020a50ee1a000000b00530a0a9ee36mr8902769eds.38.1696665168939; 
 Sat, 07 Oct 2023 00:52:48 -0700 (PDT)
Received: from localhost.localdomain ([77.222.24.57])
 by smtp.gmail.com with ESMTPSA id
 n24-20020aa7d058000000b0053331f9094dsm3568685edo.52.2023.10.07.00.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Oct 2023 00:52:44 -0700 (PDT)
From: Andrew Kanner <andrew.kanner@gmail.com>
To: martin.lau@linux.dev, bjorn@kernel.org, magnus.karlsson@intel.com,
 maciej.fijalkowski@intel.com, jonathan.lemon@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, aleksander.lobakin@intel.com,
 xuanzhuo@linux.alibaba.com, ast@kernel.org, hawk@kernel.org,
 john.fastabend@gmail.com, daniel@iogearbox.net
Subject: [PATCH bpf v4] net/xdp: fix zero-size allocation warning in
 xskq_create()
Date: Sat,  7 Oct 2023 10:51:49 +0300
Message-Id: <20231007075148.1759-1-andrew.kanner@gmail.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+b132693e925cbbd89e26@syzkaller.appspotmail.com, bpf@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+fae676d3cf469331fc89@syzkaller.appspotmail.com
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

Syzkaller reported the following issue:
 ------------[ cut here ]------------
 WARNING: CPU: 0 PID: 2807 at mm/vmalloc.c:3247 __vmalloc_node_range (mm/vmalloc.c:3361)
 Modules linked in:
 CPU: 0 PID: 2807 Comm: repro Not tainted 6.6.0-rc2+ #12
 Hardware name: Generic DT based system
 unwind_backtrace from show_stack (arch/arm/kernel/traps.c:258)
 show_stack from dump_stack_lvl (lib/dump_stack.c:107 (discriminator 1))
 dump_stack_lvl from __warn (kernel/panic.c:633 kernel/panic.c:680)
 __warn from warn_slowpath_fmt (./include/linux/context_tracking.h:153 kernel/panic.c:700)
 warn_slowpath_fmt from __vmalloc_node_range (mm/vmalloc.c:3361 (discriminator 3))
 __vmalloc_node_range from vmalloc_user (mm/vmalloc.c:3478)
 vmalloc_user from xskq_create (net/xdp/xsk_queue.c:40)
 xskq_create from xsk_setsockopt (net/xdp/xsk.c:953 net/xdp/xsk.c:1286)
 xsk_setsockopt from __sys_setsockopt (net/socket.c:2308)
 __sys_setsockopt from ret_fast_syscall (arch/arm/kernel/entry-common.S:68)

xskq_get_ring_size() uses struct_size() macro to safely calculate the
size of struct xsk_queue and q->nentries of desc members. But the
syzkaller repro was able to set q->nentries with the value initially
taken from copy_from_sockptr() high enough to return SIZE_MAX by
struct_size(). The next PAGE_ALIGN(size) is such case will overflow
the size_t value and set it to 0. This will trigger WARN_ON_ONCE in
vmalloc_user() -> __vmalloc_node_range().

The issue is reproducible on 32-bit arm kernel.

Reported-and-tested-by: syzbot+fae676d3cf469331fc89@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/000000000000c84b4705fb31741e@google.com/T/
Link: https://syzkaller.appspot.com/bug?extid=fae676d3cf469331fc89
Reported-by: syzbot+b132693e925cbbd89e26@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/000000000000e20df20606ebab4f@google.com/T/
Fixes: 9f78bf330a66 ("xsk: support use vaddr as ring")
Signed-off-by: Andrew Kanner <andrew.kanner@gmail.com>
---

Notes (akanner):
    v4:
      - add explanation about SIZE_MAX, suggested by Martin KaFai Lau
        <martin.lau@linux.dev>
    v3: https://lore.kernel.org/all/20231005193548.515-1-andrew.kanner@gmail.com/T/
      - free kzalloc-ed memory before return, the leak was noticed by
        Daniel Borkmann <daniel@iogearbox.net>
    v2: https://lore.kernel.org/all/20231002222939.1519-1-andrew.kanner@gmail.com/raw
      - use unlikely() optimization for the case with SIZE_MAX return from
        struct_size(), suggested by Alexander Lobakin
        <aleksander.lobakin@intel.com>
      - cc-ed 4 more maintainers, mentioned by cc_maintainers patchwork
        test
    
    v1: https://lore.kernel.org/all/20230928204440.543-1-andrew.kanner@gmail.com/T/
      - RFC notes:
        It was found that net/xdp/xsk.c:xsk_setsockopt() uses
        copy_from_sockptr() to get the number of entries (int) for cases
        with XDP_RX_RING / XDP_TX_RING and XDP_UMEM_FILL_RING /
        XDP_UMEM_COMPLETION_RING.
    
        Next in xsk_init_queue() there're 2 sanity checks (entries == 0)
        and (!is_power_of_2(entries)) for which -EINVAL will be returned.
    
        After that net/xdp/xsk_queue.c:xskq_create() will calculate the
        size multipling the number of entries (int) with the size of u64,
        at least.
    
        I wonder if there should be the upper bound (e.g. the 3rd sanity
        check inside xsk_init_queue()). It seems that without the upper
        limit it's quiet easy to overflow the allocated size (SIZE_MAX),
        especially for 32-bit architectures, for example arm nodes which
        were used by the syzkaller.
    
        In this patch I added a naive check for SIZE_MAX which helped to
        skip zero-size allocation after overflow, but maybe it's not quite
        right. Please, suggest if you have any thoughts about the
        appropriate limit for the size of these xdp rings.
    
        PS: the initial number of entries is 0x20000000 in syzkaller
        repro: syscall(__NR_setsockopt, (intptr_t)r[0], 0x11b, 3,
        0x20000040, 0x20);
    
        Link:
        https://syzkaller.appspot.com/text?tag=ReproC&x=10910f18280000

 net/xdp/xsk_queue.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/net/xdp/xsk_queue.c b/net/xdp/xsk_queue.c
index f8905400ee07..d2c264030017 100644
--- a/net/xdp/xsk_queue.c
+++ b/net/xdp/xsk_queue.c
@@ -34,6 +34,16 @@ struct xsk_queue *xskq_create(u32 nentries, bool umem_queue)
 	q->ring_mask = nentries - 1;
 
 	size = xskq_get_ring_size(q, umem_queue);
+
+	/* size which is overflowing or close to SIZE_MAX will become 0 in
+	 * PAGE_ALIGN(), checking SIZE_MAX is enough due to the previous
+	 * is_power_of_2(), the rest will be handled by vmalloc_user()
+	 */
+	if (unlikely(size == SIZE_MAX)) {
+		kfree(q);
+		return NULL;
+	}
+
 	size = PAGE_ALIGN(size);
 
 	q->ring = vmalloc_user(size);
-- 
2.39.3

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
