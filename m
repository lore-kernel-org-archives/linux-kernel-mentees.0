Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40AA2FDC41
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  1 Dec 2025 09:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764581103; cv=none; b=oC/7n1pW0s/cdWxX+7C4OqokeT3azkgTRjdplodPuUoPB24212ee/G/FaWK26gmMa55zgCbth6yfjFJx7jwhjtdOgL55syiM0w2JXGqRDxtniLPMxf7F3hexvZ700G4iZ6xwc34AduiyYhxxHqZLhqPgH3K3wziXxrAxJ2WPdHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764581103; c=relaxed/simple;
	bh=d9GBTfOrFJjQNQxndzxCPwaJdkYd9QaUiqFnCs8pM8Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LbI8xUFl+f5agF7IaItBL+HeM7uEwmxJjEEN6TLh4+JH+FwWQh66DfbuubAhom69HNSMt4yvtkF2ur1v4gly+Sq5Lp7r9eyGIXZnHzIW18xsp1bD7H6XNkUzQ+B2rga/FhYgTOJ9nNR3X5svHkRbY0T8RF6Z848M1MhbL9tgIkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSbrQsKc; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSbrQsKc"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-297e982506fso51725325ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 01 Dec 2025 01:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764581101; x=1765185901; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qERR8P+/o4ObMaf4NL7eL/6PohQaFQTnCKkZHGpKlnM=;
        b=SSbrQsKcnzfeXYiC2q7bhPJNQgQCcRjBUIJVur0wRDdGVFMcUXo/Ms5Dt10+0sr4iu
         wAj3q/u71c1ALJVD0nKKmOVlJP3tgEXAsCiUOoMP+NkqYOy9xpNWvGvF5VOn+8Lzc+e0
         KXoqx7uunP6GG2dEz61pTEbILX2Bkw4/PEhgjncYSS0a7f49c9w2+9EaZet9cFlU+AyP
         Jpp72Anv30e1UYHVv1zCyHCq52w/fFf0JwYMgD2I45ejzywsxzQIhnOr9DcWvhpttGeZ
         Ly0yqbBuM34TnbQ9cdQw+tJ+nJgmnjTVmURmLqxhMJB+gTC3gHwEyp/NBP2WiUx3H9tL
         A+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764581101; x=1765185901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qERR8P+/o4ObMaf4NL7eL/6PohQaFQTnCKkZHGpKlnM=;
        b=B62+snHzgAqUReLKSodaCJrVOdqmQOq6hqbrCs2lTuCTW3c2PjMCRZSgEqJB6UkpeL
         oKTDOL0evQvNNHWUB5TCUTHdpbFmhUzQ0a3ikSe4aKMTPC+6UOZ4kd+HuNCBD3Icsgz9
         NgpzEsfni7wXbIbzdMbcE4qXZfCyFqAs5SDMnkNpqraRW15y5Tr17jPM5YNEqzUcs0CT
         FKsOZPKWW8g0Gh+K0oPSY/4iGRCz0N9XCDaEdbG1r8gfjtbz1yZu03f0z20XNI7AXIIr
         hvOR+9VRIPkcIU/knQ84jpGPrKUYCJg3q8vW6cTfZXMQl5pgWdd+5an79Gr4r7cTPCSi
         KDug==
X-Forwarded-Encrypted: i=1; AJvYcCU7bYcDuGeMNw0HnTYfuD/WAQX/HD6TwrCN1XUbgKQGYnPGqGoCEc33Jvl7qKY0p2on+bS9DSGqq8xpll5S0PPkbXEJyg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzW1O0S/IIhjqjzwg1Y9DEm8OnOQ14JyyLQ/18YmEHn7NQdC/la
	KEQEOldeMFiBXpw/4aDehFH0Yl//QKbNu2yBQ11RSVshz8Ny55OaEx9+
