Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8A519F424
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 Aug 2025 18:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755109494; cv=none; b=kd17LfVRx6dbq+jd64cfsvDLu2qfZP3AWFLLlK7z37EQNg9AAKIUHjrOeA9srabyQd2gjr7SYLdbSQ55w4mbdEvZg50xMzIyamhdh2xannELKJ/PANRu1wd6R/oEFuLTpvSwrbs3GqhTgULUsnhkuNEIA0bShmGf/V3+TCHk8Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755109494; c=relaxed/simple;
	bh=rMZI/++Sl83oEviYROVHczJ3NA9sNaqcT1YdK0dP1Q0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bBrMvDmdIrucwHdwIZTglojEZm+QxaycWgGQbnl+qrtb1/IwhRmTeAahlC/tWmnKWD/udgjOBKtx2p3uXhmLTVFF6bXYPzQ2BKZAe83vbkgcYzLGZVxxxa6FAjMe8TrqYeNFHmsx0M4vwVNxjS9ql0CbMzmmiWciFEf41Bmjxz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HptZKcPH; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HptZKcPH"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-76e2e8bb2e5so287518b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 Aug 2025 11:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755109493; x=1755714293; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lf4c4+X3SHCf0c7CaWo3n9zdv/g/JaUx8MF3KOPrPUg=;
        b=HptZKcPHrhkioOkY1lGjTDLm7249MRtl3tbntncV12XhXvjsewaVwBEq7FGcl9t1g4
         hrnPd3MK2G7SJI9Suuv3ToQEghngBhqRUzDt49fvmTxW6d9Kzr3oSyFpf33lGRjRvOcx
         GCDwxBHqaMUrtjsQeN2RNwPtsQNn6S3gRFGzXpRZGbeF1NE1UKxSodpfFab96dwwzp3V
         E1W4Bj79BI0CBVHVTnM3S6D/KJ09DqwDNK8PJFs3eosEYAIKcp2LZ+P4rWh0EUwRcKOL
         3o1bhXk+ZXa2qe4YP2odvl9r7iZwGoNyGz5ycVZ4ulF0+W+KIYo7LYrzHuC5ezvjfd2G
         Lbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755109493; x=1755714293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lf4c4+X3SHCf0c7CaWo3n9zdv/g/JaUx8MF3KOPrPUg=;
        b=XcPQ9jYqaLzlxsvBrhGSl7Vkon0zGQDqPubsS0S+q3479GGfJ31Mw7ZBEIEBXDUAYW
         sx16aDysKG3qzjicHAzDc5G5+naHnkHC9tHHZ59lHo9xBM23zkWncxEMWhNwiNJUP7QB
         oguXoSWc25NdI3l1TNDPAScfj9vqETCJNQX7rASkfHEhSXaVTCpc/esVni+CLrEJu8fu
         c9QfcH38VnslZ26Qzg1Bt8B27RExNJQ8RKw0Ao0EZc1/ldHpRk+nPc91wu0vKTvvQeAw
         K4jUzd5RzsxvZN6YG98nJNZUDj9U+ntnYxFZAYRqRX1k8rgWLN8Tlk7UDYXmy8mVxBjI
         kGlg==
X-Forwarded-Encrypted: i=1; AJvYcCWrUb1c9gAF3NOal2NpL8Ng2Ecyqv2VbJVDEMzEHJe9X0NIqoPItqpE8qWChbkMV3mhRDNn3bUpcMWIiNj0bg1uBGmSqA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYivccw3h6Ep+3UO6J+zC5iOivhFghhZSB15pZ+umFknlum0tO
	gB8K/6CyXzCbv3RTsjMpviZGkcg6T/4ElGUTjzpbWA7oZ8IpZ/Y/RJO3bSAPZS13
X-Gm-Gg: ASbGncs9j65vqpE7wky/cqZp9KFK3HeS/b7caxstG4OIJTQyms+tDRdyau723eK3QdM
	hXmLHP8xGGIjPCEbVfzB6Takm+EfyVDg3e8XDaKOUrwfrcOPZZQcqwzIYy8mfEubk5+ffwx3C++
	KGWkhIZ5T6nXKdOjOJxcUYn8No6NjoHiuMYadelKpmMa+LeKFVn2NtXQpitLghY61qd8AD/tWUu
	AbGG79LpyQoFeTu/p8eTgespMMP/x2fu7Wp0xZT2VFZcSlerdHIEs0dyJL9AnFtOIH0TOZlE1/n
	lHR1cRcVc0oXC5bL7gaRAIh23myHtKeETMjGlaoDnJV1onW/aBcbAXIqJ6bccWsoZ/Hv+mnyrO1
	DvRMleiVqkObuHhKjVWmnnxj2fEu/lnP7ifUffyaj
X-Google-Smtp-Source: AGHT+IGFPWxg01RMwiGU0dEwChvK6RJmUSmpiGeA5HRM48y193iq5Ghvtn2vXWFMsWE1r5tKYUst2Q==
X-Received: by 2002:a05:6a20:3ca2:b0:240:11b3:bef3 with SMTP id adf61e73a8af0-240a8b50ffbmr7204349637.38.1755109492421;
        Wed, 13 Aug 2025 11:24:52 -0700 (PDT)
Received: from archlinux ([205.254.163.26])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4263836324sm20670472a12.10.2025.08.13.11.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 11:24:52 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: tytso@mit.edu,
	adilger.kernel@dilger.ca,
	linux-ext4@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH RESEND] fs/ext4: remove unused variable 'de' in ext4_init_new_dir()
Date: Wed, 13 Aug 2025 23:54:40 +0530
Message-ID: <20250813182440.17581-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable 'de' was declared but never used in the ext4_init_new_dir()
function, causing a compiler warning:
variable 'de' set but not used [-Werror=unused-but-set-variable]
Remove the unused declaration to clean up the code and fix the warning.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 fs/ext4/namei.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index d83f91b62317..bb2370829928 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -2965,7 +2965,6 @@ int ext4_init_new_dir(handle_t *handle, struct inode *dir,
 			     struct inode *inode)
 {
 	struct buffer_head *dir_block = NULL;
-	struct ext4_dir_entry_2 *de;
 	ext4_lblk_t block = 0;
 	int err;
 
@@ -2982,7 +2981,6 @@ int ext4_init_new_dir(handle_t *handle, struct inode *dir,
 	dir_block = ext4_append(handle, inode, &block);
 	if (IS_ERR(dir_block))
 		return PTR_ERR(dir_block);
-	de = (struct ext4_dir_entry_2 *)dir_block->b_data;
 	err = ext4_init_dirblock(handle, inode, dir_block, dir->i_ino, NULL, 0);
 	if (err)
 		goto out;
-- 
2.50.1

