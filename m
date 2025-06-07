Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AE21F91C7
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  7 Jun 2025 08:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749284964; cv=none; b=h1t1REIVFaUIYZP0evyRudaazO6HrBmJiZa0PpFp6/lagjpNlh/gOOybc3t9zzhyet8bUxm8nL8IScjYSvmkfULNDyKKDRVc4KI37+YAkNQnOh9sWHX1ycDKOU85wQuRCAaKQVaPAQlsn2ustGkeCxyOX+yRHIosf1QK43htz7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749284964; c=relaxed/simple;
	bh=guoGByzLTf+4QpA3Zq9Oc6Ba9GkWALSBOTskGKrijdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kh9x2ApXqXmVQ+CcJ48Mo+1xbUBVn9PXK7FxXYIJs0kHan35gMbTE5o2g8Jx0ByqdhQiNByXd9xSvrM0ynuTPU2UVuuqT114rpNqkhpHD647rkbcfTdD0MQ76NE+kuRPc7CQhbabM6oiXLZ29g+bbKGwjW3z7azsoJUvnttvkXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OA1CoSZd; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OA1CoSZd"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-742caef5896so2430267b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 07 Jun 2025 01:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749284953; x=1749889753; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gqrQNrZhDEaoDoYGNSTeR9PK55978s8pQW2q+WWm76Q=;
        b=OA1CoSZdQag9DuimorXi2brznfZg22PFLeD5z4vKQrC9ozSnfOEStHatjm9WIQX1jR
         K3ccv8G+HhfxdDwNuFOaty1XGLzBMQE5NvB5nyDgzJ1brvqnXr+pD0qvoqup4Sbb8vU8
         ISaz88SrEOwukrHsJlef/2w7j52R9GS/SEtBDzPKLc8NpjW/hZjg+aBCRg8cd6MoPeiF
         CC1/VNgABrCTx9nVJlotv/V2JwR9xpSWGzJPpcST7sMooyVI4pPzH605IfDK3pOGv+MC
         crrZ+3DRSEEwJ7h6kQ59WqI2Zqw8ayOrZVqLU/sZA/wfzEb4c6wmMsfxvjmjDZpv2Q+4
         bg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749284953; x=1749889753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gqrQNrZhDEaoDoYGNSTeR9PK55978s8pQW2q+WWm76Q=;
        b=SFbaZGTffr/bYYlXZn7A0jkpxXxKT5YgEDLOU0i5ENxBJaP3b1JQqizjAcD8C4M7Wl
         QA1/HpyCTo+l6JZi7kT/70yIR9Sn/dGa3o98n47RssX/I2QyMJpT8YPB+f1OPxMi3W9h
         aaBgLCfXh9zz5iMFLdpNLP+qtthPB13ZaBrBtkog/odDqwXFT9E6iA5Cqf1T7mFRDsCm
         rJ2yMn0SF/rFYyuST9SIvQLGO+bJwrLgVWPQ0cYl9Rbyh2NjolJT0bNS6Co098gieIaS
         VkoD/vycgOudTJhH+9G0QARcGJS+0zANzZMDFiUbx/ZPmTQG+ZdGQb7eBWRNKlNeg4D/
         avLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB5M1xuUyee1bXEV9UxkFtLWw0zzJQEah0XTYG1fCwggVJsYfg/spH0gqrBHb16MbCRwInjddX0hFN+jeMWDKHe6METg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxE+HQcrJhAKwh4oIFSGRNtgFBTHIq83wpDFhc6ZnVmzGl0OvSQ
	SHZS+3qgDbWzLGCdY3EOr1RB+Xc3OxWnrNpl+UX1y80tJYyT3RrBGRHM
X-Gm-Gg: ASbGncu39gX/5rzZn2ROlWvsqU1iUs5aP585dW8u3l2AD4/uZTFTX5PJ50NRjgTxkna
	18rw/4LMBcV1azArQJX3BhM8io072hTQhymNfTp3F4J7LNYlukKIHCjF/Aobusd100rfmFMXijV
	cfRroLC1QmrVD/j7i4g3MljjxGOoqeNxbbtElOs9FTK1MnLTkFeeGSyNzQfphaYso7dmTQTBW6X
	7SuAONfJQJ/Ty/CQAEiYj8zyMiLGsQkjEv7twNKj/kNqmnN4exlhVi3chnIgbxRxl7gb9sGpO/7
	jEj05r6QYLkA2YOgvBj1hLFetsfRphy3ZPyIreWinGMHwQ2/Lv3Rm+SGc5B/VsORNZSz0zanyxJ
	de9xfng==
X-Google-Smtp-Source: AGHT+IE9aCBOMW8jOB8EK9bPb1ZC5O8NIYvfw46IhJ0zE1a/ZNZp97aFpovU0yXogxp864rkRJ3vng==
X-Received: by 2002:a05:6a00:4f8b:b0:746:cc71:cc0d with SMTP id d2e1a72fcca58-74827ff5446mr8425921b3a.12.1749284953096;
        Sat, 07 Jun 2025 01:29:13 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c66:bf5b:2e56:6e66:c9ef:ed1b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b083908sm2332354b3a.76.2025.06.07.01.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 01:29:12 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	kees@kernel.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] binfmt_elf: use check_mul_overflow() for size calc
Date: Sat,  7 Jun 2025 13:58:44 +0530
Message-ID: <20250607082844.8779-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use check_mul_overflow() to safely compute the total size of ELF program
headers instead of relying on direct multiplication.

Directly multiplying sizeof(struct elf_phdr) with e_phnum risks integer
overflow, especially on 32-bit systems or with malformed ELF binaries
crafted to trigger wrap-around. If an overflow occurs, kmalloc() could
allocate insufficient memory, potentially leading to out-of-bound
accesses, memory corruption or security vulnerabilities.

Using check_mul_overflow() ensures the multiplication is performed
safely and detects overflows before memory allocation. This change makes
the function more robust when handling untrusted or corrupted binaries.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
Link: https://github.com/KSPP/linux/issues/92
---
 fs/binfmt_elf.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index a43363d593e5..774e705798b8 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -518,7 +518,10 @@ static struct elf_phdr *load_elf_phdrs(const struct elfhdr *elf_ex,
 
 	/* Sanity check the number of program headers... */
 	/* ...and their total size. */
-	size = sizeof(struct elf_phdr) * elf_ex->e_phnum;
+	
+	if (check_mul_overflow(sizeof(struct elf_phdr), elf_ex->e_phnum, &size))
+		goto out;
+
 	if (size == 0 || size > 65536 || size > ELF_MIN_ALIGN)
 		goto out;
 
-- 
2.49.0

