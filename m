Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E0725622
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 28 Jul 2024 17:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722187824; cv=none; b=ajqMFAeHLZWcUWSoyvNtAm7WawLKm/6De7r7IJEh0bp9i2dz6jL24t7UnuZwggydiLX/un91B8tizZz3cUqTD+J4qQYFNITMvf6bvsPXxlw5oNNKqGi212AfB0NsugmpD/Ug0sydGNirgemDW5ILly71W3wul5EBFu+Z5E0jjVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722187824; c=relaxed/simple;
	bh=2AD3MMNZqnt70MEWY//mRnCq/uSFCw9XkUjYoZqo9bk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mSptRV5/qoEsQ0NYVfFI9lGDl9+Y9vAcEWjXz0EGrvtKwcX4VJBP8kEIR6Tdaw6Pz2kVxVHuZ2GmV1NJ/YEur+iu5eD+5dpqbmf5u/SdmoHGrlw2QYryeBGpq0b+DTPdgo8TFWnDbTppieQ+/O2ER/BhDrYDm8jiDW1dQrmYoN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Do1Kt7TH; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Do1Kt7TH"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D06C60611
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 28 Jul 2024 17:30:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yZvm28H0Sm4l for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 Jul 2024 17:30:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=simeddon@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AC8DE605CA
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC8DE605CA
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Do1Kt7TH
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	by smtp3.osuosl.org (Postfix) with ESMTPS id AC8DE605CA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 28 Jul 2024 17:30:21 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7a1be7b5d70so1675681a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 28 Jul 2024 10:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722187821; x=1722792621; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:commitdate:commit:authordate:author
         :mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6wiv0nloWjoHcpjHzBuCqTkOOAP2x8qTq7AZF6uuHjQ=;
        b=Do1Kt7THaJYKStYhYV/iIoHsMznm41kGXaDlRZd+tVvlrLZyHSev8AGAB5DLT6nyZR
         I+++DVMrFCWwCmqxQw0z/8ZgqB6LMWKke0dGBhs6xPgC0yZ9LeRifUPhdJzn0PPKD8F/
         VYj5SKlHu6arZxzaeGEc2gFV30TuN0zaBXXfdVJ/cVV3QxzKtTIsqeM1epr8pVTIC5EU
         iZpWhmldLR2qX602tc8bFDNV3FcYfgdndeYBuXFRuxmFQ23fV25fTkzr2MNZNrvwQqWH
         Le6Fg/bDWIdwqHW+QvxgcOBl7Uwd7Z+4kGvE9QgrMilTa8uA3AMA+B3JA4ZP9v4FgI2k
         kVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722187821; x=1722792621;
        h=content-transfer-encoding:commitdate:commit:authordate:author
         :mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6wiv0nloWjoHcpjHzBuCqTkOOAP2x8qTq7AZF6uuHjQ=;
        b=eQbJk6hGiCnhuebzq1UpMADWqUKCnQqJgtrwoU1F9QQE6MW+7w6OCU7jPeiViB+iPt
         YwSI0SU7R2ysBF3cJd/Ed9+K62yT2exV/IdkLBLay6b4AZR6s75SBPkqRDVDFQRryZ26
         m2P1CylOuLcXTwFacr3dLkDLyuNSAki+saDRxGAU1l9et7QuiOTJ/e2dtdDc0gwCYucT
         3NYXjVHIgMAA0zKJA2KjU4HudzbxQVexwOaCDiGLv49ZbjdZvAdyqdkXT4UnyZKNDi+Y
         Bnh/BmOQxZkv31jB/YumN8duS5wKUXtGlfY29a/OfXfzJ23QdYXkLzVDAqxrCHcFZVuR
         0Fhw==
X-Gm-Message-State: AOJu0YyH8WvNfJQHTd8WKDAuZAkO+pdfjQDpkErieblp9JcT1+gsVYo3
	dUwUhFDJC7j4kqgOVCy0Md9L5WyWlwL8QPbVXTVJTPz8Qa1skQxm
X-Google-Smtp-Source: AGHT+IEfMq8QoH5lOT2NRgNitnLWzz70aYsDLkP3r7fNq48j/yoIHV/k94tN1APtPUzLmahR4gqBRw==
X-Received: by 2002:a05:6a20:918e:b0:1be:c41d:b6b7 with SMTP id adf61e73a8af0-1c4a0f4b3aamr8625612637.19.1722187820740;
        Sun, 28 Jul 2024 10:30:20 -0700 (PDT)
Received: from BiscuitBobby.am.students.amrita.edu ([175.184.253.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70eca8af213sm3169860b3a.180.2024.07.28.10.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jul 2024 10:30:20 -0700 (PDT)
From: Siddharth Menon <simeddon@gmail.com>
To: linux-fsdevel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	syzbot+fdedff847a0e5e84c39f@syzkaller.appspotmail.com,
	Siddharth Menon <simeddon@gmail.com>
Subject: [PATCH v3] hfsplus: Initialize subfolders value in hfsplus_init_once
Date: Sun, 28 Jul 2024 22:59:13 +0530
Message-Id: <20240728172910.483823-1-simeddon@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Author:     Siddharth Menon <simeddon@gmail.com>
AuthorDate: Sun Jul 28 17:05:40 2024 +0530
Commit:     41b1c7e0a2b4907dd7f1af4bb319fe9d33dd76cf
CommitDate: Sun Jul 28 17:05:40 2024 +0530
Content-Transfer-Encoding: 8bit

Addresses KMSAN uninit-value error in hfsplus_delete_cat
discovered by syzbot while fuzzing. It is triggered by 
`hfsplus_subfolders_dec` due to uninitialized value of the subfolders 
attribute of the hfsplus_inode_info struct created by 
`hfsplus_init_once`.

Fixes: https://syzkaller.appspot.com/bug?extid=fdedff847a0e5e84c39f
Reported-by: syzbot+fdedff847a0e5e84c39f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/x/report.txt?x=16efda06680000
Signed-off-by: Siddharth Menon <simeddon@gmail.com>
---
Updated commit to be more descriptive of the issue being fixed and 
initialize subfolders value at a hfsplus_init_once
 fs/hfsplus/super.c | 1 +
 1 file changed, 1 insertion(+)

diffhfsplus_init_onceus/super.c b/fs/hfsplus/super c
index 97920202790f..24e58de21 a hfsplus_init_oncehfsplus/super.c
+++ b/fs/hfsplus/super.c
@@ -661,6 +661,7 @@ static void hfsplus_init_once(void *p)
 	struct hfsplus_inode_info *i = p;
 
 	inode_init_once(&i->vfs_inode);
+	i->subfolders = 0;
 }
 
 static int __init init_hfsplus_fs(void)
-- 
2.39.2

