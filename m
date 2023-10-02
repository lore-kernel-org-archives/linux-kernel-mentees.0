Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C336E776CE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Oct 2023 22:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C68C402F2;
	Mon,  2 Oct 2023 22:31:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C68C402F2
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q4ywbJce
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C5MdsSLQFkCb; Mon,  2 Oct 2023 22:31:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BCCD0401C9;
	Mon,  2 Oct 2023 22:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCCD0401C9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99422C0039;
	Mon,  2 Oct 2023 22:31:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0565C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 22:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B30D81FA0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 22:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B30D81FA0
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Q4ywbJce
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FkyffXIQlWLl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 22:31:48 +0000 (UTC)
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58E6881F9E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 22:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58E6881F9E
Received: by mail-lj1-x243.google.com with SMTP id
 38308e7fff4ca-2b9338e4695so2723021fa.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Oct 2023 15:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696285906; x=1696890706;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iZ4SCtr/9Ft8mS+V0BNVYtsyfhk4Y7ExsowxzrXeKBE=;
 b=Q4ywbJceyqqZ/aCa17Pc72m2WKS0ZWEFgKCbSf092F16X1dgL/2BKZ5+/6VqszZ8SC
 WiVhFLCIfaQoruPRllOmwfEideNIGLX8OUmqei2dapKGxgOxUO1RAsW0UmhBd3vDGeli
 iU4/qhIa2+2kSNB+be5lcIUZhWvMIX8I0PQC+wpC9X7TEfCDlI7Kn/lfk7NIrLb13kT7
 pX0XtUscpww3+pSyuPcSJWDBv5vrPxhRX56cfKK4bbYR/6kV7A7GH+kfZ1Z+oD6lAUco
 50fYO1QL2nxtVW6A+KLMIGzGlgBH7+Bn9uKU+xDvVL1R9jtauEVvqGM28oS/vQ/gYJa1
 abDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696285906; x=1696890706;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iZ4SCtr/9Ft8mS+V0BNVYtsyfhk4Y7ExsowxzrXeKBE=;
 b=OxYvrp/9GxL6NKdGUmcxwzTedTd6ytUCXkHBjJKpZ1M4n04D5eDPGfmOeAXJKWj7R8
 50UEvaLNlZz7TLKQFGn1bjmv+VSi16/IPRv67OcxirvKpiLfNcKFJqNXw8Wkh8ElNir8
 WiJ0uSD9meNU7Wn7QVD1PXOOz1J+00xvDcQX0snOQrN169PZPIZ65gwX6dfghsg2irGV
 P6o4rrYZHyE4s3eWSQAjAbWt8DyFZZcEzHmXFN84oOeujqwvm2S+wSmnCWwlCjcK5bjj
 C0ayyBLhOx8ESGjM8J4n5i6Xk2A85LgTolFugAJMLRSVn3V0hsKM+rIhC5Yb44UmdSNv
 +eWA==
X-Gm-Message-State: AOJu0Yytv1dGeFtgQQwxPjecqCFdxgNE5wpt4Hvf0TJUdSMEl3IZjh0o
 71HHjdH3Zr9T10/tRUV/CAc=
X-Google-Smtp-Source: AGHT+IFaCQPJjfeaLO3tHZxSeqKnLvLg9cAsOZG2hZ+Nt8TEFFFBRge3VNTurmBZC9EWyG7/QMIyAQ==
X-Received: by 2002:a2e:8505:0:b0:2bc:b9c7:7ba3 with SMTP id
 j5-20020a2e8505000000b002bcb9c77ba3mr10509789lji.12.1696285905850; 
 Mon, 02 Oct 2023 15:31:45 -0700 (PDT)
Received: from localhost.localdomain ([77.222.24.78])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a2eb703000000b002c0414c3b6csm5451574ljo.121.2023.10.02.15.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 15:31:45 -0700 (PDT)
From: Andrew Kanner <andrew.kanner@gmail.com>
To: bjorn@kernel.org, magnus.karlsson@intel.com, maciej.fijalkowski@intel.com,
 jonathan.lemon@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, aleksander.lobakin@intel.com,
 xuanzhuo@linux.alibaba.com, ast@kernel.org, hawk@kernel.org,
 john.fastabend@gmail.com, daniel@iogearbox.net
Subject: [PATCH net-next v2] net/xdp: fix zero-size allocation warning in
 xskq_create()
Date: Tue,  3 Oct 2023 01:29:40 +0300
Message-Id: <20231002222939.1519-1-andrew.kanner@gmail.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
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
Fixes: 9f78bf330a66 ("xsk: support use vaddr as ring")
Signed-off-by: Andrew Kanner <andrew.kanner@gmail.com>
---

Notes (akanner):
    v2:
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

 net/xdp/xsk_queue.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/xdp/xsk_queue.c b/net/xdp/xsk_queue.c
index f8905400ee07..b03d1bfb6978 100644
--- a/net/xdp/xsk_queue.c
+++ b/net/xdp/xsk_queue.c
@@ -34,6 +34,9 @@ struct xsk_queue *xskq_create(u32 nentries, bool umem_queue)
 	q->ring_mask = nentries - 1;
 
 	size = xskq_get_ring_size(q, umem_queue);
+	if (unlikely(size == SIZE_MAX))
+		return NULL;
+
 	size = PAGE_ALIGN(size);
 
 	q->ring = vmalloc_user(size);
-- 
2.39.3

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
