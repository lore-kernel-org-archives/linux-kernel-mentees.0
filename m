Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D75D26E161
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 29 Nov 2025 09:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764409054; cv=none; b=BID3cAHadqpdIprdbwyfCye9pTRvGWC8XiRw4+jA/jPVIY1gAoqzz+ov/0doA8wfw3dAb8+Vj8eKTOwylfU0N4gzFE5wH2i9hJwM476N0JRBGEmdcb5dwtS29tRmHp/ol0lfowoVsYwYUgjvbwY3R3XCqwqQtHmF1S2dKmozqDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764409054; c=relaxed/simple;
	bh=ZlTvxu3VWssXrEln8HvuE9rP2j0RUbWa4IrghVjwy5M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hJOpgcdgaYxPFd35Ek/26BkaAaRP6+x8zqOIxKihvg4BTvJwBDzNkn6RP8nSEpjfk4L0PNGgBGwHdW09DaJZtAIaWhxNv/TM42iHe9q0Mlw8FgN+KAvFlczkH0v4P+2d4l3wmnekSI4ONrOPCWu1s/BFYm5uSafaEaKKmXPI4Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=asoVm0ig; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="asoVm0ig"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2957850c63bso18907005ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 29 Nov 2025 01:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1764409050; x=1765013850; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jGXKKxMGK1eysZNyH6QH0SU/9g3Orh82OvwO5tAJksY=;
        b=asoVm0igSoiNCfeFEAcg1i0q/pt7iiEIVwe6kZ4puX7vXd/bnn1rIlN6exHYMm3j6W
         qcyiCZVsed043f6UVoNVN6h8CR/pD/exExLA4SHWix2Qvp/inlYgIkr+GSRZOqDJJNfP
         UxPJ9e659LR5hO511coG2QnPaeBgD2hBaGa8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764409050; x=1765013850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGXKKxMGK1eysZNyH6QH0SU/9g3Orh82OvwO5tAJksY=;
        b=bqqHGlfO+OSTVJcxzclss5DsaG76C/zlGYQMQfLjtneQ07QzW6uH+1LqkUc31JmHfb
         1/tP3CTD/MHiaTfoeaQiVX/vP/1cGBCmPt+KkI4EsHx3GyIiS35IKF/qH9XdwR3huoRr
         jHAuwmN8hmgwyKeMosULWdJDi8qJwDp8Zct6r/KH+Mr3WHu8+PyxIXiwKcNtrgfd3p3P
         zUa6OvBupcGg4/oRxQg837jQdfNhDxgoQrx9aapg6w7Z8vf5zNCuCYaiQbg4BjksL7+b
         er/cxr9LQDXxRb7LtcAfVYh+VkOKNDMaN5NPzEJL2zv9ACLyi/soYT+dpaCwR2fQFIom
         z1fg==
X-Forwarded-Encrypted: i=1; AJvYcCXi0o5TtgMQH1xZk7RZtB/SBhfmyJRXxTQn2Bt694bN+g8xjZvIs/quGdx/zdXENsXxKKPek5eUf/9kDBVBY4dCire7/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxodNtAUO3kDG1JpIPAJBTcunuVm6hZTMib1Ng76SRlVBZ/pQTr
	dmv7gBdZ3aXrMd3dWg03TfuJo5yHC9qjmy8BksauYI/ccEGogu4e46vcH9Swryrc+Es=
X-Gm-Gg: ASbGnculzJc4TtjBkf/nEX61v0PBhKZq1jmNjrn0//aIr1wtuMgWWvnTH17lE/8UVbu
	LV4MxfGlZTOh1CWuOmGj/FnTbGdFV2y1CFBQCttTXhxvm87o4E3VMmxZDKZ+HQyJCCglptoFWeb
	f6jayIZNYwm0N6688wXB/0qcG0/4a0M4lRCM6E+TpiArmL5+oAC2K1TpEkcneAzSsXl1PQ1fjMm
	KXpzBPUVuiPOzUEpSlSm81yab+596k+iostCm18BxgHbxlSJvljqCzJ8M1ODTjY1S/NCreF3s0C
	G6gsEiDqbkg8jF6khc9qWZlZxwO6YA51Oj0m7OzFgpCdji48f5DSQYfVAWhxJt82gCMzFRFrjUA
	exT+nOvoiuy4cdKeIh4ggtQ3Y8ARA3yBngouYxcokxHSe9JmAEN8KWUih71ofS80xUoAghhB/Mg
	q5uL/gMwellToMYSzDrbllFQGJeVW3yKTYHXp54yJq7DSfruWG5rY7bzfOIt4=
X-Google-Smtp-Source: AGHT+IEI8230ifO4LYJAs7VvXkSTCZgJ9OOKZGhnRbVSZR7l7RNsQuwaVaZI1pZEkHGHHbd0YQM1Pg==
X-Received: by 2002:a17:903:98c:b0:299:dc97:a694 with SMTP id d9443c01a7336-29b5e3b86f5mr378476365ad.24.1764409050232;
        Sat, 29 Nov 2025 01:37:30 -0800 (PST)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx.. ([2405:201:31:d869:ca83:6d4:140:3932])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb542a4sm67075505ad.86.2025.11.29.01.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 01:37:29 -0800 (PST)
