Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701ED3D6475
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 23 Jun 2026 14:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226486; cv=none; b=cAjhgCLYIVgRJAYdO1nKT9xC+Nfr2xbeL/X7eBXegdJ2plB3x0aTgGC4RTeh4RvJ6tA0OdqcZCzZpjWV8Ns7qxLFlKDx3D8/V5x3rwfRBCYcV1RrXefDXS+abA6fgornNdlYEyACKUvN8SjwvqIo/auc/2SQy1fGgPHmKMvyYHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226486; c=relaxed/simple;
	bh=L90/AkyCB9U0geyi1lWA/eHf7voiXgf417DXWgwVaXs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lt0qKVW+AMB4C92xKWbMxChh7lRYlIV3RD+dKkpyBDfPy7JwtBHLcJnqqo8RCMfhz1OTsV4hMYGls/CgHgt8yCglZpEtCH7F0kYoSLxVmUgTUMlNgfMHW/f8tzjRy0Fku/h+xNV77Zh+PRExA4mjvPHmvGRIQ3DiBSsk5uIH6g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DxW+gzde; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DxW+gzde"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1384ebe7a10so5869944c88.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 23 Jun 2026 07:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782226484; x=1782831284; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IY3KFhICfndG+RHDKCrSaeQPMXM8dmxeDhVM/4MoFI4=;
        b=DxW+gzdepm5NEB2Rn0XbiGsooLGYT/cw+0SgEtfXKQRK9EBGnB9W0Wv1Azu/80kjNz
         tvnNQAQmep94OHv2PFYk4SYqal6aXZx5TeMu7T57I5VfzQbIlhwSPe0U19mbb/5bjB50
         O2LMUhmutmfsytW+qKTY7wmZCf7FPNLvwuun4LQEVnOxd3w8mforpgzAkLRp2rcQk7eK
         kLNUZgROQ26RNpHQ/eszofLNfAaSgCL+idJ2p5FlDa3Jv4wCLE72epLPYqcz2lwtesB6
         zBTZj8OCnldT/QpfYaB1m+fflg5NBAguz+Vv3/Es5/EK9LVkPPK437ol8FupZGZ547WZ
         tyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226484; x=1782831284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IY3KFhICfndG+RHDKCrSaeQPMXM8dmxeDhVM/4MoFI4=;
        b=LRbqygZmk+tK0jVDaZ4k4MrwqynrVQ6gZni0V08q9KgLM80JNiGqZKwFzYwHggtnRC
         qtdBkSpY82Vs5fXYiF33SAY8mYv4BVddw5FHjslCDqTGiymeTUn9nCoyE9okE6X11G2k
         QnzigNwt0Rg8OnQNiYWndYv9jUnVf6xDG6GTwfrR2ttZ62LQtdHnWB34ywiRdjwnwjpc
         ZvVRRSA9ysBWC5XZ2Bke3j7GiOne/9ZRFQQggveRvZ9c/ZALk7vKwuPtcHCpHj0nuO/n
         Zj0YNWaFKFVFewhRCuIrZzci8rWHyphwV4jVEwJ9fjoD7t9bwkthYDIYmif+z/62rF1T
         ZrWA==
X-Forwarded-Encrypted: i=1; AFNElJ9EyTip4rdpLN1hJcttuuCp3osodk9D5u57cQH3CAETksjGHHbYhjOAdAftXkbOo3B4lzybrsuBJF4dhbHqK4Yf1f1v/w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3w7c/eQWknrrJUJSWJGzJolDePMoskO2yJ29ZcMrm0m48gFtU
	R0dauBmuz2a30XRNvTOs+yXh5kV6SgDm2kN4P5Ad9ezaNtzXlNv/JIi2
