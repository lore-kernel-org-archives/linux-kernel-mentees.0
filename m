Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AD2C6FD1C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Mar 2023 12:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3DF081E24;
	Tue, 14 Mar 2023 12:05:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3DF081E24
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IwlVlMQ4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tcVbY5bLsSz0; Tue, 14 Mar 2023 12:05:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DEEF381E04;
	Tue, 14 Mar 2023 12:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEEF381E04
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C291AC0035;
	Tue, 14 Mar 2023 12:05:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D37EC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Mar 2023 12:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71F2D81E24
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Mar 2023 12:05:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71F2D81E24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sufwdmGF_aaZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Mar 2023 12:05:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0580881E04
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0580881E04
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Mar 2023 12:05:30 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 c8-20020a05600c0ac800b003ed2f97a63eso101995wmr.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Mar 2023 05:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678795529; x=1681387529;
 h=content-transfer-encoding:in-reply-to:from:to:content-language
 :references:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uuZPA6U7LSFaedRXIOYqZD00Nnv1oDl6UuiE2AirY+k=;
 b=IwlVlMQ4zPgU8q+JJtkDM9Z2/ogIyw+2pvLUbobUmms0x135dZXMFGiJwtfi7y9aBt
 r7FrKbIMXAwKynW0NzD55XU+O0Ub/GLS1RZSRZLy/IXCKPa8sHmLL//k9+dtyRo0Sl4l
 rFj73MzaVwzNCqyvzlAlNLkXW9SK/vV89m7BbdK5QgIMIe8yQQTLJ3RqQB0LE1nQvHCm
 gUpBpH1dNp1q4JqVCL+Cam1qQfkHsq/HN8icZU+HRo3muarStXFsnWkcd7+enRQMsvVT
 iNwCu97R+iHMsLD+SToAf9sH3Db0oZ/rTYpZJgeiAwCJabcmomnsP3615ydPeattoOO1
 5YSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678795529; x=1681387529;
 h=content-transfer-encoding:in-reply-to:from:to:content-language
 :references:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uuZPA6U7LSFaedRXIOYqZD00Nnv1oDl6UuiE2AirY+k=;
 b=4C3QtYxcVYi9Kiwr12DP2uF25s5uvCIpRDyGIfIUM8IDJY8ny7RSM5itnUldkdnDAC
 rKm+DnCnSM8TBVJb1Ea8d9z5zYXfvHXLrvC6gohYS31t6/Y1Xxv7Q+b8AQzAtLxkhe2e
 WQkSMtHcdJm+Xgx4m7biRcXLfTibVSH1aIhF/YyyX2XV0N3fxzeEuiIwI4UbxUK9q+HV
 XnjE1IkrL/YBFO2J1l9jMbSQCsj4Ndj/Yew3mk56WG10E67pxVTQrumPhgbArSq5fNHH
 Y1mRTae4lirWcsSGPa4o7bY2Jel/rpHKUA8oLZqwF0+AkgD09mY+rg6my2eLFD4LM5ha
 RQDQ==
X-Gm-Message-State: AO0yUKUpmK3+QVVbxU59ydjJaagjRQorkPHdHFEXLgVPwQujB4B+N0gc
 GGLfkW11cn5PgIenXCtN3IGIIgJoH+psaQ==
X-Google-Smtp-Source: AK7set/KhVONwK8Xt1fNGAyXn/h9TwTAWxw/R43j8xTCKSWYcaLOWtMdrWc7nWzn4cNREAVmOfxRBA==
X-Received: by 2002:a05:600c:3d89:b0:3e2:415:f09f with SMTP id
 bi9-20020a05600c3d8900b003e20415f09fmr12565558wmb.3.1678795528802; 
 Tue, 14 Mar 2023 05:05:28 -0700 (PDT)
Received: from [192.168.10.15] ([37.252.81.68])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a05600c45d000b003ed29899dfdsm2811859wmo.21.2023.03.14.05.05.28
 for <linux-kernel-mentees@lists.linuxfoundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 05:05:28 -0700 (PDT)
Message-ID: <d2790e79-898a-609a-af3e-3bb9571bd264@gmail.com>
Date: Tue, 14 Mar 2023 16:05:27 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Fwd: [PATCH] FS, NET: Fix KMSAN uninit-value in vfs_write
References: <20230314120445.12407-1-ivan.orlov0322@gmail.com>
Content-Language: en-US
To: linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <20230314120445.12407-1-ivan.orlov0322@gmail.com>
X-Forwarded-Message-Id: <20230314120445.12407-1-ivan.orlov0322@gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>




-------- Forwarded Message --------
Subject: [PATCH] FS, NET: Fix KMSAN uninit-value in vfs_write
Date: Tue, 14 Mar 2023 16:04:45 +0400
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: socketcan@hartkopp.net, mkl@pengutronix.de, davem@davemloft.net, 
edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
CC: Ivan Orlov <ivan.orlov0322@gmail.com>, linux-can@vger.kernel.org, 
netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
himadrispandya@gmail.com, skhan@linuxfoundation.org, 
syzbot+c9bfd85eca611ebf5db1@syzkaller.appspotmail.com

