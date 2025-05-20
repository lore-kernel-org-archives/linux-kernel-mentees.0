Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F58254AEF
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 20 May 2025 09:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747734339; cv=none; b=DZhQnR653y7RpsqjJyR6d3Cd2zMLAXbs/J2xL01BdmbgP8+ZfBa55gy9QAn1ZcqqQGiLux2miQTLk2sIgvaXXEB8Gt+0mRPbxeR/r3stvrxry8GV4GiflcfXVEgHxT6O7EJEojBIhDMG0AMfvXU9ezMFGJEHKlQPKTCVm8pOpPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747734339; c=relaxed/simple;
	bh=55t2jOzwJu/Pe94Z1MGgGTsjmdsmro44z4m15Q30ch4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aXfI4xGTpr1YemhopQVqBxoStnTa0wcsn9AW/Xd5poztBoN3IFLK/PGQ7N/nsHPXv9jCIcZE70Dh0EN6p+SrKNYVq2TiFvDgefmmnlsF59WX+UlS0Ia+kRfO+rAGu+uFd/UkS82hxp99s3OJd9l5XAxkDC8k+34/AaXID+kOZQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nd136vJZ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nd136vJZ"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742c27df0daso2266556b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 20 May 2025 02:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747734337; x=1748339137; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RF8ffXs2a5We2CWtSW9yaEOhQbyIvm2awu47Uy03/dI=;
        b=nd136vJZjICrgelL56Ow3h35gi4hQpg5Lx0UNRAgEtek8Jm1ug+5tbenU4TOKc805w
         qUGHN6NmKNJFCKRMGPXgBbDqpg2doX2UIW68VAGMOxbO+e28rhFe3KbYeP9XD+E1QAEv
         3X7YHnVoBI98lgKuiG91gamZsTuV7mpXBwaKV+JtAEJBt8bgEnktUXmRleLWTo7ngLwa
         nv8VUbEvUoCsCvwEwEV4BuGYV2bUP9fFAMo16D+6WNF15oWnc05piIV4X7iA7qWf0pG7
         QUClQqna1Xm93rXf+lKIZ1NsBnkMwairyxhTlWD7nmfLrakzQreymEIT+V3Y86CqZkwW
         5V4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747734337; x=1748339137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RF8ffXs2a5We2CWtSW9yaEOhQbyIvm2awu47Uy03/dI=;
        b=GlBBDxWIkdReKM/uodPTV35KKMtw38Dxt3oHT9BY38+VyUURpYoMvJhHs83aq6hiAa
         sCb7TLTNSTorUHC2gNWTB2qrZt8Wun2teB7dWVh29j8jOJShBTyzJRO3EdoLLywUFbIw
         qXxzEoif+uLgJRARTgckQ9SUQjO2G7kS3T18QjJ41wjYqNm/p5N4anSJtM5attWUTiwr
         fnlNr5V1nH11V4OeizCyLGEUOS0HhvrwYV/X/WpVeZ1KZV8jeW8Den6Hl9f/XQUdmdUD
         lowdlyDcPIxCd39zPlKsfWFwTglTuiNsvKO7s4UuiO2rHJxsYYAalKJCnkSWsU8Rq9ot
         DkFg==
X-Forwarded-Encrypted: i=1; AJvYcCVZlhK7N90MOpgm5QnJi38swC1Y/RiRr2Ce//EQTY4KAW9xHOfVjXstC7BBUOqdhTHpSm3eFLpD7lfiB4KVf57Ya1ogPg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfoPyLzd2nfjTbh3IHyRujwdevPeN3FeTD3U/LZ/2f2aGS698Z
	DWI6ckLL/b3+VfpFnxHK9loZXXq3/4CtnE+lEGb1Zpo3dc4AMAIDshU4