X-Gm-Gg: ASbGnctfjZLtlAEEplwdXPo0CcC6KsYLOjkdZVzALd/1y40UguJev8nfV4tVxaP6Rig
	xsU+I0ag6HChdPczpwe+teFPMip6g9+88TDn2MMr76gwd9j15mTXZBxAsg4fnAojev04P2cqFKm
	TA83Y7lj9zCNAL18ElQ2VW6DezP4hj3kxg/9hOsP6nzmu6svqJAurVdX/ofxCtWEOuJfdmMtFmg
	yBsgB3NlHMyzT+HEMkGYcPlpNXfNWSEPzmOaeLmkd9DVwIxtHrCarwQuDiV2MpYhkM4Ei1iy4Nt
	eadPUopcZWiiqx/bLN+MGd0KC+008jKMHLSaJ72dN1XoHz1Y3S6u/UtmKi1WzYpC8Qp+Ti8AoH7
	vtbZvRx1IQKlGPZFi460Ti5UteSFbcaq1NUpyBKZVV+NJBGdW7K+SohFepOvG2bCER6BK+wHO5A
	N5CJfIreui59mdpoOddSfeN0DMCEc=
X-Google-Smtp-Source: AGHT+IFXnf0d/pxuEm+gHoXJiVlLVuf56GuwzRCPB2DmvUZXgNgKDE4fu8biWpWXfSyNlaPjS17cGw==
X-Received: by 2002:a17:903:2c10:b0:298:42ba:c437 with SMTP id d9443c01a7336-29b6bf75998mr389621755ad.50.1764581100937;
        Mon, 01 Dec 2025 01:25:00 -0800 (PST)
Received: from localhost.localdomain ([114.79.136.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce441e59sm118620605ad.33.2025.12.01.01.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 01:25:00 -0800 (PST)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com
Cc: ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>,
	syzbot+96d38c6e1655c1420a72@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2] ocfs2: fix kernel BUG in ocfs2_find_victim_chain
Date: Mon,  1 Dec 2025 14:54:49 +0530
Message-Id: <20251201092450.84991-1-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported a kernel BUG in ocfs2_find_victim_chain() because the
`cl_next_free_rec` field of the allocation chain list is 0, triggring the
BUG_ON(!cl->cl_next_free_rec) condition and panicking the kernel.

To fix this, `cl_next_free_rec` is checked inside the caller of
ocfs2_find_victim_chain() i.e. ocfs2_claim_suballoc_bits() and if it is
equal to 0, ocfs2_error() is called, to log the corruption and force the
filesystem into read-only mode, to prevent further damage.

Reported-by: syzbot+96d38c6e1655c1420a72@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=96d38c6e1655c1420a72
Tested-by: syzbot+96d38c6e1655c1420a72@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
v1->v2:
 - Remove extra line before the if statement in patch
 - Add upper limit check for cl->cl_next_free_rec in the if condition

 fs/ocfs2/suballoc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/ocfs2/suballoc.c b/fs/ocfs2/suballoc.c
index 6ac4dcd54588..1257c39c2c11 100644
--- a/fs/ocfs2/suballoc.c
+++ b/fs/ocfs2/suballoc.c
@@ -1992,6 +1992,13 @@ static int ocfs2_claim_suballoc_bits(struct ocfs2_alloc_context *ac,
 	}
 
 	cl = (struct ocfs2_chain_list *) &fe->id2.i_chain;
+	if (!le16_to_cpu(cl->cl_next_free_rec) ||
+	    le16_to_cpu(cl->cl_next_free_rec) > le16_to_cpu(cl->cl_count)) {
+		status = ocfs2_error(ac->ac_inode->i_sb,
+					"Chain allocator dinode %llu has 0 chains\n",
+					(unsigned long long)le64_to_cpu(fe->i_blkno));
+		goto bail;
+	}
 
 	victim = ocfs2_find_victim_chain(cl);
 	ac->ac_chain = victim;

base-commit: 939f15e640f193616691d3bcde0089760e75b0d3
-- 
2.34.1

