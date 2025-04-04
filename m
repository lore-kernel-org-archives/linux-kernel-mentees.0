Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308EF1B07AE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 13:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743773492; cv=none; b=LYLibnChC0TL/EPh2ouTcY66yvA+iwwAKznAVgevxJJL5bZyDBL5p7HVJA+1BnazG9VyAJmCmVzzCeSASBAEsPgcltc/OZwNmTh80T8BxY/IFaZNjU9M+Zs7BiiELhKLeOBHzlr3x7GeoCxWngTphCYdeQUX6wuBwsPqWFUyvjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743773492; c=relaxed/simple;
	bh=Mrb3uEmlv4xl8tkAfjJDSVDkM8xtCLnQRyTNFJMkSWg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OUIIkxa8g8YXuCeiG3U5z9g/1XhVnTWsmGloSsn9JJp96vktPAAHqIFjMaCYF79J28pOjJ6Al0kWJMiraU7YQ+rYfvvrHMPpTYQKrvpLbTOjEzoYEX0DNg3HkYVr0vH8tHKwhxtQ1Hr0FZtYZZ92bHT5mDIeIB7kdeBgQ/x5me4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/qsxk2a; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/qsxk2a"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C217C608D7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 13:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o-Djaw4U-Yxu for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Apr 2025 13:31:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=devaanshk840@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E158060AB2
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E158060AB2
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C/qsxk2a
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E158060AB2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 13:31:29 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-227c7e57da2so18422025ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 04 Apr 2025 06:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743773489; x=1744378289; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zmk7AQJnJtbdOsTE+xjJik8mWDejJLeip88wYD329cw=;
        b=C/qsxk2ahmBGQQpDXKE6Kkc3iOYTIkK6XpilqrVIvt76cmaswmnOnJigxWCqKGzruA
         dOvgkwjJMmrA5zHztUBXiHaogmfF7c+kQ7WFgK2TVp/BB289ODgSw3hTW4l/UAiw3x1r
         v5VqVxhSc57fFFtRSlOjptt37PYFAIh6VyTEt1a4s5hR6K+5JG3myaGkdkuz4DTOioAj
         eIwWdwWjZlvVhiLBzn6xZzda2G6en8DSU7jjoKyo4jCtzDF12GQtaBU28Nn7SuMY5wBg
         uLq4x3mb6yUF62NGvGypyFdXfjOjF+Unn1mTNUWzA8HOypW1Gx70tp8WLw1VXq+GNjRU
         N2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743773489; x=1744378289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmk7AQJnJtbdOsTE+xjJik8mWDejJLeip88wYD329cw=;
        b=ovDVA2+wcUDzhStZUKmH01NIRQALYJLbGetlDvgKYQujdfzBE3K36n/h/BXzx5ZEoB
         7+QyrszEN3i3FoPzu/0njvZHfCyuxaQzpj4vebrY4t1le/m9oOUmQ5HyQzfQJhJttyhX
         l72spdviHIbuchFw0Qm8Q+D5+Lf3AJS3qPCrgVVctU+1PUiNr2uRN91N+/UC8x0NB1Rc
         ilERPZV/UARCfgKZq5iS/BsNQ4h4NuOYzwzOkoyCiaik/neEBTPFGDexDyQVEQZ0DOKn
         kM03nToT9pBl08tFH40PdXOLPOvycFXONrODLF9ehm1s3ZvuP1SSbDySnI/SZER/78U8
         HNtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlp6abLmRDyOHM3pxOeM79+0tNCP/niZT9Hzmh/FMo+Btx6j2m+88ZdMD97Zs8Dy3up/kp8TX7SA2fWAyb1e1qH4UPaQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyhNhhoP01yhHDF3aOV/L5IvYn0A2ySE7Tm4FgIA2zE/aGc7DVm
	E0XQjdY8XZnEXXMQnvCU/4dniebvIKTQEr150X4UR/VTl71ttpuexdY142TwKZw=
X-Gm-Gg: ASbGncu9yzw51h3ZOQHjHypq06x94ZPBzkVd1x090tiqk9ma31zjFRNITWUyXtEQAxc
	tIcMweB3qWpyQVqaOEUWPfcjwBo0Um0GuzAydtWOn1P8qEApfAO6xBzmzTYtLUmxR7Hf1glUBcE
	lhYLYR0ALBaIxSJFGbWXqQTB1zLrj+2iAEg6w7SJGCD+g0AkoYYycOix/sLXQkVZlQK5UtNMUjP
	1VsmFoKRDQiguSD6VBMA2dz23ryE2pXA08GbyXk7HIaRCc6OYGO8P/mSkiqhUH1AQzy7nrN/4Co
	P6IVeyZPbjjFteZKLXaT1ykWR5ulkUWKfvq+F+NYPe68
X-Google-Smtp-Source: AGHT+IHHjJCFcl1Uoof7R+Oq2QP1pTkGPta9Ksu7QNpbZo2s53FaqTO/vWbI7tuL49zRDu2mYg/0dw==
X-Received: by 2002:a17:902:f70d:b0:224:1221:1ab4 with SMTP id d9443c01a7336-22a8a05866cmr51137215ad.22.1743773489062;
        Fri, 04 Apr 2025 06:31:29 -0700 (PDT)
Received: from fedora.nitk.ac.in ([2a09:bac5:3d57:1a46::29e:13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22978772746sm31684035ad.223.2025.04.04.06.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 06:31:28 -0700 (PDT)
From: Devaansh Kumar <devaanshk840@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com
Cc: Devaansh Kumar <devaanshk840@gmail.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2] tracing: Replace deprecated strncpy() with strscpy() for stack_trace_filter_buf
Date: Fri,  4 Apr 2025 19:01:03 +0530
Message-ID: <20250404133105.2660762-1-devaanshk840@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strncpy() is deprecated for NUL-terminated destination buffers and must
be replaced by strscpy().

See issue: https://github.com/KSPP/linux/issues/90

Signed-off-by: Devaansh Kumar <devaanshk840@gmail.com>
---
 kernel/trace/trace_stack.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/trace_stack.c b/kernel/trace/trace_stack.c
index 5a48dba912ea..982b1c88fce2 100644
--- a/kernel/trace/trace_stack.c
+++ b/kernel/trace/trace_stack.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2008 Steven Rostedt <srostedt@redhat.com>
  *
  */
+#include <linux/string.h>
 #include <linux/sched/task_stack.h>
 #include <linux/stacktrace.h>
 #include <linux/security.h>
@@ -543,8 +544,10 @@ static __init int enable_stacktrace(char *str)
 {
 	int len;
 
-	if ((len = str_has_prefix(str, "_filter=")))
-		strncpy(stack_trace_filter_buf, str + len, COMMAND_LINE_SIZE);
+	len = str_has_prefix(str, "_filter=");
+
+	if (len)
+		strscpy(stack_trace_filter_buf, str + len, sizeof(stack_trace_filter_buf));
 
 	stack_tracer_enabled = 1;
 	return 1;
-- 
2.47.1

