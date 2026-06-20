Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AECA1509AB
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 20 Jun 2026 18:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781978511; cv=none; b=ud4+w+lqx0oBOQxMAGUflSQ0/jNcEcvB1kRySvNbcmXWXawXq4KuYmOPkOzwtSey2cmrPVhMzFFLGa9UIy1tQG81/cpcrKZNGSPzZHWiphsKQXfbuojgi49pfpV17abeaVTVTcQ4/mgfnHITvwngqOQLCMnOLMmkYckbiae1hh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781978511; c=relaxed/simple;
	bh=81qX+qAPsLCiqIdHPLg1+JhVNjcZxVE57fRIFw3hA+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CyJE+mnFx6icm8iVaGQhLV4OHJLMEwtP1gBB9h7LMdrNcROj/92KoP9GAjEDOkVbREHBfIz3V9dZi8oNXcE6NFd8KDnoiYLdbQtZQDLgtw1vB2KMDrMgsT5QVDITa9azXbWuHYbRIwcBmt16Dyxu8eOsOSDfyeT1pJEHp2vX7TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXhI3rRz; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXhI3rRz"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-139aff562e1so492242c88.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 20 Jun 2026 11:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781978508; x=1782583308; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TU1KHjg1xw4SOUVLZNaBDJ/t1F+t4VC9J/t07Bu+tLw=;
        b=bXhI3rRzoZRp9Sn6ys6wkNJ4JWa4aj2qGfZnMSbKTtIDYrLPzrlEII26sU60pE12sc
         HByW5ZQ45OAdZQYKtO/DRfwS0o8s9OUutb0BOOxutzm/IQn/d9C3U88SDdl5DRYsM41/
         NrNO8pFrtYS74OwRuazPixSCovN8LiwumfH8vfWuh/nQqZoELUJH/dRpBEOFKXJsMPqZ
         JbFUsmomEZCKuRCFqS3W0kcBdWF351h+tSdA+t/VDm8aX1Q+7Jjangc0q7q4iT2rtRtU
         PCvaEPnI17cCZ8Yy+d25JylKYoeJ3yKJr3D1We7oBaTCMm4CGvwS+ok1HzLWTuRvco51
         GvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781978508; x=1782583308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TU1KHjg1xw4SOUVLZNaBDJ/t1F+t4VC9J/t07Bu+tLw=;
        b=lRkU7FpLGDKgMiWkqDVyxd4czbWgUhlEgcGoiRJQh1qDHaCG5z5BEIVjhWHFr7sEe+
         WqRejME3luUbE+nefQgiQXlKE7BZonk/bRr3HKfLqF0HlpJwUV0pTXxU0bkXriwObJKW
         kBRD+wR6VglUeJFEp7xr8azm0Pn82ibRa6spOkCSYO2NVGOCbADWqFU0ec1euK5NNj8N
         qqKD8DnB7/zjhslqurCygmptoQSHGpzPSIhRXPdsOR6tbjkixiHKVz93IUzZ9Ntkx2cL
         Zo6chMIeTKS8W2H1CfrmB3/1VhTL8vd/49rPRPfVHyfkezwPVOModlymr7bvmzMFdHfr
         Ujqg==
X-Forwarded-Encrypted: i=1; AFNElJ9eq5fCPcFrp1pe39FzB6uV1oRHBFzDTWn49I5aIWBO4QnGf9hBeLRR5dJBNTbtu0AGfPSkBkTeNQWygR4j8MigA+3W7g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLM68JsZonlwDiWcN1+Dc3ewMgEwJ52JPurnLQkUvkSjyhwBOR
	fTUDrzZ9yN3FIvZBdUwANNlCiVgsiFIoaIGjcy1ajRLgEyfjyjuae1gV
