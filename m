Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECDC34D3B3
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  8 Nov 2025 13:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762610337; cv=none; b=HtkChLetEeVa1JOmhW7Qyn8/DZPsWBbRvdjf3GRrNcQuCRavbvE8gXnkEdw70p/jwtwsJ7smTJrjuuVwbvB0Jsdxzo2o27ednc0yLd07OcgUnvcP1W6ZZSini1pfimpYFh7TXS3a0MFujxPToI9Dtw8OEp/ALnrFcKVpNsJqZ0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762610337; c=relaxed/simple;
	bh=R9U9FFPYFfs1lf4z9IJfnV89cTwqAR88nq9i7ZjM2ao=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X4e/LZFfx0Ii/JhYINoCK/YnEufbXmZoVI8XR2DRcwmHcd8LSjoNZrhR00t3AnZOH9PjC3WPRcCZy87Z3Uwov2HPee9XF7Y8eXGuYn1MDibfRc5jfEyfgyqaZRuYsxOYSQe9vSmsTtOp+wazpYpCWBuqVBuRpTajx6W1pHxmvrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=Aira+OWl; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="Aira+OWl"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7ade456b6abso1385328b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 08 Nov 2025 05:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1762610334; x=1763215134; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c6n3EPsz961nven+j6SJxgAVgFz9niflHZuv3YbeEgs=;
        b=Aira+OWl4zEqRxatAWCP9D2Z3WRK9M1VZIkYYpUcpjm+2bSO9zef1oGtEw/HLuKLJr
         w098Kvrg+s50F60E18AESErIez/1GoTEDL7MCSzJ4ifkveCjAMSPYdO/U1psf9pGZnF6
         qp/lQR+lnhhDIoskoNdldc7vIm5ywlTODsue8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762610334; x=1763215134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6n3EPsz961nven+j6SJxgAVgFz9niflHZuv3YbeEgs=;
        b=awH8vvUOozEAQTFyw1aOssa+wdIUxtqBv8BxrlGvxnuOI49k0ahPBwyPt1TvPemFh2
         x17GJ8aXooZcqHrbwCf/kpmJUjkIVX39fZ2VghrLErJZKBJuhD/NcstBoUtA0oRFkvsw
         qOKFFEDAeX+j8U4YildFreIPoAPM1Zc+TBVAt+Mw8uc/v1nj039Y6y6aYEoxMoATjQ7D
         j1wFEQO5JGz10XcFl0nvhZgN+raCGqZnsVTjgNfXIYniqrExQMnfpnQPkZbf9ybUGzKQ
         lgDeOQN+eI64D84fMUX6kUOxOLCJ1x3oT7OTOKhJhAxLw5PBmaGHMSFAS7fttFcDltqa
         gpaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrp1zI6hWgp3jLUTS/GaeXyN36EX6bQX+QWwTLLI1fAulqQgAopdNQj73KAL/zk3/zF0iCyBVRl4G7qP4zHeWIAOlvfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6acIbKEpg6kmQ8+j7ZrXcZVGmA1SK4mDdQxz8TFLHGVxJmHKl
	KvfXB/9J9h3qzntoOOXNcMx2lvQx4wnfWe+XmTBp1AsX/13O/nDoJzhKPJwWcChukxU=
X-Gm-Gg: ASbGncuujJWdx1g+vGG+PPA/TViUANao4gG/E8qqh2snTDtgpWRWLO1pAgjQTb1d5Zy
	k8NKEJjIR4uA83FB005K1H2aqCufhZ+XGmpbEBmrGcSe2Lc966BpFf6XUNvl3qyv+k9AbWxho4O
	sh2QNGO7LelO7twxpFpNp8b2lSVEYNr4WR1X55ZzVd1kVgJrFfTgZ8EARe+DrbUie/e2GWWpAye
	KfWfa3hVE2LNdQrntATNWlhpDDzdoi8oW7FHKDtb94+n3Q3FvllQp/0mTFVfIHhfs5P/R/bu99o
	/TnwCj8swg+g3fiT+GWhU5ei/b3/qwwFwkx7Sp536jpWGPeQNXZzJO8sO8VVU5z5qlQDoAEnRwV
	RRXBMnNH8DrZ1sTDpbewIRQ4l8dIoPoAiIdWwVpfEgB+VIL5SGHpkkUJUTFPaw5HwXqlowigvrx
	RXpivZSgMaV4N1C2CMmp0wsyRjxLN4iXSah4cRUxNsgVN9
X-Google-Smtp-Source: AGHT+IFQqVguGIqedsjEz0k0Lw5GFUnn9lv1d5S1ooXU8a4FS9klL3ycJRWkb/ndyRRz6jrg5EhccQ==
X-Received: by 2002:a05:6a21:3391:b0:2ea:41f1:d54a with SMTP id adf61e73a8af0-353a3d61343mr3226851637.55.1762610334543;
        Sat, 08 Nov 2025 05:58:54 -0800 (PST)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx.. ([2405:201:31:d016:940a:b59:9e93:d45a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f8c83d52sm7985853a12.3.2025.11.08.05.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 05:58:54 -0800 (PST)
From: ssrane_b23@ee.vjti.ac.in
X-Google-Original-From: ssranevjti@gmail.com
To: shaggy@kernel.org
Cc: jfs-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	dsterba@suse.com,
	david@redhat.com,
	shivankg@amd.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Shaurya Rane <ssrane_b23@ee.vjti.ac.in>,
	syzbot+e87be72c9a6fe69996f5@syzkaller.appspotmail.com
Subject: [PATCH] jfs: Initialize synclist in metapage allocation
Date: Sat,  8 Nov 2025 19:28:41 +0530
Message-Id: <20251108135841.42281-1-ssranevjti@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>

The synclist field in struct metapage was not being initialized during
allocation in alloc_metapage(), leading to list corruption when the
metapage is later added to a transaction's sync list.

When diUpdatePMap() calls list_add(&mp->synclist, &tblk->synclist), if
the synclist field contains stale data from a previous allocation (such
as LIST_POISON values from a freed list node), the list debugging code
detects the corruption and triggers a stack segment fault.

This issue is intermittent because it only manifests when recycled
memory happens to contain poison values in the synclist field. The bug
was discovered by syzbot, which creates specific filesystem patterns
that reliably trigger this uninitialized memory usage.

Initialize the synclist field with INIT_LIST_HEAD() in alloc_metapage()
to ensure it's in a valid state before being used in list operations.
This is consistent with how the wait queue is initialized in the same
function.

Reported-by: syzbot+e87be72c9a6fe69996f5@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e87be72c9a6fe69996f5
Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>

---
Tested:
 - Tested locally with syzbot reproducer, no errors observed

 fs/jfs/jfs_metapage.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
index 871cf4fb3636..77c512a0a42b 100644
--- a/fs/jfs/jfs_metapage.c
+++ b/fs/jfs/jfs_metapage.c
@@ -269,6 +269,7 @@ static inline struct metapage *alloc_metapage(gfp_t gfp_mask)
 		mp->data = NULL;
 		mp->clsn = 0;
 		mp->log = NULL;
+		INIT_LIST_HEAD(&mp->synclist);
 		init_waitqueue_head(&mp->wait);
 	}
 	return mp;
-- 
2.34.1

