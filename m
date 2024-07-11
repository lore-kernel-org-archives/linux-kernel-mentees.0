Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAEF179B2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jul 2024 03:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720669373; cv=none; b=LWVM6hVB5JS4mdJhuzMPQNTdS/2d8G8Ug/VQfz8tyeDxenzurshDhOni025LYyPkBfBztupQTTBzpVL9Z+iw+MsHRmqAmYdEc3PpltkwSQ9FuwCryWJSdL6lHSJmXpzHpxQgO5QADhLBPc52i93ApUH6ibjgzUGjLGu6qKa3cSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720669373; c=relaxed/simple;
	bh=lSaGeQnHnNNoOyHZNVSNPYOXeoUh9742+oAvgeRslyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qgk69VkVIdXt4Lf6GCyqmYnhoITguGdq6PjuaydPesOkr2ni9hIlvHx1J8JOJOsRvUu2G/TkZ5Cd/fB7pji4R1DaCmUn0zUog5iDipPiE+5Y8LP4RYcI4l29njNMUq8XM4+UzZTfF3n9Wj4jsL2StsZYME9+qZ2qW5NNFXVK2Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aebdi/K8; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aebdi/K8"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37FE283F1A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jul 2024 03:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aPFwNeqVjfog for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Jul 2024 03:42:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=peili.dev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EC0BA83F16
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC0BA83F16
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aebdi/K8
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EC0BA83F16
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jul 2024 03:42:50 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-655fa53c64cso4376717b3.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 10 Jul 2024 20:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720669369; x=1721274169; darn=lists.linuxfoundation.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hI7IGZW8LkC7mU+jbdeJAOVeuDNzhFNvGgcXqutnwBg=;
        b=aebdi/K8nFIJsXdLJ3ID3IMDkUopvpRGOmjCGrUQQZwVJjvV2o1T8R+VqC8qmlKNb+
         Zyn75xByGQ4rAPjzZJJhziU0OzZ6bQrsXp2a0D9rrhw2gHjqXcLvyBVCAbXQtAAke+cH
         2h5jgaXB+6fo9wv0IXnU1h+qLRbxcziFGdJbcl4YLCeGubqJnurfkVNXYSfEKt1SXF8D
         Cv7o8nj9xA9KRFuahXyIQaSzKaGN1Lw+ejpBWNDV2a12yO5yyDDMOgickXuPcKTaEoR8
         k1h54hYf3EfwW5WBY3ekYLqhcU/lBF7ZaOB7WFUBscKrX7+Q1LuUm254wmQcDGbro2j7
         0BfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720669369; x=1721274169;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hI7IGZW8LkC7mU+jbdeJAOVeuDNzhFNvGgcXqutnwBg=;
        b=S/J3T7xipd8ltgdci8p2vknZ/Z1yN/Mc6hSdognp3okFP1XgRfKUF0zW1hxR9R0fha
         HLvip+FF6eQNwXLm4Nnns+MYd3gXrU6vGgS8OLNjfSLYu7EDrU712GggZazrgPTj//Ja
         Z58eRQ2P0UsS+sv9P6PBoqc8d0haucIG0rKgWzFIA96gdRikHwb9sLk6ZG2/lba72jcK
         Ba0HdaPU5o06d0zLYDlxCtwthfliCyVP9DWi3qOTwQsc4ygakvtMXyC/vhQiKccmWEu9
         mHrUsRHenAZnjr0ywWOLm+9RfRE7yYNZUqXfjvmK+scTylT1WYrdUsclpiKK3SiEMO9f
         /Qng==
X-Forwarded-Encrypted: i=1; AJvYcCXqMyq1xfDI9HpEe2qI+NJPB4f/HG7FP6lJ+qza/EEtVO1CzuPIAHJUP397fx19/xryoTBTFNXzagkmLnfMj0XxiXnzGsOyLXGifiaElS+1Is4aSICDMg51PFF4zl8W
X-Gm-Message-State: AOJu0YynML34OC0j0qkspfTr0TwIGLCYj+qNLZuAtRk/iTMM7/tMxq6x
	xvUb4yz+YqxT6IA6fk2/lB4b2oWbsUgIGXPer/4+Me0VvmRMmAh6
X-Google-Smtp-Source: AGHT+IEUh8omZx36NQsQXUtt8YolVr4+mlRQIc2219cs3Las/AYw0NAiZlwWSwvpMLSC0hk+vwziMA==
X-Received: by 2002:a81:928c:0:b0:651:a00f:6961 with SMTP id 00721157ae682-658ef05538bmr79181067b3.22.1720669369568;
        Wed, 10 Jul 2024 20:42:49 -0700 (PDT)
