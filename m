Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC91223DC1
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 16 Nov 2025 05:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763271742; cv=none; b=pePHXu2tRx60Ajd/YJLp6dx1Masxl3ic0c86AIm6Y/QsO+sz4AFDu45lHJ+RcfvweK/M8nDZd1sog2X8z2dhY5oCywVo3LEGr4L/PU9G/V75WMbx2Nk49UKZdAtX1Nmm6JgbHYdvJMx679O2tlNZrSr5vJROSUZ3BpbUTLlTkTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763271742; c=relaxed/simple;
	bh=AkswSf8Pj6kLPywAFc/4sCinbDAhglnWFAuDkhBcqCM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lopbifI90Cuge6RZVQRJVGSGcmilPoRBSZdPUy8L8WbBnrgPLaFrahc8jEKz9X2LeQacmG5N1w9jYCOhwdRW27Lt0+hJVqT7OjzYW/2kjaq0ekBf9ozb2Khuar4SVokEpmbx/+lBwFv53/0yB3LWnQwpHqfsvtBZ6ZMTk/Yw7gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=bDuDb+vX; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="bDuDb+vX"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-340ba29d518so2329080a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 15 Nov 2025 21:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1763271739; x=1763876539; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTWCYfcDkOpbvWX4/d8dth0aaIAROH9noLyncWa3asY=;
        b=bDuDb+vXrDdRMLcwRnvdhrJGoPijBt1HpvSp8wDM7Lg4iNRnOGDiLini0tq/jjeFK/
         bB8f8nyinTwRwC/IK5eLJgih6MoDTatcQDT5zlADxek/gGKLab5ca7lzmOGApoF0JOKl
         7HwsqqJakcJ1wkfcpC+z86cq0B8/Aqn3AzeOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763271739; x=1763876539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FTWCYfcDkOpbvWX4/d8dth0aaIAROH9noLyncWa3asY=;
        b=E5K9ulzzUDye0/ZuzWdi8mdYobs8+2ighDssX6eSWiSVtlzxfMF1hRfvUHI/bhZ495
         I2bHls6sWZYGVfZwnh7KvAsg1fpaUKm+wyymzKD5UFdO7M3ak1UNwe9+u0dFJye7gyeb
         dwCo7xkHNeYzR2zOW37AZWG36tRx8ySrvMdbMHpYO1px8JgpvJ+jh7V3cX/kLX+r5njr
         kCZN9yKDP2SDmmrU6hYWf0J5rbHZ9fdBz59y7mVdUgqUHIi+Sj8amilDdutM1aI270Kh
         DxCOvASruT0kvJlFG4vFJI/e2VX+qzFy1C5J+cCPey3Ojusw7w2+/6ml5dS1sQ8NWtby
         icJg==
X-Forwarded-Encrypted: i=1; AJvYcCXyLcX94z7acGEaOyk/jH6Vz9uCQVEMACDsgKt9NzcBlh0wJfckdGrfcF9YoscTnxvzgWjCAAtdv0EgbHOR2Hjf+MZtKg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIqK3P3itP91mRQ+ssNWrqYHZJuIlJYTcHPBqsZU27A8JtSS7i
	syXOVLWWcLFB+iE8NJ0CFr5T358bTmX2yjjgQJutdsFR9Y7ZSaejIOR5O+F2NYwW8/k=
X-Gm-Gg: ASbGnctyVtZ9Um4Rbt3Q3QLm0iapLsn1b3ZLQ7uKv0UdDuBH3u7+iJvJKDIgFAdEtwx
	KxtY6v1JD24ZmnNWY/k/5F6f0LnbR0+1Hhm4RUEBvErvwiUV9WJSCX4+TfxX7SgxJ1k48S9zEX1
	QRs7TqVB0bFGnTMqB+RRAnUey1Imk2oq7oOO/2z6Afyrh1IsY+jYWMrl6kzrv8jiXpSC6axRK0E
	gRZAAs9UDuISh9IrYGyfNPWBj9QpkbwnNRyGVGaDcM73cU8lrMmWRBtbQrd8OQOI/j3pBTm0ESn
	p49/iFyZ4W2XlaqNbjwL7NhB6Td17a41eCqf7/5ory2hU60CiuRHyMDGFYUyXI46c4ZejMeixet
	o5JMLs9NwMZoUDKfzFRojGG7O3+72sIl6VQSil0suaO5HQHkRNuCUEU4iJLJpEHefm4VJVZ08bt
	rfomfm5bzayTlrUfoA77o8RNYGe4STrBXfc7H7lbsU+33VHIAttK6mB2XdV8TCBSKUNz1z3A==
