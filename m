Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D74942AAE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Nov 2024 19:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732391405; cv=none; b=jFzJPY8CwmesQwOcZddWyFFYgLovjRb1UK79ja21v8VR3Z4IpvwZEBpZNa6QWJfzfvgB/dB9RiyWmhFDfn2ZXDOW5pRqY3pKuiRYj+QjmmNq/PRdX5UmRSKXl/R/dkqlE8WCKKulD3nbq9dxvYXXbm5FazPh4vHX6wLVvXmfGng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732391405; c=relaxed/simple;
	bh=0lJjK/Wj3Hu8vBZP4NKVokNyrxkIqZj5FLU4Os+ancI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dsveO+MyNh+vNelMT2+fosEXnx7+aiTdGnKPPU+NATOqZqWqZ/pep5kH+KUbbSI8FYVM2+jpA5jWlbD5icwNFEmJwkfrl//Uqj7WKtGz8dlcKxKKWrgnPCKTR5nn7/x/30q6DnT2ODCtJiKVAEAyxgpvQTcUiHeboy+PJCeZrm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICnFzy3m; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICnFzy3m"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE7308111C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Nov 2024 19:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XHP9gA-SiysF for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Nov 2024 19:50:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=leocstone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E65B4810A5
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E65B4810A5
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ICnFzy3m
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E65B4810A5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Nov 2024 19:50:02 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-72467c35ddeso3150484b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Nov 2024 11:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732391402; x=1732996202; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtpJ5UMR5MaspyfBoKBZMhSAyxFrrP/3aDqY9HRg/tw=;
        b=ICnFzy3mpv4KANo1Qlwn9Ht80Hd0qx0ix5IjYZTDWOgM1DsTsLZbZEk4wlaG3k9O8o
         K2Q6+fqcPAE9OJJOT2ztXlQhSVaHisMm8A39xsX1+NMeBsSAyG2QB8EoUU9O3I7LJ9Dw
         XzOVXz7CjJinhTO+oGYOoynqsvALmxV2bJ5QL7Gl21Yw7NDtLknTq+Eph3nhnwEJ+6W0
         0f80zkADENPucUN3Wf9y6kfsBJ/Q8wSuAItV1V3y34H/S/LK//CuMlTLyq2tk0Q0QaDf
         JgeOs/XguZZqwjgQToFwtX3OrFjMYGzWjW5RhwxalsSQBcqirc0EBsj7mnqWc/xW2C4g
         qeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732391402; x=1732996202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wtpJ5UMR5MaspyfBoKBZMhSAyxFrrP/3aDqY9HRg/tw=;
        b=BS7pCP7mLb3tSVB6/T8gQiv9RRF9oK/sxq6TUihltLVHaDxkKD7IAj6M2XgpMXAfH8
         vJ7nDLqMIAbNPQOF6jWKajb0tmJct2GgcbhaurxTwoNRJ0dXRWHCuob8BQv6JBBEWMZD
         8ouTL+P9PMUdYQ9cyK7Qh7u+iRD4nRM5jKCtbbDJukQ/emjaY+7zj339UuxgZHHJKKY+
         252rpXstvS5rkxmkpF8XNCt1VufKcYhLR2J7Y/oc20LNfzbDcAUzOCnW5B3YDGTDJ3dh
         wcl4+rtGQH3DKNXEg1MRklTxPAf/iwR2kWcf5xofOkQkBmc83Pyf+nECaLUUgxnT/6iq
         Wr/w==
X-Forwarded-Encrypted: i=1; AJvYcCWyzYJuCqNWhKXvTDlm+iCSy6YBRIKNHBvGWn7TtFKatR2WtV0bsScEOXsfqQXbtDnJ9crhW97xlwZThi0YK9EH4yYDwg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yzf7Gk2oklhSgy9GvgtUQYLjZGR4cwThvoRXctF7Z1lXUPKsvtX
	fN5Otf5WHW2SJE0MA3fvDwis6u8duGt0HnH8ZVWfc+HQcxjPRKfq
X-Gm-Gg: ASbGncujrbdM5Alif9aLEWrpW0nXAncxqm6d05fKeqo6Bj3dZgkoHCtySyyQ6un2Glq
	HQLpXuf+qGTLY+ce3nO1e9J6P6oS8NVajWqftfSJMJG+dTBYuHBw00q1U14Jb41j3CoMxAE2LBW
	ARuBRFwOHqkVo5biiK848yU1mii1nOX9gNfKcLLrRBRV4mJBQvIe0ik/qaVCyGSJCkPE5wgouIt
	+jeuoPMjNQ3S9LnUNupd9NeqZhqaGSMciVG9mEkcDS3yDezWrl+6PJSlrF1kZm90w==
X-Google-Smtp-Source: AGHT+IEonW02YsXMiQhDOe5tluD1XYyX9QKCECbVHY7UXTIZwuR2Rb7BIbNCftr/q27vK/JUE+i3IQ==
X-Received: by 2002:a05:6a00:23cc:b0:71e:44f6:690f with SMTP id d2e1a72fcca58-724de95a306mr13402766b3a.8.1732391401983;
        Sat, 23 Nov 2024 11:50:01 -0800 (PST)
Received: from tc.hsd1.or.comcast.net ([2601:1c2:c104:170:86c6:5b62:b5b7:ec1a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de48f108sm3627957b3a.87.2024.11.23.11.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 11:50:01 -0800 (PST)
From: Leo Stone <leocstone@gmail.com>
To: syzbot+2db3c7526ba68f4ea776@syzkaller.appspotmail.com,
	brauner@kernel.org,
	quic_jjohnson@quicinc.com,
	jack@suse.cz,
	viro@zeniv.linux.org.uk,
	sandeen@redhat.com
Cc: Leo Stone <leocstone@gmail.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	shuah@kernel.org,
	anupnewsmail@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] hfs: Sanity check the root record
Date: Sat, 23 Nov 2024 11:49:47 -0800
Message-ID: <20241123194949.9243-1-leocstone@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <67400d16.050a0220.363a1b.0132.GAE@google.com>
References: <67400d16.050a0220.363a1b.0132.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the syzbot reproducer, the hfs_cat_rec for the root dir has type
HFS_CDR_FIL after being read with hfs_bnode_read() in hfs_super_fill().
This indicates it should be used as an hfs_cat_file, which is 102 bytes.
Only the first 70 bytes of that struct are initialized, however,
because the entrylength passed into hfs_bnode_read() is still the length of
a directory record. This causes uninitialized values to be used later on,
when the hfs_cat_rec union is treated as the larger hfs_cat_file struct.

Add a check to make sure the retrieved record has the correct type
for the root directory (HFS_CDR_DIR).

Reported-by: syzbot+2db3c7526ba68f4ea776@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2db3c7526ba68f4ea776
Tested-by: syzbot+2db3c7526ba68f4ea776@syzkaller.appspotmail.com
Signed-off-by: Leo Stone <leocstone@gmail.com>
---
 fs/hfs/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/hfs/super.c b/fs/hfs/super.c
index 3bee9b5dba5e..02d78992eefd 100644
--- a/fs/hfs/super.c
+++ b/fs/hfs/super.c
@@ -354,6 +354,8 @@ static int hfs_fill_super(struct super_block *sb, struct fs_context *fc)
 			goto bail_hfs_find;
 		}
 		hfs_bnode_read(fd.bnode, &rec, fd.entryoffset, fd.entrylength);
+		if (rec.type != HFS_CDR_DIR)
+			res = -EIO;
 	}
 	if (res)
 		goto bail_hfs_find;
-- 
2.43.0

