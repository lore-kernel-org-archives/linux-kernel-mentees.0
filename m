Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F2A2DC794
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 14 Nov 2025 19:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763149068; cv=none; b=C2j6rqbPadcve3GWx/GYMZFujvrh8djodVRl9Jc0uvGBg+pkkk8YOhMZCqGCDI0bITBWnp69/lAJNsfNr3Jq9+251mwrka8D+orxdUQoaXAKdrFNkfIU93BLDpkaXaDI6u5LEsMdAB3DmUzHxeTAJPbK8rShCuP+78//Z1ozRcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763149068; c=relaxed/simple;
	bh=w8x1vgY5Ytuh+8oAzT9I6DYuO6E1SOohSBxub76r0Qc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mQEkY2s7wkXAb3PzIRYmFrZUVJkqzOVmMfnXhcsypEwEbEBNucArZ2UPursiY8aSbUwGH8r3jDiGO2B6d0JIokqy7RALK3Tv7SkKO3EWAEGzlRgafTBjn1R1fmXhwEj5ahNZ/TI4ptDH9/6As34EXKI8bw6KkblS74eUQuJlsvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=Uij6YR61; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="Uij6YR61"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7aad4823079so2162595b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 14 Nov 2025 11:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1763149065; x=1763753865; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XU8vU/KjPE99lkBMAKIxdrPamg7+p9OoEjvmjp1kXQ0=;
        b=Uij6YR61Shp5ZP4jQszTu+cOvK3TIsJcqyGL/WyjtUGgKSW2yfrt1evIDNUiRDaQao
         TEjjWxwoaRkW4aM1Z99VsIu0nBfp/FHl/L2ioW6r6esQaiGTZsJg7SmMvFSldcD9A/iT
         +mcIeTOiy1OZNFBEdiMbBlsfnfw1reZfhW2Tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763149065; x=1763753865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XU8vU/KjPE99lkBMAKIxdrPamg7+p9OoEjvmjp1kXQ0=;
        b=rGgExLhw8l4SWKrw70AbsW3r+qg5k1dHEicBoFqHGQc+qeJc/LCaQYYyaRTYGEeCDQ
         2tSP9MqYXChfDaY9g4d+7CkgvVMDaYCGeSZr+QGi0e+3BGlx4XWAUd88HYqitwyGUgnw
         9CL8ZAqd/+tHYgqs4hJ3MrrEn8R3rYtJMqOMqYpGuViFDcM6qH2/sqI/jt8UFNbYHFfp
         5RXfS2y2RMlNWThnfejZgauLUFXMkd2Llc/6e/VcpQIFRRpkA0oPKjs1GDjvlHq4nERY
         53C5KqllMKva+I1r2RdAG21CTTNqx6Ez03+sqe96tJRp4NaTnJqW5k7aNQo/GuK+b3Pr
         FQeA==
X-Forwarded-Encrypted: i=1; AJvYcCU5Cn7TVXcsUwMBJW7Mwcy1cbLrZQRY68DpEvuoecssJuu42tYfuHbZKlm4wBAcP2rWvVYpIpTspRc0Etk5MP73zFKOgA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwA7WpKReHduUYwWe+40D4QOAXOS0y4dTz6UQEk9LEH65Y6/qUl
	FTb1kquCfZ4XsV98oK2JezayWKWR3ql4C/VplKo2BVs1uTaTy+h+JOgp3m3T7bpr4g4=
X-Gm-Gg: ASbGncvFa6yFS3iMu+KDRAkRGr8C2sIBVJx7ePzjYXQZ9i/Qe97AliS7EchaQAWqd14
	to9OgTSe3FH12hnRWAPHcWdsFAJl2SYcDM3ftldPNRVIP9LqhGkyms322JIn/e6L+YgxA40FxwQ
	bPuVPfjBrm342UpSlzGB357DtJI7Vebdjh6+ifauWUbcIA9MAlPb3MPeJFRxHfhhbLjUVtEaUXk
	CuOhCknwjeTBI6sGjjoyl2txPG/k2mVNUfuPa4rMBVVvlZvOqoMQ6eurp3Uxzd6cNRL5W4jQkXd
	tMVaSVHNzkzgssVmfAA+2xePrAZfwz8pq53z2Pb8T5jxsslPZjeBGbKsiRwmE/YobPXejeOpMSP
	BUHwv+G+PaeXl6kG2vWnY1xdKvh+7a8HkRWfF60OSw7HaMFIsBteKcsDVkiHlcgvfjivYdNaMQI
	gTCx5vH/4rR9TuE+BBvzRBHOwOLrzQsfbR/zHGw8BNrDkZeqN5OYQs9b19
X-Google-Smtp-Source: AGHT+IE+LbpWEktarCB2Dnrv1yWZrNsnZpDCOeAp7apnz9uVsWtNi+RAN9rwFssQKUSctcc6Q3Qc9w==
X-Received: by 2002:a05:6a00:2e8f:b0:7b9:7349:4f0f with SMTP id d2e1a72fcca58-7ba3799f055mr4742484b3a.0.1763149064968;
        Fri, 14 Nov 2025 11:37:44 -0800 (PST)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx.. ([2405:201:31:d869:6873:3448:fe16:68a6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250cd5f6sm5941807b3a.16.2025.11.14.11.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 11:37:44 -0800 (PST)
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
	Shaurya Rane <ssrane_b23@ee.vjti.ac.in>,
	syzbot+09b7d050e4806540153d@syzkaller.appspotmail.com
Subject: [PATCH] mm/filemap: fix NULL pointer dereference in do_read_cache_folio()
Date: Sat, 15 Nov 2025 01:07:29 +0530
Message-Id: <20251114193729.251892-1-ssranevjti@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>

When read_cache_folio() is called with a NULL filler function on a
mapping that does not implement read_folio, a NULL pointer
dereference occurs in filemap_read_folio().

The crash occurs when:

build_id_parse() is called on a VMA backed by a file from a
filesystem that does not implement ->read_folio() (e.g. procfs,
sysfs, or other virtual filesystems).

read_cache_folio() is called with filler = NULL.

do_read_cache_folio() assigns filler = mapping->a_ops->read_folio,
which is still NULL.

filemap_read_folio() calls filler(), causing a NULL pointer
dereference.

The fix is to add a NULL check after the fallback assignment and return
-EIO. Callers handle this error safely.

Reported-by: syzbot+09b7d050e4806540153d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=09b7d050e4806540153d
Fixes: ad41251c290d ("lib/buildid: implement sleepable build_id_parse() API")
Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
---
 mm/filemap.c | 2 ++
 1 file changed, 2 insertions(+)

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