X-Gm-Gg: AfdE7cnRvcd33x3amgvU4FFRSUcod4rN7lU8FGfy5vJXIep7c2GmrU/D6OwVeTbl0N7
	O/J4IWyi+kjF5pR9UrtSJOGBVMjsOLN4v601jNwHs4nT8H2k8dwvMo6ace+QkwUA9AG5C4GWGq/
	Odua7JJsnI76CXsBnZ3BOHFdk1TUfJ5M4oozwjOtZY9bumnw+OeCMm/ljjWma7ZX2MauYlk5S+0
	quN/xjHpGaT6m6swhoIonoopN8wKz0q+2xrp1vkIgWbypm3ytBHeaNR0qlBmbHJu/A8KO5+Sl4A
	CF28OqI4g3rP/vp1RMU1qeGnxNgUqR86WUlwdnGO0HiJ4oyLQhsGQt/6jFr6ZEDuI5WuGipxT3m
	zIVmRWb38SgfnImu0aQNsrDcMun6tg+fV/Yffas2mGedcsQod0lnwnFXIDflB+1iycz7JPB8zph
	JtBBtunYnv4uR/8ttvQj60VWDCKA==
X-Received: by 2002:a05:7300:1826:b0:2f3:5266:fdfc with SMTP id 5a478bee46e88-30c071a7ff2mr5939362eec.33.1781978507455;
        Sat, 20 Jun 2026 11:01:47 -0700 (PDT)
Received: from mo-Inspiron-5559.. ([2001:fb1:da:4242:fb25:44f6:726:5eda])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba57db7sm4025121eec.7.2026.06.20.11.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 11:01:46 -0700 (PDT)
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
Subject: [PATCH] tracing: Use seq_buf for string concatenation
Date: Sun, 21 Jun 2026 00:54:41 +0700
Message-ID: <20260620175441.223342-1-woradorn.laon@gmail.com>
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

The backing buffer bootup_event_buf allocation is unchanged.
Use seq_buf_str() to NUL-terminate before passing to early_enable_events().

Link: https://github.com/KSPP/linux/issues/370 [1]

Signed-off-by: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>
---
 kernel/trace/trace_events.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index c46e623e7e0d..15164723e028 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -22,6 +22,7 @@
 #include <linux/sort.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
+#include <linux/seq_buf.h>
 
 #include <trace/events/sched.h>
 #include <trace/syscall.h>
@@ -4501,13 +4502,23 @@ extern struct trace_event_call *__start_ftrace_events[];
 extern struct trace_event_call *__stop_ftrace_events[];
 
 static char bootup_event_buf[COMMAND_LINE_SIZE] __initdata;
+static struct seq_buf bootup_event_seq;
+static bool bootup_event_seq_initialized;
 
 static __init int setup_trace_event(char *str)
 {
-	if (bootup_event_buf[0] != '\0')
-		strlcat(bootup_event_buf, ",", COMMAND_LINE_SIZE);
+	if (!bootup_event_seq_initialized) {
+		seq_buf_init(&bootup_event_seq, bootup_event_buf, COMMAND_LINE_SIZE);
+		bootup_event_seq_initialized = true;
+	}
+
+	if (seq_buf_used(&bootup_event_seq) > 0)
+		seq_buf_puts(&bootup_event_seq, ",");
 
-	strlcat(bootup_event_buf, str, COMMAND_LINE_SIZE);
+	seq_buf_puts(&bootup_event_seq, str);
+
+	if (seq_buf_has_overflowed(&bootup_event_seq))
+		return -ENOMEM;
 
 	trace_set_ring_buffer_expanded(NULL);
 	disable_tracing_selftest("running event tracing");
@@ -4766,7 +4777,7 @@ static __init int event_trace_enable(void)
 	 */
 	__trace_early_add_events(tr);
 
-	early_enable_events(tr, bootup_event_buf, false);
+	early_enable_events(tr, (char *)seq_buf_str(&bootup_event_seq), false);
 
 	trace_printk_start_comm();
 
@@ -4794,7 +4805,7 @@ static __init int event_trace_enable_again(void)
 	if (!tr)
 		return -ENODEV;
 
-	early_enable_events(tr, bootup_event_buf, true);
+	early_enable_events(tr, (char *)seq_buf_str(&bootup_event_seq), true);
 
 	return 0;
 }
-- 
2.43.0

