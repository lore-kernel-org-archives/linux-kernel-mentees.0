Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9610D1A83F8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Oct 2025 14:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761317147; cv=none; b=qyJ/3HpIMUDATQQ62ggHLxNmyB5t4T4BSmHEBF4dvJSKAFkbBus1nm+zXdmgVVAYRwOQUMN5XUXPuLIlX4k5q9Tqxb+mJBSPBxVxeB1wExGMNCcnkgUSon6JNq95ukYQkKHs2mFwpfL3a21e4A7gDJZZr78274+SHhrpUDMI1qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761317147; c=relaxed/simple;
	bh=nqG4zh+kHvMInvyQ9gQCc4CsAgJQ86U7Qt1LNvskd/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g0SzJwG3HN7dfdg0YQnp5gXGkZpBjhVwh+sbAPLgaWF+BN96QEjR0r0XG1NHEtrfEH2UBb6GGBk9hWvj++K1PDPTFMkeieXsJP0SnlaOih5hJnCEC7ReNV2buxcZ9LCrJk98ETjr8bBF0MhAYAQbP7CzK6LZ+2WrnODED7Cs0No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+UlT40U; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+UlT40U"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44DAF40A04
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Oct 2025 14:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id faWPxa93kaxg for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Oct 2025 14:45:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=nirbhay.lkd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 693B3406C6
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 693B3406C6
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b+UlT40U
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 693B3406C6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Oct 2025 14:45:45 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-33255011eafso2249589a91.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Oct 2025 07:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761317145; x=1761921945; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4n0UnjLUys/j015DW1wlIcevAZ741dIgKslESCiUAc=;
        b=b+UlT40UStLQzcKzvmfXR7dCU/75t75mj3pJKsVc338FneZCZZnDGhvt1Puv9LKpVg
         a6TGMVuNXVAp+fVhwvBDqOoKeNOme2QiB6mq7ZL7xpAM3HOm57fLE8J1wh3cz3Bb4QlX
         CldP2tblb/vkdHRj9eUOzeujMv83AUZoj0Rl7xjPWXgwzt0RviiM99qbwxj5u9VcgPoN
         UBieuteRki8sLWjcVF/Ky13DtwtTTTqFq3seebiIvteGyxjGKNPse5iNuOfnMKnhgV3s
         e1rknfGInzEiseVRcTo6G5qMJ/NUlX+63c45hS24T4Phy5HtL6cpKZRBpXO1V+plMgXK
         e0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761317145; x=1761921945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4n0UnjLUys/j015DW1wlIcevAZ741dIgKslESCiUAc=;
        b=thw37BFSiADsk8j5mNyq2X6f7uIYUVuKyqsbzZ6zcwYD5TnDG/TnJSlJzSEVQ+99cT
         HJGRXyF0Nm7R2iCVVoFaso75CRHNdk2H5Af3If9IFOEbs7/95B07HkAtORdpCS/CElzy
         bXru0o1OBfEIgH43iJ45KycpCIioHeweoNoqrHpTj3AO7bw05xsCQ7NsKUvheSnMHNcl
         TOoy4M1pss7hBMnHvz8IJxeib3LB+D1sydYMVGDNQt56iQdHzeEpbXMg9BHNNVoviDUh
         xUogMaPyPItglvPq5KLTWGYEgzwEARWbYsOyjg3G/wTJqSEmsndlXrPbxxjCjWjwSZJn
         bOzg==
X-Forwarded-Encrypted: i=1; AJvYcCXPtfIrS2QkrCSiYTnuleWfywFhcAqRRilcCptbLSEqtALkMX3C1+CqmU2+6ojgBvlTq7SnwsGgv6oNS0VjP99QYHkXGQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyBYr7klSONPPoAzLPrFF0pwI/ukEAWsjm7JeeaQ2byMBLD+N7k
	2WLrir5ccnXZUtKbiL0+ul8mUoy/lOsz4uI90A8pce1+kLn2wRJ/Fncr
X-Gm-Gg: ASbGncsNNQwkreoZmTX8aq4EsiRjQZI5ZMIKP7qylA25lIRdNaCgwqUtJm5+K9xxkeo
	0cj/oUQKb9EX4qdfsH3B3zsmyvFoz/OTa3Gf+1EWj3Zb2QMkuxjO9tLOlMLB1ZW0eSItxLod+/4
	C7X0dYGfp17+0ymTvSNqikZQ7MS3v1yjdQfqAJsbpsatFSasMzgQ+i3oJ5xBJn0hqOyqScIJD4r
	U0vTZrmmU5/BUhaFyc+8vVkbDJQuhUgFUEeeCY5h7v2G8fSZw0TXstEM+RUNYXVt631hyoO4xte
	ixuliFK8fLfoYYhmAGzUn9KSWGtp7ONERwd3K1S5LagsZkq3Q20QD1zvkeM29oAFuPXJCRS2aeF
	u37I5C7A2loKzvdEcone3jw0LNn1+quRB1gzdQsJT+2p6dfoS5ETBHWYwWsv8lX9culoFoKdOsQ
	3zK4YMMrLHu4N65XeEoH7Hv51VrxH5SLkm+rWgobhU/le+gn+qimQ/6vCW
