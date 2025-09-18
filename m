Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D372F069B
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 18 Sep 2025 20:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758228536; cv=none; b=mxmj60XwEokieSv3AbHNkz3pDh+gIz9y3v9Vsq2i2EbIsMT7OlXUcBdgzxb+RDO+Q4rP32WIFEdYryB0pmnkK/NIBAXYAaqZVJOGoYYXmZDtZJ7S9XsA8DA6/nm33A3YYo+mC9KetCfL+tQRGb8P+8Y1pnYaKkRIkU84VoOgmSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758228536; c=relaxed/simple;
	bh=R8VdHAizxiIZiX4FLFq7J/L0lVxWiWwNMZ7Ks/nE3G0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uXu44zoiZAgsjQOKL6s5e5Ipa7q4uERliHnyC98/0G5pl4pTRq6x4Lhia4vRjZTJXzumSRzdCiNUuhjNmaC7HOmKk2vjuDDW5XsLVHsTHdL6zj/510qtI/o9f1sf+mYRdnJzYJeH4tptPCC0HEaexamt9MQY46KTji7GLbrjTn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJECGoDS; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJECGoDS"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b5507d3ccd8so904673a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 18 Sep 2025 13:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758228534; x=1758833334; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RWvpfkXVsTXpCF10bCqC7yVTYFDAtVdXNdJBDL/F03g=;
        b=FJECGoDS93XwSdfOfm4SFSBKcvXUP98mDyqfE+TbnfBtuF1BhvVLyPlej6JfavFFLK
         cP8V0Rkl/QS2aGZ9rqWZ4wHSQv8sDVb5w/iqTR5iyIFtFm28sZThPYryaWTwK2cU6d55
         NVJx/K8mKrkpM+mcUq/N6+fQ6G66fgAu3+sPia4jFPgCxXiE7DtNDf9y9hcL3q2sSg2K
         7apfc1coA0OXE7mA+Y+rk+lN1RqT0IgS+dOAhqQIyGTVFbCkvbNN4SeOknl0ZFxh9KtO
         ZwFVbTzwBeJJ0AWoVpeguytJYKRVavvwzZnPEPeR2BE7CPK6ix0dldvWwyq56FxJcDk0
         4lYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758228534; x=1758833334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RWvpfkXVsTXpCF10bCqC7yVTYFDAtVdXNdJBDL/F03g=;
        b=NkSRtp3bw7SgnN6T6co2+DaQpxLT8Ldia2oCc3y2EUm3wzfke+gUwFKxYAYxvMkBii
         zZMeftSM9ynKGa+aWMjYBJfd6MTCrIeozOmBohm+S6K+nCp1lvgarz3E7cigWyzptYqc
         iE+0mXuCb1OHBekrtbEd5xSDWgUBGUYZpYwVFTBi1w7fYiinfQkAo18XfAej4cQXD41G
         NasUhqohAabT4JPak+qTtM8IhAC75R+75Qy0KKDxzhCCLqV1MDaI5U7dds89J9/P5hPu
         QOHQcFhjgEhuHvq/2BwAjAnSfd0YXqPI0inOrryUmL9KLiSNUwzP70SZUpNvD7BuGtho
         QsWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqW/VBUqy0+5hP6TXAsmVyt1ejp9xqrtMKJlFpvZKGIKRSW2JeTmUWz6/5MD8O7JZ0PAV92z48dHswFYRnuh6jhfb5ag==@lists.linux.dev
X-Gm-Message-State: AOJu0YxM3EdwFrmi9chsJQNg/RhFqTbM3TtgYTfoF/TQH8JUzyBEzlR/
	WmeBwRRQE77mDaE4juxCYsUBGhXZCkeYDCN9zmShYjXK/ev7Riy7FvUc3amekxdj
X-Gm-Gg: ASbGncvg8VJz2zP/VAey/Le26KxMgc5pMgryZWSy/KJjdTPq93CYDOXrOa4FsB1y+KM
	ZwBW6eLCtP0ycIY9xbzP8c6BDbpbpJ7ZOJF14acOyOkLt8S7zrjXLFY+fKBDRhIMD4BYfwJF9aB
	6TcaWoy0GdUlBvG0Gx+yO/19XqSKtqeOnBXzawd64LlAH8+zV10/357dRikVhWEJnWfrhQgdkXR
	V8VVLrt0xCv8csI1qQv2Z23WIB4tkYdWeRnJkhw1fSaUx+ujwoaiYd6FPrYwBwbdMccHoGwrbh6
	YmqWWdYesWdUNorMorufOi7P2eo/fm4r3xzS6KUY/x5LigqoF9DvDLYu8+rqdKTsDyPZSLqgZ94
	2BwwhVN0hoJK8nw3aGd6L1YY8s6/9Nx3dFWwSiVsN26BXSDJtCcuCie1VMcs99XryTSQBzYMyfQ
	vW5yRqWF7uSDDiUsgW1vQRTE6vI4NkOFc7elSXQs4m3o99
X-Google-Smtp-Source: AGHT+IGvApn9NcuvVzGprdBHvz9fgjbBfoh2S7GiEqj/2hx5hOyGCmpC/rOdk8KdIWmY96AzPPcNKQ==
X-Received: by 2002:a17:903:2ecf:b0:267:776b:a31a with SMTP id d9443c01a7336-269ba517048mr11002435ad.29.1758228534309;
        Thu, 18 Sep 2025 13:48:54 -0700 (PDT)
Received: from crl-3.node2.local ([125.63.65.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980368ef4sm34486625ad.149.2025.09.18.13.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 13:48:53 -0700 (PDT)
From: Kriish Sharma <kriish.sharma2006@gmail.com>
To: agruenba@redhat.com
Cc: gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	Kriish Sharma <kriish.sharma2006@gmail.com>,
	syzbot+7567dc5c8aa8f68bde74@syzkaller.appspotmail.com
Subject: [PATCH] gfs2: add bounds check for rd_length in compute_bitstructs()
Date: Thu, 18 Sep 2025 20:48:30 +0000
Message-Id: <20250918204830.229918-1-kriish.sharma2006@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

compute_bitstructs() allocates an array of gfs2_bitmap structures
using kcalloc(). The function only checked for length == 0 but did not
guard against excessively large length values.

If rd_length is too large, the multiplication inside
kcalloc(length, sizeof(struct gfs2_bitmap), GFP_NOFS) can exceed
KMALLOC_MAX_SIZE. This leads to the allocator calculating an order
greater than MAX_ORDER when calling get_order(), which is invalid.
As a result, __alloc_pages() warns about the bad request.

This patch adds an explicit check that rd_length is not only non-zero
but also within the maximum safe limit for kmalloc_array():
    length <= KMALLOC_MAX_SIZE / sizeof(struct gfs2_bitmap)

This ensures that get_order() is only ever called with a valid size,
resulting in an allocation order within MAX_ORDER

Fixes: b9158815de52 ("Merge tag 'char-misc-6.9-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc")
Reported-by: syzbot+7567dc5c8aa8f68bde74@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7567dc5c8aa8f68bde74

Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>
---
 fs/gfs2/rgrp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 26d6c1eea559..a879e8030568 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -760,7 +760,7 @@ static int compute_bitstructs(struct gfs2_rgrpd *rgd)
 	u32 bytes_left, bytes;
 	int x;
 
-	if (!length)
+	if (!length || length > KMALLOC_MAX_SIZE / sizeof(struct gfs2_bitmap))
 		return -EINVAL;
 
 	rgd->rd_bits = kcalloc(length, sizeof(struct gfs2_bitmap), GFP_NOFS);
-- 
2.34.1

