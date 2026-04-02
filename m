Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42913EAC73
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  2 Apr 2026 16:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775145881; cv=none; b=KeWhHOaDNY0xURN7OOc1g6W6tvGGwroJXxxvRgdRDKyzu4BWy3aMGV8kIqN5Wwb5gb5eTOdrMtsflbtbHiNseM9INyVBE3O5VMiVNNlc+VhxkELZz8zsasdPVaFPPNS7oHh/506bNX0JIZC+k1Zjb+0whiDE2yoIKDK4IPNFXRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775145881; c=relaxed/simple;
	bh=vbR9luJi2b5bo/PrlmldXqoQ6slG09mFuhpP189oVoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=inOoJ88JJFPKRRlAqwHgHAUcWypWthF1FviAevurp5pOf8TiEvDBHmQ2NICG99cq7FK7B67kLYBzGEH/50G1L7j/SjDdv+96fLsw1mP/b3pDK1N2yyLQ85yenRT38GgHB8QwvztCyJlqivw730RhoeaH9aBx1Gm3zQEIw6E69P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=et2I1nY9; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="et2I1nY9"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82735a41920so361529b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 02 Apr 2026 09:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775145878; x=1775750678; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=prBjVrj8/bfyqPL6p9NnkzgN1t0pLTHzzXHQ/VzSqEA=;
        b=et2I1nY9zfKPgZAa2amZxOZY7Bcpj9BT0+hfyv0cCyf1nT11BFaNQqz0KQx+lhM++r
         Quct1/aa2pyzXIDB+p5jN81pUfitY/CmmWmblvmf1Syygez7/rv9Iaq9cBv/RFhph/Wr
         uaG2YQEzsT3/mFGdntTJZk3OQcWEOHs5AzVssUHhdkeqXN3RJybOfTN4OigIg5juyjxZ
         1AUbG5lZFinUc58aVXlBtOfsjtBEVTVyNQRDHV451uATgUlFmL0vjqn9nNfVFnFKap1o
         tkKQeuCnUbSyKFiXmwAQvqA1S9I3cEjhOVFHWN8LmGNpDNqzfNRU6EVD5Q62ueM9pnOZ
         NJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775145878; x=1775750678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prBjVrj8/bfyqPL6p9NnkzgN1t0pLTHzzXHQ/VzSqEA=;
        b=LY3joUdzMGgvQuPNFJkHjfsw0JM6sV4MVfOJSB8O56wQDIMX7hFN1PIXDK/RBwGbPQ
         DdRNpLEteJzKk3VAplFH7i7OzLokmSTBlo+wPTInqevUD+tmMe7z32X4pL+cCkErZ+WE
         Uia2WupzgK1PXA+ibiLppcLNfpdhmQPMy7Uo0mN7uHYLCmjrGOB0IbUc5gNSuMqRatV4
         9kaOATrF1278dm+Zu2ZfiPaGgTh8gM37RgiCH2J+RUPPoSYUnk+IwTtTkoPBkAyxYd+B
         GzWUJab4H5GXbKJAh2UljbajO8WsCeLlzZfe9LBIRnvcuMUXh7788ISMh6I8x3AN77eG
         Hdvw==
X-Forwarded-Encrypted: i=1; AJvYcCXbVXsu+Dsc1xnzJ7vesFaab9ktv4Z/HY7y3oowhAa/sZqNkgMdJy663L4ZXBt2lrB/1/r6BXSN0l4Z1aapzrssHCsufw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyY58FDmwJeJZwFMRgdAoh73IUWoe0lMjwKUVT6/LF5MJysXU4W
	RVcfC1rOh/OwkLwJh+Wh63aDfasP/pia1UyFWkWqzZbywLq4dKcPxevL
X-Gm-Gg: ATEYQzwPfOvdAwNH3sfUup6nxwrRQl5cSD11HQ/1Ci+JCTQmtCYjVOm33dEYRvpInWg
	9bet8RqkUQeizW99QuMcehO1rkGptP9cN21TtwOp7z7rNxdudyaKCG4L+7maIzHQSARiUoAhoff
	+xs7leeKxXOpsfQkNY8DWGppfj3M3hzgi1KctW8MMQQ1QRnXOibpU1s/QQrDe/PYAIp69gUxt5v
	lj4JYSRQ4V5Q7Rivz0Km7dvGObsSFbDKS+GwjM+Sgae8JLXmMNYujPfcjb6i/l09jjTsgGat6M1
	LEtn/ewMUmle1EDmnL7EztbiUkuKRqWrKGMugBT+lSXRgYz8ijAROzvub/RguegadSvQ2rRuB6m
	kaUyYeJYciF/+8oqqT3TlPBZibSK/Ym81zxQMN8w5jsKB24ixzRVFwV4gnh+wAta+PO1mNxUYym
	F3DSdn9qKCmKq4+FAu47S1ZbKnU0GTIAm032ILtOLrdL9OTKg=
X-Received: by 2002:a05:6a00:298e:b0:82a:7f1a:758c with SMTP id d2e1a72fcca58-82ce88c0f1emr7664298b3a.11.1775145877863;
        Thu, 02 Apr 2026 09:04:37 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cfebe5b23sm2822987b3a.59.2026.04.02.09.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 09:04:37 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org
Cc: mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	me@brighamcampbell.com,
	shuah@kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v3] perf header: Validate build_id filename length to prevent buffer overflow
Date: Fri,  3 Apr 2026 01:04:10 +0900
Message-ID: <20260402160410.425978-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The build_id parsing functions calculate a filename length from the
event header size and read directly into a stack buffer of PATH_MAX
bytes without bounds checking. A malformed perf.data file with a
crafted header.size can cause the length to be negative or exceed
PATH_MAX, resulting in a stack buffer overflow.

Add bounds checking for the filename length in both
perf_header__read_build_ids() and the ABI quirk variant. Print a
warning message when invalid length is detected.

Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
v3:
 - Fix printf format specifier: %d -> %zd for ssize_t (Sashiko)
v2:
 - Add warning message when invalid filename length detected
---
 tools/perf/util/header.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
index 9142a8ba4019..9ffc0f4ca6d1 100644
--- a/tools/perf/util/header.c
+++ b/tools/perf/util/header.c
@@ -2545,6 +2545,11 @@ static int perf_header__read_build_ids_abi_quirk(struct perf_header *header,
 			perf_event_header__bswap(&old_bev.header);
 
 		len = old_bev.header.size - sizeof(old_bev);
+		if (len < 0 || len >= PATH_MAX) {
+			pr_warning("invalid build_id filename length %zd\n", len);
+			return -1;
+		}
+
 		if (readn(input, filename, len) != len)
 			return -1;
 
@@ -2587,6 +2592,11 @@ static int perf_header__read_build_ids(struct perf_header *header,
 			perf_event_header__bswap(&bev.header);
 
 		len = bev.header.size - sizeof(bev);
+		if (len < 0 || len >= PATH_MAX) {
+			pr_warning("invalid build_id filename length %zd\n", len);
+			goto out;
+		}
+
 		if (readn(input, filename, len) != len)
 			goto out;
 		/*
-- 
2.52.0

