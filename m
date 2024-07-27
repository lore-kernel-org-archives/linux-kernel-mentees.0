Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D1614290
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 05:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722056728; cv=none; b=nd23ELEXM57EcjprFazFYONFdxpL+pa4MNVK68WNeV1QGldZDGAInjsecVgwJYJsyyg8H5SEw861nlDp5NjcexZjpYUtmuCdkOISL/Oc5PJvwTgd8IucmQ8GzW4Rq3cWImje2IvuQ6txIacGhWWAV9kcam9sjQVsJUbOI9vFM5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722056728; c=relaxed/simple;
	bh=/3XHeKGDH8aOhuocuqDn0RYUe1NoHZhy+PvegfT10AA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SawgmKoBMxVjCmYEgKC4W/+TJmfZbfj5fklr7DNGOP8x2R8AhvZeSUea0IUB8C0NxRG9W9RAxN2CPYcADo8AWG7iG38L23Up7LouKPv+AQKYYwfCsHLbAs90pCD8Y379FDr32EBgrNuJb0tOdFkHgET3/Qp1WcUgfeRzRgw/Fpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3JcRH0l; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3JcRH0l"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F40360605
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 05:05:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y5ou9TZwFnvt for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Jul 2024 05:05:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=simeddon@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8652C605F9
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8652C605F9
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k3JcRH0l
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8652C605F9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 05:05:25 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1fc66fc35f2so8924905ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 26 Jul 2024 22:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722056725; x=1722661525; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:commitdate:commit:authordate:author
         :mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8fwF+sIEd+UF6XQ7f3lxitcOcqkgN3Wx/mkaFs+E/lA=;
        b=k3JcRH0lcsoTbnk66iej4uqQ6sB/AkGJ+VxST34YMTZe0AazkFXWi/hWeQmRSzSCxz
         fCeo5M/SyQZF4UjECPxDnTpRGgwVSXOuHb1RPFv7v5zpF+Il31BYMR2lJy1IDj70Net8
         DqZ1rkfDgui/QkH6sCNXCHVTCW3fUQ4JzZwZQLR3LFvYpa46P3kn3ithBMSZGXsogBMf
         pBdvYAJQbxV5JqROQWod5ZgC7pg9gXSr8XBQ/uomP3eQNgbjEFhDVaJQZ9jmdikp2DwE
         WwtvPTwWsQZQNc90Hc4df5L4sbqPgsBgxiZTLbkL09rOOfY+c78loj+/e8tZ4wfjtsL/
         7CrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722056725; x=1722661525;
        h=content-transfer-encoding:commitdate:commit:authordate:author
         :mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8fwF+sIEd+UF6XQ7f3lxitcOcqkgN3Wx/mkaFs+E/lA=;
        b=dtfRt5EBuW7vaa6syBTH4r6xjlNS4sJG4KsDLmOvvdzEQorknVtAjzBj1FVY5OjDKn
         othn5u7O5xa2MwVgGBaPjZKcQwH5GOsW/6QI1UZbFrC53UQ1DJ6RqyqJbPRtsQJzI0Kr
         lNG3C5sJzVnskl1HsS5IlAEPokPjgt5ObaPl+zsvpVLAqp0G0AaHD8aQdg1S0VI3hILP
         Uskhvhg1hw3ECPIyM1viamTnH/sQ3iFKqJPS9Kh1HE/XXxDHAH1C53RHQ83bpZddr558
         P08FK+6utSq0YtG1d/uTY2c7L++djM5IOW4FA8Tq4wOmOgMYbMnes2aJ2h7obuQVqkb+
         5GEQ==
X-Gm-Message-State: AOJu0Yyn5J7KM57ae+O1Fgawii3H/FZys0mHdCZCGAmKhC9yj2mFqAS6
	lOL3MNdJ6NGlWuaFfgBBOwhaOEJF1XJ1PYGAuPXzSEtardTk/jfB
X-Google-Smtp-Source: AGHT+IHzzJA3gjt23+LtJDbQYUn47voj2188cIn4w0mIhGxGJQTzhZ2fOwRyahcNJf8lZEMKF8xQxg==
X-Received: by 2002:a17:902:ec89:b0:1fb:d07c:64cd with SMTP id d9443c01a7336-1ff04b01a5amr31792775ad.21.1722056724623;
        Fri, 26 Jul 2024 22:05:24 -0700 (PDT)
Received: from BiscuitBobby.am.students.amrita.edu ([175.184.253.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f73554sm41864265ad.242.2024.07.26.22.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 22:05:24 -0700 (PDT)
From: Siddharth Menon <simeddon@gmail.com>
To: linux-fsdevel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Siddharth Menon <simeddon@gmail.com>
Subject: hfsplus: Initialize directory subfolders in hfsplus_mknod
Date: Sat, 27 Jul 2024 10:35:05 +0530
Message-Id: <20240727050505.68108-1-simeddon@gmail.com>
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

