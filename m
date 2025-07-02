Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C897B2BE63F
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  2 Jul 2025 19:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751482831; cv=none; b=ex5uDx+mrliTOAAXT3E1mht0F8LQctrXxk9BBrX9Tv/CNKfhosPgzUEcGdoI0ibCA6cbuC7yoyu19rQQjKQHEtJJKdzoIGiv3fsq3E9hyDwhmU3MLVNrbcIjlT0RYOQANzFvhKzrRldcUBte3rnBS7l/D0o2E/n6rsvpZgE92jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751482831; c=relaxed/simple;
	bh=d8RdH4bygtc6dzbH1AbeiVyiXe9i4xNli8uyMLHR01g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r6DIW8Zctz1eJVgB31u41XH/zpCveUbN10xWZgizpJgYs+6t/UoBlbBPnezh6YlL1mvBm8dztVHpurbr/7ZlpoZMiaiQTcJu17y/ut7ZaSEOIE8Zcn+9FDq/9VZrcmnM3EQRS4Qrnkl3u3S71IsFCWojBLnc9E1qf4wKgbQD43U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CO+seq/b; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CO+seq/b"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-31332cff2d5so5994049a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 02 Jul 2025 12:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751482829; x=1752087629; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dNvEoNaOIW82DnFZ370ho50EsopFgUiF2vv7ai8Lmhs=;
        b=CO+seq/bIsZMScl/WXGe9FPYPmnUt64v1r8ZtWCBBO0csdSykqKurx/+X+JsNo/V3w
         svwvI24vGtrrYgm9L2tliDQtswLUleUZhzk9z83oj53ohmTthFWNTZJrK2vYqVBF0xgp
         ZkUOUPngEQjuHwkr1EpmU57RlRPi7fZmQIrZXPAJsj6Elq+QIj0W1nbnuxm0bW4SmcYK
         PZmd87AyUeYxO+1CFmRBatlAeukxk/lR1fX8ph9qkf1q3TgyVHT1+XMGpP8OOg67TrX8
         iH8rEaeAgeOIOuSLkIeBu8DdO9wjn63YeNVScmE/l6t0k/FCIWkiRgs3x0uj7c4dSVt1
         IRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751482829; x=1752087629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNvEoNaOIW82DnFZ370ho50EsopFgUiF2vv7ai8Lmhs=;
        b=E2J6yxRNETaceClK81foMCm62wj6aTgzGlC7k08T7Qe0/ECFP3gXXh82bxFnG+Dncn
         aiwNK7oBQEd7OR2BZHCq15q2IVL7+/aLcahcudl98SMY5XdT3OrllVdxhl5nMGerQ4Kb
         v6RiLE8+JWxTuKwt4aQ0sizCC2xwtM3WMg8qyLTwDwK4WGfghLQOeOA6FxM6XOGFkS8+
         z8MaUTKF4n/mz6BkgfyOBnTr/P695GZA/jhxjhH8zL5BvuTse8HucbnW4VvynZkrH60B
         g8hex/QmED/mDujRY1xfAqHhMvBEtQRIjg++kwKBzN7bmeiSWOj4tW2wj5kLdto5hT9l
         VCVA==
X-Forwarded-Encrypted: i=1; AJvYcCWzR4vaxeo4HKWc4NAoSm7xgMI6nBmkBq0nrMzqD8S7PELFx+dm0PmB71+fRbb/LpCzVe8MF915sTCKA7hO1gDIh0LHYA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzlpD3R+wuBFbqtkkGEtZ7U2kXrxj1tdR4IPkANzZh5h4xE1Rox
	VZFjDNKnzuVqBshzQMfWXDu4Vq/ctRh4h5jp317fqKLcVDZAMTNkKXvi
