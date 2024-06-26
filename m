Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D2479E5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Jun 2024 00:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719362403; cv=none; b=l7fkZTNJdpoqjnqGLAwCLnuZionS8hfG76Qhp6p2BhULsiWeOpse/LTkaf+PAxgfyj8jpFHtzNEUOLudJYq0uurwFFhUGX/BrrCCvcyXUKPgggZFwNl/8wvn7Mijm4g0TorhMc25lywaAeYzyvFRhDtfG5uvmI0h9W23vMPxIlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719362403; c=relaxed/simple;
	bh=nAAboattMDWw0GSvPKDB9G5XT9DIggzKYBOB4CVd2TU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YItqVdsbWhdxusJUmZBEzFFM427mqQjl9x0FWEGm8ChxY8GF2kIM3KO/k0EY+hqqHxHKHMcf+xQ4tlBUM2pmz4Cc+Qcaprs/n5oTZaTdbRBdgiSzv96q0pGRblH4U7yK/SP7IGnpH4jsAgJSDepK64Bq3RklU8/aCyeRaNEqoB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TLLPheeN; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLLPheeN"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D5F88135D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Jun 2024 00:40:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mrZuXIA3SAKB for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Jun 2024 00:40:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com; envelope-from=peili.dev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 125B881359
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 125B881359
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TLLPheeN
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 125B881359
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Jun 2024 00:40:00 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3d21e00d9cfso3580424b6e.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 25 Jun 2024 17:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719362400; x=1719967200; darn=lists.linuxfoundation.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NybrsZoQ5NkZHnc8LjAToGVxa3rG+ocUIRAyW06Tmpw=;
        b=TLLPheeNO2XdA6uONkEa64GMZ1oBokCS694JmOZ7w6CJU+9lmyu04uo3/5iBLOJ8mD
         oa0/k+jC6EMsJ97VhqgiOc0VDZD/s4uGIm/sFltWHioe8gSK1uHwLb2w7AG9LAUHdqS/
         jb02zAxvb7SNpdX5fJpvXQaLfOBTWkjIhunOt6IEmvaid6NVbMGoN2BE9MLFxrmEHXGU
         Rb2LTU+mpCP2NFIjv+YKRw7jegcKKDSI6+LpeDErukiUwljmSvBJXWCr9Kgt9mJGkjw3
         iLo0iwgpdz/94cEtQ4TKpuqRlWr+T13YclHhtz5i+PGV0TudwEVF/0g6mQzbOwoqbQ0Y
         6x5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719362400; x=1719967200;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NybrsZoQ5NkZHnc8LjAToGVxa3rG+ocUIRAyW06Tmpw=;
        b=WUKjjIBynngKF8OLXsjBnrwRGo18YbLve9Voyy3rRk90urUlqq7hJ+dUcuO80DH2Fe
         7jj9Kqzviv+Cj3Jyl5Z8TEOy/bM8AL0pXj342Aq5fLZohg01wuiItt/dreoWKVdinGyh
         ZLM2I9Yu18zC3V4RVZyJ8TlIH/KMH/ZXPLb7rZbUW1Rvv388QHAoIuyjpcLo3buB1alm
         PkMa8U8db6sEgNdMfj2GYoqc+WttpYmvkTSjawMVHo0Z10A2uu/gQolDr/NqS9k3VN29
         u5ZHQqKDBxlmafxC9yRPAQlyOdLpXE00JZdJfcYgt4XEb4YVQOTolndJlL1ZfPvfLgPy
         GWmA==
X-Forwarded-Encrypted: i=1; AJvYcCV6Xm0pH41gX+gru5kmfiHSYMO+znzJs7djwH52I0CTBu27Y/yQcJrU0cspPE/yxevcRpIcO70IIAqdmn0OlIRIKKsxyOGISDakVscAUtYRv3HoX7xbYn2ogBfYV17g
X-Gm-Message-State: AOJu0YzwTvHnxibu7gUcLM6o9NQx/g3oGuWC6Wv6KzKGG1lFgiKGMXwO
	wUcPT9rggx9RVywSF2lBxjDQf4jTUavaYaXYN9g+umf5M59++8Vv
X-Google-Smtp-Source: AGHT+IEDxX77IH30jnhxhvrn9DWCCLLvNhcTnqWg467fsBjFOyek1YwH6WVzUfuJ08rer781cBT1Fg==
X-Received: by 2002:a05:6808:144c:b0:3d2:2833:73c6 with SMTP id 5614622812f47-3d545a7c3femr9871690b6e.39.1719362398777;
        Tue, 25 Jun 2024 17:39:58 -0700 (PDT)
