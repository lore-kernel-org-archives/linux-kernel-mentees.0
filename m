Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F3913CFB6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 19 Apr 2025 09:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745055193; cv=none; b=nItg7Ku47Zwa+1lB+apFWdKHRVs+nnATp9UbXz8fZsN0nvhX16TTn0gYvn5pJMLFaqZ34ruhxlqsdajuhq5DkDoM35uXsGoo7rDiXe12e9e8P4iPHvvtP/tkNUYqA4BR31TnEdD3Ea5frI/MQ+OpOAdLx2UKEooIsc+X4B1w8Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745055193; c=relaxed/simple;
	bh=GJyS5j49HwboXosecKbk01w2vmZBIhpnREZRlsh+SmU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KAE6Z0xeQhnzGG1IB5YTMc+Uv7UD2/B9E4yDCKNGg1rO6kfZgUYGNchY0bdGsq/6z/XMX5DzIwGRyZFTnSHXvfCfYGC8goPAJT3bl84lQ6UQj6ZMhAz6X7SJQ80jndVqMkLueakENmRtJpSTuVeXWBXPRrkGqUSZEXOBujNh1VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZpnC1AB; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZpnC1AB"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C669607C1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 19 Apr 2025 09:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id prlW78Nsjccq for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Apr 2025 09:33:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=devaanshk840@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 596B460778
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 596B460778
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BZpnC1AB
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 596B460778
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 19 Apr 2025 09:33:11 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso2175902b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 19 Apr 2025 02:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745055190; x=1745659990; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jNBsSgAcJG4HwgrA5SXirxxEQY4MUp9geatSnVOp64U=;
        b=BZpnC1ABbHrDkaZDOCdMrVBUcSjm1i1r1/zlCnLLnOSFOCJC0l2BC5OSQzzgS690Or
         HM9q9n597YdbZr7OiRAFMAuxMcEEtL/r8IKmnSe7/5K8vdsRYgC+cCjssVEmLPNeVysK
         GlBCvSx8jUN2Te5FDL+Z8BCYuTf3zcWWzZ/7G0tjWPcyoHX4ZHlh9aPnlS/tjU32MGsz
         e9+zFk2yjrao2Ij7+XXl9mtbWDSr5y0WIHCeBLWwBv03DTvyjAWcrn7gmImdpnAPMl+O
         uAbJO/UBkiCKW9ts114X0VYWQiAVRLwuEt7gbeyylz+gUzILWeIO70z74GW62v1pcHsG
         7Onw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745055190; x=1745659990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jNBsSgAcJG4HwgrA5SXirxxEQY4MUp9geatSnVOp64U=;
        b=Hnu3ZVIl9ygaStjtmvOkcALfcIns1hH06E+RLuhfqaoQplcmPTAmOqq1KZxXvkyrHG
         Ai8UMVfTjs1rhqEQJhtGpdkeQDLkDmftKJ+2n7p2zJdR79wlUfg5cMA52PjV0RBGCOPr
         ocfmTjiTbhrOYHFzo74+Ip2eZnEr1fg+NCK9OGDZwI3ZWDj5TUvBFh9ahdfeoW0or/OP
         h2Qm5A5jq19xkk+23O97C+LuvtWq3KTG4FQhp5DjAVqrf4Yvl79zIh0wHOU+J1Vqvaqg
         Ch4cRuHd+3PPEGfgbFeXPEub68DyN7aPhYSMAVB+40t/3cGqQ1diHJ+7JrIY4Y2m5/IW
         G+sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJv4fP9u7oEesv/F0aL3sKus4rT9R2NFf4YNsEm8AkD5/BrFV7bm5tcA9fC9wqLYUU9Lw2jNIwYzlNStuiVFkBNHf8sg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw8Sn1/Gy5AhUe+N4pGrXRSiqSeVdYEgB69bq3+CSgadNAsq2Pm
	COvtg95PLRNMVw9aBJTG/dOQMihT9Cy4fNtvF/CvB3O4+BKiWGZ8
X-Gm-Gg: ASbGncuoWn0ZaefG7U6lGSrDJssSAbTXERdHbXK+oAJ3aDhl0ju6r+rl68gGMTzQIcd
	RLxw+SvxwObyWfuOZg1rMZZ59Y87w+cf97oh/wROjt1dE9AWBHecPPulJGgHMM2StvZCXNCNadF
	6M0LNh2IBBCZRIj8/ukzu9TQWUAi80Hnl2sF6MkyTfHd/Q9rbkTt9NPymZDpg/r6TGMItWTLhHx
	AzIcl97wR0zlc4ky3PV0e03AhEL1VTN3pOap6WrZIe7WnyVYFZ8wgLeiQeVywT72s50jCTivaz6
	HGvz9FZEmE2IyAG4nI7KRlPW+1gVk+t9xOkchtXM
X-Google-Smtp-Source: AGHT+IFaHnGJ1Xe8+ZQ76q9t831ngy+tZUUZlxsycSo2CKF753PTc5bk/NuURZDEmhZuDgrZQ/HhWw==
X-Received: by 2002:a05:6a00:2285:b0:736:4d05:2e2e with SMTP id d2e1a72fcca58-73dc149716dmr7054022b3a.6.1745055190509;
        Sat, 19 Apr 2025 02:33:10 -0700 (PDT)
Received: from fedora.nitk.ac.in ([2a09:bac5:3d52:11c3::1c5:d1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e46e3sm3056375b3a.59.2025.04.19.02.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 02:33:10 -0700 (PDT)
From: Devaansh Kumar <devaanshk840@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com
Cc: Devaansh Kumar <devaanshk840@gmail.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v5] tracing: Replace deprecated strncpy() with strscpy() for stack_trace_filter_buf
Date: Sat, 19 Apr 2025 15:02:59 +0530
Message-ID: <20250419093300.1575072-1-devaanshk840@gmail.com>
X-Mailer: git-send-email 2.49.0
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
index 14c6f272c4d8..4c349db381cb 100644
--- a/kernel/trace/trace_stack.c
+++ b/kernel/trace/trace_stack.c
@@ -542,7 +542,7 @@ static __init int enable_stacktrace(char *str)
 	int len;
 
 	if ((len = str_has_prefix(str, "_filter=")))
-		strncpy(stack_trace_filter_buf, str + len, COMMAND_LINE_SIZE);
+		strscpy(stack_trace_filter_buf, str + len);
 
 	stack_tracer_enabled = 1;
 	return 1;
-- 
2.49.0

