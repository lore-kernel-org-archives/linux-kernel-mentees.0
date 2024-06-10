Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B0C7470
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 10 Jun 2024 03:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717990965; cv=none; b=FtpISsTItiTF89I/txjeB5q8paJx3yA5gHo3EoasLmRtfsjNxeTKUGN1P6lSwCSHBGKgHPqqVKVdNgwGQ/VZJICbzcUEQTK5YRVZOJOQC9owy8KYXWt4O1aRyessaygdRDP6v8uEmIDu++tqeXvdaP+dEN1h8Ploz7ZunFAxEsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717990965; c=relaxed/simple;
	bh=t3VdJEotzI4Ro0q+MWskZGZL8F2LoDZJnFJJK1Eoxis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l2pVTY6e5GhJ/PjPpnT6nprg75+1cewOskFTzMvcggPQ50+Esfg62mFcfgmCafY6M8tbCYqBLVaS4cIyM8g+1KOAZdoxpCAJAESGy6QopnCWvcogIRSrJf/bBO6vPloNM7Fy8n+LkwCsrBzcrLgLjM5Mq7288q/7blPy3GUxFaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uf5RRx0M; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uf5RRx0M"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB32140540
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 10 Jun 2024 03:42:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ao9oCiu7RxF8 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jun 2024 03:42:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::a33; helo=mail-vk1-xa33.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6268C4012F
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6268C4012F
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Uf5RRx0M
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6268C4012F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 10 Jun 2024 03:42:42 +0000 (UTC)
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-4eafded3c66so1592664e0c.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 09 Jun 2024 20:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717990961; x=1718595761; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HEbAtXZAxmPVWPII7D3ghN9eKKqyx3k0dRCLuMe3f/w=;
        b=Uf5RRx0MMbLAiwzL2Rn8tjdKmb+cg5sM2VqBwIpx01SLVRGLsM8zsye8ALB+F3nRu2
         fLM7Bl2KqgaJvgHUbnTiXEwy50u7Sm6uA4q2CA2ZtkT4fYTUQtUJ9su678pwt4Nwcvo9
         26YzeRIp6+obbPwEJOjh1LN2aBey/UD+rflAisGGiZD2Uve1s3lfZoH4kk0fZJg+ncls
         D0oBiejDLlWvmH95/g1gAOt0ng15+5CshahmywT0kjhR/y8K864qe4y+IO+yQHmB5zf2
         5DeEs04VPMaACniyutjetpL/1yfAfc8B84nHzqQziNIx+K5gk8mDwOVUOdHfiyW0ing1
         p1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717990961; x=1718595761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HEbAtXZAxmPVWPII7D3ghN9eKKqyx3k0dRCLuMe3f/w=;
        b=HxwbHN/XjJkj/z+3k8JOuUK75P6XZCy2TzBRiTj2VftMx/EOx+mo25nwY6N0dsOGXB
         BUNf0nTIfrE9kKFBMp2KVJnln8PzYziIr+4t7Ay8JuXHhPmlZZMuwXp9d+fjka8TONRQ
         UuvARAjwdFhnrxEvd+1+dbRHrq+GWlk8T5KhbBafzugqGbAowpY85E3ulsOPNHQ97HuN
         lR8/XEzg4NvbejKGTv3rZJw+HQp+jwhhOnIJluTrmZ6r4Nk87RgZKhB3cDv5lOfCKAqQ
         cEYxffLZjWGnNSGW6j7V8rZnJ8bNQ7P1moQi8PgE7RHw2hBtyKyDqHUz1PV6HWVnfE5i
         PQMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEkA+Q600u2tv+8VL8xqjihBakcKmCMb3y1cmNgnw/WSlDCWqYU9HbUTlNMpr4v8XbboxdeqgydfGWZxOS464tFj4QK81bCQGSPPzkB4hLb/R0qYZULobhA0ZgTqIN
X-Gm-Message-State: AOJu0Ywkn9vvDAhbMIB5ZSNoIFOB10FkY5IyVokYrqp6+oBucCYSZZPQ
	YJo/xhGptYaEazFFuZov4jZVJYn5yrWkYx+BMYmbcyKNysm5swgA