Received: from [127.0.1.1] (107-197-105-120.lightspeed.sntcca.sbcglobal.net. [107.197.105.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d5345a6016sm2124731b6e.37.2024.06.25.17.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 17:39:58 -0700 (PDT)
From: Pei Li <peili.dev@gmail.com>
Date: Tue, 25 Jun 2024 17:39:56 -0700
Subject: [PATCH] bcachefs: Fix kmalloc bug in __snapshot_t_mut
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-bug3-v1-1-366d4884ab71@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFtje2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMyNT3aTSdGNdSzMzg2SzJHOzNCMDJaDSgqLUtMwKsDHRsbW1AA/vk2J
 WAAAA
To: Kent Overstreet <kent.overstreet@linux.dev>, 
 Brian Foster <bfoster@redhat.com>
Cc: linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
 syzkaller-bugs@googlegroups.com, 
 syzbot+770e99b65e26fa023ab1@syzkaller.appspotmail.com, 
 Pei Li <peili.dev@gmail.com>
X-Mailer: b4 0.15-dev-13183
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719362397; l=2675;
 i=peili.dev@gmail.com; s=20240625; h=from:subject:message-id;
 bh=nAAboattMDWw0GSvPKDB9G5XT9DIggzKYBOB4CVd2TU=;
 b=qt+kmpW/VwTQ4Y1GcMuWI72KjMC5aBkQ15pKvsO6jyM9+L1I39sWcxOFaLF7KqF3Ww1vG7hAX
 CIi1MX+P/CgAh6sG8pFf81iNL4z6t3IFbGC2gbHOjiqDGWOvmaHv23H
X-Developer-Key: i=peili.dev@gmail.com; a=ed25519;
 pk=I6GWb2uGzELGH5iqJTSK9VwaErhEZ2z2abryRD6a+4Q=

When allocating too huge a snapshot table, we should fail gracefully
in __snapshot_t_mut() instead of fail in kmalloc().

Reported-by: syzbot+770e99b65e26fa023ab1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=770e99b65e26fa023ab1
Tested-by: syzbot+770e99b65e26fa023ab1@syzkaller.appspotmail.com
Signed-off-by: Pei Li <peili.dev@gmail.com>
---
Syzbot reported the following warning in kmalloc().

bcachefs (loop0): mounting version 1.7: mi_btree_bitmap opts=metadata_checksum=crc64,data_checksum=xxhash,compression=gzip,str_hash=crc64,nojournal_transaction_names
bcachefs (loop0): recovering from clean shutdown, journal seq 7
bcachefs (loop0): alloc_read... done
bcachefs (loop0): stripes_read... done
bcachefs (loop0): snapshots_read...
------------[ cut here ]------------
WARNING: CPU: 1 PID: 5078 at mm/util.c:649 kvmalloc_node_noprof+0x17a/0x190 mm/util.c:649

We are passing a huge new_bytes (greater than INT_MAX) to kmalloc().

This is likely caused by either we run out of snapshot entries when
calculating the size of snapshot table, or an invalid bkey was read.

Instead of failing at kmalloc(), handle this error when a large size of
memory is going to be requested and return NULL directly.

syzbot has tested the proposed patch and the reproducer did not trigger
any issue.

Tested on:

commit:         55027e68 Merge tag 'input-for-v6.10-rc5' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10f3a389980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bf5def5af476d39a
dashboard link: https://syzkaller.appspot.com/bug?extid=770e99b65e26fa023ab1
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=170174c1980000

Note: testing is done by a robot and is best-effort only.
---
 fs/bcachefs/snapshot.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/bcachefs/snapshot.c b/fs/bcachefs/snapshot.c
index 629900a5e641..e3303aea8b29 100644
--- a/fs/bcachefs/snapshot.c
+++ b/fs/bcachefs/snapshot.c
@@ -168,6 +168,9 @@ static noinline struct snapshot_t *__snapshot_t_mut(struct bch_fs *c, u32 id)
 	size_t new_bytes = kmalloc_size_roundup(struct_size(new, s, idx + 1));
 	size_t new_size = (new_bytes - sizeof(*new)) / sizeof(new->s[0]);
 
+	if (unlikely(new_bytes > INT_MAX))
+		return NULL;
+
 	new = kvzalloc(new_bytes, GFP_KERNEL);
 	if (!new)
 		return NULL;

---
base-commit: c13320499ba0efd93174ef6462ae8a7a2933f6e7
change-id: 20240625-bug3-9660c6b76f20

Best regards,
-- 
Pei Li <peili.dev@gmail.com>

