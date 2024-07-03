Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE7E1FBA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Jul 2024 00:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719967713; cv=none; b=Eok4IdqzrKHeQ4eu6r/J/xiPWEzmWZK5/EeAgsP5w88vr/OGEHx3ct+Nba09NH5fVQkyWfPCP0lZHGMJ1P9urhkdCxUiYY+x9OaX+JeJ0fmfFGG18WtO9fqeg/T7ye6+bIeMuVjLwu8z5SaplazeuMFBL6TqHM0no6YSVdDlNUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719967713; c=relaxed/simple;
	bh=oWYSMtuZp1pdNBxCN7ttoYHwMtat4dDaIgcJ9Igj9CU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nO/a5xBpR73nfjeSyMVqLsXBVCthBPjB0VgI5ZidIYopSQJ4KnbSXl+2HFMedzDPwXy/hHfF1a+ah9wNZ46nlzunPBEKS5u8k7tjT1Dmql3S76B8lq7+25WemR7YvnWNq0i30WJuzUV17PKDjNgQm0Z2MjO2dfSknRxMZJiuUW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljDmOQFl; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljDmOQFl"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE984819CC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Jul 2024 00:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jV8j4w4MjY6u for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Jul 2024 00:48:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com; envelope-from=peili.dev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C072E81AD1
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C072E81AD1
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ljDmOQFl
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C072E81AD1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Jul 2024 00:48:30 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-700cd57a9fbso1858086a34.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 02 Jul 2024 17:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719967709; x=1720572509; darn=lists.linuxfoundation.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Li3K3Uue/qNEmAx8woj0qwPhTqO5rT3fVLroOQjerg=;
        b=ljDmOQFlTyMRIGnQY7sr7y0FaEjXWvZlWitnIpj3ac9+9SdSjTY4T7aaHo5X2G2EKz
         5yG1Iah4GTxAnNYCETQs6PhXsamKhxaEzbCXFNoj/KeSP4ffuhsabJQ+pEBUiGNhWUoL
         4QVbEBqEE82Lii2N9wdfyRPttzrlLDGCpFZGZyagvJ++zCJhDA/m8vFBc8Xqntu70Cg8
         LAtiKb6Zc3Bns6rOyrpzuI8/kaI+nI/uWkAttywc836puaH9YoWK5GyZP1L9myjO3+oQ
         TOVELTiczo2RkLjcwL3fFHhluiLFXZysEyL0vo4jXBnXOKFp+gSQqLsPh0VdummzAQO2
         pjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719967709; x=1720572509;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Li3K3Uue/qNEmAx8woj0qwPhTqO5rT3fVLroOQjerg=;
        b=jbHvHamNje0POmVVVnr8V9+vu1/ERDgPIH09/n7cengybJH6O3r8P4HW13tiWZaoeQ
         /JLPZNYK4k1HUPu2+e+xgsBhj5/21+8pcPI0V3xZtAqFrNRIui5lst1ZIgmn4QwUv7/p
         fl5+qVzKc6+ANlSIM0m2c6h4mhnw1XFNFLw5hxFxBV4ylETiKVQLSHxgLEw8ANc/eAlx
         QMF9Lt7XXRM1irWUlCUx3UA8XHTj+pZ/5SLwvhSgO+/tZUpuB2HBbQS8nlBrdhePbvAT
         G+k8s9BSixgm4M8VR5Ra2Egfx+SkZJv5456ym3iX5Zy2MAnVRVe2RwCrD7qUsqStk7+R
         pxuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5lBYqkJ7GHOHyKxxsVrr/hApBGcbi3S3n9C3engMlZ2FAv2kfDpzPnrKEm+0xcwvG5holYHTdTkX9kZwiEPxKhg4R8xoPcNwxlRKcjShlBMierXerm3gAHRCJRzl0
X-Gm-Message-State: AOJu0Yy2lVgNDN1EvOaudOG/5IyHLx7s723DO91+Gr10iPC2qdwJfLLX
	TAGV5RTdLWTq2k8bptDZgpUvpXRtciXAyTbg9o0LlzhDbuZTQ1B90/jo0Q==
