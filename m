Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E34B3546E4
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 20 Nov 2025 17:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763659076; cv=none; b=osU8rtWEXKAtc78BctO0RFRZ5GE7bO2URA100JKECZG4dvtVf9FB+KDVui+Z7jPeU7DoLDFIuXEIaGLCWWJ1Dop12Wf0VXPfJ++bjYrwpEWrikfx7mFsC1U6pn33qXU1A7VrERWNXkthxyxWG9vR4WtzMrU4t7jX6ceEPDxR0X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763659076; c=relaxed/simple;
	bh=p3ApoAA1CanQQdozSlHOXOSokHr0N8H00lCqp1aC2iI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=plBa2SZLMlGYhHEqtvGl8K1J4GvzGfeAUoKWkvmyUKHKNjH1+YP0rHhP/ri3WqSoVRsR69mjdh3qNqnUL0m8nEU+hsUuRBmKLKD+RZx7HAzWnqbPtBFwaGhakSi1IL7uN5O62CZ/y3xZd5TzeLqXhQV7I7nObCN4LHbfb4Dd+nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=CXAiqqzH; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="CXAiqqzH"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-295548467c7so13003215ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 20 Nov 2025 09:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1763659072; x=1764263872; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lxUmT50gh4iATr6XFekF1hQSSR5/JtG5gjuDPPL7SIo=;
        b=CXAiqqzHlbMd4dpdGvrQvwuECt9ohneL0bfarO7hiq1inEAjC/8VUfPdQb7aBNknJn
         5BTwC+WOlql0nSgzxEf9MDLtf0iQkQfsQ58TzsCcQ1C/fz3cCpJr/yOoQKU8kVb0St8r
         YvX9BOj3NzsF6OJzd7qGkoQyADCROeEHCi1Dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763659072; x=1764263872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxUmT50gh4iATr6XFekF1hQSSR5/JtG5gjuDPPL7SIo=;
        b=CYNNDmNRpMowIoRcoEPVa8tnLPAF1/zk8X9LBj+l6irYZinWUYTGC8YlAd5FeZcb9a
         fwKp3RJtJyNQf0u5v3zftn4fW4KSnIWQxojjyyURUrOrF0MApjcmjwgBmU9bV20+Dp0o
         kzdeWLVjXZM9Sg6vQjPtTIi3dmKBypy5LV7PbwbuddFQJCfJ9R19x0WUrJBFGGhwvlz5
         PkuLQesNLNZEC+tjQcuyLVxN8/fRV8TU66r7OiTv8+pzRBnAryf21Lr2X3t7b8fCv0fJ
         5dNT+3I6QD6PLVKXdQl5Kx21EjfwXXAZSoD9aF9dzSBbXqjhzbZB3OBn8Yp96r338Tuh
         92TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiBPN5SrCMDpssTNTQVyR+0H7LFWnWaQ7d2eXxslqXsXwQQAY5QIGnSab3yY4Hj7CvMjtK+TRWED/1niwl2zybPFSXfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIdOo0f7Z1cSIjqX4sXAZHrl1HS8MV7DWl0wgozu2/VeCDHlGb
	M8KdxNLPrG29P/LjZ1tVjf887IxrnZQws06ZCrYEt8XihzBDr3F+2Qi7qdmN9YnnGOQ=
X-Gm-Gg: ASbGncvqeAdUTP56DvMi6gS64bDIl3YwlyWyfngUlhU8HI3QM/d8V7OomgLvgYvLkzE
	6rtgYbC+wYuFzzKJh0FRge4ogwN2yY0LPtquy/jzx+08AYv6TYo6kW5bSDooQFrvE+VEFlEyk7I
	rHqTeA+n/+BiU2amEnThZXfWYRXwtQV962kv7Ae2eBzBekbgFzGjFYyd7BsexiHrhwf3TbUYUs1
	WudCf0FNOLaQ74HTWhdMUvABDQ2qmdKvA6bqTWxcjCnMn/LqTq808ZjOC48Wy6vuCcphPk3MWA3
	iAshtRMCT9Wy6M9/R1K0eF/lUVVD2FZufOrA3FUn43ixMHpg9mMTYoTNxQcDE6V6wy9fgNBQ3d9
	u5RTlX78U1D3Tyfvn3RDBi3hqNe5Y9Lt77Vsa1xTk+XZQyR+8HHlCBEalqhKuRotyG1n/eFciXN
	b7R6dzMjUfiwDa4uuKwNHJLUkOwBqyTmp6PEI7lv1y8Ku6dDz9o9gYPdY0