X-Gm-Gg: ASbGncuMRu0TW9qJh/YCq9eyj2fBd3kHHKUJtO8N8Kl094uzg3soUbqNXYAi5shpnng
	Vrzo51jcBB1oZZfak0SD39Zuq9lm36dLMBq6Ip8dtE1H8peH7CsNWDMXVMbhySCsidij0K40e5p
	ThUBkf77X7XLBjF2jUB2CE2rh8eWlEgEDoPRmStSDKh66s+p018yQgpB2gg1cvDd0x08UXdP7z2
	E70pcDGZEKphrruwuQxJfgjwkeCFEjXNUvi+0nHn10/FakJmYFSVOPrI+SyjD5ViuX1VfeJXFQf
	/ZfqENgXfXinvvlwOZW7IJxqCpyPVjalZ/MkqqXJmCLT/d2pasRiKm7hpb/PwebkgltYf6sgrKL
	belf9vZXCgNwEpQ==
X-Google-Smtp-Source: AGHT+IGjC38TxGHkGLNwrYD7Ou7a0rpGqtFyhZa76JxTWq07mNYsWa8kQEbhMKoz4uNlmMMxii9iUA==
X-Received: by 2002:a05:6a00:982:b0:736:a7ec:a366 with SMTP id d2e1a72fcca58-742a97a2bcamr20340316b3a.9.1747734337299;
        Tue, 20 May 2025 02:45:37 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:62fe:9593:f762:39d9:3865:830a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a983551fsm7576457b3a.113.2025.05.20.02.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 02:45:36 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com
Cc: linux-perf-users@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH RESEND] perf stat: Fix JSON output formatting in iostat_prefix()
Date: Tue, 20 May 2025 15:15:25 +0530
Message-ID: <20250520094525.97706-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The iostat_prefix() function previously included a TODO noting that its output
format was incorrect in JSON mode. This patch corrects that by conditionally
formatting the prefix string based on the output mode specified in
perf_stat_config.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 tools/perf/arch/x86/util/iostat.c | 35 ++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/tools/perf/arch/x86/util/iostat.c b/tools/perf/arch/x86/util/iostat.c
index 7442a2cd87ed..1d9c20dab5c7 100644
--- a/tools/perf/arch/x86/util/iostat.c
+++ b/tools/perf/arch/x86/util/iostat.c
@@ -403,18 +403,29 @@ void iostat_prefix(struct evlist *evlist,
 	struct iio_root_port *rp = evlist->selected->priv;
 
 	if (rp) {
-		/*
-		 * TODO: This is the incorrect format in JSON mode.
-		 *       See prepare_timestamp()
-		 */
-		if (ts)
-			sprintf(prefix, "%6lu.%09lu%s%04x:%02x%s",
-				ts->tv_sec, ts->tv_nsec,
-				config->csv_sep, rp->domain, rp->bus,
-				config->csv_sep);
-		else
-			sprintf(prefix, "%04x:%02x%s", rp->domain, rp->bus,
-				config->csv_sep);
+		if (ts) {
+			if (config->json_output)
+				sprintf(prefix,
+					"\"interval\" : %lu.%09lu, \"device\" : \"%04x:%02x\"",
+					(unsigned long)ts->tv_sec, ts->tv_nsec,
+					rp->domain, rp->bus);
+			else if (config->csv_output)
+				sprintf(prefix, "%lu.%09lu%s%04x:%02x%s",
+					(unsigned long)ts->tv_sec, ts->tv_nsec,
+					config->csv_sep,
+					rp->domain, rp->bus, config->csv_sep);
+			else
+				sprintf(prefix, "%6lu.%09lu %04x:%02x%s",
+					(unsigned long)ts->tv_sec, ts->tv_nsec,
+					rp->domain, rp->bus, config->csv_sep);
+		} else {
+			if (config->json_output)
+				sprintf(prefix, "\"device\" : \"%04x:%02x\"",
+					rp->domain, rp->bus);
+			else
+				sprintf(prefix, "%04x:%02x%s", rp->domain,
+					rp->bus, config->csv_sep);
+		}
 	}
 }
 
-- 
2.49.0