X-Google-Smtp-Source: AGHT+IGE37cgZq3LE0NZaCz+m7LS6PUY2cEAveg7UCUE4CXD/YmIbu7cgbbVm4lju8pbSA4JGkdBDA==
X-Received: by 2002:a05:6830:2056:b0:702:1de0:9a4a with SMTP id 46e09a7af769-7021de0a7f6mr5366692a34.29.1719967708719;
        Tue, 02 Jul 2024 17:48:28 -0700 (PDT)
Received: from [127.0.1.1] (107-197-105-120.lightspeed.sntcca.sbcglobal.net. [107.197.105.120])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70208090725sm1273321a34.39.2024.07.02.17.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 17:48:28 -0700 (PDT)
From: Pei Li <peili.dev@gmail.com>
Date: Tue, 02 Jul 2024 17:48:27 -0700
Subject: [PATCH] io_uring: Fix WARNING in io_cqring_event_overflow
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240702-bug9-v1-1-475cb52d3ee6@gmail.com>
X-B4-Tracking: v=1; b=H4sIANqfhGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDcwMj3aTSdEvdxBSLRGMzMwvDVKMUJaDSgqLUtMwKsDHRsbW1AN+eV1p
 WAAAA
To: Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, syzkaller-bugs@googlegroups.com, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 syzbot+f7f9c893345c5c615d34@syzkaller.appspotmail.com, 
 Pei Li <peili.dev@gmail.com>
X-Mailer: b4 0.15-dev-13183
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719967707; l=2240;
 i=peili.dev@gmail.com; s=20240625; h=from:subject:message-id;
 bh=oWYSMtuZp1pdNBxCN7ttoYHwMtat4dDaIgcJ9Igj9CU=;
 b=2CTRcQ59Jslvl+23lIw2OKiISOO9WIwUSDXNtWtmPaj+xHfnXlASeBeCMeVeuBYShg9TeHBp2
 jWp00+/6ZKGBVpFs/19fR+hino0mbkb7//PSP31OjHtZ5912tcbwIQR
X-Developer-Key: i=peili.dev@gmail.com; a=ed25519;
 pk=I6GWb2uGzELGH5iqJTSK9VwaErhEZ2z2abryRD6a+4Q=

Acquire ctx->completion_lock in io_add_aux_cqe().

syzbot reports a warning message in io_cqring_event_overflow(). We were
supposed to hold ctx->completion_lock before entering this function, but
instead we did not.

This patch acquires and releases ctx->completion_lock when entering and
exiting io_add_aux_cqe().

Fixes: f33096a3c99c ("io_uring: add io_add_aux_cqe() helper")
Reported-by: syzbot+f7f9c893345c5c615d34@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f7f9c893345c5c615d34
Signed-off-by: Pei Li <peili.dev@gmail.com>
---
syzbot reports a warning message in io_cqring_event_overflow(). We were
supposed to hold ctx->completion_lock before entering this function, but
instead we did not.

The call stack is as follows:

Call Trace:
 <TASK>
 __io_post_aux_cqe io_uring/io_uring.c:816 [inline]
 io_add_aux_cqe+0x27c/0x320 io_uring/io_uring.c:837
 io_msg_tw_complete+0x9d/0x4d0 io_uring/msg_ring.c:78
 io_fallback_req_func+0xce/0x1c0 io_uring/io_uring.c:256
 process_one_work kernel/workqueue.c:3224 [inline]
 process_scheduled_works+0xa2c/0x1830 kernel/workqueue.c:3305
 worker_thread+0x86d/0xd40 kernel/workqueue.c:3383
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:144
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

In io_add_aux_cqe(), we should acquire this lock beforehead.

This patch acquires and releases ctx->completion_lock when entering and
exiting io_add_aux_cqe().
---
 io_uring/io_uring.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 4e2836c9b7bf..0f62332e95ff 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -834,8 +834,10 @@ bool io_post_aux_cqe(struct io_ring_ctx *ctx, u64 user_data, s32 res, u32 cflags
  */
 void io_add_aux_cqe(struct io_ring_ctx *ctx, u64 user_data, s32 res, u32 cflags)
 {
+	io_cq_lock(ctx);
 	__io_post_aux_cqe(ctx, user_data, res, cflags);
 	ctx->submit_state.cq_flush = true;
+	io_cq_unlock_post(ctx);
 }
 
 /*

---
base-commit: 74564adfd3521d9e322cfc345fdc132df80f3c79
change-id: 20240702-bug9-ad8a36681e2d

Best regards,
-- 
Pei Li <peili.dev@gmail.com>