X-Google-Smtp-Source: AGHT+IEX5+Zc6CDsncOD1U2YKgYTgfSBUwM+Np98fLDZTHhgs+0g9k59w3ppAgkJNjKS+pbJ2TSgiw==
X-Received: by 2002:a17:90b:4f:b0:33b:a38e:d868 with SMTP id 98e67ed59e1d1-33bcf8e95f3mr35727097a91.24.1761317144424;
        Fri, 24 Oct 2025 07:45:44 -0700 (PDT)
Received: from prakrititz-UB.. ([2a09:bac5:3c3a:1aaa::2a8:13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e224a2f28sm9344760a91.19.2025.10.24.07.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 07:45:44 -0700 (PDT)
From: Nirbhay Sharma <nirbhay.lkd@gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+19e0be39cc25dfcb0858@syzkaller.appspotmail.com,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Nirbhay Sharma <nirbhay.lkd@gmail.com>
Subject: [PATCH] gfs2: flush withdraw work before freeing gfs2_sbd
Date: Fri, 24 Oct 2025 20:13:33 +0530
Message-ID: <20251024144332.33773-2-nirbhay.lkd@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <68f6a48f.050a0220.91a22.0451.GAE@google.com>
References: <68f6a48f.050a0220.91a22.0451.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzbot reported an ODEBUG warning where free_sbd() was freeing memory
containing an active work_struct (sd_withdraw_work):

  ODEBUG: free active (active state 0) object: ffff888026c285a0
  object type: work_struct hint: gfs2_withdraw_func+0x0/0x430
  WARNING: CPU: 0 PID: 6010 at lib/debugobjects.c:545
  Call Trace:
   free_sbd+0x1e4/0x270 fs/gfs2/ops_fstype.c:1308

The issue occurs when gfs2_fill_super() fails after initializing
sd_withdraw_work at line 1218. Some error paths (fail_lm, fail_debug,
etc.) skip the existing flush_work() at the fail_inodes label and jump
directly to fail_free, which calls free_sbd() without flushing the
potentially pending work.

free_sbd() is also called from init_sbd()'s error path before
sd_withdraw_work is initialized. Since the structure is allocated with
kzalloc(), work.func is NULL in this case.

Fix by adding a guarded flush_work() to free_sbd(). Check work.func
before flushing to handle both cases: when called after INIT_WORK()
(work must be flushed), and when called before INIT_WORK() (work.func
is NULL, skip flushing). This avoids the WARN_ON(!work->func) in
__flush_work().

Note: gfs2_put_super() already calls flush_work() before free_sbd()
(line 606), so the flush in free_sbd() will be redundant but harmless
for the normal unmount path.

Reported-by: syzbot+19e0be39cc25dfcb0858@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=19e0be39cc25dfcb0858
Fixes: 8fdd8a28fe5c ("gfs2: Asynchronous withdraw")
Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
---
Testing performed:
- Reproduced original bug with syzbot C reproducer
- Verified fix prevents ODEBUG warnings in all error paths
- Tested early mount failures (unformatted devices)
- Tested all gfs2_fill_super error paths (4 scenarios)
- Parallel mount stress test (3 concurrent operations)
- Memory leak test (50 mount/unmount cycles, <4MB variance)
- Race condition testing passed
- Validated with syzbot on linux-next (Oct 22)
- All tests completed with zero ODEBUG warnings

 fs/gfs2/ops_fstype.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 08502d967e71..6cea03410e57 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -67,6 +67,14 @@ void free_sbd(struct gfs2_sbd *sdp)
 {
 	struct super_block *sb = sdp->sd_vfs;
 
+	/*
+	 * Only flush withdraw work if initialized. Work is initialized in
+	 * gfs2_fill_super() at line 1218, after init_sbd() succeeds.
+	 * Checking func avoids WARN_ON in __flush_work() for early failures.
+	 */
+	if (sdp->sd_withdraw_work.func)
+		flush_work(&sdp->sd_withdraw_work);
+
 	free_percpu(sdp->sd_lkstats);
 	sb->s_fs_info = NULL;
 	kfree(sdp);
-- 
2.48.1

