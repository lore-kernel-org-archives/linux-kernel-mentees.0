Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3410125F994
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Jul 2026 04:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783918452; cv=none; b=XI9AfhGAadJmsjG92eqCzZUpWFauT50y5FsCiT6X+z4mbsO5G1fJ+xGgFg16eykl/IOPtIkRu7mJPxyBuWtdue2JqX8eVXb30bviUGiz1/dJf7g06Cj3KDkejoDzVkl/4SlnyvXQNYhyvxoApAj8xYVi3nYUsr/0CHbGBJEhLdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783918452; c=relaxed/simple;
	bh=aWyuivC0uBr2raUrYrGhB6xX3JmGBmcCaiXVvYEGVQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MY1kBKzzJ2KeARDJnYa/Er+4WcSWTILAvtoN+SEEq0NCEkPgxkjuovYqUJsbzMghaMG8PYg0Ww6grpE17b5EoIKBQlUVxoprRSB3eLbSUY1vSOPLq4auf0f9tMBggPghoCb9NgpOSU+h6csnRakSXHgZbofrA2jZkcRoAQBS6RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGIIrp8m; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGIIrp8m"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cab973140bso31174545ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 12 Jul 2026 21:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783918449; x=1784523249; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sFT84HfE6g23Y0JSEsGGMWs+C5GZdiRx3RFEfHBMGN4=;
        b=mGIIrp8mS3IGZ/6LMGjJqK+56Ec7RkmvgYFz7y94NMdIKxSdu/YDiQeCLrjH4V2TAS
         teFHSju/Qc16AjGYVXqgcHkjks/FSQLW0pTG0qFSH0sQKpGc8PZKlOpfTzsrMWpT9aQm
         DXkOU42dfafLItXIRORUqGMSXuejpCHRgylDg6EOARSYMiMxJ5r31J1j4o9aHuVLo55/
         aJvYuNOnAbvfnfvxIZN4t3ip07EE2NrTBr1dT/u6QiyGR7fQPjONG+EVU04xj0kYsT8P
         Bvpc0yYjtk59HB23zVwSUcng0jtLoDfEi5ESK3LzEmcQWb6pCAZkKdGZ8fSMsEskPhxv
         GlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783918449; x=1784523249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFT84HfE6g23Y0JSEsGGMWs+C5GZdiRx3RFEfHBMGN4=;
        b=N7qyBraxPb6TNT4xwXRrQ2dfWxyKBWbO7cYcFp85LdS6SGR5OKBrK3LTY+n/l/pfvX
         QXGE02qVcZyHG2f2Immrh6pvw04q/6msCyui/Uo7999vjP3sbxmG9xCwWNNmCxEt0qkw
         aM/uXOCwJodxlJq7/5AbQyYAoCpybcglQYbxYVRRWkD7aNQ/bNiEAveGCzB0kwwH//Ds
         yl6n/L4NEbFcH+NFGyM0B2MfduXbImE8cqWglHLXLCkUZasCIF3M4NcFAcVEWIQcCUDz
         2SMuKXGWK2/1LNtqJ/Bu4lGwVYeWZ9IbY5yl21K6lhHgahRI78jp72BOEySPHeFNQOAb
         0QWA==
X-Forwarded-Encrypted: i=1; AHgh+RoxRjz65JhD7B3GJgXJZSZW0A5d7AS+USE8OkYUcCa88RuNBVzLRetcZdNg3M/oyCVo5211Y4WITI/md0J+PQfFkpFe+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwoBiTX+Jo5rnYOvY13YreNmqPXw7VeN1OhwTZoa0MYcIPOzDA/
	ISPyBInknnx/hZm9VMQ2anY4Uz5xeQxs+AdGku9LIgDFZGt/JPrVPnBe
X-Gm-Gg: AfdE7cmIiEe2Lif0UKtlku8MBu0+6hoel1fFNv4ehDYD01vZC2q65WF6E1y19o5xugY
	UR9SBSfH2AlzC1UkQsRacMoEl0IycyPHYq82gB/gMgWnrujZJZEiOSTqFGptrUuAhnOlF/7mle0
	HM6kUBHr94j2UQ20gJBJ0dUciMbCl8FrBacL179z82C6ZRLcBROpElc+Ji/vHEaEopUvcU3IHOM
	SO16PyQQBeINwROBUt/omukcWWfOC69fnzc0gx62q8WOUsbfrnBmI+h6Z+mK0hKqVoqcTX08E7m
	AEqJTSGCnlG3Ql0ktU5rNktwr2iZ6kFzugJ3iMNphNrTUHZl4mK8Kr0iiB6tgk91xZ4GWKMI4Ib
	vCSv+4aQ5pAMBNQZLbWAktD+rZa15Z+tBwBA2qCpxC/skMQHAZhmFxHv1KSPvVVubd7XrxuxvZJ
	dU/2mtAi9djPJ2nFa75hls7CXhZaY=
X-Received: by 2002:a17:903:b07:b0:2c9:ff29:3f91 with SMTP id d9443c01a7336-2ce9e7a5613mr78426635ad.6.1783918449548;
        Sun, 12 Jul 2026 21:54:09 -0700 (PDT)
Received: from mo-Inspiron-5559.. ([2001:fb1:db:5c33:ea21:9586:4d37:987d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bbaesm92010215ad.57.2026.07.12.21.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 21:54:08 -0700 (PDT)
From: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	woradorn.laon@gmail.com
Subject: [PATCH v4] tracing: Use seq_buf for string concatenation
Date: Mon, 13 Jul 2026 11:52:49 +0700
Message-ID: <20260713045249.69942-1-woradorn.laon@gmail.com>
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
v3 -> v4:
	- Removed typecast a const char* to non const.

v1: https://lore.kernel.org/all/20260620175441.223342-1-woradorn.laon@gmail.com
v2: https://lore.kernel.org/all/20260622094623.18469-1-woradorn.laon@gmail.com
v3: https://lore.kernel.org/all/20260623145147.12145-1-woradorn.laon@gmail.com
Sashiko: https://sashiko.dev/#/patchset/20260622094623.18469-1-woradorn.laon%40gmail.com

 kernel/trace/trace_events.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index c46e623e7e0d..4f5a0e73a89b 100644
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
+	.size = sizeof(bootup_event_buf),
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
@@ -4766,6 +4774,7 @@ static __init int event_trace_enable(void)
 	 */
 	__trace_early_add_events(tr);
 
+	seq_buf_str(&bootup_event_seq);
 	early_enable_events(tr, bootup_event_buf, false);
 
 	trace_printk_start_comm();
@@ -4794,6 +4803,7 @@ static __init int event_trace_enable_again(void)
 	if (!tr)
 		return -ENODEV;
 
+	seq_buf_str(&bootup_event_seq);
 	early_enable_events(tr, bootup_event_buf, true);
 
 	return 0;
-- 
2.43.0

