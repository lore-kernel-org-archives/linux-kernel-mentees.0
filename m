Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE7D1B4242
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 18:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743793105; cv=none; b=pE8MORmS+UgBMI3me7FVu5Xf3P6LMeqbKc+p4PFIMd4jSTisTZ43XjMnf7wfAY/llFwtWZ5D5pfU8tMoo61Tf1Z7g01FIYr9+oLtzPRh35WnmMYzSAYTS8kgSjA/5XMdzELc217AsKio4a+7eJn+SDVtdZAce3SuSxYa2XSVMz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743793105; c=relaxed/simple;
	bh=gUJ7ch+2ljiCT2mj3iJ01ojeBYFA0SgdHk/14Pv5s+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jLjNVJ7y6Ts+NHrDMFv+9V3ZEGNLs77jFoeeM99cytAtOeog/vox9Mwlt87yND8MbvThqZZxOw1Oh1GIXaUOmRNQ5ijlMA9zKAXYJmflA8ewg49ocaLH1V3ApfDD+7CuKZRswhE0BvSP2p4lP7tIP0QevcflmYra+p4ykhoBMys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgSmPnpu; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgSmPnpu"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 499A460BC5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 18:58:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O7mJNjjXCj4l for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Apr 2025 18:58:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=devaanshk840@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9ACBC607BB
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ACBC607BB
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WgSmPnpu
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9ACBC607BB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 18:58:23 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-736aaeed234so2050116b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 04 Apr 2025 11:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743793103; x=1744397903; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=czT9t7Qp7rdMQKs61CER3dHjC/ShGZ0p9ydFV0RkeNI=;
        b=WgSmPnpu8kcBtRXnPKKY5juXYfiKIXSLFvcxXNbjH5baiO4RcxqbN9kp95+kGRp4Dp
         bDfohEwv9FptoBisgrqrEuzmdGRcWj2h7/Gmc+JeMF1mtYHaQvHDXHncWo0TPGKF2XUE
         gIkUeKBMfDkc56hq//+AkvamehHK9BWU9eeUfC56QX7M6T9slq56C9lt2wMwWWsRkxsw
         XGuWBbJPzL+A7NWcsRRGPk46R2sjW6oqzn0zikPjR45e3wF/QDcSd0RT4SZahU5PbkMy
         xnliwGh4x42r6cfkjONQYxAZ4R9gMUuqaNWLMCTgd8A2YXA/GWoQwjggtCxTogM5OWBj
         GP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743793103; x=1744397903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=czT9t7Qp7rdMQKs61CER3dHjC/ShGZ0p9ydFV0RkeNI=;
        b=hGa5b37rwelcA/XGDHa4lLSWfIkqJe89CYU/5ket0d3cXIXrkYMWG4uPVkmk4OJoBf
         3J5X0iYYx7f8UL9RtQIjAdmQ/KNT8K9WH4AwCnZeo2T2mRs9DS/daIcTuEsT+OtRANug
         5v8We90I8reC9YNALViocHgXZbFirekEYwylsk6p3Vdyxg4QiryZICR6cyFsbPBfsWcE
         xPqu0TcqrxmkPvphHr9a1yWvpRzTbtSjoc2PzEqp36RlFEX5EMl6SXVNQ+YnqXefZ3bi
         a9digKw/Qz9WaPxp5ZrnxiJCQ8cis3isTsN9C+039E0+7lEyO8ykYfFnCUmKS7gO0/Rq
         l28A==
X-Forwarded-Encrypted: i=1; AJvYcCUHYqL/tQS4tBd1T4GCccRtdE/W6OwStJL44b25CynyYwPVS7VcBIDEQZQI4behjGo3rPDGzLjqjYuBi/x4lkOsZTdjjA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxX+7SMl74bwAqUJkYXu9oKQjDrVSmzaoBFsUZ63FcHSjsfQ4n2
	5uvQ/+rCmoqg/5FAtjSx7AJsilijj2CsUukLB6SePa/UGRidT0FN
X-Gm-Gg: ASbGncsDO+9Am3McqUzCXzzptwnwdO4MI9uiF7mvUsxvfwtzG6i9ZiA2Z8DGCMYJrTr
	CnPJdYEv67NOABy/eh8FYzuT5aUbe2uidmDxdxzrBi3AUnXtNhkves/7O3bkk5afSWTd4Tc0Hop
	TPpG3L4KnsdPEs+avMA24hkb/kPoGEXdONj4Ilosqhral/LeV/NSqxvEAEcS8umtG4FiffvLV1P
	QXlPCoTfPRhqu+HaZjgYbhnO5bds7P+UMbLHEqglXIXNroZ/gX1s3RumhfV/FTtN+AWnbWvD7/I
	Ma+pHc6WHDVbxtMKZj0uMeLU+Vv1eDkjG0ldmsLm8q0=
X-Google-Smtp-Source: AGHT+IFxFFy+1QLkfm3L4/1xU7Gcsmyq25Fpn10Kzmuaoo3aua/SdrrSfwlZtKCD91G9hrkEh0M55A==
X-Received: by 2002:a05:6a00:1411:b0:732:5164:3cc with SMTP id d2e1a72fcca58-739e711fcf5mr5187398b3a.19.1743793102688;
        Fri, 04 Apr 2025 11:58:22 -0700 (PDT)
Received: from fedora.nitk.ac.in ([2a09:bac1:36a0:810::176:64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97d17f8sm3879563b3a.10.2025.04.04.11.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 11:58:22 -0700 (PDT)
From: Devaansh Kumar <devaanshk840@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com
Cc: Devaansh Kumar <devaanshk840@gmail.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v4] tracing: Replace deprecated strncpy() with strscpy() for stack_trace_filter_buf
Date: Sat,  5 Apr 2025 00:28:15 +0530
Message-ID: <20250404185816.2990559-1-devaanshk840@gmail.com>
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
 kernel/trace/trace_stack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_stack.c b/kernel/trace/trace_stack.c
index 5a48dba912ea..617e59a234da 100644
--- a/kernel/trace/trace_stack.c
+++ b/kernel/trace/trace_stack.c
@@ -544,7 +544,7 @@ static __init int enable_stacktrace(char *str)
 	int len;
 
 	if ((len = str_has_prefix(str, "_filter=")))
-		strncpy(stack_trace_filter_buf, str + len, COMMAND_LINE_SIZE);
+		strscpy(stack_trace_filter_buf, str + len, sizeof(stack_trace_filter_buf));
 
 	stack_tracer_enabled = 1;
 	return 1;
-- 
2.47.1

