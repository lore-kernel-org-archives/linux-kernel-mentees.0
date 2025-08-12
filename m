Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9F223D7FE
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 Aug 2025 16:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755015672; cv=none; b=SjBZccwI3UeD//1oDCGYnXFur3NzSJraNJdSlFKs8vDi/jfTEshDAhUtdE2q3dgaI8G4bJVRNv5xGfCwhKuQNFt3qvNEG8KHQzzGyqeIFP8FGCyFbtRF9qbi+SNn6rXcHQB6ovggzvwMIooXoc36yMLXrcmGyDpnDWFIczpFNVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755015672; c=relaxed/simple;
	bh=dTd1bISb07RmhclrXB/gkGh9Mk7rG+MICfls5TsJ/3I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JaONDWqxh6I5eCHXL2LY83pJ/gvzxbRt0fkCf3GwS+H0uTfhpxLmsvmO2g81VKc58iAR/NkPW/mwfqSAl38xEbIZs4EzrjE7tQNF3ct9cJ8CPA4oeZYMJEX4MYUudlkfM3re2ZfRtdjz17/eAC77rl0sQqc5IzeKFn09h1dGXXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=epe19v6Y; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="epe19v6Y"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-76bfd457607so5541067b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 Aug 2025 09:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755015670; x=1755620470; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y35mC9vn+sDOpVRQKqdCv/s3UKbQ6a8UZ50nGToUsyY=;
        b=epe19v6YhwyxStD1/Y8k4Dnij/RIm76U8AQ63hTqV+OGE7kYoCC4o7WzViD8w9duZV
         jEfVtrUyj0mchJEpeWt3hEDAdllmmMrCDORE79Fl7mj1J9wmAd9H0g3F0kJxz7ZHmhli
         WNrTK/g3QsIlLiSGtQ9Sgfn0zs5WNC4CWskWDFlKRUFsNVWsW1To4Zv3/RxGzDNC5lle
         dG0+0927pNoYbyhowGZOa7n8aHXsu/Eu6z6VTJ+wggXoYVRNBW+djbasmQMOopGWkFDA
         gYGplZK2M3WdPrTuxYfK+sNXma42auvlHPPujnH25rMendvR5uMIOvIdcC62SENPijWz
         qIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755015670; x=1755620470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y35mC9vn+sDOpVRQKqdCv/s3UKbQ6a8UZ50nGToUsyY=;
        b=qD4ZYskJOOYecU64rR9WPtSn6OQm0i4KInYvXKaY/CKCJOCvIJrpyAQLeEOQR8wFc6
         TDwVFEP/PKaVkSDtUq0fh/o6H2OSkJrgmBApRhhZ13mF5FlfdiplZ+kTykY991OoBSDf
         ZdD9OSSPme5p/eLcL1QcUMoeSogIwy2EInmASZHWVssxOfXI8Dqn99EklyrlAx2z49hQ
         WxV4DIuNMCjd+qqkSP1k4yklQFr1qsEMVnUYki4wUx7ZfRNnAKpEXfJDEZl99MvT8nIv
         XcOTO78u7VupDpd1mXx5CRZT/eh2Fz6e/tMURVjvUleqR5NrdJhVuvrtQ/iwrBSc4G8x
         ezxA==
X-Forwarded-Encrypted: i=1; AJvYcCXjC/mzRVmGdwEaw8Di7uGFdXOaFzNUCExTbKLvU2I8oUfF/wUUNGBWNTf5+NTau8qcfcQ+wD6pigYq642D86E895nB9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh4x5PpYiuREzHPqpeKljKc4MgVYMufgP1mW2I6yyimR8jIacp
	vVTTnz9Uo+f3gnzB9jZUwjFZUl/2oQbm8PSPuz/sxr4k2RPD6HqaMfZV
X-Gm-Gg: ASbGncv9SVWsQyRugH9v83PvGHt/Nfg2La+nOWiDnEoZT9tJ1X7c14APVi/vSym2E76
	zPmjS8qZrKLcGRJvyL7D/k6ZvJaOvO/gaXTvjgdN+Xv6dbA95b+5eLP8NFuD6No0WwKuMtngdHr
	Mo/GEcW+4Nluieo2cazavLka0+a394sC2E3Us9P/Evq3ryCySdfnadtiB95eOc8CZ+iBovYzKc0
	rqtiBFbyb7FpCNeI9sDeJ+yJBVAkqUx/suNz0aewnL8fpFSd7X1sR0Lmrsl9dzRsYjfmFrt0nQq
	bdShv1IflAT3k19AZEAxhr0TGAmQMCPSOJ9gKa8+Pxjfpf06mNfnmI0U5PBrYd4FQLjPTgQmBYN
	SOYQFUgM7ahKJoqZxpttxq5328ciH1ViTGf4=