From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jaakko Karrenpalo <jkarrenpalo@gmail.com>,
	Felix Maurer <fmaurer@redhat.com>,
	Arvid Brodin <arvid.brodin@alten.se>,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shaurya Rane <ssrane_b23@ee.vjti.ac.in>,
	syzbot+2fa344348a579b779e05@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH net v3] net/hsr: fix NULL pointer dereference in prp_get_untagged_frame()
Date: Sat, 29 Nov 2025 15:07:18 +0530
Message-Id: <20251129093718.25320-1-ssrane_b23@ee.vjti.ac.in>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

prp_get_untagged_frame() calls __pskb_copy() to create frame->skb_std
but doesn't check if the allocation failed. If __pskb_copy() returns
NULL, skb_clone() is called with a NULL pointer, causing a crash:
Oops: general protection fault, probably for non-canonical address 0xdffffc000000000f: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000078-0x000000000000007f]
CPU: 0 UID: 0 PID: 5625 Comm: syz.1.18 Not tainted syzkaller #0 PREEMPT(full)
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:skb_clone+0xd7/0x3a0 net/core/skbuff.c:2041
Code: 03 42 80 3c 20 00 74 08 4c 89 f7 e8 23 29 05 f9 49 83 3e 00 0f 85 a0 01 00 00 e8 94 dd 9d f8 48 8d 6b 7e 49 89 ee 49 c1 ee 03 <43> 0f b6 04 26 84 c0 0f 85 d1 01 00 00 44 0f b6 7d 00 41 83 e7 0c
RSP: 0018:ffffc9000d00f200 EFLAGS: 00010207
RAX: ffffffff892235a1 RBX: 0000000000000000 RCX: ffff88803372a480
RDX: 0000000000000000 RSI: 0000000000000820 RDI: 0000000000000000
RBP: 000000000000007e R08: ffffffff8f7d0f77 R09: 1ffffffff1efa1ee
R10: dffffc0000000000 R11: fffffbfff1efa1ef R12: dffffc0000000000
R13: 0000000000000820 R14: 000000000000000f R15: ffff88805144cc00
FS:  0000555557f6d500(0000) GS:ffff88808d72f000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000555581d35808 CR3: 000000005040e000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 hsr_forward_do net/hsr/hsr_forward.c:-1 [inline]
 hsr_forward_skb+0x1013/0x2860 net/hsr/hsr_forward.c:741
 hsr_handle_frame+0x6ce/0xa70 net/hsr/hsr_slave.c:84
 __netif_receive_skb_core+0x10b9/0x4380 net/core/dev.c:5966
 __netif_receive_skb_one_core net/core/dev.c:6077 [inline]
 __netif_receive_skb+0x72/0x380 net/core/dev.c:6192
 netif_receive_skb_internal net/core/dev.c:6278 [inline]
 netif_receive_skb+0x1cb/0x790 net/core/dev.c:6337
 tun_rx_batched+0x1b9/0x730 drivers/net/tun.c:1485
 tun_get_user+0x2b65/0x3e90 drivers/net/tun.c:1953
 tun_chr_write_iter+0x113/0x200 drivers/net/tun.c:1999
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0x5c9/0xb30 fs/read_write.c:686
 ksys_write+0x145/0x250 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0449f8e1ff
Code: 89 54 24 18 48 89 74 24 10 89 7c 24 08 e8 f9 92 02 00 48 8b 54 24 18 48 8b 74 24 10 41 89 c0 8b 7c 24 08 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 31 44 89 c7 48 89 44 24 08 e8 4c 93 02 00 48
RSP: 002b:00007ffd7ad94c90 EFLAGS: 00000293 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f044a1e5fa0 RCX: 00007f0449f8e1ff
RDX: 000000000000003e RSI: 0000200000000500 RDI: 00000000000000c8
RBP: 00007ffd7ad94d20 R08: 0000000000000000 R09: 0000000000000000
R10: 000000000000003e R11: 0000000000000293 R12: 0000000000000001
R13: 00007f044a1e5fa0 R14: 00007f044a1e5fa0 R15: 0000000000000003
 </TASK>
Add a NULL check immediately after __pskb_copy() to handle allocation
failures gracefully.

Reported-by: syzbot+2fa344348a579b779e05@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2fa344348a579b779e05
Fixes: f266a683a480 ("net/hsr: Better frame dispatch")
Cc: stable@vger.kernel.org
Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
---
v3:
  - Keep only prp_get_untagged_frame() fix as the other two
    NETIF_F_HW_HSR_TAG_INS checks are not needed for this bug
  - Move NULL check immediately after __pskb_copy() call

v2:
  - Add stack trace to commit message
  - Target net tree with [PATCH net]
  - Add Cc: stable@vger.kernel.org
---
 net/hsr/hsr_forward.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
index 339f0d220212..aefc9b6936ba 100644
--- a/net/hsr/hsr_forward.c
+++ b/net/hsr/hsr_forward.c
@@ -205,6 +205,8 @@ struct sk_buff *prp_get_untagged_frame(struct hsr_frame_info *frame,
 				__pskb_copy(frame->skb_prp,
 					    skb_headroom(frame->skb_prp),
 					    GFP_ATOMIC);
+			if (!frame->skb_std)
+				return NULL;
 		} else {
 			/* Unexpected */
 			WARN_ONCE(1, "%s:%d: Unexpected frame received (port_src %s)\n",
-- 
2.34.1

