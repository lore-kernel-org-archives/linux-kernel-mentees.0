Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307A84400
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  5 Jun 2025 18:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749146427; cv=none; b=XHrlyypXIn4xfdggQQNeYPJILZcKrtP5uRtIQY8vPv4PEJmWKDSnojUNjxccVxXeuto+6yG/RQAoHvqVbPprpIdTqeH4TxSPgqoFyS3P22dVdVpu4TqNp+ktCe+mHaQ+hCx6tpORZmz/U//TKfyCUECDSwCRQj/NCKKyg42IqMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749146427; c=relaxed/simple;
	bh=55t2jOzwJu/Pe94Z1MGgGTsjmdsmro44z4m15Q30ch4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pGLXSn4FouMBp2hFFXcGoKakKlXWqFMpoqjHZBsjoc0cL5sLnvgkqWqbOI+077KH4TkhpWrVHv8x6+wwmELOrQuEuWgWZ15WH7RtYSBsHXbkym/LLDhiHzoN8D54MDWblg2OPNgOhKNYS0Bv6Kk00dTwC06Xn0cW3K8cTF0H9e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQCgV1ys; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQCgV1ys"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-74267c68c11so1207514b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 05 Jun 2025 11:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749146425; x=1749751225; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RF8ffXs2a5We2CWtSW9yaEOhQbyIvm2awu47Uy03/dI=;
        b=kQCgV1ysmkq2lVmbEjR/o6KZofNWXErLpad3B6ea/nHFx7E3oaBDbdF3qhEIYIlE/2
         noypxOaULeoISC/xwImYmi1NLKF7r/3wFesp0LAsMDFyQxIreyj8P0bkmeIMxxc7uDyF
         dc4lHggQXv6E/td5e1LCAKQBYRFfG5c6FcL0QE9PBKu5S0kYpJ1hgpBOU6a08FJ7B9in
         kNgQlaFZV6n918wp07u0yuLQF6zz++ZM84wn8x7WeYWKu7WXo2Cf7oTC5XtHpiE9O2Y5
         coYNe797/I+pfb/P1xMQ+zw1VxcZQnI4qd2kOq9yUtBDEs/+vYDC58CykDibZJGuyH8k
         TDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749146425; x=1749751225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RF8ffXs2a5We2CWtSW9yaEOhQbyIvm2awu47Uy03/dI=;
        b=sezncAY0CEvdS5L5FLFbWKBsD2Mv8A7+x9xaKQBMTcYkyV+mVasWJJSKeKdl3y4HRs
         S/NfSKQvByRG+sM9e2+3yLdTxrASewFOL844hbUjqBAPiKxsZMqOjhJGw7rfgdODxeCT
         3J6rSdaF9L7VGDjgkUaqjIAgRV+f4DyqptrnkknZtXG78oUmgO2vFLfgGzqqn83y1AVt
         JgZCc5UZGsH+sRNDl8ElqkgvJv5s1t/Qx9/EzlKHTk/LFzTxjDZ6mO1pSsfco2q7zsep
         1ngQPg/UBnHIN/m5IIu4RzMKBfAZP4gZlileS7MM4nqmxJ7yABxjuxZ1XTvrewlltbI0
         yCNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4qL6Z4IlgzSazjdJRBgy2kOR4484Lb/ifDIrP6jjkxm5SxLlFDKTrPXPOd9l8KEAPDuh+lGu7hH2/jrbpNRtwRFb+aw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwADVRrXpFKmCfhQzRcjfi+CKN69g+6LEhSyEaltoUuxVL23Ajb
	ScSQVUg0D7BfNgD1eg7FnU/HPwPO+fxVJSuqcDKkclHNi5fjykLJJubuZsTuyDQXB/TeAw==
X-Gm-Gg: ASbGncsQdsRWG7mY7SC0m6r4Q6VuAlf7lCAGVuoYxKWePYBoyclmSa9g3ZLXBtZk8uN
	KAblelEofTzDPF9yaeFWuRDvriDiNdo31rfQ1k8kBuAbYqwxJAYOWLFsG9rZHq10CTc8bGnnnrb
	XgcZmza2g6aNaBNr8CyYOSSYOqd4S76Dd4VX4MZJy0gXmMI3yucKqmAeMiTUkCak6ja06953Jo8
	J9mIJI185SBA+76xopbMTDyqw8pjqlVcHjvUVl7oj5rNVMFL+TeLPh0/ZQuuas3hzZq1+bnA7jC
	m8tLyOf916KGrs6oMvuRiXE77cM1Y1CzM3hhGKx6ALLi59r0jcr991fTAB35F4m9xZ9OPH4qZ5n
	YkgTrBhskMQ==
X-Google-Smtp-Source: AGHT+IG35nhW2BaKHY08+bd9r62M+r94Fyct1DOa+cXTe18W6zYbZVo0lDD3CUa75gAzRZSVhbE65w==
X-Received: by 2002:a05:6a00:14c2:b0:747:ab61:e4fa with SMTP id d2e1a72fcca58-74827ea5744mr825231b3a.14.1749146423838;
        Thu, 05 Jun 2025 11:00:23 -0700 (PDT)
Received: from localhost.localdomain ([205.254.163.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affafaf6sm13405708b3a.100.2025.06.05.11.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:00:23 -0700 (PDT)
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
Date: Thu,  5 Jun 2025 23:30:11 +0530
Message-ID: <20250605180012.16788-1-suchitkarunakaran@gmail.com>
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