X-Google-Smtp-Source: AGHT+IGztUNaGjZFWUnDL7xh/FztbOYUcGyLwc5aSOAng5l2BJ9dXPkCUM6X/FcwsIgBf2udZwwY2w==
X-Received: by 2002:a05:6122:903:b0:4d3:39c3:717c with SMTP id 71dfb90a1353d-4eb5621cffamr8039667e0c.1.1717990959373;
        Sun, 09 Jun 2024 20:42:39 -0700 (PDT)
Received: from x13.lan (2603-9001-5c02-c5bc-0000-0000-0000-1b5d.inf6.spectrum.com. [2603:9001:5c02:c5bc::1b5d])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-4eb5e95c169sm888024e0c.17.2024.06.09.20.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 20:42:39 -0700 (PDT)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: dushistov@mail.ru,
	skhan@linuxfoundation.org
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ufs: Use LUT for dir entry types
Date: Sun,  9 Jun 2024 23:42:14 -0400
Message-ID: <20240610034219.14711-1-luis.hernandez093@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the original TODO, replacing the switch statement with a lookup
table results in more concise mapping logic and improved performance.

ufs_mode_to_dt maps file mode bits to directory entry types. Indices are
created by right shifting 12 bits to isolate the higher-order bits in
order to use smaller indexing values.
e.g. S_IFSOCK >> FT_SHIFT => 0140000 >> 12 = 1100

Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
---
 fs/ufs/util.h | 46 +++++++++++++++++++---------------------------
 1 file changed, 19 insertions(+), 27 deletions(-)

diff --git a/fs/ufs/util.h b/fs/ufs/util.h
index 0ecd2ed792f5..caa843373191 100644
--- a/fs/ufs/util.h
+++ b/fs/ufs/util.h
@@ -7,10 +7,13 @@
  * Charles University, Faculty of Mathematics and Physics
  */
 
+#include <linux/array_size.h>
 #include <linux/buffer_head.h>
 #include <linux/fs.h>
 #include "swab.h"
 
+#define FT_SHIFT 12
+
 /*
  * functions used for retyping
  */
@@ -146,40 +149,29 @@ ufs_set_de_namlen(struct super_block *sb, struct ufs_dir_entry *de, u16 value)
 		de->d_u.d_44.d_namlen = value; /* XXX this seems wrong */
 }
 
+static const unsigned char ufs_mode_to_dt[] = {
+	[S_IFSOCK >> FT_SHIFT] = DT_SOCK,
+	[S_IFLNK >> FT_SHIFT] = DT_LNK,
+	[S_IFREG >> FT_SHIFT] = DT_REG,
+	[S_IFBLK >> FT_SHIFT] = DT_BLK,
+	[S_IFDIR >> FT_SHIFT] = DT_DIR,
+	[S_IFCHR >> FT_SHIFT] = DT_CHR,
+	[S_IFIFO >> FT_SHIFT] = DT_FIFO,
+	[0] = DT_UNKNOWN
+};
+
 static inline void
 ufs_set_de_type(struct super_block *sb, struct ufs_dir_entry *de, int mode)
 {
 	if ((UFS_SB(sb)->s_flags & UFS_DE_MASK) != UFS_DE_44BSD)
 		return;
 
-	/*
-	 * TODO turn this into a table lookup
-	 */
-	switch (mode & S_IFMT) {
-	case S_IFSOCK:
-		de->d_u.d_44.d_type = DT_SOCK;
-		break;
-	case S_IFLNK:
-		de->d_u.d_44.d_type = DT_LNK;
-		break;
-	case S_IFREG:
-		de->d_u.d_44.d_type = DT_REG;
-		break;
-	case S_IFBLK:
-		de->d_u.d_44.d_type = DT_BLK;
-		break;
-	case S_IFDIR:
-		de->d_u.d_44.d_type = DT_DIR;
-		break;
-	case S_IFCHR:
-		de->d_u.d_44.d_type = DT_CHR;
-		break;
-	case S_IFIFO:
-		de->d_u.d_44.d_type = DT_FIFO;
-		break;
-	default:
+	unsigned int mode_index = (mode & S_IFMT) >> FT_SHIFT;
+
+	if (mode_index < ARRAY_SIZE(ufs_mode_to_dt))
+		de->d_u.d_44.d_type = ufs_mode_to_dt[mode_index];
+	else
 		de->d_u.d_44.d_type = DT_UNKNOWN;
-	}
 }
 
 static inline u32
-- 
2.45.2

