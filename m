Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4000913C3F6
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  2 Apr 2025 16:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743610254; cv=none; b=daOrmdpysnYjCDIwqmE4Ku2b6G3xbe8CKikCGoYrngZUkSUPEO+RlizPIUUe8GYX1gA8qKRagsi9YjYglZxUmen5BbUPWSsC2gwjBSdbAH+h6XuKOQMjro+4IlH6OL3T94i0Yp7eIF8hqlgTjJwnvmHSGYnVDDdtof/n9KQ/ahE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743610254; c=relaxed/simple;
	bh=OIVqJJNsFrMiqu/uq1QlcvPuIL4Ese/KYrI1dezFYZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iZGWhC1OsJYeiy7oOk28llBzJnZ7ZkHDZOS1j59iTsfJTG1aqVATR3c8/G7Nf0m0TGNV0PMEkfo4l70gjSumFXVcTG3gkY/RMc4UWP2va5MldWHKwWYO5BwMlanGQ7w2E8/tNz+EmrIFAVPGG4X9RwTOYv91fRXqiZmq2lyvFGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIymJiFx; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIymJiFx"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-225df540edcso17671975ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 02 Apr 2025 09:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743610252; x=1744215052; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIIr79S8E8NybYY6gtYpu9PlGyNiRm8JHaUp3As1v3w=;
        b=lIymJiFx9o6WkA9o/Jzmsd72D1j/jq9nnK8xyzx4uHuOQoX3vq7QLlTAXN1ftXk44k
         QgenSKw5gNF2+6WRLK4DN5TPMhXVjhO2Ra35JMHK202/xcq9RtS3+TX5XJXchL055nL4
         1pHTT65cCJwcryuxRexQDQD3+CC57o415Jc9tgGfEt2ghiXdNkSNa0A1ld5OVCf9L4rY
         TNfaxj1RhmxKEro4BMNAJwZF+TgT1sA0qEyXTqd9EQhDwSuZBBHIn2FDxTzamaAs8wED
         dpAGOFJHlvxV71MitvWuu+I3CCfp2UDRBd+XbsmKUscGNRsxo+mjCHbyGsiSwCPknlLl
         1LmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743610252; x=1744215052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZIIr79S8E8NybYY6gtYpu9PlGyNiRm8JHaUp3As1v3w=;
        b=noQ46D79gj6e1vYyBxwqpaBoSk5BZhGV8pSdn81/6K+bsaTZzkAD9qc6fpywQhFJU4
         cIMtCUjddImlc/kABuKoeSM+j6ONlLsQMpUa7zT3Nkn1IYFVK5ElDJ6HU/sz0TrHqi2r
         4ksGwrBqjSoozKFIbiqegaKDfi5zOVNULEXucYRkA72BwhF2sRMCzI+8hZVwxDHeI7Gl
         HxWRtJnv+SDDxsYHGdW2865+G7omQKvnZfPkICewJlrAwH+kkUtNiHvCdlTHBnXlfYD1
         FK+EZ6KdAaKDddvTFfZ3csv0xQ1nrvIgSS919Z/6167vcQE+n1zJ4Ad8jOizE/KfIUFB
         ch3A==
X-Forwarded-Encrypted: i=1; AJvYcCVtH2M9cXxgyeJEfWjvsv2fYsEROmBaHYGwaWU/kZxIPQMqDmhZu9Nw2iiveMfWKGmMk+KcG//IxcXpTJBMulzAL253cQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyBXeCy0Q237gUJsVcLVWxmhue8F41ItS4QBcxvWnkWlVoYzTbt
	3MCMzdS/c5KzklJUA9tC/DLb02SLb1KH+nuJrd+UNlxZfhxNUpy2
X-Gm-Gg: ASbGncu0zoIJdYc5SdWDQK0k4UCg1wfWD/T6beL7P+2NoZKPmPWeTro+qtUaPpg4+od
	W2TYfgilhGJ21jl8t0RpAp+dw0t/zkqa4jzNmRr8FxUFH2HRIKx47UlwSHLjAIHRkZiMHPzSaxT
	sAYh5hli52Y8usooB2R3xt6zzPnNxSda4r1+3KfiBlcEp2TWSquu7S4dgr5uedIaZmWaqGboIWk
	lgMKghAJbwGZROJoD+PpqFm6g2HQqMT67GcyVdr72NbWUjPE/AW7GthM8BXFY7zzmrzcqO4jZnW
	8mdBTs0NPuufzagLsvzR87Jzpn3YvFU0xVCIFcn00zqxGXR95370CHMOP8nr4fgXjQ==
X-Google-Smtp-Source: AGHT+IE7ktB2KWY480DsrcKFnuDQRmNlfL3ZQiO+dZdrtj8/7tTzLyWkyo/QVitSv9v+OWHDkn89lg==
X-Received: by 2002:a17:903:1b27:b0:223:4d5e:76a6 with SMTP id d9443c01a7336-229765ba827mr1321195ad.1.1743610252117;
        Wed, 02 Apr 2025 09:10:52 -0700 (PDT)
Received: from localhost.localdomain ([14.139.69.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1fa0a5sm110205435ad.240.2025.04.02.09.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 09:10:51 -0700 (PDT)
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
To: kent.overstreet@linux.dev
Cc: Bharadwaj Raju <bharadwaj.raju777@gmail.com>,
	linux-bcachefs@vger.kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	syzbot+c82cd2906e2f192410bb@syzkaller.appspotmail.com
Subject: [PATCH] bcachefs: don't call sleeping funcs when handling inconsistency errors
Date: Wed,  2 Apr 2025 21:40:40 +0530
Message-ID: <20250402161043.161795-1-bharadwaj.raju777@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In bch2_bkey_pick_read_device, we're in an RCU lock. So, we can't call
any potentially-sleeping functions. However, we call bch2_dev_rcu,
which calls bch2_fs_inconsistent in its error case. That then calls
bch2_prt_print on a non-atomic printbuf, as well as uses the blocking
variant of bch2_print_string_as_lines, both of which lead to calls to
potentially-sleeping functions, namely krealloc with GFP_KERNEL
and console_lock respectively.

Give a nonzero atomic to the printbuf, and use the nonblocking variant
of bch2_print_string_as_lines.

Reported-by: syzbot+c82cd2906e2f192410bb@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c82cd2906e2f192410bb
Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
---
 fs/bcachefs/error.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/bcachefs/error.c b/fs/bcachefs/error.c
index d4dfd13a8076..6f0f2f12c004 100644
--- a/fs/bcachefs/error.c
+++ b/fs/bcachefs/error.c
@@ -60,6 +60,8 @@ static bool bch2_fs_trans_inconsistent(struct bch_fs *c, struct btree_trans *tra
 {
 	struct printbuf buf = PRINTBUF;
 
+	buf.atomic++;
+
 	bch2_log_msg_start(c, &buf);
 
 	prt_vprintf(&buf, fmt, args);
@@ -68,7 +70,9 @@ static bool bch2_fs_trans_inconsistent(struct bch_fs *c, struct btree_trans *tra
 	if (trans)
 		bch2_trans_updates_to_text(&buf, trans);
 	bool ret = __bch2_inconsistent_error(c, &buf);
-	bch2_print_string_as_lines(KERN_ERR, buf.buf);
+	bch2_print_string_as_lines_nonblocking(KERN_ERR, buf.buf);
+
+	buf.atomic--;
 
 	printbuf_exit(&buf);
 	return ret;
-- 
2.49.0