X-Google-Smtp-Source: AGHT+IHIeZ0gSCTYx2RYrw+PozfYnyCRvNfs8pJlWdAxPKJFcTkd+VRt6elmqXbkfgHK0ChA9lrxDg==
X-Received: by 2002:a05:6a00:399d:b0:748:e5a0:aa77 with SMTP id d2e1a72fcca58-76e1fdccfedmr173077b3a.13.1755015669114;
        Tue, 12 Aug 2025 09:21:09 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:2:f21::2a1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfdf9bdsm29794035b3a.111.2025.08.12.09.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 09:21:08 -0700 (PDT)
From: Ryan Chung <seokwoo.chung130@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyer@efficios.com
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Ryan Chung <seokwoo.chung130@gmail.com>
Subject: [PATCH] trace/trace_fprobe.c: TODO: handle filter, nofilter or symbol list
Date: Wed, 13 Aug 2025 01:21:01 +0900
Message-ID: <20250812162101.5981-1-seokwoo.chung130@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolve TODO in `__register_trace_fprobe()`: 
parse `tf->symbol` robustly (support `sym!filter` and comma-separated lists), trim tokens, ignore empties, deduplicate symbols, use bulk registration for lists, return `-EEXIST` if already registered, and preserve lockdown/tracepoint deferral semantics.

Please note that this was my personal interpretation of what TODO
required here. Welcoming any feedback. 

Signed-off-by: Ryan Chung <seokwoo.chung130@gmail.com>
---
 kernel/trace/trace_fprobe.c | 102 +++++++++++++++++++++++++++++++++++-
 1 file changed, 100 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/trace_fprobe.c b/kernel/trace/trace_fprobe.c
index b40fa59159ac..37d4260b9012 100644
--- a/kernel/trace/trace_fprobe.c
+++ b/kernel/trace/trace_fprobe.c
@@ -12,6 +12,8 @@
 #include <linux/security.h>
 #include <linux/tracepoint.h>
 #include <linux/uaccess.h>
+#include <linux/string.h>
+#include <linux/slab.h>
 
 #include "trace_dynevent.h"
 #include "trace_probe.h"
@@ -762,8 +764,104 @@ static int __register_trace_fprobe(struct trace_fprobe *tf)
 		return __regsiter_tracepoint_fprobe(tf);
 	}
 
-	/* TODO: handle filter, nofilter or symbol list */
-	return register_fprobe(&tf->fp, tf->symbol, NULL);
+    /* Parse tf->symbol */
+    {
+        char *spec, *bang, *p;
+        int n = 0, w = 0, j, rc;
+        char **syms = NULL;
+
+        spec = kstrdup(tf->symbol, GFP_KERNEL);
+        if (!spec)
+            return -ENOMEM;
+
+        /* If a '!' exists, treat it as single symbol + filter */
+        bang = strchr(spec, '!');
+        if (bang) {
+            char *sym, *flt;
+
+            *bang = '\0';
+            sym = strim(spec);
+            flt = strim(bang + 1);
+
+            if (!*sym || !*flt) {
+                kfree(spec);
+                return -EINVAL; /* reject empty symbol/filter */
+            }
+
+            rc = register_fprobe(&tf->fp, sym, flt);
+            kfree(spec);
+            return rc;
+        }
+
+        /* Comma list (or single symbol without '!') */
+        /* First pass: count non-empty tokens */
+        p = spec;
+        while (p) {
+            char *tok = strsep(&p, ",");
+            if (tok && *strim(tok))
+                n++;
+        }
+
+        if (n == 0){
+            kfree(spec);
+            return -EINVAL;
+        }
+
+        /* Allocate array for pointers into spec (callee copies/consumes) */
+        syms = kcalloc(n, sizeof(*syms), GFP_KERNEL);
+        if (!syms) {
+            kfree(spec);
+            return -ENOMEM;
+        }
+
+        /* Second pass: fill, skipping empties */
+        p = spec;
+        while (p) {
+            char *tok = strsep(&p, ",");
+            char *s;
+
+            if (!tok)
+                break;
+            s = strim(tok);
+            if (!*s)
+                continue;
+            syms[w++] = s; 
+        }
+        
+        /* Dedup in-place */
+        for (i = 0; i < w; i++){
+            if (!syms[i])
+                continue;
+            for (j = i + 1; j < w; j++) {
+                if (syms[j] && !strcmp(syms[i], syms[j]))
+                    syms[j] = NULL;
+            }
+        }
+
+        /* Compact */
+        for (i = 0, j = 0; i < w; i++) {
+            if (syms[i])
+                syms[j++] = syms[i];
+        }
+        w = j;
+
+        /* After dedup, ensure we still have at least one symbol */
+        if (w == 0){
+            kfree(syms);
+            kfree(spec);
+            return -EINVAL;
+        }
+
+        /* Register list or single symbol, using the existing bulk API */
+        if (w == 1)
+            rc = register_fprobe(&tf->fp, syms[0], NULL);
+        else
+            rc = register_fprobe_syms(&tf->fp, (const char **)syms, w);
+
+        kfree(syms);
+        kfree(spec);
+        return rc;
+    }
 }
 
 /* Internal unregister function - just handle fprobe and flags */
-- 
2.43.0

