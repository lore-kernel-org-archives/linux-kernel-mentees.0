Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2625DC25B08
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Aug 2022 07:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD9FD8341E;
	Fri,  5 Aug 2022 07:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD9FD8341E
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XhBBP6F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qoBFFBjUXJ06; Fri,  5 Aug 2022 07:37:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BDB6083300;
	Fri,  5 Aug 2022 07:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDB6083300
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83359C0033;
	Fri,  5 Aug 2022 07:37:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BEEFAC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 07:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 852D641CD2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 07:37:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 852D641CD2
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XhBBP6F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A1sdEPFOmJn8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 07:37:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AECA41CC7
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9AECA41CC7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 07:37:17 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id z19so1975843plb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 05 Aug 2022 00:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=FaDd+LzIj5iLUBrDGb+n83PYJvxLCIFQVAAzY4PoSgk=;
 b=XhBBP6F6NzSSGpBbC3Qr0i4t8FDpstx+oB1ZK17xY0wdAv97sZbC+uFiJPa8BTCUdF
 ijwFAyY8W8/tyzJUfFe5s8LJisc8t9l0bQdhxl0GpDh9w1VvbN043QNaaj6ToJEGHLGn
 oBAr0b0CARjT8inWeVR4DdluMpvyo3QutR03fGDvPeNafYOdUO6lcKgBhpW9oHdBS/dL
 D288zlvGYf/FOUkEAKMMtlgJ36pb27bl1XTlwJ5HAAqnKg8bKpr5+dD7+BV5vhSN+OJW
 lV5l7OakAfDUEIPCPyPN1EibMUQE/WXQqqXgr55znvuFdu8MVivOwqr//W6BrCzV1svr
 98Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=FaDd+LzIj5iLUBrDGb+n83PYJvxLCIFQVAAzY4PoSgk=;
 b=7241XRf/tFuxICI1JxPiIDobkmMwl5q+iapvujTJza1uZxRHdHfnn6WbZv9gpeBPUd
 qaf+npVdEqo4U+wj8pCsBUAWTz30FGKKJDlBMlbpB52M+4EOVdtkQdk4y6bBytGTItJe
 GRdIzfUFGpXD9pDvsVjGQWO6d3DcT2SDUVdm7F7sQtH17Ked2GjHElJCmR0wAjfKzwhK
 lQ/tNDNnj0YunFN2BAKCThH1z7fVdA9Bacq4AbuHoKPCdtihKyMH4mTJP/15XHtnykc6
 szR+yFFF4oInQAgeeEzfT1X42Tm+drG0cG9nykdnS8iDaxTbHmCMh273IUtR/oy6a9NL
 454w==
X-Gm-Message-State: ACgBeo22RgXoHHKOsvSeor78KfyzaDSCTjS6LNbQ8XiZOAhGpVPBI3R3
 seIqree3C3PZKJJm0FQ+FVY=
X-Google-Smtp-Source: AA6agR6aXUqXhkZ84+pJdqBEbVO0712xP8TGTnR2og+zd4XNEDcabte56LnhHtREQeehcE9x8oJuWA==
X-Received: by 2002:a17:902:f785:b0:16a:4f3b:a20c with SMTP id
 q5-20020a170902f78500b0016a4f3ba20cmr5629511pln.118.1659685036933; 
 Fri, 05 Aug 2022 00:37:16 -0700 (PDT)
Received: from localhost ([117.136.0.155]) by smtp.gmail.com with ESMTPSA id
 a5-20020a17090a008500b001f559e00473sm3228861pja.43.2022.08.05.00.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 00:37:16 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: syzbot+5f26f85569bd179c18ce@syzkaller.appspotmail.com
Subject: [PATCH net v5 0/2] net: enhancements to sk_user_data field
Date: Fri,  5 Aug 2022 15:36:48 +0800
Message-Id: <cover.1659676823.git.yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <00000000000026328205e08cdbeb@google.com>
References: <00000000000026328205e08cdbeb@google.com>
MIME-Version: 1.0
Cc: paskripkin@gmail.com, Hawkins Jiawei <yin31149@gmail.com>,
 bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

This patchset fixes refcount bug by adding SK_USER_DATA_PSOCK flag bit in
sk_user_data field. The bug cause following info:

WARNING: CPU: 1 PID: 3605 at lib/refcount.c:19 refcount_warn_saturate+0xf4/0x1e0 lib/refcount.c:19
Modules linked in:
CPU: 1 PID: 3605 Comm: syz-executor208 Not tainted 5.18.0-syzkaller-03023-g7e062cda7d90 #0
 <TASK>
 __refcount_add_not_zero include/linux/refcount.h:163 [inline]
 __refcount_inc_not_zero include/linux/refcount.h:227 [inline]
 refcount_inc_not_zero include/linux/refcount.h:245 [inline]
 sk_psock_get+0x3bc/0x410 include/linux/skmsg.h:439
 tls_data_ready+0x6d/0x1b0 net/tls/tls_sw.c:2091
 tcp_data_ready+0x106/0x520 net/ipv4/tcp_input.c:4983
 tcp_data_queue+0x25f2/0x4c90 net/ipv4/tcp_input.c:5057
 tcp_rcv_state_process+0x1774/0x4e80 net/ipv4/tcp_input.c:6659
 tcp_v4_do_rcv+0x339/0x980 net/ipv4/tcp_ipv4.c:1682
 sk_backlog_rcv include/net/sock.h:1061 [inline]
 __release_sock+0x134/0x3b0 net/core/sock.c:2849
 release_sock+0x54/0x1b0 net/core/sock.c:3404
 inet_shutdown+0x1e0/0x430 net/ipv4/af_inet.c:909
 __sys_shutdown_sock net/socket.c:2331 [inline]
 __sys_shutdown_sock net/socket.c:2325 [inline]
 __sys_shutdown+0xf1/0x1b0 net/socket.c:2343
 __do_sys_shutdown net/socket.c:2351 [inline]
 __se_sys_shutdown net/socket.c:2349 [inline]
 __x64_sys_shutdown+0x50/0x70 net/socket.c:2349
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x46/0xb0
 </TASK>

To improve code maintainability, this patchset refactors sk_user_data
flags code to be more generic.

Hawkins Jiawei (2):
  net: fix refcount bug in sk_psock_get (2)
  net: refactor bpf_sk_reuseport_detach()

 include/linux/skmsg.h        |  3 +-
 include/net/sock.h           | 68 +++++++++++++++++++++++++-----------
 kernel/bpf/reuseport_array.c |  9 ++---
 net/core/skmsg.c             |  4 ++-
 4 files changed, 56 insertions(+), 28 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