X-Google-Smtp-Source: AGHT+IG2K2QlmLfFxQbOUyvFX7GI+ZJKFUXmOL4E+Oy9wQTzgT+ZrGoudEvwXm4hz5A9Qo5blHBWsg==
X-Received: by 2002:a17:90b:180e:b0:340:bc27:97bd with SMTP id 98e67ed59e1d1-343f9e9f385mr8126097a91.9.1763271738957;
        Sat, 15 Nov 2025 21:42:18 -0800 (PST)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx.. ([2409:40c0:1035:4e2d:eebe:9df9:70d0:b210])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36ed72cd1sm8509995a12.11.2025.11.15.21.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 21:42:18 -0800 (PST)
From: ssrane_b23@ee.vjti.ac.in
X-Google-Original-From: ssranevjti@gmail.com
To: willy@infradead.org
Cc: akpm@linux-foundation.org,
	shakeel.butt@linux.dev,
	eddyz87@gmail.com,
	andrii@kernel.org,
	ast@kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	syzbot+09b7d050e4806540153d@syzkaller.appspotmail.com,
	ssrane_b23@ee.vjti.ac.in
Subject: [PATCH v2] mm/filemap: fix NULL pointer dereference in do_read_cache_folio()
Date: Sun, 16 Nov 2025 11:12:05 +0530
Message-Id: <20251116054205.114412-1-ssranevjti@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aReUv1kVACh3UKv-@casper.infradead.org>
References: <aReUv1kVACh3UKv-@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>

When read_cache_folio() is called with a NULL filler function on a mapping
that doesn't implement read_folio, a NULL pointer dereference occurs in
filemap_read_folio().

The crash occurs when:
1. build_id_parse() is called on a VMA backed by a file from a filesystem
   that doesn't implement address_space_operations.read_folio (e.g., procfs,
   sysfs, or other virtual filesystems)
2. read_cache_folio() is called with filler=NULL
3. do_read_cache_folio() sets filler = mapping->a_ops->read_folio (still NULL)
4. filemap_read_folio() calls filler() causing a NULL pointer dereference

The fix is to add a NULL check after the fallback assignment and return
-EIO, which is handled gracefully by the callers.

Reported-by: syzbot+09b7d050e4806540153d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=09b7d050e4806540153d
Fixes: ad41251c290d ("lib/buildid: implement sleepable build_id_parse() API")
Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
---
Changes in v2:
- Add early read_folio check in __build_id_parse() for unsupported filesystems.
-Add defensive !filler check in do_read_cache_folio() to prevent NULL dereference.
---
 lib/buildid.c | 3 +++
 mm/filemap.c  | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/lib/buildid.c b/lib/buildid.c
index c4b0f376fb34..3136cc92010f 100644
--- a/lib/buildid.c
+++ b/lib/buildid.c
@@ -298,6 +298,9 @@ static int __build_id_parse(struct vm_area_struct *vma, unsigned char *build_id,
 	/* only works for page backed storage  */
 	if (!vma->vm_file)
 		return -EINVAL;
+	/* check if filesystem supports page cache operations */
+	if (!vma->vm_file->f_mapping->a_ops->read_folio)
+		return -EINVAL;
 
 	freader_init_from_file(&r, buf, sizeof(buf), vma->vm_file, may_fault);
 
diff --git a/mm/filemap.c b/mm/filemap.c
index 13f0259d993c..f700fe931d61 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3980,6 +3980,8 @@ static struct folio *do_read_cache_folio(struct address_space *mapping,
 
 	if (!filler)
 		filler = mapping->a_ops->read_folio;
+	if (!filler)
+		return ERR_PTR(-EIO);
 repeat:
 	folio = filemap_get_folio(mapping, index);
 	if (IS_ERR(folio)) {
-- 
2.34.1