X-Gm-Gg: ASbGncvIalMiGuKFsNo37ohqXpBlk2WFvFy2VgnDACPMrH8dltA0WClG4faT2gTD4Qa
	TnOunZ0AXg+4mHa7pCHzV7Mnl2mMjEA1ez+xDIy7N+5Y/q6ttlbio3fn+fmRBfJAFZnJDnuN7nA
	FEX9NWVBnC/QK44KN6P8ataTzk7I1NpEpbURAmaczUbxVhEpVNsdrFAW6hx0eCA13sO4sv/dEBY
	wtfBJRFG3jYxOgZs8KT4Gkec+SzZduYXhlU1/OT41OtKNA6h3I8DZSWZAAMLKVnRWcvEzZ/jTNP
	KnhhXJvpkHZ5WmdM8sZtguiMWAZoxzJyzo9wgED3JSysePX3WnGSrmO7yBPJku9bxpEPjQbV
X-Google-Smtp-Source: AGHT+IHisT+jL2i9exD2iEGFPt0p0HhJMwOgwOqxm5sMieaqvdl02QcRn6IPSerxf/AqzuegXaPCvw==
X-Received: by 2002:a17:90b:52c6:b0:316:3972:b9d0 with SMTP id 98e67ed59e1d1-31a90a2d5d4mr7166223a91.0.1751482828855;
        Wed, 02 Jul 2025 12:00:28 -0700 (PDT)
Received: from pop-os.. ([49.207.217.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a9cc66830sm415374a91.16.2025.07.02.12.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 12:00:28 -0700 (PDT)
From: Aditya Dutt <duttaditya18@gmail.com>
To: stable@vger.kernel.org
Cc: Edward Adam Davis <eadavis@qq.com>,
	Dave Kleikamp <dave.kleikamp@oracle.com>,
	Dave Kleikamp <shaggy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	jfs-discussion@lists.sourceforge.net,
	skhan@linuxfoundation.org,
	Manas Ghandat <ghandatmanas@gmail.com>,
	syzbot+30b3e48dc48dd2ad45b6@syzkaller.appspotmail.com,
	syzbot+bba84aef3a26fb93deb9@syzkaller.appspotmail.com,
	Aditya Dutt <duttaditya18@gmail.com>
Subject: [PATCH 5.15.y] jfs: fix null ptr deref in dtInsertEntry
Date: Thu,  3 Jul 2025 00:29:36 +0530
Message-Id: <20250702185936.68245-1-duttaditya18@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Adam Davis <eadavis@qq.com>

[ Upstream commit ce6dede912f064a855acf6f04a04cbb2c25b8c8c ]

[syzbot reported]
general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] PREEMPT SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
CPU: 0 PID: 5061 Comm: syz-executor404 Not tainted 6.8.0-syzkaller-08951-gfe46a7dd189e #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/27/2024
RIP: 0010:dtInsertEntry+0xd0c/0x1780 fs/jfs/jfs_dtree.c:3713
...
[Analyze]
In dtInsertEntry(), when the pointer h has the same value as p, after writing
name in UniStrncpy_to_le(), p->header.flag will be cleared. This will cause the
previously true judgment "p->header.flag & BT-LEAF" to change to no after writing
the name operation, this leads to entering an incorrect branch and accessing the
uninitialized object ih when judging this condition for the second time.

[Fix]
After got the page, check freelist first, if freelist == 0 then exit dtInsert()
and return -EINVAL.

Closes: https://syzkaller.appspot.com/bug?extid=30b3e48dc48dd2ad45b6
Reported-by: syzbot+30b3e48dc48dd2ad45b6@syzkaller.appspotmail.com
Reported-by: syzbot+bba84aef3a26fb93deb9@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
Signed-off-by: Dave Kleikamp <dave.kleikamp@oracle.com>
Signed-off-by: Aditya Dutt <duttaditya18@gmail.com>
---

I tested the patch manually using the C reproducer:
https://syzkaller.appspot.com/text?tag=ReproC&x=135c9b70580000
given in the syzkaller dashboard above.

 fs/jfs/jfs_dtree.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
index 27ca98614b0b..cb57d4f1161f 100644
--- a/fs/jfs/jfs_dtree.c
+++ b/fs/jfs/jfs_dtree.c
@@ -835,6 +835,8 @@ int dtInsert(tid_t tid, struct inode *ip,
 	 * the full page.
 	 */
 	DT_GETSEARCH(ip, btstack->top, bn, mp, p, index);
+	if (p->header.freelist == 0)
+		return -EINVAL;
 
 	/*
 	 *	insert entry for new key
-- 
2.34.1

