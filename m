Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E116D1E1A3D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 17:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759857222; cv=none; b=GvAWChw/vBjWuhxGw0zKidIE39WWnCeZ5e0l+vXjZ5mvcTRfLUvzDRcNga/YnTPQKpmhHgP701RthJAxprfA7llsC1pVPoS1lXYoLmFczoWXhouJrYHBtFuaVscrYKJayMN8k6Fvwqbouc+kdU8nWGc1753D/146k747TRH+ItA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759857222; c=relaxed/simple;
	bh=6hkEXSoPQClBN9P+2M59L/xoo11QDhuwy3o/ItrIwug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r9VK+7FGTxiGlyoNDqDdc3iti6uJJRCgz5seyqOpCI/x2KUQzMFm40dFrosALK4QygSW22lOAQGsbb+gvOavpMqgXDrrl+DZLH+8MDotBWQfbyDlUgqMC9SBvRJNgRXQfsF5QjbyxLMhQq2wJLN9dZqAxOZsepHnNbikk7JgwbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tx/0gGpZ; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tx/0gGpZ"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96CE240135
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 17:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wdeErWcMiKup for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Oct 2025 17:13:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1044; helo=mail-pj1-x1044.google.com; envelope-from=ankitkhushwaha.linux@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EF1FC4010B
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF1FC4010B
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Tx/0gGpZ
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EF1FC4010B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 17:13:39 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id 98e67ed59e1d1-330b4739538so6612898a91.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 07 Oct 2025 10:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759857219; x=1760462019; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ndiW8EiHjsJuqlvrDnKSTbKhst7QkkL0u0UDEfXrL54=;
        b=Tx/0gGpZboZQ/RbkFr1oh9uyOG7a6H+cktB1Nrf1Fg2vTeIZxAXGs5zwoQ0fwxLOv7
         GzRuEMejALAVaFYb58qxHEJOmiX7mBwnbxXpnyN7joalwX5UpvPFfIJew/dTT0DndjMY
         h0KdgpO8HgPC+S2+twUmK26J92BdFkk3A0IUEjURtq8DW+FQ5WXsY9jqoULwK0c7+EaT
         loOZlimNsdYSMyXewinAZKAa+9pPXpJGGCYu8b2CsuipxwEqSEOPTlP1HVS709QxgiiC
         BmIMzLzsM/T6MNDZUgQnARWK0urROARemVqEWmbI/Zl+GaUPoDCPTxZNbjFm6xRGaKDu
         3XNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759857219; x=1760462019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndiW8EiHjsJuqlvrDnKSTbKhst7QkkL0u0UDEfXrL54=;
        b=X0Yc7iSpLyi0jN/7V4BM2HHP3qj8Ijcz7aIW+GlkF0FrcQFzx1g7ZQWwHn5E/vubOY
         Eo5nF/9WS2z06UKmJHQUK3a8k4FfMctiE6Xb6wWlwGNTi9i9uL+Yxg/qrgyJ7GG/DM5K
         DSvXvIHhOWL2+lQYaUWVL+L1qnbEG1YueE/4rVTuWStBq2aj/KDQ3q/E1wX+3nrZwL3s
         2nGdKc9xtvxZXAtWsw1XLYPEjqkYshsVn159pK+pCUhAZhzNQZgnnIbMVk2ldCN1yuML
         VE41IxBv/vfpvW0TqvWGuGtGKL+N9kIbGxRIGocXFnU8mNWxzE94EuZQqvFivmRQiRLL
         GM4A==
X-Forwarded-Encrypted: i=1; AJvYcCWUk1ysRFMbNIoAYNBIX9ajhFBRjj/WG6adV0x6T2llKBTQ4CqkNjye5aDt6aoZDwXtG5ligiS1A4fJqK4bUrgaxXYwRQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwSLOFKU1NnjhZrEZHGr30Q4P8V9mz1ypAuD5ZCLYLMyeyOTZhD
	h/SvmFbi2IfPWl2PP5+BgFOUBTWnuTZjIgPPTGb57U+ymI0Xm+JWICgy
X-Gm-Gg: ASbGnctHhR37uam4aR49Jm0fmkrGahfegkDUOjGea2ahhvyQ5wEEPBZADlvRGJZAwZR
	OdU6BTjIKqpIWBL5hscr3vXGi03uvWlTcagazhg2focIwewwfbV7bQ95noMkqYFVDsoviRcBf0U
	nOBhADJ/tofH12ryqfSgc9nyYpLhqNHyPz5w2PSXDWNJkM8LiKPjDy4hUG4MlHvcANTDLaafI5h
	BRDQ5KNe9yfkI+UP7lHRbJ/5vZSd/ZrUyTtwn8tqkuf37cnaTDQd2TnwDCJGa9RwHiJUqFkTrPt
	uyuxnNbQspJPPWkdbytNDVfrqpixwPVC2SOxv8fsUptroWALbOKA12E7/Alm2Is1I0r7niJ9lK7
	43LwXm0JhiUHO2IL5btsTkfShFUcRpPf/8nkHu2ZDZ3SZKb5sGJWxAAtnLg5fEY6Cnw==
X-Google-Smtp-Source: AGHT+IEw8/ovBuazt3eXRnTgiJXDDXOaNSZGFtByXDec22X8YVk7CtYfnAhylw3oRk25QxNUr2BtOw==
X-Received: by 2002:a17:90b:1d09:b0:32e:a59f:b25d with SMTP id 98e67ed59e1d1-33b513cfadbmr293892a91.30.1759857219077;
        Tue, 07 Oct 2025 10:13:39 -0700 (PDT)
Received: from fedora ([103.120.31.122])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339edf4992dsm1906075a91.0.2025.10.07.10.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 10:13:38 -0700 (PDT)
From: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: david.hunter.linux@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>,
	syzbot+ddc001b92c083dbf2b97@syzkaller.appspotmail.com
Subject: [PATCH] ring buffer: propagate __rb_map_vma return value to caller
Date: Tue,  7 Oct 2025 22:42:56 +0530
Message-ID: <20251007171256.20884-1-ankitkhushwaha.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return value from `__rb_map_vma()`, which rejects writable or
executable mappings (VM_WRITE, VM_EXEC, or !VM_MAYSHARE), was being
ignored. As a result the caller of `__rb_map_vma` always returned 0 
even when the mapping had actually failed, allowing it to proceed
with an invalid VMA.

Reported-by: syzbot+ddc001b92c083dbf2b97@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?id=194151be8eaebd826005329b2e123aecae714bdb
Signed-off-by: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
---

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 4ff71af020ae

---
 kernel/trace/ring_buffer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 43460949ad3f..4efb90364f48 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -7271,6 +7271,8 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
 		cpu_buffer->subbuf_ids = NULL;
 		rb_free_meta_page(cpu_buffer);
 		atomic_dec(&cpu_buffer->resize_disabled);
+		/* VM failed to be mapped */
+		return err;
 	}
 
 	return 0;
-- 
2.51.0

