Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A19241103
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 18 Apr 2025 22:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745014515; cv=none; b=dbrEEOxdz4dGBCG+6/qTVCaSJuBlOJrNWtU9bnsxPHJftR6KKVl9SFvexM39UGpPLzVXWDCPUpix58qwlvSd2TRH8Wf8E/0TBINyWTn8foWWeiXmrT+IYRgymYhkDAr7cYarpgQ6hRYEJlgpSZMtZb2E+JarVqDOAFBNlzYgVKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745014515; c=relaxed/simple;
	bh=MDBxHsJCkRfwaYkN4xwKGOxP9+1Gn8TJMJCH3XDi0T0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wj7G8aB6Q8gVs0Tlloi+pP5yzA4cba5SKvkjAg1ls87uHq+7PkdC0qSB/j/A71eZWoRURXO80PDk4ZLWVoKIJkNPjsPhNK3bGE6nAJdOUSexmsOQU16fImI2jaHlLv+o6zrRURinU219ksDrj6XuD5N0H3imXoj9SiG0wqTKI+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQ8s7/a6; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQ8s7/a6"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46BFB810D2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 18 Apr 2025 22:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8EdCV9DdSinP for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Apr 2025 22:15:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=devaanshk840@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9785181AEA
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9785181AEA
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QQ8s7/a6
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9785181AEA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 18 Apr 2025 22:15:12 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-736aaeed234so1946708b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 18 Apr 2025 15:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745014512; x=1745619312; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SvuW99/2oNvthIJgT8GkH4cc6GT8kdWdVq16cR06I+0=;
        b=QQ8s7/a6VloVbm0LU+fbnLqn1GRgYTpEjvSQu2B6cRkhAZaqxB4PJCO0UoYKLEIio4
         0lyW813NrS2tkH1z2gNgRfG0LfiCsDQzduDKH5658peYnYEIph/AQODm1XrCZu0FrMdm
         SR6duWIoZoZg/Xo4xMVsFkLLprsmwlaShmmlgUktIWxrMjUy53/Oog7aF6neaGEok+G1
         ZX4VmTnDgN1A5cUMO3Jyje8MHFU7Eiyff5rzQxEYocIAlvxOan2PlfndwcamFAM4RmMv
         Ors05zA5EsPnrh+sbP2Qnp4XGV1FIlNq4GN/0KwYfpH0VjaB23sr1Cke3aXPHfVQRU1m
         iLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745014512; x=1745619312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SvuW99/2oNvthIJgT8GkH4cc6GT8kdWdVq16cR06I+0=;
        b=YzKL841lI9K4U0ZEtfsqxCS1Yg3BC6SXSxdeJmoxyh+KQDrGC0cHFhEaPllhSNcUM9
         bmJunq8tpiNJJHYZWnhOA/9THetmpK5YVgkEeU5Welyyy1rqcZm9CAxTI5kYrQV+FE4l
         30Cw6KaiTPkT9j9vFAkYV2uw93JFghr21uLKk50AIT2JzgLmixxIuLZBNRjOpE5JDKLw
         tD/ETokahbu7dF8iylsXivuwryUkEDx00ruoXDrWhiInO9yP7XYiuqZe0vulkeJAAAdP
         dLyQSS+ZzcR9arAg1AbbNnzMYh3I6PNAyVdZ6ru33si/QNSE7kn0kpmeHPUTi3vq3F4v
         K2KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiUHpVAxjgZ/NB+yncAk6l+gZU9YRge/8n8Z98jAUh4dCOQV1fJF65Is/NP9O2r2FJKoUKnTK4MZHCqhrGtaEH3MpAuA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxUo28t5snfopxkm61Mp/j/3nYrG9K++YvfNVO6hnmKkHcNXe7s
	j+Wb0n4zh+of60u2A8ewHaX083DPNUnRqjoXQQMj37uN9Gvp8qGQ
X-Gm-Gg: ASbGncs71Z+u4plYMXufJlAiUN1eeU22ntAt6L0oZevvYbJhoMQgVMUgQC6t+1hsOQF
	7xJoZCerbfqAXvQcUqjpSWq+g1Pe20MeDWJ6QTk5ACMUrgV0GbjbZe2nM/9PQFVSLNmUDwUnOqL
	jMt7j0TQ1nZN05ZgAbbeA6/4VdSduPluJ3cUbRJNDwn7saOWsm4P7Zzp9/QS0ESzw7U4rJ1R7BU
	LSvtjfe59pxBh8tYT3M+XpaCV9AQSUcAEliyev6/Eg/gE0MvXwaSoJ1KRny1EpiBKm+y/qC7t/9
	T7i0f2FGmoUzHCpo1g0ObZ5JoIO24iBWONFToCuT
X-Google-Smtp-Source: AGHT+IGJ4CYpI2OHYR0RVZJ8yOR76RsDFeBV5X07FEPK/XxIkWSq2ein7aEwe5oJolKQY3P1d1Q9Eg==
X-Received: by 2002:a05:6a20:9e48:b0:1f5:7007:9eb8 with SMTP id adf61e73a8af0-203cbc55934mr5974149637.16.1745014511665;
        Fri, 18 Apr 2025 15:15:11 -0700 (PDT)
Received: from fedora.nitk.ac.in ([2a09:bac5:3d50:1a46::29e:5f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db13a3396sm1873880a12.28.2025.04.18.15.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 15:15:11 -0700 (PDT)
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
Date: Sat, 19 Apr 2025 03:44:41 +0530
Message-ID: <20250418221443.1067938-1-devaanshk840@gmail.com>
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
index 14c6f272c4d8..0f2253f3bc8c 100644
--- a/kernel/trace/trace_stack.c
+++ b/kernel/trace/trace_stack.c
@@ -542,7 +542,7 @@ static __init int enable_stacktrace(char *str)
 	int len;
 
 	if ((len = str_has_prefix(str, "_filter=")))
-		strncpy(stack_trace_filter_buf, str + len, COMMAND_LINE_SIZE);
+		strscpy(stack_trace_filter_buf, str + len, sizeof(stack_trace_filter_buf));
 
 	stack_tracer_enabled = 1;
 	return 1;
-- 
2.49.0

