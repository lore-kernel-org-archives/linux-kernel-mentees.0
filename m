Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93E8364943
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Jun 2026 09:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121840; cv=none; b=copt7Sv0tJ4G6PIObJsb+sILjCFHuS0B8op99uzWUyWRIaIQJ+Dl002ISBdsh+yLqRqGhfFMu0K+qn9zjkppaHeNGH7uobE4VZu0epUxSl5BSwM6vlz3H2w9Wask9SMkMnV8hQJC5hFjKeMXLRDnlufbWoTpnVPdazdfeWrl9Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121840; c=relaxed/simple;
	bh=LcXFBjy0Musq3rs9odypp8XIbScOuRnpbQGZpnLXeYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mmgb3H6kVuCkaGzeRYfErhyzdOEKgm98cW/eEjRJ+yH7md9bOFCd/P2ymt5LyRfHh3P5lLxe4sG4dtHpXxHuj1Z+CXbZ4WAskVjAWOcEtnez+Rn6eMT1aVJJJhbT/1Ij1J8NMm5hIui3a2XcwW1Smt98UD+XbQUzLoBfCaB7JZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QESjakpN; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QESjakpN"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36d98b9aa9aso3627117a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Jun 2026 02:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782121837; x=1782726637; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=htWvtKaxua89M7k0hTBaygLPKjJzXT76M5Ou0Pu7mmM=;
        b=QESjakpNRHJJJY1N/QVS1CS4w2be9r1iU3nAWVmOxFPzzYtk69X/FWQaMz02hRoXRa
         vWrXrhZthJBTyIb2jR+fvDk3XdoA9lf0i6o3v7U4kWalixW3elvCE+Oty2IjPrFmJL7m
         /QtaksUsoFcJTmqa908RefetmHkY4OeBqMCgYdab6Q6lFHX3l64aHmmmScgS+MxIzzhW
         ZpHxRQJbRvHQWdiIxlEcG6RtF9EjVVgt3Q6DsBauVM+8A/ZN2mJavIAcw58HXAK1HKGW
         tvI8n9IqbYevCSw3YCEo2NBRsUxK0NIX/6S6dvJ96ZEInNm3UBN8F10ZASW1GoueOtop
         RS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782121837; x=1782726637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htWvtKaxua89M7k0hTBaygLPKjJzXT76M5Ou0Pu7mmM=;
        b=kxZXS+Ie91QRLQrzuUcoIT+HHT2Q6954kt3OV4dx/Lgecboe1lN6c3kPJFVD/0TCBN
         7O4UQOmX/gMBmkf6FJxwK1C4Sks8XyEUv+ltW0AJ6LxiIUuUKE2NATb6MUHgZu3weQKa
         w7fHzTzhvXSIzP8gHwglwrovx25/9qC9wMavXl8diDUKSf0cMBW3x4M0YzdeeFPrjziy
         Jyir4KtsfzI+ZNoT0QnjMlBYjxsbX3gxUcScCeFFZsnUUrRcVZGcgOqsoFK7w/AZL/Gm
         UxaIclWENHE+9ItvGrDmYW5+3lVmFQaHkkJNFCLEkYZeZK1shqD+Tby3eCpSoq30odvD
         3Vmg==
X-Forwarded-Encrypted: i=1; AHgh+Rr3+/CA1Wk/K74cYhy/mnLSVEjdeS+0a/s6ZkNabx3j6AEXjN5RSdpiCCCq8MRMKmg6Ep7yRIdtcd6lmxgR6HC3bh+5lA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVnHOSuhKt1JM8qhGLkal8tEYCEsuLUSg0Q1xvMLet5TOzrp0o
	KiwGSfBm+cn5k4XyYwl9Exwq/BSARP8BEUTCgneOYrUO9kKYjGwGz3/3
