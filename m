Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A557D3009DA
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 20 Dec 2025 09:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766224183; cv=none; b=q+5mAkFek7mqClWe5tGrtbrTN/Xp7edWO806IZLMRsGVEcmc/ugCkf/IIQ0LGMcACTdZu5Km/9RLnL0Hjx1CsX3gCex4ctvg+3NikInVs89MD/mXz6MYpJO6uiuiszYzzaTlUui2zNaanNr5xkRqHLcRzOD1WHJZ1JQK+jShdvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766224183; c=relaxed/simple;
	bh=8vPBBIVGC/F5q2+wWMM4e4vlGTNbzIZZ4fuMbWYwOnI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a+s0uUtec+WmYzHJUHelTapI/iTJ7YjEQxHGB6BQCshaE599OVDSwkbCyEhVrxR7pfxGEY5DIRJo0J3FdJ03Z712PPhXrkpsPeZcIDaKge0GBteDwCme6on5WMzGOu9ct7Hca71ldZApWm6XAFVxawNlgWXfSqbTn0lT7N7F+80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OamRB6xJ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OamRB6xJ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a081c163b0so24380705ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 20 Dec 2025 01:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766224181; x=1766828981; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j7IJxF6HMphYNWv4fklqBcjfxDWSKokfkAddGStMOYE=;
        b=OamRB6xJx8aDqyt0dlFnqbCSqfgaByjZD110wjFqKp5x+VDqdMb0le/lAaWlqVsHM/
         cIzGnNn9PROSaY1MCjthhlcEFfMBU/AyrzPTQ8atIAXX2hDnmkEH6GB1D7TIsL4njSLR
         YkQkNS9wdsnjoCdFNFxSItzSMe5NfjwjLPNJGicE5gX+J1i4y8s9sJQ9QyapJDmcgV3V
         57cQPsgXc9lLdNWlTd4r/GUwV1icTqSF0NU49VtDVluifiFLezYvQueTGVUTmobbvDbP
         PFm4I4nXPFUZ4r2RJJleKa4wrs9Ers9fpplectDEwlG7zNKUnuItRMZt1huBpL6oVLWI
         0GUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766224181; x=1766828981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7IJxF6HMphYNWv4fklqBcjfxDWSKokfkAddGStMOYE=;
        b=dasVo4LPNdXhGVqUq1wh6go7UJpCzZqjYXn9XafSpe0X9lwyuf7Jdg7zmTxLfLly/v
         1Yzxxic/v6d7dLyi2uuwq6BYSepLvSOsRHLh8jGKDEtr00o8gHP7zXPMhaNQwZ19eFrY
         nsLf4injs0UXb9/RTSjio6N2/xwTy/tb65HR54cqfsBq+3HH8AXlq1OY1PEr513djJh0
         lUBftXDYFjH76rWor7iMOgzuDo5H+nj1l2IY1VEqSiA/HpVbLBW9sM+CXJ4YIek3H2ai
         xDxHJSIKUeJ2GZhWoW9ukUODMv6cyS7NYEQa0wcFqun87Qi1TRKMdNij76Smj90LzXCF
         y81A==
X-Forwarded-Encrypted: i=1; AJvYcCWGLS4IwZx9DPkvBcv/Rso2wkVpV/QLW9ezAHaIL0AyroUMtcXEbBxl8rpPWYkkW5DRZmotTI22splKr7kHxmS0OLkK3w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8+HbppiEtU3oIuGgOyES7BhlcgfwFvNr25axYixPBZ0eBTk86
	SwyKvp0V8PDllBUN5rKq7x+73trOtUy3/zHJ+Yen8VKPJ43zz5VvD2av
