Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92C1285045
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  1 Dec 2025 21:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764624571; cv=none; b=kcY6B5xEuQIaFEMNX3T+nIFZk7RZgVpLiz37F7/AZGDlp5JnVYeWBSG/tVFauz6zRHoLx7u7iNZscJT4EUinoG1muipFyNaE6nvtYUaq/FMv9fscSwwL1c2VazE09TNfUv2w0afFbShVDeyVqLiU1+MDis9TOzvTCTrKwttWFw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764624571; c=relaxed/simple;
	bh=lSvg/K7yPsKUCFTcfSOcZg9VsOKeNcGmYT1edmcLv+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jQbs3dOlqgq2SR3f3j1baYNNzZBWAQAvpu+zIFpogGv/UB/HMalkViBfhTj7umLAS2YLbg6A7lOJuMs6vudVgt0ApV9CJO4YsBr2IDbZelhU2iNbElkvLihWoGIwaPOJofLLz8rqtCK0N0W+pXEUbtBJg6WVSXdvBLbnqY8FErk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C60ECFrc; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C60ECFrc"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 665FE80A96
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  1 Dec 2025 21:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qFeu807OM_E for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Dec 2025 21:29:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A6511809F8
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6511809F8
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C60ECFrc
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A6511809F8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  1 Dec 2025 21:29:28 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6416133c627so755956a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 01 Dec 2025 13:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764624567; x=1765229367; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0Yn63rsGsd4Hj7X1d2hk85Oe6NspbG2sX3h25PNq3o=;
        b=C60ECFrcS2rgURxhNZ33hhsVVfBulXneF2eDJncGo2tf6AGJakuO5eJeGZ2iMV9q0i
         ytdqvoDFABzkHfpqjHtPWweOiG/9cCfOBAiTYV0fqigOwjePLEv0Js4CQMr6v51pVYkh
         e86RHxvvnbFexL/ggl4xZKHOnzuHeAvj9DYkNa9m7+pdh9aSz2GKCSqDu9qNhP8m+MgX
         42mRJNBn/PldB//AVVyWpTJ5cgBQ+GzUFmbvBJ2PMrvbLxESp+7BPviaOSsIjLVjW8Mp
         /HNowCT9v70BRAq5oOteDE/ow2Apnh6EXNRyDE127etTxg0HvSWHKDNpebt4YBM59MEv
         F8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764624567; x=1765229367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S0Yn63rsGsd4Hj7X1d2hk85Oe6NspbG2sX3h25PNq3o=;
        b=RDLNHYrijroxX9G5+8f5C8GmpHqNuLUYGr295diSPw6L3Gn/IvA1rrtAtA/+SGtcks
         G959rEh/AC1K9cOtAfePCOQbGRFumbkvhnK3RlopHgXSRM3j25SfXr6DHLqAgQBEDFzE
         Z9mQmMZNObAihjfUEeCuMFriGEWJkgf75KBhlO1rLyIpAu1Sywwvp0m1zO3GMaWrFiKD
         1ilR0+bJWJTDlq3M64AUfVsV8Fn7bAa8EG/5OUSmt+LtAiGWCyGyq002LQQjOU+dh2Uh
         3tYPC/m0KiytSyNC0KU5v0Wq/FsQ0yylIBxy/9ZaFjLoylJ6rMnRirXBEGWZrk532JOK
         Tg9w==
X-Forwarded-Encrypted: i=1; AJvYcCXP9PvcpQqe/Y+CyX2tXEK4HAU2PL0xKg3X5r48rl25lqQ6ri6zvUxqZBGoApPIYXxVLV4HxFNtd9TTaOprXxf24w6JMQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy1RO5pSB/VYptpf0NA090O+CCgHdUYU/mKyfNuhxkhaIxiJSWl
	aJZZB21lC+U+eQHNAL1O5UyX+IldcBu+hEtkvEHWSnNyMiBNk/JlGCyCmWKzEQ==