Received: from [127.0.1.1] (107-197-105-120.lightspeed.sntcca.sbcglobal.net. [107.197.105.120])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e64ecfa0sm9624677b3.84.2024.07.10.20.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 20:42:49 -0700 (PDT)
From: Pei Li <peili.dev@gmail.com>
Date: Wed, 10 Jul 2024 20:42:47 -0700
Subject: [PATCH] btrfs: Fix slab-use-after-free Read in add_ra_bio_pages
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-bug11-v1-1-aa02297fbbc9@gmail.com>
X-B4-Tracking: v=1; b=H4sIALZUj2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDc0MD3aTSdEND3USLxGRDi8S0JHMjEyWg2oKi1LTMCrA50bG1tQDMZei
 uVwAAAA==
To: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
 David Sterba <dsterba@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, syzkaller-bugs@googlegroups.com, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 syzbot+853d80cba98ce1157ae6@syzkaller.appspotmail.com, 
 Pei Li <peili.dev@gmail.com>
X-Mailer: b4 0.15-dev-13183
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720669368; l=2430;
 i=peili.dev@gmail.com; s=20240625; h=from:subject:message-id;
 bh=lSaGeQnHnNNoOyHZNVSNPYOXeoUh9742+oAvgeRslyE=;
 b=Xf2utb/BH7ExAT1vPQEXuKA2y7e7hGHcB3HvBcXVZsC/aR4IeRhX2Rotu0LurmKzDfTV+caEU
 kGY4NPDu1LgC1RwsuwcCddt/24zWwCOBXCcEoq9LjiYX8k6wpV5Qs2z
X-Developer-Key: i=peili.dev@gmail.com; a=ed25519;
 pk=I6GWb2uGzELGH5iqJTSK9VwaErhEZ2z2abryRD6a+4Q=

We are accessing the start and len field in em after it is free'd.

This patch stores the values that we are going to access from em before
it was free'd so we won't access free'd memory.

Reported-by: syzbot+853d80cba98ce1157ae6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=853d80cba98ce1157ae6
Signed-off-by: Pei Li <peili.dev@gmail.com>
---
Syzbot reported the following error:
BUG: KASAN: slab-use-after-free in add_ra_bio_pages.constprop.0.isra.0+0xf03/0xfb0 fs/btrfs/compression.c:529

This is because we are reading the values from em right after freeing it
before through free_extent_map(em).

This patch stores the values that we are going to access from em before
it was free'd so we won't access free'd memory.
---
 fs/btrfs/compression.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/btrfs/compression.c b/fs/btrfs/compression.c
index 6441e47d8a5e..42b528aee63b 100644
--- a/fs/btrfs/compression.c
+++ b/fs/btrfs/compression.c
@@ -449,6 +449,7 @@ static noinline int add_ra_bio_pages(struct inode *inode,
 		u64 page_end;
 		u64 pg_index = cur >> PAGE_SHIFT;
 		u32 add_size;
+		u64 start = 0, len = 0;
 
 		if (pg_index > end_index)
 			break;
@@ -500,12 +501,17 @@ static noinline int add_ra_bio_pages(struct inode *inode,
 		em = lookup_extent_mapping(em_tree, cur, page_end + 1 - cur);
 		read_unlock(&em_tree->lock);
 
+		if (em) {
+			start = em->start;
+			len = em->len;
+		}
+
 		/*
 		 * At this point, we have a locked page in the page cache for
 		 * these bytes in the file.  But, we have to make sure they map
 		 * to this compressed extent on disk.
 		 */
-		if (!em || cur < em->start ||
+		if (!em || cur < start ||
 		    (cur + fs_info->sectorsize > extent_map_end(em)) ||
 		    (em->block_start >> SECTOR_SHIFT) != orig_bio->bi_iter.bi_sector) {
 			free_extent_map(em);
@@ -526,7 +532,7 @@ static noinline int add_ra_bio_pages(struct inode *inode,
 			}
 		}
 
-		add_size = min(em->start + em->len, page_end + 1) - cur;
+		add_size = min(start + len, page_end + 1) - cur;
 		ret = bio_add_page(orig_bio, page, add_size, offset_in_page(cur));
 		if (ret != add_size) {
 			unlock_extent(tree, cur, page_end, NULL);

---
base-commit: 563a50672d8a86ec4b114a4a2f44d6e7ff855f5b
change-id: 20240710-bug11-a8ac18afb724

Best regards,
-- 
Pei Li <peili.dev@gmail.com>

