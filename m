Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14704149DF0
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 13 Jul 2025 15:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752419559; cv=none; b=DDMAe+09+zbARYRkK0SG+mTEQz98lCbUTZ/QPwkrAVdoyLyUO+Q3waEEtl+1bQz3vlugE1U7TjVMvwOpYqFpdq6/ZLkf7G16Yi1JEbHAUxLjNPFgdqyx8IQLzut9BbZ0M6zyeemVcVInSBPJgVUa8jA6oNIQRbvcQdR8GrV9IzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752419559; c=relaxed/simple;
	bh=WhXhD8DoE5hAI18sbrgYoirqUWMUbYaQdRp4TZni8no=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D8HPI6js+Nz2+v4XMCAR7g0LZeILAwytH5rCPNYuKsjFEAmo4Yp8tQqzat7qU3YyJU87PmeDjNMwzHV0hBX/IVgbAPk17xWFu0kbNWJ2Mf8zHEf29PKCtxCExml/Hb2/NT74FIYFPFGv2uZkqGhQd0qKlCrrh6bW9SPwiQq49nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kaIdnBy/; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kaIdnBy/"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso2864604b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 13 Jul 2025 08:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752419556; x=1753024356; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aOHtBlXea9cd3aN0INW94Xle4LZ4tirGxfQi/1kIgss=;
        b=kaIdnBy/GrJwS26tfchJ/PsKaM0m0DXcyon9pbx5J7k2yoHaj38ARr0YSySTu7MEEX
         vQYiXwVWjSxvyDUEZABYTibnndkJ/MUHMRyx4OE0Eb6+WNscNkfTpLvEfOo+v6qJGMRD
         P7Q5urlfsDkmXN0lwbjvo3BuRLrYw0AVa/AATUvzmK6MZpox3N0RiJ8l7dO0X4B/OX7X
         SNhjLHcOZBQiMDxbphzRu2UoKLq4ZL29Wk32ArUzc7nIUn8FW1lH+Wxo8MIR5s3mr8p3
         WT+30+RVWCCKpoMJaM+u0J1oq/apgc4SZEqOvxS1Yio8m/QHVg21BYgYkici3W92TkQQ
         7hKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752419556; x=1753024356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOHtBlXea9cd3aN0INW94Xle4LZ4tirGxfQi/1kIgss=;
        b=sj4eA/kBlY8lAy3Obj0eYRQyBMs/n/AlnAlbcLMN0ipF1CjBOrjC4v4r1nUlnSZ7os
         5HPrOSywsOTLw7idCqpl1AnzHQhsAvOy+1ohraKI5uPHOYnwINmwW6+JnFTcBEuK8WVP
         kwZXdyqFb93gkRUrddf5aMlFZWQT00l7PkgYv4przW3TfFGjA47sBkJ2FArWETwpXG78
         Tx/sG3hwnqeqzcaTJqRi+bh701LelQIX2aP/4eNrgGaMptR1yTgbDDlhgk+XfrHK+xNW
         5a0zuo02bdWCZxcYNB2i9K/VUyGO1SjhG8SpHi5M3nmZMIUAbOzBqxR7FGrVNekJREYk
         H6YA==
X-Forwarded-Encrypted: i=1; AJvYcCUllaVL03QjcMVerLyKn7tcCb6+BFh8cdrI1gPxpchTD5WwX0MBJYHMzAsZEYUakrZ9RNaM17VGVB4YLXhK19vXqTiomw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzSanQu1yw1C2JjRsSiGZ5aVke5N244o9ujcEg+JHLfSXjZ0yBT
	pDRFWnHJOFTCgyJiystH+wZW6/okw9eoF98u99lSw+pQEAQ1aZLjiz4m
X-Gm-Gg: ASbGncuqp94fC4E9TfCAe+lbP0xiwBHbVzXFouxjyUQGLqn0WTd2oca9Xmy43FhjDLR
	dvxxE5abRufof62xdEy9r4LzGwTOa8ENPG0kuhlmEplMekeua5OLr+dRJIJOikXolQNMwYtYhFU
	1NG+0wbYFBNv2Vb8VqGSlBXgwRMjz81KLhD/kWl7gS4OU7HNb+mun2DbAxL0iX49OdNJnZ4Sbk8
	DqjuGqJ1xoZOVUAQzRfVu8PpgfjZ8pI5dwRvAR3D7NpFPUrWrcHI8Qs7keiGG3TU1n7Bzs+PaqH
	/Jtp5i4oOcohEjV+rcKrkIyMug+5iiwykd3b8g3tZjWINWOE4r/WttseDHaMWIzdDa+Gik24DXJ
	NEqiGGCYaGw7sfKS1lj1lYitQ42fbcQ==
X-Google-Smtp-Source: AGHT+IFfS9CYUZRVVqfQakPYkDfbYFTQ4i7frj2W2HT7q+V2vCSSPfXsTH4UwgX8Xr9t+y7mbk/w6A==
X-Received: by 2002:a05:6a00:92a8:b0:74c:efae:ffae with SMTP id d2e1a72fcca58-74ee03a19acmr11235698b3a.5.1752419556077;
        Sun, 13 Jul 2025 08:12:36 -0700 (PDT)
Received: from archlinux ([205.254.163.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd7341sm8956513b3a.15.2025.07.13.08.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 08:12:35 -0700 (PDT)
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
Subject: [PATCH v2] perf stat: Fix JSON output formatting in iostat_prefix()
Date: Sun, 13 Jul 2025 20:42:24 +0530
Message-ID: <20250713151224.43764-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
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
perf_stat_config. Note, I didn't test it since my system doesn't support
it.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 tools/perf/arch/x86/util/iostat.c | 40 +++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 12 deletions(-)

Changes since v1:
- Fix issues in formatting

diff --git a/tools/perf/arch/x86/util/iostat.c b/tools/perf/arch/x86/util/iostat.c
index 7442a2cd87ed..d7ae19fb83e5 100644
--- a/tools/perf/arch/x86/util/iostat.c
+++ b/tools/perf/arch/x86/util/iostat.c
@@ -403,18 +403,34 @@ void iostat_prefix(struct evlist *evlist,
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
+		if (config->json_output) {
+			if (ts) {
+				double timestamp = ts->tv_sec + (double)ts->tv_nsec / 1e9;
+				sprintf(prefix, "{\"interval\": %.6f, \"device\": \"%04x:%02x\", ",
+					timestamp, rp->domain, rp->bus);
+			} else {
+				sprintf(prefix, "{\"device\": \"%04x:%02x\", ",
+					rp->domain, rp->bus);
+			}
+		} else if (config->csv_output) {
+			if (ts) {
+				sprintf(prefix, "%lu.%09lu%s%04x:%02x%s",
+					(unsigned long)ts->tv_sec, ts->tv_nsec,
+					config->csv_sep, rp->domain, rp->bus, config->csv_sep);
+			} else {
+				sprintf(prefix, "%04x:%02x%s",
+					rp->domain, rp->bus, config->csv_sep);
+			}
+		} else {
+			if (ts) {
+				sprintf(prefix, "%6lu.%09lu %04x:%02x ",
+					(unsigned long)ts->tv_sec, ts->tv_nsec,
+					rp->domain, rp->bus);
+			} else {
+				sprintf(prefix, "%04x:%02x ",
+					rp->domain, rp->bus);
+			}
+		}
 	}
 }
 
-- 
2.50.1

