Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59648288C31
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  7 May 2025 13:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746625135; cv=none; b=iGXW7ygt9Layawp7tXjv4apEdEnNR247a7w7Z2wBbyTq3tVpax1wPQiTR0kpClyp1bgKiM1oKECCDEZ8uxkrUHIgi3ExZeEpZ2tnIiLF9Slnz/W7Ve2cwsrRhtHHmqFqJv/qu9DChrfIAGW7ItmoOoW0c2Kbz4cpbo+feZ8bicI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746625135; c=relaxed/simple;
	bh=LfNP7WJnwi+phkB8AdTkI2n6mePHkoApep398h3RGrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NcgO6qsD4FwBLzBd3y121CO2x0O5clshFIUmm8mBMAV0wtsO6xNp6wJSGvovetymmhBqATT3dx8/7HRs1DLsD+dpJpowIU2mBd4RE3y8W3n6+S2NbhUElS2jiu4INKDYVTikhKkotjGZDR1yyqS1EPZEnXddY3h79GNDHf2gpP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHPvn6HF; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHPvn6HF"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E069760869
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  7 May 2025 13:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OR12whYV92hq for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 May 2025 13:38:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=devaanshk840@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D10EB60EED
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D10EB60EED
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RHPvn6HF
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D10EB60EED
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  7 May 2025 13:38:52 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54d65cb6e8aso8818508e87.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 07 May 2025 06:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746625130; x=1747229930; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OD/yxQNBXIGY/VHqYV6OisAoQh685n5/Owltr5spKgw=;
        b=RHPvn6HFcQMa9RcKLd1C/eQTrXJbTJFDeTuN9UQbP2aUAzFA4e2TXkbX8YDTmOjN8q
         1y3QIiMXR7FGrsp1oaEXmHxCrWChrcbbKCPUNuihZMljVy5JaT0zyRbglqBYAYz0sXkA
         ygbRj/JGSD0QWsUG3OgWVhlqRTLYIkbrmpKNRBKtpGVSFEDE4LJYt/92DE3nc0+SR4kW
         ekjYZv8eKbTCgzTzO4YuuaiYFBU6pyTpXyEpzvz3BiGQGC2NgLnJFMLgZTl0gu6eRhrk
         bZ7+/pEHbKmXfYFdrOdqQKeZ6G5qtmqsYsaP9aa/3YfW9k+8NWo1J4cbKGe5pBH2WVwm
         tJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746625130; x=1747229930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OD/yxQNBXIGY/VHqYV6OisAoQh685n5/Owltr5spKgw=;
        b=C++GrmMuHKRG4yHmfqTnr3ncZEwLPDti5/GFgLVhtWZoBwKvLedEukYhiX7HSe9Ip9
         g+78heNrx+7vkSjjwvHhJPImn38Jgge/mJFfm7IEYPwpZ7xUKprSHhH0MRQFPa/ZJmCB
         Ssv3PA/EOksXs6kmbF8Ccpr4zSYSyGlPADVbyLs9GulkLQ5FaauUbjMxLZqMY5S1nK4D
         5LUJrjN7wHxK3UCYssb0oh7UTDDcDt9JFMgOgnUm6lz4gFrCNWAGFztORA6HOHSqf/O5
         I3LZode1aiTCJaVIn/EL0MVKcgHeN/Mvf5bZuSklh2F07AvE+87AgmERInFTXo3+N5nr
         /mQg==
X-Forwarded-Encrypted: i=1; AJvYcCXP/M9lpLSA6NguET4ZrhwcaYeSFP6bAKtSUCHtbslIQZ6aY1EPyRa98cg9hChsG+/b8wcBDdJavwFkXNSG45oz4ApycQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yzcjpb0PtsN+A3W5v7xDZcBtb0D5ttBRfRZQ95D6TQ1XGcNLoNL
	cHYHQuiv+9kITzxSBvxdbU7c7ngJRfSLBYgH0Ls9vYgbpLE+B1g1
X-Gm-Gg: ASbGnctKD2CaMFLyMsg/f1lH9YhG5bFaBz2F7cr4Y4323mMmOXRMMoUrhyP3Zxb7VqV
	9VrLAtuaBmcmOdo8FJjsZ2Rp+5KozWjCggFLe4P99NlAX6iBDl66vWv/+c+/F9+P3SuCOz/GG1b
	59EjAgrkKH8daxn6iC3NpIaxCIxmWIdGjHhclZ4AexlXMU4AAybHeYlmkE/UvwteYDKlobHVQGO
	Yl2WJOOXHOeYLJEzZoxsv4tsLAXhtxa+TIbND18PpGnugCwFo16ud18V0Io5Vy5yisKYgPidndk
	KGKhfsNJvLqhW6rXt+3NxkZ6PrzgxQL+NI5HqpU=
X-Google-Smtp-Source: AGHT+IE7OuUNY21KuuPCZDuP+BcZV7oI8FYP8VyCZ4PN2pl4RI2QdeBd+BN8VNJT1RoUI1Io7w0QGw==
X-Received: by 2002:ac2:5693:0:b0:54a:cc07:4091 with SMTP id 2adb3069b0e04-54fb928f00emr1141623e87.2.1746625130185;
        Wed, 07 May 2025 06:38:50 -0700 (PDT)
Received: from fedora.. ([37.131.106.85])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94bf0cesm2348836e87.57.2025.05.07.06.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:38:49 -0700 (PDT)
From: Devaansh Kumar <devaanshk840@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com
Cc: Devaansh Kumar <devaanshk840@gmail.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [RESEND PATCH v5] tracing: Replace deprecated strncpy() with strscpy() for stack_trace_filter_buf
Date: Wed,  7 May 2025 19:08:36 +0530
Message-ID: <20250507133837.19640-1-devaanshk840@gmail.com>
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

Changes since v4:
- Removed unnecessary sizeof(stack_trace_filter_buf) in strscpy

Changes since v3:
- Refactored code to compare length with str_has_prefix in a single line

Changes since v2;
- Removed unnecessary string.h header file inclusion

Changes since v1:
- Moved from memcpy() to strscpy()


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

