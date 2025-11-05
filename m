Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EB630F929
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  5 Nov 2025 11:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762341001; cv=none; b=MECis//yuSxfG0NeTJzioV6YeDqR7tuZxovYn+K/s8Ry8e/kvZxbWXJ+5oKPQysT05z/qf4zwljmhePa8yrLkt4sygsNel1epMBXvMp0kt7WOcW5FaI2BX5mAQjcShWaO3I7S9CsdonDoRi3hLjDrLUFAal06PWwSFUgURd6I/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762341001; c=relaxed/simple;
	bh=qOUc++FbpRH9EOOvQa4AZbyk8wXb82NantRb8isyR/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lc/Zphpn7SOq0WE4sWZ4xH2lRGmzuV4HQeshKv7W8eYSLx8h1l+On68WNgQFR4ga+wtpUdMwjhObLGxG9pajcErJOCCuc5HEUJ4sjGQSJ/aj4ZHrcpNo694Y61BqkLjLNC5KEhXeA1XlDqVzlI54ZadyLo3B5MPThVuMVIU/wCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5oFRz/d; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5oFRz/d"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 978A441169
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  5 Nov 2025 11:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DpYT-ouH0MYP for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Nov 2025 11:09:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8836B41168
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8836B41168
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q5oFRz/d
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8836B41168
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  5 Nov 2025 11:09:58 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47112a73785so42605915e9.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 05 Nov 2025 03:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762340996; x=1762945796; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fNljkoDjcu+DjVHFlm8hZRjkzJt0yBrV07jD/iI+rkk=;
        b=Q5oFRz/dzYnm0Dgqf0Pg1wHyhxEVDJnRjLpbvowrWj4ojHcnsItMntAH97NMhklVu/
         dOFBmSbO4ypHiM8AEY52zXXXftntNHuezz8JOizbHC0FWR+l/bVsS6ZTfKAnEuGIkoR6
         8DzY0jSvx67wB0Jt9L0hyyFwvCUZWf86oiIDw0ngklqfmJoghODEeYyvPtVSEcMG6WeM
         3D4MoMhoBUBIH+BFrJG2ZM2YcQuq/Jgji3Sdg14PSwLjGonVFsr0KoMUzNui/zf1i/vA
         JTHAthBXhlQJlNH5LFtJ4zh0lph/5MGh89hp0u3/vSHXsUN3UPBfgKbpmH6vCYj+wyq9
         Y3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762340996; x=1762945796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fNljkoDjcu+DjVHFlm8hZRjkzJt0yBrV07jD/iI+rkk=;
        b=NqbMjtQ4GrcAp3jXN8QmqYOlWScuUSWZ2Hfc+0JP1eZOONyuPuAPLq+AJjCgYAxEfO
         IWN839K3L0JJ4frI2Oh2+ZhG3M8F0W/S+bZXqNqTCDqAQGnrKxpYkWuBxoQHqljg7wEF
         pmpNstQgG0vp5aIv5gvXKqzCejFEIQEMzhMH01xn16XEbkjF0vVKv/0YoxPPPPZv31x/
         xfeFY1HORTJgNDqkZjelwiduYpzb1T+pOQ0+sos6ltFF2CxyfqZMRqRNorL9cM2EssFv
         sj7DWtVx4PfxqC6TdAOjc+sBnhfI+9Q6VWT+W6E/xqx3a0UGnwqDstkmZxkyUtkW5Px4
         zWqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqjNjcBN6RdsjV+SaAg3+AwXQPjhGG8Fa4WrG/YmYqbw+UXDB2p2tuGAplil/2SE1A7kUTSuEhtCY3hyEoiNrtLCCSag==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy/T9cXaMHGd6o0Unfs1KkXfdRGJ3JKxU5HGlARJg3shCDcWoCJ
	t8dy3psHHb/XQSGgV9uQp7GXkYI3vcjLtPT91LIw5o1Lqa8/O9vFvSZR
X-Gm-Gg: ASbGnctimRNpZgFpSlDjSX2HFhaKI1XdhlDb5WMDW6iwKLrNWSf4xC6XIMgnmgmIY6S
	/rzGeDXayWSRjWJ5u+XcKSK4C59NABS36w7YOCHk4BFD9k/oHeuCk4hPZ8Qn2Zhr30ywYpee4Me
	qp8n/F7G8UcDtDC1Uif/ra1Qi+NcNSc+Pt1MpUA9TAOctNjRKU4tU9RfuEb0nCzvldHhbuP42qy
	kk33Mv0zpWiqFeP6hsz+RteSFr4QtdDWQRG6f8TYhtdHaPKM9wi3FDaMXAnha5ao5K8hQqknRmJ
	/frx9GN9kOF1nxMeWlvC5MeShRCcIMyAnRoCE+GuHMujLT+QLIaq+ZiTx+2cPfVA6/CKxP1LMiw
	+jpl9KoJuQix2Kk0p/Nt0//TqiaPzAkt+Ia+We+K8f15sTy4mKudqNTD8V97lFmDK78idn2tfYP
	04Jd4mEGAZv0Y=
X-Google-Smtp-Source: AGHT+IF2UxLPAaLgLuHgbIyHft9aPDsEhxD/4ZlCe6k4ng4kCQPn8kS2+g0dONw0r1xUVMNFLgkTpw==
X-Received: by 2002:a05:600d:8381:b0:46e:376c:b1f0 with SMTP id 5b1f17b1804b1-4775ce9bc74mr15632625e9.7.1762340996155;
        Wed, 05 Nov 2025 03:09:56 -0800 (PST)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c42adsm39728415e9.4.2025.11.05.03.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 03:09:55 -0800 (PST)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	khalid@kernel.org,
	stable@kernel.org,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>
Subject: [PATCH v4 0/2] f2fs: Add sanity checks before unlinking and loading inodes
Date: Wed,  5 Nov 2025 13:09:41 +0200
Message-ID: <cover.1762339963.git.zlatistiv@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is provoked by syzbot warnings caused by corrupted directory
inode with i_nlink == 1 that passes the initial sanity check which will
only mark the filesystem as corrupted in case i_nlink == 0.

Tests:
- fio/fsmark parallel create/unlink on VM with f2fs root filesystem.
- syzbot

Changelog:
  Changes from v1:
  - Rename exit label in f2fs_unlink().
  - Add sanity check in sanity_check_inode() and remove it from f2fs_iget()
    as suggested by Chao Yu in order to detect on-disk corruption early.
  https://lore.kernel.org/linux-f2fs-devel/d4b7c03c-6554-4407-b823-aecfcdf7dc3f@kernel.org/T/#t

  Changes from v2:
  - Remove i_nlink == 0 check from sanity_check_inode.
  - Wrap i_nlink == 1 in unlikely() marco.
  https://lore.kernel.org/linux-f2fs-devel/1f519357-a489-41fe-8159-a8e319aedd17@kernel.org/T/#u

  Changes from v3:
  - Replace F2FS_I_SB(inode) with already obtained f2fs_sb_info pointer.
  https://lore.kernel.org/linux-f2fs-devel/4de88613-54a2-4ef3-9b56-7963cd3e42e6@kernel.org/T/#u

Nikola Z. Ivanov (2):
  f2fs: Rename f2fs_unlink exit label
  f2fs: Add sanity checks before unlinking and loading  inodes

 fs/f2fs/inode.c |  6 ++++++
 fs/f2fs/namei.c | 29 ++++++++++++++++++-----------
 2 files changed, 24 insertions(+), 11 deletions(-)

-- 
2.51.0

