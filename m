Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7457DE743C3
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 Sep 2023 20:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F4FD61078;
	Thu, 28 Sep 2023 20:46:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F4FD61078
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iznKP/z7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xAIfWG7IQEnj; Thu, 28 Sep 2023 20:46:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D2B1E60F56;
	Thu, 28 Sep 2023 20:46:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2B1E60F56
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE2B9C0071;
	Thu, 28 Sep 2023 20:46:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A98F0C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Sep 2023 20:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E73340C20
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Sep 2023 20:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E73340C20
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iznKP/z7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Uz0e0llohfR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Sep 2023 20:46:34 +0000 (UTC)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37C76404EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Sep 2023 20:46:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37C76404EC
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5042bfb4fe9so20839775e87.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Sep 2023 13:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695933992; x=1696538792;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hPgUe9lX4McMY8NXu/5cUyHU5+8iuToZI/13QzjOzwU=;
 b=iznKP/z7T9Z51gCp/tHkdQx6bbr7oFyHxd77gYPjn/IOFX58FEJSTp6GOHLvwB7ooK
 FYbmqFtIVUTcQzH8HjauanWGkMK73C2UIRhEnhbsTj1MVj00f3YdimHVCcLCFAktMazw
 AblonKyd2PDFvrLegUpLpeUSzkXwLwIcKxw7TFfAhfJRjaq9qBYLCQr+Q7RFivs4z/G1
 qTRjv3zVtewyMHJFkWtKmDa8GjKcvFaPXMCmD9X6/ZC69aC9f5UOXXNlqYZMWerna8za
 GVajcMFl4Z3UAo/9bxvFiLiXwD/GTCI7B6O9gFdzF4ZQdj85gSoOl9kzMQCbRu5uF8ID
 gkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695933992; x=1696538792;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hPgUe9lX4McMY8NXu/5cUyHU5+8iuToZI/13QzjOzwU=;
 b=az5Ct0bn/JQJa5xZoY9oSjiWY/DD7GX31X3wi+PJuHM42ah0P8l6LP4ULnd6dztbx/
 028a3uK5vn/Eng1u6HyVac9skGDcuuOYU5PNm3O4ZETCRvci09L3gknwG3Wu20C6+pyp
 YnQ6T8xbjNn27UsvuhsktvLpfwkbLAF8+RQgozsuKoeD9nJIaeiKY1lS2Bgt6sStdtnB
 REOUuWlWSmtwKNK7gopnWLPui16+g6+DoNOysJOnK04hszGQ4qwpnAnam1G6Hc0aqhw9
 vzOjceFeuGwG5N6aV5FV9J5PbcVPTBKlQxAh6CUqpPoK5OaURqcWoz8sAY5N7o26T9kA
 hhqA==
X-Gm-Message-State: AOJu0Yy1quMGJlkxdoW8oAlPtn+YGEN8C4nzi5H7UDORuglvBoJbsWmK
 Zmk2MsqALqy34Yt8tI1DLGw=
X-Google-Smtp-Source: AGHT+IEwlsak/7zZhDaoy1I+l4SeZz0Oi1OVAIyi21U3apsnncFv9qsbL+yC9kNOSWGBmjk+/qX2vA==
X-Received: by 2002:a05:6512:3451:b0:500:8f65:c624 with SMTP id
 j17-20020a056512345100b005008f65c624mr1822930lfr.53.1695933991637; 
 Thu, 28 Sep 2023 13:46:31 -0700 (PDT)
Received: from localhost.localdomain ([154.133.201.230])
 by smtp.gmail.com with ESMTPSA id
 l23-20020a19c217000000b00501c77ad909sm3233139lfc.208.2023.09.28.13.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 13:46:31 -0700 (PDT)
From: Andrew Kanner <andrew.kanner@gmail.com>
To: bjorn@kernel.org, magnus.karlsson@intel.com, maciej.fijalkowski@intel.com,
 jonathan.lemon@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, aleksander.lobakin@intel.com,
 xuanzhuo@linux.alibaba.com
Subject: [PATCH net-next v1] net/xdp: fix zero-size allocation warning in
 xskq_create()
Date: Thu, 28 Sep 2023 23:44:40 +0300
Message-Id: <20230928204440.543-1-andrew.kanner@gmail.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <000000000000c84b4705fb31741e@google.com>
References: <000000000000c84b4705fb31741e@google.com>
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
RFC notes:

It was found that net/xdp/xsk.c:xsk_setsockopt() uses
copy_from_sockptr() to get the number of entries (int) for cases with
XDP_RX_RING/XDP_TX_RING and XDP_UMEM_FILL_RING/XDP_UMEM_COMPLETION_RING.

Next in xsk_init_queue() there're 2 sanity checks (entries == 0) and
(!is_power_of_2(entries)) for which -EINVAL will be returned.

After that net/xdp/xsk_queue.c:xskq_create() will calculate the size
multipling the number of entries (int) with the size of u64, at least.

I wonder if there should be the upper bound (e.g. the 3rd sanity check
inside xsk_init_queue()). It seems that without the upper limit it's
quiet easy to overflow the allocated size (SIZE_MAX), especially for
32-bit architectures, for example arm nodes which were used by the
syzkaller.

In this patch I added a naive check for SIZE_MAX which helped to
skip zero-size allocation after overflow, but maybe it's not quite
right. Please, suggest if you have any thoughts about the appropriate
limit for the size of these xdp rings.

PS: the initial number of entries is 0x20000000 in syzkaller repro:
syscall(__NR_setsockopt, (intptr_t)r[0], 0x11b, 3, 0x20000040, 0x20);

Link: https://syzkaller.appspot.com/text?tag=ReproC&x=10910f18280000

 net/xdp/xsk_queue.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/xdp/xsk_queue.c b/net/xdp/xsk_queue.c
index f8905400ee07..1bc7fb1f14ae 100644
--- a/net/xdp/xsk_queue.c
+++ b/net/xdp/xsk_queue.c
@@ -34,6 +34,9 @@ struct xsk_queue *xskq_create(u32 nentries, bool umem_queue)
 	q->ring_mask = nentries - 1;
 
 	size = xskq_get_ring_size(q, umem_queue);
+	if (size == SIZE_MAX)
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
