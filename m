Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874FD190676
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 10 May 2025 17:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746898746; cv=none; b=LOYJoBUAsnCHEgEe7BiDKD2rHujZIejAi5wzueCD5mX5Lnqx75vzQQIM/bjzgJJVB01ExIqHi5LdFIQ24ASntPeLMIkSg2hs+zxHSUfhH/llOaADu3Ecqmmqv28KErwqTaaRYqxs4vx5dX2+4+HHnlLpgeFs6VSYeIJnfR0Aal4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746898746; c=relaxed/simple;
	bh=55t2jOzwJu/Pe94Z1MGgGTsjmdsmro44z4m15Q30ch4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YZQyy+H7H7yUIzIB07oBYh+swzXw7pfY5zRYJY4eoGUZM3h5DujIlNzdn1iQnyKTcC/SNZK1QDFdvs3DoBUD/oE6B5eHupsctkdsXGUBEgcNoLiMKLzCx/CIjCWvunu8+D4uXPV7j2kPGaW7nB34Li++xzjkyH6YLh28sOMJr7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGyZL7Ux; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGyZL7Ux"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b24f986674fso1249279a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 10 May 2025 10:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746898745; x=1747503545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RF8ffXs2a5We2CWtSW9yaEOhQbyIvm2awu47Uy03/dI=;
        b=KGyZL7UxIzPmz6BoS0W3FXnL7xOnJfG3Uk5pPrHzDcOcGpBfRwerG0AtqejRFX6STT
         qcyAlPu0Xfo2RG9wgFLzv/hbOL0oisjpl/OdeYjJ9YyClXv7JqT1XtR6M2i4sB1u8KkE
         bw9y1C9oHLQLSHMK5Wn1LysWfiofxeRqUtLUpc+x3hxw0i4I0/hiSkxnmSecUKMUf/uV
         uWKa/+aNtiiXvSI3XsuVhTJ6qURCl0YGVEtnOYumN/oi+b0xX8BTgPhKi4ZLaMrbcx9C
         kb1lfolt1s/uhlSzqNAzAn/1P46h1LhazEqU0wED5IM9Q8rkprOuO3l+20fLHutLqykj
         xvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746898745; x=1747503545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RF8ffXs2a5We2CWtSW9yaEOhQbyIvm2awu47Uy03/dI=;
        b=uH9aw5SQ1yiJawYctSR/GTHIeEcZzmiBA3khAeaeuOGLhy9hklx33J8gJwnE5fw+u7
         SBVnElBtA9C2vmmcBKVuPmxDMYt/LDkfIhrC25rAV1dH6j/6JAtzuo0mza47kyRTUfUP
         HuSU3lLFX9NQe1rbrAk69XQakrKEVVkuFGDtspMY2tc8dDDbFYwTO2Ax+GuuFOw9EZGE
         mKmKkac6dhdQIYYGjCvj+ZoG4juFAhr3C1av6oDtQu4g552BB71XKiUQoys74A0ru9wo
         QikE6Q8a1/k7XhHHl4P38XkcLJKBKR1phqfry2yDFw3Lhdayja6dLqViQMvzueFNKpKQ
         RnOw==
X-Forwarded-Encrypted: i=1; AJvYcCWL58s1nfyOD8oim6woMSsOj+hYzPYKwP+Z/FvlXc1TpCb3CAeIPDaJUO9pMKIq/555+izhdVarp3kBdYN7flecpYgP7A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwvYcxO5MmpHyG6ovufRDoD3q+uU/mmkROO4rw2FMGHf+rQQS99
	RPZV8tKwqQdvHTceFWFiAk/F5YjRxaOQIwst0sV/6sJEr16F4kD5
X-Gm-Gg: ASbGnctsZqVvhUSjgGkSpCQgDoYFIs0Z2YXrsCPD8ziGjJTjK0caNGsgBVlV7OGTgmS
	beKQqeEWjQa0uo7mKkPfoyQOaqpWECcczJ2J0rzZK5qlcAY9RX97gDHIA6awbmf0pLtpL5m9sc4
	xBkUVYlSSN1wWU8GegkO3bwTuIPCN8ATVFhFOkcn3hr87YiZgY9SVMhqBYXzhlpErTQGZDlNBXt
	C0/ItWKXsv8vNOKU1YlUNn8Sqr1B9QYpusgsW5oAepoZwTjN8uGJBs35uyItz9QEI4V8cyJQlqm
	ZJTNq3hH7aKNJYOZNnCr9G2VF+sV9qzYf1CNZpzKjRfXDubFxjzW/ONaXc4eAlvFh76F6EAgXhB
	rAHM=
X-Google-Smtp-Source: AGHT+IGTSxQPyOYD2KYBCUKfHwpds4RRWRANwFMGm8fDWS9SWeC9Jtl+M+LV9FTIZF/FsTZvk/vGyQ==
X-Received: by 2002:a17:902:e806:b0:215:58be:334e with SMTP id d9443c01a7336-22fc9340996mr94447795ad.10.1746898744533;
        Sat, 10 May 2025 10:39:04 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:7b7f:bab1:cfed:9805:ea32:5760])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a4c41sm35651255ad.237.2025.05.10.10.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 10:39:04 -0700 (PDT)
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
Subject: [PATCH] perf stat: Fix JSON output formatting in iostat_prefix()
Date: Sat, 10 May 2025 23:08:25 +0530
Message-ID: <20250510173825.32444-1-suchitkarunakaran@gmail.com>
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