Syzkaller reported the following issue:

=====================================================
BUG: KMSAN: uninit-value in aio_rw_done fs/aio.c:1520 [inline]
BUG: KMSAN: uninit-value in aio_write+0x899/0x950 fs/aio.c:1600
  aio_rw_done fs/aio.c:1520 [inline]
  aio_write+0x899/0x950 fs/aio.c:1600
  io_submit_one+0x1d1c/0x3bf0 fs/aio.c:2019
  __do_sys_io_submit fs/aio.c:2078 [inline]
  __se_sys_io_submit+0x293/0x770 fs/aio.c:2048
  __x64_sys_io_submit+0x92/0xd0 fs/aio.c:2048
  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
  do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
  entry_SYSCALL_64_after_hwframe+0x63/0xcd

Uninit was created at:
  slab_post_alloc_hook mm/slab.h:766 [inline]
  slab_alloc_node mm/slub.c:3452 [inline]
  __kmem_cache_alloc_node+0x71f/0xce0 mm/slub.c:3491
  __do_kmalloc_node mm/slab_common.c:967 [inline]
  __kmalloc+0x11d/0x3b0 mm/slab_common.c:981
  kmalloc_array include/linux/slab.h:636 [inline]
  bcm_tx_setup+0x80e/0x29d0 net/can/bcm.c:930
  bcm_sendmsg+0x3a2/0xce0 net/can/bcm.c:1351
  sock_sendmsg_nosec net/socket.c:714 [inline]
  sock_sendmsg net/socket.c:734 [inline]
  sock_write_iter+0x495/0x5e0 net/socket.c:1108
  call_write_iter include/linux/fs.h:2189 [inline]
  aio_write+0x63a/0x950 fs/aio.c:1600
  io_submit_one+0x1d1c/0x3bf0 fs/aio.c:2019
  __do_sys_io_submit fs/aio.c:2078 [inline]
  __se_sys_io_submit+0x293/0x770 fs/aio.c:2048
  __x64_sys_io_submit+0x92/0xd0 fs/aio.c:2048
  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
  do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
  entry_SYSCALL_64_after_hwframe+0x63/0xcd

CPU: 1 PID: 5034 Comm: syz-executor350 Not tainted 
6.2.0-rc6-syzkaller-80422-geda666ff2276 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS 
Google 01/12/2023
=====================================================

We can follow the call chain and find that 'bcm_tx_setup' function calls 
'memcpy_from_msg'
to copy some content to the newly allocated frame of 'op->frames'. After 
that the 'len'
field of copied structure being compared with some constant value (64 or 
8). However, if
'memcpy_from_msg' returns an error, we will compare some uninitialized 
memory. This triggers
'uninit-value' issue.

This patch will add 'memcpy_from_msg' possible errors processing to 
avoid uninit-value
issue.

Tested via syzkaller

Reported-by: syzbot+c9bfd85eca611ebf5db1@syzkaller.appspotmail.com
Link: 
https://syzkaller.appspot.com/bug?id=47f897f8ad958bbde5790ebf389b5e7e0a345089
Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
  net/can/bcm.c | 16 ++++++++++------
  1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/net/can/bcm.c b/net/can/bcm.c
index 27706f6ace34..a962ec2b8ba5 100644
--- a/net/can/bcm.c
+++ b/net/can/bcm.c
@@ -941,6 +941,8 @@ static int bcm_tx_setup(struct bcm_msg_head 
*msg_head, struct msghdr *msg,
   			cf = op->frames + op->cfsiz * i;
  			err = memcpy_from_msg((u8 *)cf, msg, op->cfsiz);
+			if (err < 0)
+				goto free_op;
   			if (op->flags & CAN_FD_FRAME) {
  				if (cf->len > 64)
@@ -950,12 +952,8 @@ static int bcm_tx_setup(struct bcm_msg_head 
*msg_head, struct msghdr *msg,
  					err = -EINVAL;
  			}
  -			if (err < 0) {
-				if (op->frames != &op->sframe)
-					kfree(op->frames);
-				kfree(op);
-				return err;
-			}
+			if (err < 0)
+				goto free_op;
   			if (msg_head->flags & TX_CP_CAN_ID) {
  				/* copy can_id into frame */
@@ -1026,6 +1024,12 @@ static int bcm_tx_setup(struct bcm_msg_head 
*msg_head, struct msghdr *msg,
  		bcm_tx_start_timer(op);
   	return msg_head->nframes * op->cfsiz + MHSIZ;
+
+free_op:
+	if (op->frames != &op->sframe)
+		kfree(op->frames);
+	kfree(op);
+	return err;
  }
   /*
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
