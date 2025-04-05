Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E49224D6
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  5 Apr 2025 20:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743885045; cv=none; b=O8TZjpafA4CCyMFcLGfLiOe8A+9SmDgfQBslPTlWrvq8VZXR1mZUBWOrbi02Mq7dNQVvQgUriAAWzJd/d5EtP034tnL5M8/FN9/w2sTEuMl+SX5mkeAhKQ2/MfuPtmF0S9Jgo3bYfpePsDi+y/dGlSEUw/GsztFahx912hQAX0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743885045; c=relaxed/simple;
	bh=592/DYeE4rV/PvvRdjDT+n9BuKH+8hLaJtJPesSSxkw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CUDmtDqLREzaDudngYYvokJ52el7H98Ur05V8843ZimMr2pyrhc39wZBDA6nTfj84+0M4hZwud+gu2jSKguVWRGl6YrNOMR7pRvM1Rc1eNaZa4l5Z+AmRqrspnzsRe0aHpeYxcTciOHuRRKClxT06LtP1uq/REZUDI3rSb534oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9WUP190; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9WUP190"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c55500cf80so260906085a.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 05 Apr 2025 13:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743885042; x=1744489842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QFZ87RkgEvE5OWvML1O0pzoNbsXsPPEFnlwAAyAkpNU=;
        b=D9WUP190VaUrRHJ6+z8LwEqlCL36Is7i4GRwhy9XY65RD8QOdmnBKkMbGLt0NcLuXu
         I6gvK/EFYNk853AT/QCbdY33iZ3TSdC+cUDCoFx23U2ar0tS73nqY5SIIIPqFG6Qp8Qx
         EWPz4zS/wUC/i0uTrbM9KQy3BrPeEypwRcg1aakw6cs0Vjvh//rHcYx4P+RTCM9iG6BC
         /Y5twk/VK5OSBKXKrhLSTNDJ7ahE6Og2DSc4syRRFg5xKblW00/CC9Z5uVBD3YfaTUBD
         sanCqGsOmeS/3FwhXqQP24SYxPHtRal0nh7e/3pGErhLPbEIMjiheW3wYPcXOIOSy4rz
         oxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743885042; x=1744489842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QFZ87RkgEvE5OWvML1O0pzoNbsXsPPEFnlwAAyAkpNU=;
        b=egfHsV98TJw4UB/cE103PCfqsQ55U7GwTFSKJdpXtOcPpkNg9abu/7GEaecAHEbTTD
         +bqEGBmgmjGxcFptm76zUx63ORoZ4JIWowyoHWcE5z1by3r4GuOPT+G+rxlve+2tCtM/
         Mis6vKUNXaTi9VRvV1X1LB68rRWymrU9cYBc66KMGYpOoWKKAV696LrBOXWYswbIwPbv
         813axXzpsxsovo3CwDE7BqwLrsuzS1GxiTOUbhY7KnOBZsKj4Srv7kjpBAolsySEZOx+
         oeEijRQuZajW21WiO8fk81sUrmQbyiydoFIRO70CPR5IsaFUl9vDYsCWjIFXLHvnsTyV
         7pzg==
X-Forwarded-Encrypted: i=1; AJvYcCXDOM3CGoPTyLPDL0MsTsbuQWikawRjWXIJAwetueVaKTHqjtRn6bITM1ltj8XptS5ms0alkOtbB9y7bwCwUy5bjyHQcQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNrtnH8cRJzAgvW66P5l4OY3o6deEfZdZmiGL53W/uzFpFYxDa
	L1N0GhwlojgVhXDVKfkP0G8yC65QnQNcYyhYagHe5AVXaBunypkf
X-Gm-Gg: ASbGncuwFGlf6TaOCA9Ea9otCz+2XNFpT4hBiP8eopSK9mfsuECN/6AJC3Jw/U87ia0
	T3I1iYvxa+Ts6iEfSlejLStr0WkreG6ONKhzKTGib0JptkLxD7IRKUGkcf/yJ1Nvi2Z4nI0g+O8
	DI0u79ck6R4dyqdZvjbn2SpJ5cAqrQ416+wV1SH1uKo+/NDTG7KZlH6pD7N6iOVIBR5oK965vLE
	1VZW53K60I6IvWEc1GrO1Gp5x7rwbRjWdXjFHUyxZqiVB+k+p7ojodrQYm4oD7V88eJ+Ou22aHg
	rgyRQVpuKicKuynM2iBz91jzWAo968hoPjSDWPYO03FuZKw5ALW7zu5IQPY=
X-Google-Smtp-Source: AGHT+IGqvxIn7+jtL/y34/XygapLxgoGndRyHSw1XKBdPKp4mDWf3UFd4ITwDeNHFgIJ0JPUcEXFyg==
X-Received: by 2002:a05:620a:3723:b0:7c5:cdb5:271b with SMTP id af79cd13be357-7c775a0f60dmr965736585a.15.1743885042551;
        Sat, 05 Apr 2025 13:30:42 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e96e566sm384878985a.63.2025.04.05.13.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 13:30:42 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linux.dev,
	Gustavo Shahrouzi <gshahrouzi@gmail.com>,
	syzkaller-bugs@googlegroups.com,
	syzbot+ff3aa851d46ab82953a3@syzkaller.appspotmail.com
Subject: [PATCH] perf/core: Prevent WARN_ON(!ctx) in __free_event for partial init
Date: Sat,  5 Apr 2025 16:30:36 -0400
Message-ID: <20250405203036.582721-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the get_ctx(child_ctx) call and the child_event->ctx assignment to
occur immediately after the child event is allocated. Ensure that
child_event->ctx is non-NULL before any subsequent error path within
inherit_event calls free_event(), satisfying the assumptions of the
cleanup code.

Reported-by: syzbot+ff3aa851d46ab82953a3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ff3aa851d46ab82953a3
Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 kernel/events/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 0bb21659e252..153ba622cfa0 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -14016,6 +14016,9 @@ inherit_event(struct perf_event *parent_event,
 	if (IS_ERR(child_event))
 		return child_event;
 
+	get_ctx(child_ctx);
+	child_event->ctx = child_ctx;
+
 	pmu_ctx = find_get_pmu_context(child_event->pmu, child_ctx, child_event);
 	if (IS_ERR(pmu_ctx)) {
 		free_event(child_event);
@@ -14037,8 +14040,6 @@ inherit_event(struct perf_event *parent_event,
 		return NULL;
 	}
 
-	get_ctx(child_ctx);
-
 	/*
 	 * Make the child state follow the state of the parent event,
 	 * not its attr.disabled bit.  We hold the parent's mutex,
@@ -14059,7 +14060,6 @@ inherit_event(struct perf_event *parent_event,
 		local64_set(&hwc->period_left, sample_period);
 	}
 
-	child_event->ctx = child_ctx;
 	child_event->overflow_handler = parent_event->overflow_handler;
 	child_event->overflow_handler_context
 		= parent_event->overflow_handler_context;
-- 
2.43.0

