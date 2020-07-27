Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F22C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 21:38:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F5C920729
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 21:38:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IcQwbCob"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F5C920729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8EB3187A68;
	Mon, 27 Jul 2020 21:38:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bCrnZmzICYoK; Mon, 27 Jul 2020 21:38:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8B3C385CD5;
	Mon, 27 Jul 2020 21:38:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7603DC0050;
	Mon, 27 Jul 2020 21:38:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79682C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 21:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 651A620031
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 21:38:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xij2JFe7gc5E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 21:38:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 5A5BD1FF98
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 21:38:46 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id a19so2213519qvy.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 14:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OBPW13q5QlzlSrMzZgbTLPGHsSTa3HJ7NZm2XA+DWro=;
 b=IcQwbCobh7vNkJkcr8tb+vx7W74HheX2L8Fr7dpZ/em+hbTwhHjTLmVR+cPsFn6OsS
 gPOStCmf9ky3UPVmE+InLyxIWDCcHAS77jlOJpw0ym4EqJyydFZ8mDhkIIfnsBfVTLMK
 USUO2V1Pn8scghR4r3f87qt6DArxNQxzZd/Dlu0LiMs7L1FQR4Q8or8lgs7hH0e4qzS7
 7QK0AhL4agBclZPMj6pGcJLOYAV9Ru8R4+qRTdJHOYEj5JExzL9ACW2pXGvB2C/F4u+t
 LksyLeCqSowFyLoejfb9YdEZFCQLPt7IMNUxVKhgdiI2FP27N8A3XU5tPFjxdUTwadTU
 rx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OBPW13q5QlzlSrMzZgbTLPGHsSTa3HJ7NZm2XA+DWro=;
 b=bOfL/JC3gQx4pgdXh0tEDjkZdfSzvCS0/L+pu/ANQqna0R4/5rfKUZq8RPMx5LKrwN
 I/8tmD3eZYabvslv/hDFlgCXEAH1GtWcWmKFt6Td09xFu9vkbRdEswvCxYQZdQTQ6kyP
 pgx8EW8Os40WgKfxMcOv9gbTa6AbOjPwTIy/71FPpdmujoWO2H/QLszvR7Ir+aB/6Ni3
 iOUxcuuBDjxQx/6HlX8yGSV8EN1WpPu4fd+9k6+AeBeIUCNuIi/MeUXvNBQNl+qvp9e5
 dKEPyk8gVlt7jQCn2r9Swqs/lcXHs3IgoLTkc3jKfFs9xqI0As62n9H5UMEkjdEMsAm7
 V/ng==
X-Gm-Message-State: AOAM533I0wGqHi9NKUuerx5pR3iiyPFQI0B7l0uPXwgED3JExltStoVG
 CkA+3tbFgv16ZlzEE7AZDw==
X-Google-Smtp-Source: ABdhPJztgREWPYXpbY24y3xYJ2ab/diXDmx2tovh1N/94fVvWPtBBHR0/+nE3r/ezlx7C21gRN1SYQ==
X-Received: by 2002:ad4:5748:: with SMTP id q8mr23598337qvx.1.1595885925464;
 Mon, 27 Jul 2020 14:38:45 -0700 (PDT)
Received: from localhost.localdomain ([209.94.141.207])
 by smtp.gmail.com with ESMTPSA id y7sm17423217qta.36.2020.07.27.14.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 14:38:44 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Oleg Nesterov <oleg@redhat.com>
Date: Mon, 27 Jul 2020 17:36:44 -0400
Message-Id: <20200727213644.328662-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [Linux-kernel-mentees] [PATCH] ptrace: Prevent kernel-infoleak in
	ptrace_get_syscall_info()
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

ptrace_get_syscall_info() is copying uninitialized stack memory to
userspace due to the compiler not initializing holes in statically
allocated structures. Fix it by initializing `info` with memset().

Cc: stable@vger.kernel.org
Fixes: 201766a20e30 ("ptrace: add PTRACE_GET_SYSCALL_INFO request")
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 kernel/ptrace.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/kernel/ptrace.c b/kernel/ptrace.c
index 43d6179508d6..e48d05b765b5 100644
--- a/kernel/ptrace.c
+++ b/kernel/ptrace.c
@@ -960,15 +960,17 @@ ptrace_get_syscall_info(struct task_struct *child, unsigned long user_size,
 			void __user *datavp)
 {
 	struct pt_regs *regs = task_pt_regs(child);
-	struct ptrace_syscall_info info = {
-		.op = PTRACE_SYSCALL_INFO_NONE,
-		.arch = syscall_get_arch(child),
-		.instruction_pointer = instruction_pointer(regs),
-		.stack_pointer = user_stack_pointer(regs),
-	};
+	struct ptrace_syscall_info info;
 	unsigned long actual_size = offsetof(struct ptrace_syscall_info, entry);
 	unsigned long write_size;
 
+	memset(&info, 0, sizeof(info));
+
+	info.op	= PTRACE_SYSCALL_INFO_NONE;
+	info.arch = syscall_get_arch(child);
+	info.instruction_pointer = instruction_pointer(regs);
+	info.stack_pointer = user_stack_pointer(regs);
+
 	/*
 	 * This does not need lock_task_sighand() to access
 	 * child->last_siginfo because ptrace_freeze_traced()
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
