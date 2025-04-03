Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D2F29417C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Apr 2025 19:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707668; cv=none; b=uvkxGa9/WLaba/mNvoed4Ajk8TD/qpWzpIYFWfDyOlfU2TsqTI1dbQVMmhoFkD8NZqu1mGbWaDx5hbpL2vOFU5C0tkD1PqSiHEQVT+dgc1ePpRu+z3PAYR2ItD8HCvnn6zfDih0U5bpLmanCI9q4Aa5JtKZvwvMZHKGIdcbIWzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707668; c=relaxed/simple;
	bh=+pVrgwwEflxcv+fXpPVFmGLi+zNgmw2gau0oY0qWYyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QkPmdwSph9Ru4JugaSQ7Bo1hk03m2ScQBnIV4kFL30iND+SMZDM82KzpmB3QPtfDhPd15483+kTcwQAFHscO2VEy8SR6MninL3fU8QI7B6JnZJKnRML8I/FEmDxace20zXZJf8LSArkRlQLgeZEHpHQ4RvrF7KI2T77ngsS+EMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mU1zBNEW; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mU1zBNEW"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11AD1409D3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Apr 2025 19:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z4wSVkativIo for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Apr 2025 19:14:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=devaanshk840@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 51A3E408F2
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51A3E408F2
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mU1zBNEW
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 51A3E408F2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Apr 2025 19:14:26 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-736ee709c11so1147955b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 03 Apr 2025 12:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743707665; x=1744312465; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gRKzwJn+fllmtT/MCA+wLN8UzmoZF5DrIH265Xusm4A=;
        b=mU1zBNEWKiTzfU0V1z25DnUXyEQVEEJPWWQtqxMVN/FAKfmyM2SIVq/Gnn/Ocr/X/z
         ybXwuEkDAxPuo1nYiA3TPGfu/PQrKcgJfwseTCmzDcRzBJkNwm/jOJcfHM6O0wagvmwp
         V0HqFU5ypOA466SdIXx+giQTV/GTBymgvv9EjgXvNMcy6FxBAQil1r0e2TAiAeZpfEtq
         T5yxMsUwXFHFBt4DHqPUgK2oXq5TI3BpRtCTmcrwdSGqXW+CmMuU5yxuZ7Z50DcPze3R
         LnKvNcuUijqRm2f2gsRZc7h4fef+qhT6ky1w4cR7U/t8YY9CAwbDItJ6LZrkof1hXQG4
         xuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743707665; x=1744312465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gRKzwJn+fllmtT/MCA+wLN8UzmoZF5DrIH265Xusm4A=;
        b=KnviCnrgUrwRKFjrhULj38BQR6PrJzFbkNs6vaqvWZfMz0lXhmzVI1cgS0VoEUky4Q
         7ghi7G+lEZFp5aZmNhNM5TD1aFlcGcNDTOpg2WfFrK+eVeDNDaXOrZTp6hoq9dP+j10F
         jtosZOJNMGHrVgnhX6qmgjV3IZ/b/OwOzoFrmPLB7y3h+bzCih7iPVXukuDXInr8O38F
         kIak0+Um9fZ0Bu+MJmR82B3yO5W1cxgc+tOgXz8NeMmkjwKk6ftIvkhQdOM0I5iTUETS
         QD+9tv6E20jzrRrVuLoa3CGgbcHmcbQhEX75UzWl1RYQ9TqutqpMtnGxoNRSZ784enoq
         ok6g==
X-Forwarded-Encrypted: i=1; AJvYcCU6jcOMrIx9+SZrAB4uGzJ6zLRSq7kxlGXxCQI7dOWFOG2qkzlogsZasnnaSuiKQ0WeKU01Zv82V2xrCwfzEpTUpN2XZw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzMp1ZxwG6Ecam1sNFuE/D4sj/L3r7X1mhZPE+3VeoGZIi/5W28
	3ReIdJErwclEbjo+GuqiGHgm+sNK9vpi8jZPNG5cewlFhwkj3E9h
X-Gm-Gg: ASbGnctMRsqlrKLsmjsfJ/AIwLhw7p67EVZAhYT7Ux6o0rnNI/Z0uCBYejmd0zzufhf
	v751ZKpJzX5iVzPSFqmZq2hHSKNqsimOD1qVs77Wfm+SlVm7W4fMe/R4VpLa2KVoN/pin+fLVmG
	Hm7547+OjqFwrhYzvPpFac4MruIri8m7b/aQbgWeL51diynQwAhbJcfbUo/pw5t/NVg66S+d58P
	Ia1NjJn7+TPljrKTeQkpITD3Xp1BeO5PFObbf2y7622XtVbR4xA/GcFX2KrKXC2mq7WgtPwSHVS
	sB1fA21W3zlqt35aqhNPFCVcSfCFxeH2NLeapzk5ZOn25gX38ag50S13dA==
X-Google-Smtp-Source: AGHT+IFr6ysq7gCQ8c6HOaSVn89IPRNEU7Nny10SY01fQus6+wqmBy1OpmOciwDWpGwWzJg/CoTjJg==
X-Received: by 2002:a05:6a20:4312:b0:1fe:5921:44f2 with SMTP id adf61e73a8af0-2010462869cmr733614637.20.1743707665493;
        Thu, 03 Apr 2025 12:14:25 -0700 (PDT)
Received: from fedora.nitk.ac.in ([223.186.209.127])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc351371sm1583046a12.40.2025.04.03.12.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 12:14:24 -0700 (PDT)
From: Devaansh Kumar <devaanshk840@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com
Cc: Devaansh Kumar <devaanshk840@gmail.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] tracing: Replace deprecated strncpy() with memcpy() for stack_trace_filter_buf
Date: Fri,  4 Apr 2025 00:43:40 +0530
Message-ID: <20250403191342.1244863-1-devaanshk840@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strncpy() is deprecated for NUL-terminated destination buffers and must
be replaced by memcpy() for length bounded buffers.

See issue: https://github.com/KSPP/linux/issues/90

Signed-off-by: Devaansh Kumar <devaanshk840@gmail.com>
---
 kernel/trace/trace_stack.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/kernel/trace/trace_stack.c b/kernel/trace/trace_stack.c
index 5a48dba912ea..427526fd2afd 100644
--- a/kernel/trace/trace_stack.c
+++ b/kernel/trace/trace_stack.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2008 Steven Rostedt <srostedt@redhat.com>
  *
  */
+#include <linux/compiler_attributes.h>
 #include <linux/sched/task_stack.h>
 #include <linux/stacktrace.h>
 #include <linux/security.h>
@@ -537,14 +538,16 @@ stack_trace_sysctl(struct ctl_table *table, int write, void *buffer,
 	return ret;
 }
 
-static char stack_trace_filter_buf[COMMAND_LINE_SIZE+1] __initdata;
+static char stack_trace_filter_buf[COMMAND_LINE_SIZE+1] __initdata __nonstring;
 
 static __init int enable_stacktrace(char *str)
 {
 	int len;
 
-	if ((len = str_has_prefix(str, "_filter=")))
-		strncpy(stack_trace_filter_buf, str + len, COMMAND_LINE_SIZE);
+	len = str_has_prefix(str, "_filter=");
+
+	if (len)
+		memcpy(stack_trace_filter_buf, str + len, sizeof(stack_trace_filter_buf));
 
 	stack_tracer_enabled = 1;
 	return 1;
-- 
2.47.1

