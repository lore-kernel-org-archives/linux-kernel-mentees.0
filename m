Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7AC2AEF5
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  8 Nov 2025 14:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762611528; cv=none; b=OU9kOvBfxuY+DDESKqyEvGO5lislWnhkT5SoM1LibIOJlvDdpcHx1xFWphgl+gukNLxUSM3bnNG32nvIbn+Yrk9A6qFFlOMICZ1St+SpVdq0cynnSB8ywaWhk2x8XbR5xvgDo29gAiiOTeNiO4bhOs4zve0dGIhAJQ2uR7fDc0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762611528; c=relaxed/simple;
	bh=ZAWBzX0a54WgVpMoNdpAYLQpNuDibi0QFmX+nolbDCI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Jg9d/e7oTDp+GujB3RweWbj4SIeMriDgkZRfJNg4zSZSlVtz6OsjtILGd0efmHUA46hEQ2HFOqp/AisNEl0UKt++55oj5rtt+2zdzgJuBnUjXoFjxfAgjV3fLfYZSg1LIPC5UYyYXubONAWn8EsYsFZuMVq++5tf5LjrRMO6cLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=Bqa24ka1; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="Bqa24ka1"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso1406532b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 08 Nov 2025 06:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1762611525; x=1763216325; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+tbABRM++smOTjrYwL9jZfiTdA+E+dTcCgbmNoRiaFk=;
        b=Bqa24ka19NzMjJczcW7X0rY+WYOyUIdnxIciF7/jF3bq2Wk9179Wqkcghk4eigu/jl
         mQlp3GsgGOIgN0MBDyBWoaL+Zy6Aog7E2JzCrf7WfHI7w4Mt6LKQhV0wdFj7X+eDiyY9
         QBxen1xp8Ycw49sew0CZLcVR0c/VALodEwjNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762611525; x=1763216325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tbABRM++smOTjrYwL9jZfiTdA+E+dTcCgbmNoRiaFk=;
        b=T5yc2xQ2dPdy4bieUDNfx45ksLDfT8fv87fHWLMpZ1ZGndcFWQcXSbR3yBjJoAh361
         mXnlgNH8QFvZ3G6IvWOP+c7r53wymOoNaBLFHxrg62geMrK7aFKkz1WkjI33FRH6SvAI
         je4lva09hvSDoDFvhp2y9fH1cjN+XG51zstiwyc9Ing6gHvglQv1C8QY1ZKDdjmzlYko
         /c14/WNhlOOpu1ex4O6RQhLRIA1d9Zh/piQAqlOEz4nXAsF7q0sLDghLsQASjve5uAod
         9GD1m7dpG1gSqJyMog1JSNl6sZaKkbzyC2jmryswCco6lL0hZuQGoVBHsu/OJCjLG2Lf
         BujQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKJBMmEeyja8V8AQWrcf/joUMrhSXQIPuLzKIWJM+idfNLuphV409pm6B/XdEXe1lZqBEpOilmNqTyFo2EmjYpLn2GyA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1IQnZIDtsrpuZrHOljbwQPrEu3uCd7zp6us0D9M5w1XQmg6Zo
	NNjLzULCEogLLB0/EUSHxXGYbNnDVrK1VP/FfsD8sq3BOS5qjNGQHNigbQWBLjL5mVQ=
X-Gm-Gg: ASbGnctdy/KEf11Ys7HO4Gs3aTUJfCyhlz7a3XPQltnAXfHJFA4kgdZ5Xt+H7QZemt9
	yKs+AFBLweF5fetY0Bf7bg/k1acXDCgddbNjt5qcqBxFkpZq9eO2gP5nRn3ZTD5rRrAHSFSxKia
	Jerw//E8xhwVS4OKdhCNMMz2plwmjTbkl7sVF1nFXR91AzWBCyQttzykebM6ZhMonD8Mk14i4qZ
	SUR1USDVEYoU71YcTwCChfcBvm8Yazc/bZ4sBsLPUBRVwkJTjw7VxGKVB2lh0O60ZhdPdHWMxgB
	/t0JcR1HamdS6i0t2mun4HEeXAWrhV+DcZNkLWXPrawgzMGic0atXPh17jUBalPHYDUgvvD/+cb
	tvlO23p8QKcKbdh9k8gj+pxTv9fScDVlnI0xFn80OODFsMr2tlyUrCcvjvL1U/k4xBSvFyMI3aW
	d2YD96oaEPP2b3WTWPQaXZi9Barb2fP4URr3qKCRJm50bK
X-Google-Smtp-Source: AGHT+IEZ9euzPCxHgG3701HKH2i39ZGTwwKtLTdHZiIOFoUF2Dx5qGD68ES419evk39qlMiE3JxWkw==
X-Received: by 2002:a17:903:240f:b0:297:e6aa:c499 with SMTP id d9443c01a7336-297e6aacda6mr28652735ad.58.1762611524506;
        Sat, 08 Nov 2025 06:18:44 -0800 (PST)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx.. ([2405:201:31:d016:940a:b59:9e93:d45a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650e5a33bsm91980345ad.47.2025.11.08.06.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 06:18:43 -0800 (PST)
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
Subject: [PATCH v3] jfs: Initialize synclist in metapage allocation
Date: Sat,  8 Nov 2025 19:48:33 +0530
Message-Id: <20251108141834.46428-1-ssranevjti@gmail.com>
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
Changelog:
- Correct bug link
- Corrected patch format

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