X-Gm-Gg: AfdE7cmkzcCPgtOFo8O7HBDIvrDWJdmN7n6cFHYTnhPiPjLIpyEidYAWvz8wwrakDgj
	wjZhWWEinqYiI4rDbmtxR6zUEjf9XdM5wCdD9PK7jD5j7D5ZVIC1xFqVfCbiwScAWdS+G0ALuFU
	szMce65WUgyPrDIor1zM1f/X7qJtNolxSTVx/LqGezPibGmOl59Pj7NCs2bm8pox70P5N+VV0zB
	X+N+G1W/wt9ZBPBM8kZNDl8A4QfNZxpdQd1NrLEjXboAgOqAC9WkR6Jb0uYWQD1TpAzAJtdWUF5
	kaExtEUcFsKKTf1e934Wh4EVUNrKz5AUqixhmESbYXZ5g9l/PS+LYPlIcZVPoV3e7r7NTwkio9T
	duHd++jLLKcTuAyWAWAKwkaSyRb89qpfMl+cdfiV0BGS31QXi3rVusOUToEQPaoBLSt/a3AMGkE
	PpiPXET6eFeiCSUz0l1/F0DLVuc+zunVQzOpIe/w==
X-Received: by 2002:a05:7022:90d:b0:12a:6fb7:87e3 with SMTP id a92af1059eb24-139c5e033b1mr2686422c88.31.1782226484332;
        Tue, 23 Jun 2026 07:54:44 -0700 (PDT)
Received: from mo-Inspiron-5559.. ([2001:fb1:d9:863a:37d9:e7c4:e450:11e4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139adca1b00sm12963863c88.2.2026.06.23.07.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:54:43 -0700 (PDT)
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
Subject: [PATCH v3] tracing: Use seq_buf for string concatenation
Date: Tue, 23 Jun 2026 21:51:47 +0700
Message-ID: <20260623145147.12145-1-woradorn.laon@gmail.com>
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
v1 -> v2: 
	- Fixed WARN_ON when booting with empty trace_event.
v2 -> v3: 
	- Addressed Sashiko's concern about the compound literal backing buffer.
	- Replaced the compund literal with an explicit declared buffer and pointed
	seq_buf.buffer to it. This guarantees the backing storage is placed in 
	`.init.data` and reclaimed after boot.

v1: https://lore.kernel.org/all/20260620175441.223342-1-woradorn.laon@gmail.com
v2: https://lore.kernel.org/all/20260622094623.18469-1-woradorn.laon@gmail.com
Sashiko: https://sashiko.dev/#/patchset/20260622094623.18469-1-woradorn.laon%40gmail.com

 kernel/trace/trace_events.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index c46e623e7e0d..5ab630155ab6 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -22,6 +22,7 @@
 #include <linux/sort.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
+#include <linux/seq_buf.h>
 
 #include <trace/events/sched.h>
 #include <trace/syscall.h>
@@ -4501,13 +4502,20 @@ extern struct trace_event_call *__start_ftrace_events[];
 extern struct trace_event_call *__stop_ftrace_events[];
 
 static char bootup_event_buf[COMMAND_LINE_SIZE] __initdata;
+static struct seq_buf bootup_event_seq __initdata = {
+	.buffer = bootup_event_buf,
+	.size = COMMAND_LINE_SIZE,
+};
 
 static __init int setup_trace_event(char *str)
 {
-	if (bootup_event_buf[0] != '\0')
-		strlcat(bootup_event_buf, ",", COMMAND_LINE_SIZE);
+	if (seq_buf_used(&bootup_event_seq) > 0)
+		seq_buf_puts(&bootup_event_seq, ",");
+
+	seq_buf_puts(&bootup_event_seq, str);
 
-	strlcat(bootup_event_buf, str, COMMAND_LINE_SIZE);
+	if (seq_buf_has_overflowed(&bootup_event_seq))
+		return -ENOMEM;
 
 	trace_set_ring_buffer_expanded(NULL);
 	disable_tracing_selftest("running event tracing");
@@ -4766,7 +4774,7 @@ static __init int event_trace_enable(void)
 	 */
 	__trace_early_add_events(tr);
 
-	early_enable_events(tr, bootup_event_buf, false);
+	early_enable_events(tr, (char *)seq_buf_str(&bootup_event_seq), false);
 
 	trace_printk_start_comm();
 
@@ -4794,7 +4802,7 @@ static __init int event_trace_enable_again(void)
 	if (!tr)
 		return -ENODEV;
 
-	early_enable_events(tr, bootup_event_buf, true);
+	early_enable_events(tr, (char *)seq_buf_str(&bootup_event_seq), true);
 
 	return 0;
 }
-- 
2.43.0

