Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5873CF688
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Apr 2026 15:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777046127; cv=none; b=ZnQ3qriDihE+vC7BeJTg8zI2syaWlMqH8TwxWTDwmKxQyCGV5d52kx1a8ndBYnQPy5bmqbhgCq03JYPiF3hCOboO0C3HNTcVmaTWL2XyeHgdHXwMHAb/GCn+1shw+NQrL50x/0nX5D1cxxlZTReXvV34LV2jy9/6pQyijVTav8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777046127; c=relaxed/simple;
	bh=O+NwYZPZmuaZ8yiQJeSyI2dWI3z7BpsQ3W3NvgGRxsU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cDk9t6GFORw735WAEkCbTagn/4IopkFYaQ4rIfqwGcQQKrqu2P4P2tKpMjzVKg1nc5YIM/bkMaFc4Xm2Q54lBZ/YUX2sms2U9YRKsScB5D4VBzCed292q/9x0tut0W0SQVFmqZ3qN0ei58v7JiaIK2KlfxNAIdOtWeSYs0Nyl5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aVyb2hZH; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aVyb2hZH"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 263A78468E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Apr 2026 15:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l4yERsmOBlkN for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2026 15:55:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=abdououhbi1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4C1B184687
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C1B184687
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aVyb2hZH
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4C1B184687
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Apr 2026 15:55:25 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-44136f7a169so242481f8f.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Apr 2026 08:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777046123; x=1777650923; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EHfaM41/Ticte7TagLJMtblky2w2uHhJquIVzUhFxa4=;
        b=aVyb2hZHNmvrPEr+UxCbqMTwDlH45Ku3tBYSUNcHqdBCWCfEVE5a7yIEpWxCgIz2bA
         bxu0SsZNFKKtjVTL7moBNXblnlt0KEZgxVqfZqN34sIdTbw4TDuwrWyeGdGBY5fRZI75
         FmTRmJfLecJL6+ybwbj6Wde7f6GAXgylc150Tjo/1MRWkeS4I2laxarFUBa0uZKGvneu
         prarGnkXFKYgh8sV4shIN5aNIQu0VA3cbHTFn/DUyLkLlDE1Hdmwkl9nT83o754tMsVP
         hyXHv/Nyv6KOUJmR4RBJs4BB7U5eDBsRgxg3GFkXoz8TSQpLBkvm1DEJl9gFQNQKA5gZ
         6RSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777046123; x=1777650923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHfaM41/Ticte7TagLJMtblky2w2uHhJquIVzUhFxa4=;
        b=NfZITABIGF4WPf+TSplwT/CNgGAytojDFLGlP9M2M3RgNQ99kyzVQFm9VJtGtuiaWH
         teIhDieBgl77St5TWrKnNwNR94xWkIJi58EcUwuw5GE5PIv1JgrDgic6Qo76XZ5mMVq0
         d8zj4JYSVaTR7Pph2hSnCQYvhklLvXlFCWzpv7Wzpl/BE6XUD+puMM1pUdOE1sfXh7UQ
         0H1XzmbUhb0FZFfxEe8qItCbFhCacCl0Q5ShPFe4bKUGHSSuHsetTq1RZC3xgJrXVSF0
         Cg8kHfebLC7oqPLxcJ5APt/NiPAgOoIr4RkjXvXWRPWtiBUrQBWU6Bs35ZNUD1KTEDjQ
         6GIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+CW580+yUbie9M+z9pfx/7SNFPlFl8Neasrp1jMZsGa2hfPryVDJOjmE08SlXT1eiC0YGp8/nNdv1eRZIqaTDPlzRQMg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy8SZvSpx66s8fnURkR+qpq6MgdSAjwFeyF1xhSb1XGZ++h1jbt
	a2Z5o3a0+n8sqj5KK7oqG9oUdt3pAQNcBfLscfxC937WaTQ2Hgvp+sme
X-Gm-Gg: AeBDieun/IRb7XAxq5FWdzKL7b71c+ASm5z2UkgkTNtJcbpHzfWPmtRyjFAsA3J/KVM
	SSvhnYLmy+Edmq2TxPyviT6XGZ7TiaZkJxFpItiFDoqoPC1dbTjnTae/3/C8xC6SK0wAtPENTBr
	HRoZWKQMIgXThCOHNYeyq4OFkOtaHBdHRJ6d/NUrEG8f83z39ytXe56lT0DuYVKCYm1LEYIjvh1
	rE5OSZELvlpRSI3wW35FViMLECGmujlXUeU8yiSJbCp08mBQo/oSEYZ/FSumdJRqdPtXeRlPTFY
	Nl6IuCUOnotu6vHQxhkqd0fbarnhufBjHp+t+bX+soph30ciFWQ+jzzb4kBbq9dlu+tBg1yp+u3
	Lz56PBHB04hZaGkJYaD8BX2zNChOhtBegj2JMs5u2OXpnVZFHZgCHzSmknByAXR7iUWKtW/j0JL
	sO9UEN5KENEttgUxaJGnCxquHJ3g==
X-Received: by 2002:a05:6000:2888:b0:43d:7b90:fa21 with SMTP id ffacd0b85a97d-43fe3dcaefamr52255092f8f.12.1777046123044;
        Fri, 24 Apr 2026 08:55:23 -0700 (PDT)
Received: from kali ([41.142.67.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1365sm65244521f8f.7.2026.04.24.08.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 08:55:22 -0700 (PDT)
From: Abdellah Ouhbi <abdououhbi1@gmail.com>
To: tytso@mit.edu
Cc: linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Abdellah Ouhbi <abdououhbi1@gmail.com>
Subject: [PATCH] ext4: Use %pe to print PTR_ERR() in super.c
Date: Fri, 24 Apr 2026 16:55:08 +0100
Message-ID: <20260424155508.186235-1-abdououhbi1@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix coccicheck warning
./super.c:5981:32-39: WARNING: Consider using %pe to print PTR_ERR()

Replace %ld with %pe and PTR_ERR(bdev_file) with bdev_file pointer.
The %pe specifier automatically converts error pointers to
human-readable error names instead of raw error codes.

Signed-off-by: Abdellah Ouhbi <abdououhbi1@gmail.com>
---
 fs/ext4/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 6a77db4d3124..4b69e0879731 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -5977,8 +5977,8 @@ static struct file *ext4_get_journal_blkdev(struct super_block *sb,
 		sb, &fs_holder_ops);
 	if (IS_ERR(bdev_file)) {
 		ext4_msg(sb, KERN_ERR,
-			 "failed to open journal device unknown-block(%u,%u) %ld",
-			 MAJOR(j_dev), MINOR(j_dev), PTR_ERR(bdev_file));
+			 "failed to open journal device unknown-block(%u,%u) %pe",
+			 MAJOR(j_dev), MINOR(j_dev), bdev_file);
 		return bdev_file;
 	}
 
-- 
2.51.0

