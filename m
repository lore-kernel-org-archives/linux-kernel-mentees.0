Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F020C26D5C9
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Feb 2025 16:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739897975; cv=none; b=OSXKmldlrR3dc2mx+j3fvzdBOjZQOVDTJB/prG/q9PQQEt8HuSXFNZGv8Lw001yKu2AFCzDmJxSMwizZTTR2rc31RJgmWPUfygMU/wnB1X7zrO5oCkO4FTnTVTJpcn5BVPJAZsgMiL8IwZWuPW2cbUyvgWnt41EyvfUtwxZKDa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739897975; c=relaxed/simple;
	bh=3RFWOtHbuVv6Nc1ZE3k6eCKE8OuVH5G1a5Nyu4685aE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ITsJKBU4K97J8cVUgQuDVF5kLv5/S2pK/R8oK1tM1mfhCU6ZXeYWkwKHOdMmynSn/h+mkRIkyzTAyW3+uGutZ0Xh8J0GLZUItgaQKFbAOUAW51pAnhkWO3wM5K2j0eocHLApLSy4qw1lXZvA4kSfCs6mn+VJOJpFa9UShM8aAGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBox2QtU; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBox2QtU"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2210d92292eso85139815ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Feb 2025 08:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739897973; x=1740502773; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NQ0iczs/f01PaFvxLk0T+RHP0Y74cglMUGc/eTOXWT8=;
        b=hBox2QtU1/D8AM9+/4GDHWbBac9hOrKRQzAGzWRc6h0q9Z0NCjizasuRbEYLe/3w7t
         X8ha0Ys4M+5gEI9C1H5HwKdW/St2fgI7W/bce4W5mowBDioCflRBJAZ1Dt33/QgERUMx
         ZWnG0k4Sl6OL7U1JzT5kI7H8rCNOHc4OXvTNNMRP7Ozxwptf9lcahtO4eOPbU3AnZmiN
         mkk22OeNvICqRpPSrlCcymnYp8EOH2rtgh5cMfUwId8NbfWpYbRE8BETX3A1Q/2d/pUv
         sFjJBwLRdEdlRhRnXz6D5I53x3a4JTsvltVe9bu6IAHJNJbWmRAAO86XgxX2B4OT7XxG
         l1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739897973; x=1740502773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQ0iczs/f01PaFvxLk0T+RHP0Y74cglMUGc/eTOXWT8=;
        b=nSDZmTU6CUhZ2vJK7Uh/yyldgjy1aVtqOQ0KSjnglidRP4pTctb9Nck79rap/lNi2x
         vQgMm+Aavasnb9kcW8tXCzht4Y0qJxdUt7SEXGnmEFLDuBWietq2USZmRXOiCfgyk1wC
         J5sHCKSa8WLlabAMnekSe1O5iRysAhkLNbrQD7Tw/M7mAJUdEA1XZ9rkS6tNGJz3MHVL
         ++pFxRtYDRZNSTE/Rj2F/dGx00Xmbm0Tr09RKo5lvaqtpdCOME901i747h3vaWBWbSjY
         azKZEQERrfBEEdYnQGUm3V/FRQjAiJeD3JssgGLhWlZtfj2aZ3MOvMJBDHl2sflCI7Kr
         w3Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWKN4NWnjFOe/J3Ue6RZkb+N1ng4daPhgk3ipWnwW2yuNqzogNU0a4hewniJEFRwmIjhD9xgxubQX5vi5LWYQZQTMkfkw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxVC513+2bVWoSYTjIsEt1pPdh0VzcjF+OGeoPW0Kwb6eCOj5Te
	qzCNY1mcjXFUdBG7+pKU6Fc4e6C2WKuMXqSp90UbA6GQtEeVLz9gVE8KplQJohU=
X-Gm-Gg: ASbGncuTYLz2rZqVGwOFWb97quZ+ZB9uEgCicVu32bwiovd1DA7dBQoB5e5h6fI64rN
	4j9gtpMu/mfIFK9YXjAmG7ekloJfdoNykSyLDxR0W/Yq3ryG1zaq8vnJEhgJw0Lg8nInWwHiiO4
	2HchxHr4eL5d/+GZdSyznCPnmvv3xitwDEr1/9mSqIrZf4/KY3cZ84LonUU8RiCTqKXlstvh8O9
	kHuT/ir3RJQnmynIOmWGKtp8OdXpfDXRw5u5TjzQgdrMkXnb+bj5lBEXpf0nAMJpqhf6r5l0fgI
	3q4CowP4JPQg9r+4elJNsRL/5LfKg/pX2ILS5wc7xQ==
X-Google-Smtp-Source: AGHT+IF1JuWYJdCOgkh3XC0mHjU0ZlfP/j0jnRLaHEDrwR/uBAScx7ddu3oZrBXPR0lPCThpWj6pWg==
X-Received: by 2002:a05:6a21:6b05:b0:1e1:e2d9:7f0a with SMTP id adf61e73a8af0-1ee8cbbba0dmr29332802637.34.1739897973071;
        Tue, 18 Feb 2025 08:59:33 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:16eb:c16:eb93:d961:71b9:73fe])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73258dece33sm7916298b3a.37.2025.02.18.08.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 08:59:32 -0800 (PST)
From: Suchit K <suchitkarunakaran@gmail.com>
To: netdev@vger.kernel.org
Cc: kuba@kernel.org,
	horms@kernel.org,
	matttbe@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit <suchitkarunakaran@gmail.com>
Subject: [PATCH REPOST] selftests: net: Fix minor typos in MPTCP and psock tests
Date: Tue, 18 Feb 2025 22:29:23 +0530
Message-ID: <20250218165923.20740-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Suchit <suchitkarunakaran@gmail.com>

Fixes minor spelling errors:
- `simult_flows.sh`: "al testcases" -> "all testcases"
- `psock_tpacket.c`: "accross" -> "across"

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 tools/testing/selftests/net/mptcp/simult_flows.sh | 2 +-
 tools/testing/selftests/net/psock_tpacket.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/mptcp/simult_flows.sh b/tools/testing/selftests/net/mptcp/simult_flows.sh
index 9c2a41597..2329c2f85 100755
--- a/tools/testing/selftests/net/mptcp/simult_flows.sh
+++ b/tools/testing/selftests/net/mptcp/simult_flows.sh
@@ -28,7 +28,7 @@ size=0
 
 usage() {
 	echo "Usage: $0 [ -b ] [ -c ] [ -d ] [ -i]"
-	echo -e "\t-b: bail out after first error, otherwise runs al testcases"
+	echo -e "\t-b: bail out after first error, otherwise runs all testcases"
 	echo -e "\t-c: capture packets for each test using tcpdump (default: no capture)"
 	echo -e "\t-d: debug this script"
 	echo -e "\t-i: use 'ip mptcp' instead of 'pm_nl_ctl'"
diff --git a/tools/testing/selftests/net/psock_tpacket.c b/tools/testing/selftests/net/psock_tpacket.c
index 404a2ce75..221270cee 100644
--- a/tools/testing/selftests/net/psock_tpacket.c
+++ b/tools/testing/selftests/net/psock_tpacket.c
@@ -12,7 +12,7 @@
  *
  * Datapath:
  *   Open a pair of packet sockets and send resp. receive an a priori known
- *   packet pattern accross the sockets and check if it was received resp.
+ *   packet pattern across the sockets and check if it was received resp.
  *   sent correctly. Fanout in combination with RX_RING is currently not
  *   tested here.
  *
-- 
2.48.1