X-Gm-Gg: AY/fxX7cL8HAMcMpP8jFl47whYGVoagA5WGZeZQdkNR1wJfQZv8oYwx3oyFIFE8O/g6
	P7Sfr1SmzcSRmBj8D2roUz7vaAjbqecIHb616cnnVA9hdChYyq/yBkyqdv/3rWJTy0aC/tC8kLp
	oQ0kPqCK1wmU2wxb28B/+eaemlXbXCfzQ+SkI3e4D21leJfU5dV5fbR2+OhG6Mq1fq7R48CDtfA
	yLSDadbW7jnxtlU20b5ZOzJz9XfrcA6XRb8usLupTVhjfdFeGKRqe54WIGLeJ/Y6InFvJWHfIMn
	o01baDx6YJN9Ea2Aqv6ISmmLJCb0GKiEMVBuGeGattJzMqIHsXaulRwAEc87Us8ubS1Z4CI/kYh
	1cz0j0CsfxonRAuBFj7fic6wzBEIUXoY4MKaPOR6QfY8ge9eQvRs+eeJJB6JeMKN9zIEMJnMlq4
	QQB/KGfJ6D7t5my7n9VkoouoNCnTx/
X-Google-Smtp-Source: AGHT+IHMytYlzWCq2SFmQytqElgOtJeFb21rSHQ0neO72vPgyAQ4/pAf5fT0MOb+oYKbYoeapmzQNg==
X-Received: by 2002:a17:903:38c3:b0:269:82a5:f9e9 with SMTP id d9443c01a7336-2a2f2836764mr57108345ad.29.1766224180679;
        Sat, 20 Dec 2025 01:49:40 -0800 (PST)
Received: from localhost.localdomain ([111.125.231.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66bd3sm45107635ad.1.2025.12.20.01.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 01:49:40 -0800 (PST)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com
Cc: heming.zhao@suse.com,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>,
	syzbot+af14efe17dfa46173239@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] ocfs2: Add check for total number of chains in chain list
Date: Sat, 20 Dec 2025 15:19:28 +0530
Message-Id: <20251220094928.134849-1-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions ocfs2_reserve_suballoc_bits(), ocfs2_block_group_alloc(),
ocfs2_block_group_alloc_contig() and ocfs2_find_smallest_chain() trust
the on-disk values related to the allocation chain. However, KASAN bug
was triggered in these functions, and the kernel panicked when accessing
redzoned memory. This occurred due to the corrupted value of `cl_count`
field of `struct ocfs2_chain_list`. Upon analysis, the value of `cl_count`
was observed to be overwhemingly large, due to which the code accessed
redzoned memory.

The fix introduces an if statement which validates value of `cl_count`
(both lower and upper bounds). Lower bound check ensures the value of
`cl_count` is not zero and upper bound check ensures that the value of
`cl_count` is in the range such that it has a value less than the total
size of struct ocfs2_chain_list and maximum number of chains that can be
present, so as to fill one block.

Reported-by: syzbot+af14efe17dfa46173239@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=af14efe17dfa46173239
Tested-by: syzbot+af14efe17dfa46173239@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 fs/ocfs2/suballoc.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/fs/ocfs2/suballoc.c b/fs/ocfs2/suballoc.c
index f7b483f0de2a..7ea63e9cc4f8 100644
--- a/fs/ocfs2/suballoc.c
+++ b/fs/ocfs2/suballoc.c
@@ -671,6 +671,21 @@ static int ocfs2_block_group_alloc(struct ocfs2_super *osb,
 	BUG_ON(ocfs2_is_cluster_bitmap(alloc_inode));
 
 	cl = &fe->id2.i_chain;
+	unsigned int block_size = osb->sb->s_blocksize;
+	unsigned int max_cl_count =
+	(block_size - offsetof(struct ocfs2_chain_list, cl_recs)) /
+	sizeof(struct ocfs2_chain_rec);
+
+	if (!le16_to_cpu(cl->cl_count) ||
+	    le16_to_cpu(cl->cl_count) > max_cl_count) {
+		ocfs2_error(osb->sb,
+			    "Invalid chain list: cl_count %u "
+			    "exceeds max %u",
+			    le16_to_cpu(cl->cl_count), max_cl_count);
+		status = -EIO;
+		goto bail;
+	}
+
 	status = ocfs2_reserve_clusters_with_limit(osb,
 						   le16_to_cpu(cl->cl_cpg),
 						   max_block, flags, &ac);

base-commit: 36c254515dc6592c44db77b84908358979dd6b50
-- 
2.34.1

