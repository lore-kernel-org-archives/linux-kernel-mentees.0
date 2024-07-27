Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88593156CE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 05:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722057918; cv=none; b=UYU/8BsPlsJ8JBtbWSQlPYh5oKTY/ODnEfWCH9VtDxlB2dNGaJnUCXVRMO1Fh6r3nBBkaUX3baI3ILFN5d7k0UN1PLu2A0uWXybTHjmuKXfrjXYht8fgjuc4rH5k8ndpBOSgaLKDRhpOEPgMxIRnMA6unmJUJPUR3XQOofbjnsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722057918; c=relaxed/simple;
	bh=5ofRoWDFlDBxbXA/pSw5dPo+BMYbpKLy7/eH3DEdg1I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fJd1A1tc8bQUiL9gl9ECr/mzM3JxNxy82RlR7R/0Cp99ZVENFwjJQP0+L7H2ANBPBked7Na/N31BUlvRig/A9Ow5HuJb0ORDYK6F9bgNy+hqvNBbsq1h7m7e3nqZTxZwA+RXd7I5nRUznbHhfCtNrqro2TtxeMIfkkwb4YYqdME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Li5G3//j; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Li5G3//j"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 128816061B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 05:25:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FdUWSpIhJK2Q for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Jul 2024 05:25:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=simeddon@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 17CBB60605
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17CBB60605
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Li5G3//j
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 17CBB60605
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 05:25:15 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1fc569440e1so12181105ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 26 Jul 2024 22:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722057915; x=1722662715; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:commitdate:commit:authordate:author
         :mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uraz/Rjf7B10uQwtKk5Km/juVMq3uk/FF6/Ih+sO3gk=;
        b=Li5G3//jrB8NYGha+kVOTlR8iMAckIapytwRW31Ck8X8c6LssTAg4GSszcV52naL7a
         agPa+x38Qc/h2g1J/vWwJ27HPxshOuNdsh1EJKuOwVu2KzsMn/bHxbv++2GBdfeFaAJ6
         J/q1af283LTdg2xFpKEeLg2Jmzl7TvgpzvYYSAab3MUP4AL6+KsKfZx7hpXUvXis/aQR
         kBLtyjQFyTwLrKtbpAYOX4yDo4rZaBp/QNeYCGBr9QhqduDGLetNu0Zm0WyicpjM9oGH
         VinLDbeKQ8dSw8pStswnsAxQKAwyZ6D1cntXWkde24uUvLCLBWJZpvO2Y/8GEcEZgOU3
         UYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722057915; x=1722662715;
        h=content-transfer-encoding:commitdate:commit:authordate:author
         :mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uraz/Rjf7B10uQwtKk5Km/juVMq3uk/FF6/Ih+sO3gk=;
        b=JjpbbdXJh5PaYEQ1E+R54TEpUKa1zVga6FkOFA+ouIj2BmVQGU/tuwCiN7WwBoYOIw
         mDWBjqHUA/K47Nu3NFnY8ZbhbFNVG6EYt0NAPKeSqJ50lxtfVEIreCddz/HiZUs/EqZc
         fvClAQPInQX97YW1T3z9ed7oIBXJvzATCvvkOM962IKR0gMUYVqKFMT2B+cpIQm7eCwP
         WKgViR18Sjy+utkpfSvG1I4RegoEwURLT/bs1GelANBVmhdyYCxcAWx3C8jnxMTgcQCY
         1wxpoz/omTH2VhgW4tusF3oFimQ/enuXEhv3iPONY3/GJ3ipEX3VN0fdekpuxhakhrsU
         eO9Q==
X-Gm-Message-State: AOJu0YwyZFoVHbzR37NZw2quxI2vTA8PB4s+JPgd/tzEHRd/qHvH1+Y/
	hoqGhtDnWJN42PCjXR3aGVCHD/McQ+YFCPbJzOLgajqaGmiStZhr
X-Google-Smtp-Source: AGHT+IEMsMNXkWqi2O0PPz5uUuY0duZcf2oHVzL7FWhymEgdsnJDL9i1C5eQSF3lmeLE97a7tsk13A==
X-Received: by 2002:a17:902:f811:b0:1fd:9b96:32f5 with SMTP id d9443c01a7336-1ff0483e1f2mr17428485ad.31.1722057915021;
        Fri, 26 Jul 2024 22:25:15 -0700 (PDT)
Received: from BiscuitBobby.am.students.amrita.edu ([175.184.253.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7c8dc78sm43246965ad.4.2024.07.26.22.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 22:25:14 -0700 (PDT)
From: Siddharth Menon <simeddon@gmail.com>
To: linux-fsdevel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	syzbot+fdedff847a0e5e84c39f@syzkaller.appspotmail.com,
	Siddharth Menon <simeddon@gmail.com>
Subject: hfsplus: Initialize directory subfolders in hfsplus_mknod
Date: Sat, 27 Jul 2024 10:53:50 +0530
Message-Id: <20240727052349.74139-1-simeddon@gmail.com>
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

hfsplus: Initialize directory subfolders in hfsplus_mknod

Addresses uninitialized subfolders attribute being used in `hfsplus_subfolders_inc` and `hfsplus_subfolders_dec`.

Fixes: https://syzkaller.appspot.com/bug?extid=fdedff847a0e5e84c39f
Reported-by: syzbot+fdedff847a0e5e84c39f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/x/report.txt?x=16efda06680000
Signed-off-by: Siddharth Menon <simeddon@gmail.com>
---
 fs/hfsplus/dir.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/hfsplus/dir.c b/fs/hfsplus/dir.c
index f5c4b3e31a1c..331c4118bc8e 100644
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

