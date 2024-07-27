Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83BB79EA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 06:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722060831; cv=none; b=ny+kUA3qjgZ9/g/AUd8+LYEZEqK0cqNcHqtByFU+uCYAfqJ8bOgynnwnI937IW111X+4SiQ1thNrsBmYpZKjWYax/2H6wrj23qwP2Pc9IHzTn1BkYJcwAAMmI/khYpdJ9GXTbrwDCicif4zHXZ8fbdgGOr287YRjCc192Ds8yxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722060831; c=relaxed/simple;
	bh=30cMus3ICjoofxFiRIvDmfqr6dT15Jqh6QDYU4tPQ6M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MJujWoMCApNf5EEKSikDzN7ksnpSKc58i+qTrLdnxWHGko88glnDHKpXU3vtPAixskZtE9g8zedEYpFYeDNdWgcVnxuZ+fxnGzAc6LO5ELPLGR/T55VPVgI2OFEkSm7akMjUtQvBrlFvmX1MHDT/xLuzq8u6ga3veiP6nO0qidE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=feQbrwWJ; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="feQbrwWJ"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EE3C40282
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 06:13:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FPONdKDqLGFA for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Jul 2024 06:13:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=simeddon@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7C6584010F
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C6584010F
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=feQbrwWJ
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7C6584010F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 06:13:48 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1fc6a017abdso9898305ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 26 Jul 2024 23:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722060828; x=1722665628; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:commitdate:commit:authordate:author
         :mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dIv6o2cjHwR7n5agPON2AEA6FDTvC7wsWd7s+OCH6vk=;
        b=feQbrwWJlFWKohLEHxnBTrvmUkYQjyU46ulo4Nz9eJ/Gzx3rK/vUshyu7hjlR3NwON
         hC7tPh6SUYybw6jdBgprAMgWZtzhd6oWZpD9eZ/H6eSzLGoZly5uit8XlP7G8MK1Wiun
         UcPgHc2PQKf/c3pPGfEH1EP2DAYoy9wiPKFTKDRiTByaeqVU8thY0gQlaJyh6Vl4tGKw
         Ibt0l5E3o3x9AALwtFbCZnUB03ze8tYSuzePxN2A4YUA/Cj9pVEJEbdAKlcTDyJz5rwr
         bpPPNmRjxSjapc68cjCMNwWG8sVzzgsTMCxuoZ5pfShuVTEkIilcbVWdx0Dz5dUxVWtF
         MJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722060828; x=1722665628;
        h=content-transfer-encoding:commitdate:commit:authordate:author
         :mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dIv6o2cjHwR7n5agPON2AEA6FDTvC7wsWd7s+OCH6vk=;
        b=o1jVZV1HJycbtI408VmUtJNJLRB3psd+CvTaeyB3osjcE8ChqOG4MdQ9EXR8zWY3Ab
         Kqr7bc/xTOnXePD6CUTtgWsLtq11CjTcKuScY+uA0hdqULwR/k+XlN/RtoFnf9bEcoOq
         4fQxgd5PS9TYI2lZdC1RzxCGWUO5uenKQRcAOHLn7GFv5Y4ISaBFrxlRIDMeRD8cQCc2
         JXTAaccljoEnEGPggTnTSkIZe00EO5Rk+izhX7C9dZlp+FHmMLtim9YzfyyrcvKRo0+s
         S28dG9xh5eI0P6EFazy2wuCxtL5NDqd6SPZzKy/KHfz4df2rFQmkTPoGPDv+ZRds375a
         Afgw==
X-Gm-Message-State: AOJu0YwDb9WMeAb1OLLggXWhdmjdCYQIg8Ru65z1avh+hZvPvGQ+qxc6
	v9a+BuomGOO5ptB4dTG6PwlY5f9WumprzCFwT6hYAyHk6I8w0erc
X-Google-Smtp-Source: AGHT+IFpOo1oQCAtnUf97PPu718sDjJVZonCcKi4Dr7Xm8pgwAGofwWKaluBn7BA4levU45OLmh5OQ==
X-Received: by 2002:a17:902:d4cd:b0:1fb:68a2:a948 with SMTP id d9443c01a7336-1ff04809ab3mr14672205ad.15.1722060827690;
        Fri, 26 Jul 2024 23:13:47 -0700 (PDT)
Received: from BiscuitBobby.am.students.amrita.edu ([175.184.253.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ee15a9sm43068755ad.151.2024.07.26.23.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 23:13:47 -0700 (PDT)
From: Siddharth Menon <simeddon@gmail.com>
To: linux-fsdevel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	syzbot+fdedff847a0e5e84c39f@syzkaller.appspotmail.com,
	Siddharth Menon <simeddon@gmail.com>
Subject: [PATCH v2] hfsplus: Initialize directory subfolders in hfsplus_mknod
Date: Sat, 27 Jul 2024 11:43:04 +0530
Message-Id: <20240727061303.115044-1-simeddon@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Author:     Siddharth Menon <simeddon@gmail.com>
AuthorDate: Sat Jul 27 10:31:53 2024 +0530
Commit:     3f02808f3a98598adf145b3347b50926fd7d5c74
CommitDate: Sat Jul 27 10:31:53 2024 +0530
Content-Transfer-Encoding: 8bit

Addresses uninitialized subfolders attribute being used in 
`hfsplus_subfolders_inc` and `hfsplus_subfolders_dec`.

Fixes: https://syzkaller.appspot.com/bug?extid=fdedff847a0e5e84c39f
Reported-by: syzbot+fdedff847a0e5e84c39f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/x/report.txt?x=16efda06680000
Signed-off-by: Siddharth Menon <simeddon@gmail.com>
---
Removed changes that was accidentally added while debugging
and reformatted the message.

 fs/hfsplus/dir.c | 3 +++
 1 file changed, 3 insertions(+)
644
--- a/fs/hfsplus/dir.c
+++ b/fs/hfsplus/dir.c
@@ -485,6 +485,9 @@ static int hfsplus_mknod(struct mnt_idmap *idmap, struct inode *dir,
 
 	mutex_lock(&sbi->vh_mutex);
 	inode = hfsplus_new_inode(dir->i_sb, dir, mode);
+	if (test_bit(HFSPLUS_SB_HFSX, &sbi->flags))
+		HFSPLUS_I(dir)->subfolders = 0;
+
 	if (!inode)
 		goto out;
 
-- 
2.39.2

