Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B982B13FE2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 10:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3bepOA9"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1958360783
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 10:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1958360783
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h3bepOA9
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7DMcYx_eW2-s
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  8 Nov 2023 10:47:53 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6D09F60761
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 10:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D09F60761
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6bd20c30831so1253909b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 08 Nov 2023 02:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699440473; x=1700045273; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbWdFo7miza+LJDE+FII5IkRlW+z6I8tgEOAp/fAi2E=;
        b=h3bepOA9O516bdUoEdVhm1R98/PIEssLJpa/ywdtp52RFOIPqkYZuwLxHjLmmInpUq
         OfC1zHKu2imBrLgIDcYC0GP0LYKeAB4dPUI4F1BEPARViXZWiLOpj8Bl5DZEfKDSCf2t
         hJ1p08uksUQCwMfe8wirkmT5+LFyKXQOEE43aLVHvQGJrjrFdmZpQejKlBFAEtQItPh+
         jE0vL1exJJtXLA4VctLnTcS958uVcWuSn9u5l+lrRoQb7GXBW5nPoSbS8Ua+ZUyQ2jvZ
         I3cRiFpDwUQG3je9PExg996RPLBcWYbJrm/RGKWm0N8poJOU3gCzx6FnDVeH0XV2f+68
         E2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440473; x=1700045273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbWdFo7miza+LJDE+FII5IkRlW+z6I8tgEOAp/fAi2E=;
        b=i4uinuORJMu/mzXlkVX5bKECm9A8A6PfW53BMnpo/988FnRiO4ZsC79G3s4UJkbrYe
         iON1+WXhDmXUJ0bTPR7ZAcN6N6aP1flLgAVpgdA3N37gUnGHGbfArp5HaFHq/D4v1xR8
         m1TYkvmO4l5IT7rN96M3ThKpTiC2vwjB9Kf02Y7BpG7uR69KxSTFcBzMP5zKL0SuOgC6
         j6sk595NR1fBmxIWxY7WkEf4jCrzysdJCn53G7NvqejcKG4DwhjcJ9X6NxO7WRi5P4rX
         Q+o+W1Y4CPyZ7+YU6tCiKFbv50/oNls/qskzO+T0Hai9huz6gLzVNzbB95JFRQW/5gCu
         8qVQ==
X-Gm-Message-State: AOJu0YzaDhloxlwLAyQT1N8iIJP9fC4+uRIygifr3b1fy1OWZoDdNyJ3
	ZSaJC49ynSAoV446MgClTmc=
X-Google-Smtp-Source: AGHT+IEakTnfI52C8pPf0ICMAQ0OdKNwvumwvOelYpYlFppmk3T3eTha1MxYy4JkbmVoaKhG3s9jxw==
X-Received: by 2002:a62:ab12:0:b0:68f:c8b3:3077 with SMTP id p18-20020a62ab12000000b0068fc8b33077mr1611102pff.1.1699440472652;
        Wed, 08 Nov 2023 02:47:52 -0800 (PST)
Received: from abhinav.. ([103.75.161.208])
        by smtp.gmail.com with ESMTPSA id fm26-20020a056a002f9a00b00694fee1011asm8617933pfb.208.2023.11.08.02.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:47:52 -0800 (PST)
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
Date: Wed,  8 Nov 2023 16:17:30 +0530
Message-Id: <20231108104730.1007713-1-singhabhinav9051571833@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231108101518.e4nriftavrhw45xk@quack3>
References: <20231108101518.e4nriftavrhw45xk@quack3>
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
Reviewed-by: Jan Kara <jack@suse.cz>
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

