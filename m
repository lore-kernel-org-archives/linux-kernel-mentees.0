Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9817434CFBF
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  5 Nov 2025 21:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762377531; cv=none; b=sle82hWTFzn7FjYSlcjqG2MQnbUufC2FmVKeAocci+P6wulu5MG5luA8gw0RB+FprBBC51bVPhwNpv0jr60EDdrc+OBXw2k+kIT6uK2UvKc/wwOYOr1Rn7JtrTrkwLLGFoRv7xYBglSuyJT/IwbqsmZQKh5hHAMnW6nLxaIXSmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762377531; c=relaxed/simple;
	bh=oPQYRyMF1pypwbrV2bfRFWBdMbkQqKT1Ffj4kqPzSb8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZFE+2HRRaqTDLUo/akITGKlLVxkLIYYZNDuCsRTVhuPFr8X6gA5qarZ7cYNRCpPXxB4wo6jrjt4V17mqstIOA+z/zwzCR8ai8IKBqvxEtEc14XsBiN6amBYuyESQ38n3QTKlRkobT8bj0jTVDEwOjH+9nZCUcVX7tlH+mDoWOOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1TZhgFc; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1TZhgFc"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3e9d633b78so51652966b.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 05 Nov 2025 13:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762377526; x=1762982326; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DF0sydupouCelQ7a8hDVtjvfRn0GwCGA2yXi7RlWEjc=;
        b=d1TZhgFcyo8ico1qOqp5i0BYEuANUKwPnnkP/UhUtJkksMbIo0j1eUaQDXEw8HPuS3
         H1A5LxPRIBpbwl86QIWkjQJVjfFm0uxm75xIePHI2HQc41gP5dgutM+Yamgd435sxggX
         LxNXNWoY3onU2GW/gvN9jg2YRQVvYwdm9iFi1P+Z1G8nkjRx1XUX66P1tGWo+t3ElrJ1
         cUtFSEaNP6FmBWKSuBC+lLR/nLDc5iRD0tELYMIEfOwcT0yHdk/P3yqM7MbQfzxx9qJA
         4GHRs5vfwp7nw4FbYXagNin5ZMLwA+q9Fh29dQMyyYpQ43p759MaomGqcHB7+ORQYTv8
         Y4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762377526; x=1762982326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DF0sydupouCelQ7a8hDVtjvfRn0GwCGA2yXi7RlWEjc=;
        b=C5O6VptTTrbt6HD5VxNld+ZdvnENFE2GOGHwVRZ5MjPTFlICgVAow8q7Ls3fZGR7aQ
         83iyci0lK3YjozLgzke/tisNcQodeUUjCfVR2qT2n85ERSaA5FJSCvnS4jZSPNRqdL5R
         UT8Hmp3ixT+uU/YmT705XTCCzn6nCDJ0lwp3bhBifHUMjvOCPdyXBDvblUBQGTbchBOn
         ekZLu4W2ptZ+VdYfBrvcVozBJxdChm6T4apWRgUX68AJV85mP1hL8JTefTRpJOK1Qexs
         sxHJF+ZaFhOT0uDJAN0t60GcMPa6+9oZdaEjQfCl9yJ6wI96x/dv/8+rBdgoGt9SmvNh
         Q1BQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVXtjPPnyMwEOxOusYw3V6acG/aYtDq1zD3cK21FdEYtU8tydsoQibQBHzf9i5Co7DbBMEewqSgT9tuB7mE0pFeTM8GA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw95s5HSlGVP6sIhfPo7/8/ru0hVqXxvG8BvEbWAnzC/02GJ3QL
	N8rF3hJ7SJsoUwpAUZuWqpFCyvMSJm7+ByRQ2wWae0GlV2Qr5P502CIJ