X-Gm-Gg: ASbGnctXogGY+a9L7v9S/WiNl6SUDe+C9eFQGTeSwMWMJnHJ850a0DBD2yP0Ek5fd7h
	pfGXpAUeCKAwa0i+PRQunIw6gntVSfpS7QaNr7XGhuSp+3T463ZyZlaIjBP6MMvR96i6S0MqmUC
	JDDUrfTABcFCkGT2ZYOn4+9BXnxgv9+lmo0td4JuTNDIcB889ubP4+GOUnZdR3WXkx9DLVN6/d1
	Dkk/cB+h9Y9naRTLZGrjBr5KEanafKoZuk4YQ27gUUva1e1yVYx1lqn/GFsAbHpek/jiwxzP5wo
	8LFH6LL5/k2B5GgRUajtp06vuIsnLQolvy5YcqXqMFoJnrdpTmG/PeC1cznJSFzexWXSkHXexTD
	8vtzMeFdy8Es2h9ru72gA58U6m1nfvi4+M3jghggIMnpHhSitawwCdlXeTfP+dYiCerAjLGaZKL
	IEO8tildEErF4jzA==
X-Google-Smtp-Source: AGHT+IGu1SlFFpvIYvIrQ+apMAxrKVb7zxXr0S8Sxm9iSmu6U7ZmdNyqWZGcEobHLqob2qXQsUOdtQ==
X-Received: by 2002:a05:6402:5190:b0:645:e986:682f with SMTP id 4fb4d7f45d1cf-645e98668camr14681838a12.8.1764624566404;
        Mon, 01 Dec 2025 13:29:26 -0800 (PST)
Received: from bhk ([165.50.39.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6475104fd7asm13519497a12.23.2025.12.01.13.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 13:29:26 -0800 (PST)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: slava@dubeyko.com,
	glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	jack@suse.cz,
	sandeen@redhat.com,
	brauner@kernel.org,
	Slava.Dubeyko@ibm.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/2] hfsplus: ensure sb->s_fs_info is always cleaned up
Date: Mon,  1 Dec 2025 23:23:07 +0100
Message-ID: <20251201222843.82310-3-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251201222843.82310-1-mehdi.benhadjkhelifa@gmail.com>
References: <20251201222843.82310-1-mehdi.benhadjkhelifa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When hfsplus was converted to the new mount api a bug was introduced by
changing the allocation pattern of sb->s_fs_info. If setup_bdev_super()
fails after a new superblock has been allocated by sget_fc(), but before
hfsplus_fill_super() takes ownership of the filesystem-specific s_fs_info
data it was leaked.

Fix this by freeing sb->s_fs_info in hfsplus_kill_super().

Cc: stable@vger.kernel.org
Fixes: 432f7c78cb00 ("hfsplus: convert hfsplus to use the new mount api")
Reported-by: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com> 
Tested-by: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
 fs/hfsplus/super.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/fs/hfsplus/super.c b/fs/hfsplus/super.c
index 16bc4abc67e0..8734520f6419 100644
--- a/fs/hfsplus/super.c
+++ b/fs/hfsplus/super.c
@@ -328,8 +328,6 @@ static void hfsplus_put_super(struct super_block *sb)
 	hfs_btree_close(sbi->ext_tree);
 	kfree(sbi->s_vhdr_buf);
 	kfree(sbi->s_backup_vhdr_buf);
-	call_rcu(&sbi->rcu, delayed_free);
-
 	hfs_dbg("finished\n");
 }
 
@@ -629,7 +627,6 @@ static int hfsplus_fill_super(struct super_block *sb, struct fs_context *fc)
 out_unload_nls:
 	unload_nls(sbi->nls);
 	unload_nls(nls);
-	kfree(sbi);
 	return err;
 }
 
@@ -688,10 +685,18 @@ static int hfsplus_init_fs_context(struct fs_context *fc)
 	return 0;
 }
 
+static void hfsplus_kill_super(struct super_block *sb)
+{
+	struct hfsplus_sb_info *sbi = HFSPLUS_SB(sb);
+
+	kill_block_super(sb);
+	call_rcu(&sbi->rcu, delayed_free);
+}
+
 static struct file_system_type hfsplus_fs_type = {
 	.owner		= THIS_MODULE,
 	.name		= "hfsplus",
-	.kill_sb	= kill_block_super,
+	.kill_sb	= hfsplus_kill_super,
 	.fs_flags	= FS_REQUIRES_DEV,
 	.init_fs_context = hfsplus_init_fs_context,
 };
-- 
2.52.0