X-Gm-Gg: AfdE7clFf17dSN16ADq8xsmIw8QS+JxgcU0AQHO3te3q4qzm+pDBHiBN0abZShp0BRZ
	SXsQjE+evfsAa6VaF/SzeRCzios1aoM6iVPtVXquuqhDzhosskjXd5QjmYmbg956uR76nTb5Wrv
	J/g/Oa2OKRvq+bD2Ny7Jbp0BzCbDxtyAJE0QRXrlcGHA02nJVMwXOMzt/1Kc9ZQa0AnfncW9uvC
	ETNuRrEtQ0VVJ1QA1pM8mFoOcNOM1RpptGrQh3A+UKtul2K8Lerw106PhsehigwQyF6sKnqfoai
	+01haSJ5f/vd2wZEpK9TDJwCcTy0/r+IW6PycQc91IBX5vA1HOVu4mRtW472v2KJjqX3Jr/EeVQ
	AL7LpyduAp8mm9y0BEa8v0M8dDnFcBIe/cw7/TVjSod+mGPEPD3q0/yJvYoF0f9eZ/npt/nd71Q
	OeOIjZ1Bc9hHBJ0Ca1h3uEB5qRMCE=
X-Received: by 2002:a17:90b:1806:b0:36b:8873:d96d with SMTP id 98e67ed59e1d1-37d1e86f26bmr12687817a91.11.1782121836852;
        Mon, 22 Jun 2026 02:50:36 -0700 (PDT)
Received: from mo-Inspiron-5559.. ([2001:fb1:d9:863a:ce08:349e:af46:efee])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4eede23esm6512438a91.2.2026.06.22.02.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 02:50:36 -0700 (PDT)
From: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>
To: rostedt@goodmis.org
Cc: mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	woradorn.laon@gmail.com
Subject: [PATCH v2] tracing: Use seq_buf for string concatenation
Date: Mon, 22 Jun 2026 16:46:23 +0700
Message-ID: <20260622094623.18469-1-woradorn.laon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for removing the strlcat API[1],
replace the string concatenation logic with a struct seq_buf,
which tracks the current position and the remaining space internally.

Use seq_buf_str() to NUL-terminate before passing to early_enable_events().

Link: https://github.com/KSPP/linux/issues/370 [1]

Signed-off-by: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>
---
v1 -> v2: Fixed WARN_ON when booting with empty trace_event.

v1: https://lore.kernel.org/all/20260620175441.223342-1-woradorn.laon@gmail.com

 kernel/trace/trace_events.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index c46e623e7e0d..1be62a46e49a 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -22,6 +22,7 @@
 #include <linux/sort.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
+#include <linux/seq_buf.h>
 
 #include <trace/events/sched.h>
 #include <trace/syscall.h>
@@ -4500,14 +4501,20 @@ static void __add_event_to_tracers(struct trace_event_call *call)
 extern struct trace_event_call *__start_ftrace_events[];
 extern struct trace_event_call *__stop_ftrace_events[];
 
-static char bootup_event_buf[COMMAND_LINE_SIZE] __initdata;
+static struct seq_buf bootup_event_buf __initdata = {
+	.buffer = (char[COMMAND_LINE_SIZE]) {},
+	.size = COMMAND_LINE_SIZE,
+};
 
 static __init int setup_trace_event(char *str)
 {
-	if (bootup_event_buf[0] != '\0')
-		strlcat(bootup_event_buf, ",", COMMAND_LINE_SIZE);
+	if (seq_buf_used(&bootup_event_buf) > 0)
+		seq_buf_puts(&bootup_event_buf, ",");
+
+	seq_buf_puts(&bootup_event_buf, str);
 
-	strlcat(bootup_event_buf, str, COMMAND_LINE_SIZE);
+	if (seq_buf_has_overflowed(&bootup_event_buf))
+		return -ENOMEM;
 
 	trace_set_ring_buffer_expanded(NULL);
 	disable_tracing_selftest("running event tracing");
@@ -4766,7 +4773,7 @@ static __init int event_trace_enable(void)
 	 */
 	__trace_early_add_events(tr);
 
-	early_enable_events(tr, bootup_event_buf, false);
+	early_enable_events(tr, (char *)seq_buf_str(&bootup_event_buf), false);
 
 	trace_printk_start_comm();
 
@@ -4794,7 +4801,7 @@ static __init int event_trace_enable_again(void)
 	if (!tr)
 		return -ENODEV;
 
-	early_enable_events(tr, bootup_event_buf, true);
+	early_enable_events(tr, (char *)seq_buf_str(&bootup_event_buf), true);
 
 	return 0;
 }
-- 
2.43.0