X-Gm-Gg: ASbGncuihXmHu8oyWPtLD+G9SrTsC2Oq89ommnsG+Bchar99HekZdfOxF29k8aTEev/
	rOT+ZVOarvIM3R2y7kwn6FHbnPKEAfXhiit0VIGI0q2x4tZwmYfwIYrh7GdPYwSfDpxxm3rWzOc
	Ej7TuWXPwgT5TBjbv5UKAnTEUdw65H/d1uda4Rz34MSThGOIc69ygOE9//2L6MGZ3e2qxbDFQ67
	TCRMRATCxyzakz+lhqaUotzzF5K8tn/EaYcrNEZd0W/kVxxK2wn6u0oQ8xoTFSuT3fQLO944mCN
	1ogM1Rbhgy6a1/jMtJATmFc6aFSAPZaOAlN3tnU0vgFt5Axx2IHgM7XlYx8GpGEagXaTyYLTSrf
	qDXlpZq0YBvotYRT3uaMsbo4oHcmN2H6geOYhmcF13Fvcv8RIIXKr/Y1i4ng8bfZdY3Hozphnqo
	nxF5lWmPd2Jx0QYp7bXEYgeSs8PfPInWF+knGVCLPRpCqh2HmKJtuXeeJXwBFAS/REkiniqK9nA
	EHChaWTLv/rAkbZ8/paWMBQG3S9TmA=
X-Google-Smtp-Source: AGHT+IGiz9VN3EwGclfE2mM2roTXLFXItqHPPpfh2E0/oV854mv2wjZ6x4OeB6U7GyRrVN+rgMV2Yg==
X-Received: by 2002:a17:907:2d94:b0:b70:b161:b9a8 with SMTP id a640c23a62f3a-b72892ac5acmr90989366b.2.1762377525586;
        Wed, 05 Nov 2025 13:18:45 -0800 (PST)
Received: from localhost.localdomain (host194.safe-lock.net. [195.20.212.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b728964480esm52226166b.38.2025.11.05.13.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 13:18:44 -0800 (PST)
From: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Bartlomiej Kubik <kubik.bartlomiej@gmail.com>,
	syzbot+332bd4e9d148f11a87dc@syzkaller.appspotmail.com,
	syzbot+0399100e525dd9696764@syzkaller.appspotmail.com
Subject: [PATCH linux-next] fs/ntfs3: Initialize allocated memory before use
Date: Wed,  5 Nov 2025 22:18:08 +0100
Message-Id: <20251105211808.260893-1-kubik.bartlomiej@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KMSAN reports: Multiple uninitialized values detected:

- KMSAN: uninit-value in ntfs_read_hdr (3)
- KMSAN: uninit-value in bcmp (3)

Memory is allocated by __getname(), which is a wrapper for
kmem_cache_alloc(). This memory is used before being properly
cleared. Change kmem_cache_alloc() to kmem_cache_zalloc() to
properly allocate and clear memory before use.

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Fixes: 78ab59fee07f ("fs/ntfs3: Rework file operations")
Tested-by: syzbot+332bd4e9d148f11a87dc@syzkaller.appspotmail.com
Reported-by: syzbot+332bd4e9d148f11a87dc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=332bd4e9d148f11a87dc

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Fixes: 78ab59fee07f ("fs/ntfs3: Rework file operations")
Tested-by: syzbot+0399100e525dd9696764@syzkaller.appspotmail.com
Reported-by: syzbot+0399100e525dd9696764@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0399100e525dd9696764

Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
---
 fs/ntfs3/inode.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index ab61388f819c..13720baf079d 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -1281,7 +1281,7 @@ int ntfs_create_inode(struct mnt_idmap *idmap, struct inode *dir,
 		fa |= FILE_ATTRIBUTE_READONLY;

 	/* Allocate PATH_MAX bytes. */
-	new_de = __getname();
+	new_de = kmem_cache_zalloc(names_cachep, GFP_KERNEL);
 	if (!new_de) {
 		err = -ENOMEM;
 		goto out1;
@@ -1723,10 +1723,9 @@ int ntfs_link_inode(struct inode *inode, struct dentry *dentry)
 	struct NTFS_DE *de;

 	/* Allocate PATH_MAX bytes. */
-	de = __getname();
+	de = kmem_cache_zalloc(names_cachep, GFP_KERNEL);
 	if (!de)
 		return -ENOMEM;
-	memset(de, 0, PATH_MAX);

 	/* Mark rw ntfs as dirty. It will be cleared at umount. */
 	ntfs_set_state(sbi, NTFS_DIRTY_DIRTY);
@@ -1762,7 +1761,7 @@ int ntfs_unlink_inode(struct inode *dir, const struct dentry *dentry)
 		return -EINVAL;

 	/* Allocate PATH_MAX bytes. */
-	de = __getname();
+	de = kmem_cache_zalloc(names_cachep, GFP_KERNEL);
 	if (!de)
 		return -ENOMEM;

--
2.39.5

