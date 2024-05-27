Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF776A33D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 09:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716800797; cv=none; b=ZYUI9yebccQ/vjfGv9VQgugMWfXxqQGvXgos1CCvO2e9QZlE/5T0UlXHRx9RTFOAnOVd+dfrGJqpfJqGH/QCardXM7Yn2ft2eHcxpwJ5aSLTUsRt5Pkop2c/VsV3iYakn0x5XFUO1dLQImtjin3kK8F+uVNwNAVpn5a2yvO7/BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716800797; c=relaxed/simple;
	bh=OHIc8Ffq07juFkiENaunSuJKcoUQgeMoq50TSLzTm8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Mq1nkp+iyQ58Xaggxno9N8JK88B2PO7jCMeOS7vqQ3uAl5nhEtnqLe9xrbISDG8y0p00msHWtt7v+gZtO+Yz2O50M+66FgGWyLIZJIShelVOcuUFn1XmgeaN1pC6G9PSFsBdkeKEM1U4UnBLH9d4J1qRHAQeSVcmoSb8ThSLowI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gONCvhbY; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gONCvhbY"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CFFB400E5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 09:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDuHjsTPg2eT for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 May 2024 09:06:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=yskelg@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8A1D6400AF
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A1D6400AF
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gONCvhbY
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8A1D6400AF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 09:06:35 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1f44b45d6abso24151395ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 02:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716800795; x=1717405595; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5B4XuA7MIFJlATcHdcEeTF7o57u/Xxtg6G9/HDaxU04=;
        b=gONCvhbY3FDz8pnM+MNjTFb0i229BvYtWU0pGGjbPqxylt553H9M+uqLsAMzJA+Vhe
         f7K6QL6krl/OiwqMHA6kh6IqVYkzL3pWsCV9fZNiWhcLhP4VgAyMgYbKFIahnKAcjIjO
         IUTOawQEVRSqGU5w9YNKZYGHr3qp8SME8LFDCYtHiag4Gxw0FgNXakbCmnZFhoTACMZJ
         sf36/TspvzrEI/IHjf4/qWvN7xKwqelZV+QONPEk+btrcttWAidnvz6FCBCxA4jXz+Ag
         tp05I6BNqYaR6xzJ4clM4iOLJlAWAY+e/aPgVvpDrSzlIFlUvM7jR5pwCm4sKCB1EZ85
         MXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716800795; x=1717405595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5B4XuA7MIFJlATcHdcEeTF7o57u/Xxtg6G9/HDaxU04=;
        b=vLSjeMpv2rmb4oey6Quvs33BuZQyTUAx6UZiCvOs7PbRuiOUGIUD7GYBQQel/wvOMh
         hfISBYaan/W0vMNt5R5AFcve6G576pGGfxVEa2E8eS2zREbnFSI6vSt66qfqgIs/UZLp
         2mSde4MCv8IfiImkLnxrzkFN49srorTBQef/7Ldr/KaNDO0jFW76vpOUXXNUNA1ymGIg
         kemNJz0WpgTe41WV0Gfx+sEPe8ZW6yaohNjiQOVL+lybWalf1S+P1HGcsgSu1AJyQDgI
         qgprzRvBMq9V+BvQWkgsIsw+BU8oUt/REW7TjbNVtIiQSUYk6d1Dlr3cwwC5N7Rd8ir1
         rw8A==
X-Forwarded-Encrypted: i=1; AJvYcCW2Li+tj0zopwBPkeNDUvt5J/G8Sn8ubCcUkPsCuPuH3Rg+9O4kvy9IJvjkyWK/dcR+bpDreSkixYm3ux2CB4p0HZnWUwc4pTLfYHwA/2o0gwJnL3O7/l8VT7GxNTDd
X-Gm-Message-State: AOJu0Yza3NoU61sBmWYgwnZ5R/np/CIerjkYvwE5/TOO1iA4yyGq+mPT
	mSxA/bqQQVt1OD84pTDRChyokb2gGSC6r9hrQNeY2b0F30ZzHfqC
X-Google-Smtp-Source: AGHT+IEscR/I+d4dmaF4RDBfL657EXQrLII3qNOolj0Kf/7OJnxFjWoXDlUd+lx/kaBSCSw2JR/CCg==
X-Received: by 2002:a17:902:f552:b0:1f4:7da1:e611 with SMTP id d9443c01a7336-1f47da1e7bfmr37088745ad.34.1716800794809;
        Mon, 27 May 2024 02:06:34 -0700 (PDT)
Received: from paran-QEMU-Virtual-Machine.. ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c7d0e2csm56152315ad.114.2024.05.27.02.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 02:06:34 -0700 (PDT)
From: yskelg@gmail.com
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>
Cc: Gautham Shenoy <gautham.shenoy@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	skhan@linuxfoundation.org,
	Austin Kim <austindh.kim@gmail.com>,
	shjy180909@gmail.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Yunseong Kim <yskelg@gmail.com>
Subject: [PATCH] perf stat: allocation check when calculating cache instance ID
Date: Mon, 27 May 2024 18:03:02 +0900
Message-Id: <20240527090300.17864-1-yskelg@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yunseong Kim <yskelg@gmail.com>

Adds an allocation check for cpu_map before perf_cpu_map__min() accessing

Signed-off-by: Yunseong Kim <yskelg@gmail.com>
---
 tools/perf/builtin-stat.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/tools/perf/builtin-stat.c b/tools/perf/builtin-stat.c
index 35f79b48e8dc..1f238824abb2 100644
--- a/tools/perf/builtin-stat.c
+++ b/tools/perf/builtin-stat.c
@@ -1291,20 +1291,22 @@ static struct option stat_options[] = {
  */
 static int cpu__get_cache_id_from_map(struct perf_cpu cpu, char *map)
 {
-	int id;
+	int id = cpu.cpu;
 	struct perf_cpu_map *cpu_map = perf_cpu_map__new(map);
 
-	/*
-	 * If the map contains no CPU, consider the current CPU to
-	 * be the first online CPU in the cache domain else use the
-	 * first online CPU of the cache domain as the ID.
-	 */
-	id = perf_cpu_map__min(cpu_map).cpu;
-	if (id == -1)
-		id = cpu.cpu;
+	if (cpu_map) {
+		/*
+		 * If the map contains no CPU, consider the current CPU to
+		 * be the first online CPU in the cache domain else use the
+		 * first online CPU of the cache domain as the ID.
+		 */
+		id = perf_cpu_map__min(cpu_map).cpu;
+		if (id == -1)
+			id = cpu.cpu;
 
-	/* Free the perf_cpu_map used to find the cache ID */
-	perf_cpu_map__put(cpu_map);
+		/* Free the perf_cpu_map used to find the cache ID */
+		perf_cpu_map__put(cpu_map);
+	}
 
 	return id;
 }
-- 
2.34.1

