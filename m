Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E00AC8F3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 04:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QpjrKNmU"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B171B60EFC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 04:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B171B60EFC
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QpjrKNmU
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PnEFTSAy7lmH
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  8 Nov 2023 04:46:05 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1F4BF60EF9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 04:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F4BF60EF9
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1cc13149621so13856525ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 07 Nov 2023 20:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699418764; x=1700023564; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AccMyh+RlaZEsXK1ML+1emsIzpOUjcybMBaau+EZXEI=;
        b=QpjrKNmUmflPb4EpaieV+pEHANW4lHXiE9EGn9zKvU0+ogrB/Hot6MTEHgkxNllbPL
         i1kuRadBoWhXrIbRpGKVrZP8NSogzU9YltPFt4ngm4YKstjgedj2FGZ55Gi8KTGTO8kr
         GAlAsdxCdlJntvQcpZzxvnIBTOn7Ru8d+UcBd8cb6Z8QC51jJiK13pILbaH4JCDDO/F4
         F/JFu2Zrva3e8caMwzuRmc4OmTZBN7Ju9v5Gdt+gsw0yau/Ou0iHq6SBF5HG99bAuLga
         AnTJvnVlVcYBXTLh4B14S8ZEPPPCSWb3Q3hjM47Eg/8Q2t4ovtMRK1V2WvnUbw3l5to+
         Wo2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699418764; x=1700023564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AccMyh+RlaZEsXK1ML+1emsIzpOUjcybMBaau+EZXEI=;
        b=CQEeoY6wNhNdCnamllb+HSmPypjZtRDk57hdSMoBODyrMXY0/6bLvEPTmHhOby+9Wv
         VolSHDfvrcQ6em9rofP5SQLNSUuoprZmatxwINKD97R1wXX/9G62+eME25oyt/HcZ83U
         w8CHFNVObpBmQIzuhwe26+VygVBN2W1nfnOxlMln7iBEWwt+yuGjUYM1eQ2+mvE0hUSY
         JTwC8HlG97zr1Q4DLLNhpeqtyjlCaz97ZZuuMCgTMG1OPQVOHhvmM2B8jwbBBzEv21hY
         Qrznhl4mdAjU5Vg2THUl6YEruNKbVR6Smv6tNMVaaidEcUAV3Ew6I4aj5K1hlW74sTSp
         BDuA==
X-Gm-Message-State: AOJu0YwxDtLxbEO8uL8vTOnYrGfWf4Suxhl1ruraEYdJV42+tqu485EU
	uXkjggr0E5ywDJ+qrq+l0SM=
X-Google-Smtp-Source: AGHT+IHTBdEucosqnOg7K+garwd4Fwx8/Q/fzzgOpu7ehbtJq8I2JmalwcBjZ5QvjkrmGKJFEj/H8g==
X-Received: by 2002:a17:902:d2c4:b0:1cc:277f:b4f6 with SMTP id n4-20020a170902d2c400b001cc277fb4f6mr1000152plc.6.1699418764403;
        Tue, 07 Nov 2023 20:46:04 -0800 (PST)
Received: from abhinav.. ([103.75.161.208])
        by smtp.gmail.com with ESMTPSA id n15-20020a170903110f00b001cc32261bdcsm666079plh.248.2023.11.07.20.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 20:46:04 -0800 (PST)
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	dan.j.williams@intel.com,
	willy@infradead.org,
	jack@suse.cz
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Abhinav Singh <singhabhinav9051571833@gmail.com>
Subject: [PATCH] fs : Fix warning using plain integer as NULL
Date: Wed,  8 Nov 2023 10:15:50 +0530
Message-Id: <20231108044550.1006555-1-singhabhinav9051571833@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sparse static analysis tools generate a warning with this message
"Using plain integer as NULL pointer". In this case this warning is
being shown because we are trying to initialize  pointer to NULL using
integer value 0.

Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
---
 fs/dax.c       | 2 +-
 fs/direct-io.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 3380b43cb6bb..423fc1607dfa 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -1128,7 +1128,7 @@ static int dax_iomap_copy_around(loff_t pos, uint64_t length, size_t align_size,
 	/* zero the edges if srcmap is a HOLE or IOMAP_UNWRITTEN */
 	bool zero_edge = srcmap->flags & IOMAP_F_SHARED ||
 			 srcmap->type == IOMAP_UNWRITTEN;
-	void *saddr = 0;
+	void *saddr = NULL;
 	int ret = 0;
 
 	if (!zero_edge) {
diff --git a/fs/direct-io.c b/fs/direct-io.c
index 20533266ade6..60456263a338 100644
--- a/fs/direct-io.c
+++ b/fs/direct-io.c
@@ -1114,7 +1114,7 @@ ssize_t __blockdev_direct_IO(struct kiocb *iocb, struct inode *inode,
 	loff_t offset = iocb->ki_pos;
 	const loff_t end = offset + count;
 	struct dio *dio;
-	struct dio_submit sdio = { 0, };
+	struct dio_submit sdio = { NULL, };
 	struct buffer_head map_bh = { 0, };
 	struct blk_plug plug;
 	unsigned long align = offset | iov_iter_alignment(iter);
-- 
2.39.2