X-Google-Smtp-Source: AGHT+IHCvcH3jSOL7T+a7yDjy7MxfxbirT83K6TJhLThLkL3l4+krsnqHTMe0gk5zEdG6sGJ5ZT/Vg==
X-Received: by 2002:a17:902:f791:b0:298:3545:81e2 with SMTP id d9443c01a7336-29b5ebbf688mr43341815ad.22.1763659072115;
        Thu, 20 Nov 2025 09:17:52 -0800 (PST)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx.. ([2405:201:31:d869:1daf:dd82:99d2:95eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b2700ddsm32223085ad.70.2025.11.20.09.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 09:17:51 -0800 (PST)
From: ssrane_b23@ee.vjti.ac.in
X-Google-Original-From: ssranevjti@gmail.com
To: slava@dubeyko.com,
	glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Shaurya Rane <ssrane_b23@ee.vjti.ac.in>,
	syzbot+905d785c4923bea2c1db@syzkaller.appspotmail.com
Subject: [PATCH] hfsplus: fix uninit-value in hfsplus_cat_build_record
Date: Thu, 20 Nov 2025 22:47:40 +0530
Message-Id: <20251120171740.19537-1-ssranevjti@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>

The root cause is in hfsplus_cat_build_record(), which builds catalog
entries using the union hfsplus_cat_entry. This union contains three
members with significantly different sizes:

  struct hfsplus_cat_folder folder;    (88 bytes)
  struct hfsplus_cat_file file;        (248 bytes)
  struct hfsplus_cat_thread thread;    (520 bytes)

The function was only zeroing the specific member being used (folder or
file), not the entire union. This left significant uninitialized data:

  For folders: 520 - 88  = 432 bytes uninitialized
  For files:   520 - 248 = 272 bytes uninitialized

This uninitialized data was then written to disk via hfs_brec_insert(),
read back through the loop device, and eventually copied to userspace
via filemap_read(), resulting in a leak of kernel stack memory.
Fix this by zeroing the entire union before initializing the specific
member. This ensures no uninitialized bytes remain.

Reported-by: syzbot+905d785c4923bea2c1db@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=905d785c4923bea2c1db
Fixes: 1da177e4c3f4

Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
---
 fs/hfsplus/catalog.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/hfsplus/catalog.c b/fs/hfsplus/catalog.c
index 02c1eee4a4b8..4d42e7139f3b 100644
--- a/fs/hfsplus/catalog.c
+++ b/fs/hfsplus/catalog.c
@@ -111,7 +111,8 @@ static int hfsplus_cat_build_record(hfsplus_cat_entry *entry,
 		struct hfsplus_cat_folder *folder;
 
 		folder = &entry->folder;
-		memset(folder, 0, sizeof(*folder));
+		/* Zero the entire union to avoid leaking uninitialized data */
+		memset(entry, 0, sizeof(*entry));
 		folder->type = cpu_to_be16(HFSPLUS_FOLDER);
 		if (test_bit(HFSPLUS_SB_HFSX, &sbi->flags))
 			folder->flags |= cpu_to_be16(HFSPLUS_HAS_FOLDER_COUNT);
@@ -130,7 +131,8 @@ static int hfsplus_cat_build_record(hfsplus_cat_entry *entry,
 		struct hfsplus_cat_file *file;
 
 		file = &entry->file;
-		memset(file, 0, sizeof(*file));
+		/* Zero the entire union to avoid leaking uninitialized data */
+		memset(entry, 0, sizeof(*entry));
 		file->type = cpu_to_be16(HFSPLUS_FILE);
 		file->flags = cpu_to_be16(HFSPLUS_FILE_THREAD_EXISTS);
 		file->id = cpu_to_be32(cnid);
-- 
2.34.1

