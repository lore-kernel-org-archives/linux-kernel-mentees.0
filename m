Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3D92F90CA
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  7 Nov 2025 20:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762546022; cv=none; b=fOvhsVku6rpFTLkMK3rEXWGxBKmgnyv9wru/aZVrAE/EKr4uvI0sa5HTBqVFIIY/lAB+GXjvMiy4/8j6z615UPYu2WET0eIr2uyQDQjTuTRzLaW6nQ+h+FXZajJHu7hW0+UyTckv1ySj9qIff+Ed7tJgmUfPlwHnZAmnHeDfBww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762546022; c=relaxed/simple;
	bh=A4+TOwgqNdQg6f8E1pPnxBWqzpNdAcnfbfRIsLrm7Vw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JoR2DR67CLym3B6M3RISc9PL8fXW00N/HJVM4bnjmGcmtNCx7I4yB9M0r+qUBag2ObjGx6qduJ+bIYELftwKuaZSs77vi5zWM4LloGZcCfep1OobB031PY5gedze4E+pX0lxOuKt1hPdNQ70ohj4KO4GiEA8JMpGF4IKO9nB2dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=O6qDnBee; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="O6qDnBee"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-340c39ee02dso989008a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 07 Nov 2025 12:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1762546020; x=1763150820; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dhDbgFwqZiDQu1EsSrcetxhJXfZ+td3XRScWxEwgYgY=;
        b=O6qDnBeebZqyZ3mzPjFvnVAym+IYaOcKxbBWyB5gibBWjr0yyk1IAwqyQR1ZKG3ltr
         MJZhjGlD2/6B8aWQc4g9YCOOLlqedND0NfEPIte0D+fLL4kyFBezsi/J85mmcQrdbAM0
         IGGmyE7cIjUX5oJXn9X3uufJ1YyWqynG0Cj5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762546020; x=1763150820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhDbgFwqZiDQu1EsSrcetxhJXfZ+td3XRScWxEwgYgY=;
        b=KbAqrQenfY28emPdYUej/NZehjAf15TP4kS6RB7k4sqKM+Ru6lCCbfZhJvxe2ot/rs
         EG/hhSPEGFuULp7YGEFzJKlMMfXsX3SMDEPF+guBnWE3E826mWa73RzaENPnkihFC0M4
         hnHZ+R8mZ8kFlDPXSxDMJ2kH8zH45atOLkBzSR/rHTWld9ADL+dZwi65/0TXY9m10b8R
         B9iNubqGipAAV6vfvZZhXgr09ngSS+3oz6ZSWtWnQvEeG9tteNdBKyY6yh+QzhQu/OED
         APtjzzvuEh/al2kl2jNlJJI6VhfqeE7nNyi5zPEo+iTE0H/KUxW7JJZi7V6HuIjZYSWM
         OCkg==
X-Forwarded-Encrypted: i=1; AJvYcCWGf5mbklBFLook5EN0n0AfHC2qv2pZ+vYWR2bQZ59gqnqcMl7wfn14Qy4v9ABgupNCYU8ZVlNdtexmSREr7Y+wK4JIVw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc9WC9+BuLtZEHkBwpvWCIqa664KcXe0VesoD6PQfgu8/mWjuV
	iX9SDBeuQ4RUE053yjI/w+ldcN7UVW3Q6omW1SxuR+LL2Hwmq3ImvPk9eq9ttnea5FQ=
X-Gm-Gg: ASbGncttRxlAhL6wLrkWe+VDbn+ASBblEoY/neahNtsLsaT9dO1zR7cNKaP7lQhUSfA
	DO104fYsZhsxh5NWZ9rfgMUuecpXQNvQw5A3kH7TLOrZgwtbkmWVVmMn/hrIQ/RHfephD8yIFEa
	bLxoy65qBOFoZ/huoovD/RnAe2KRpYywd1HRb/5ZyreoR/SlCpqDDDewefPZxHkwHSt8mzJPfDj
	O8ftn7703CsQFLwGHbcaL6mppAYYf6WyZURjolYFugvFdYUAqWthP8IMgirgoZTU5bfPIQkSUbM
	QdGrxv0460fRfXY4AiWTKnhsH+GvC/RzrOGg3JOB4cwIW+AOMJczdiHG2Wvsw392tPJreNCFOtd
	w9+3ghElXLnJC8B8+rEucs/gD+H8hq03mimWfltQBp033ovoArt0VVWE5arcFU9lFTOKBgirN0K
	mRWkQvazVmNNp7JmV8CFxnLSbd23po5RaIpYk2ar0bV79qAw==
X-Google-Smtp-Source: AGHT+IE2QH0bYt9evLPt32Zmzpg6IE1jS/NHlYekxZETu/ShdgKYTlNUPI/Uj5DCmlG72yB5wBW9uw==
X-Received: by 2002:a17:90b:4c8d:b0:33b:cfae:3621 with SMTP id 98e67ed59e1d1-3436cd15e8fmr389381a91.32.1762546019685;
        Fri, 07 Nov 2025 12:06:59 -0800 (PST)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx.. ([2409:40c0:27:d019:96c1:1e18:c1b7:e182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c3001f2sm3327186a91.1.2025.11.07.12.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 12:06:59 -0800 (PST)
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
	syzbot+cfc7cab3bb6eaa7c4de2@syzkaller.appspotmail.com
Subject: [PATCH] jfs: Initialize synclist in metapage allocation
Date: Sat,  8 Nov 2025 01:36:45 +0530
Message-Id: <20251107200645.149093-1-ssranevjti@gmail.com>
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

Reported-by: syzbot+cfc7cab3bb6eaa7c4de2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=cfc7cab3bb6eaa7c4de2
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

