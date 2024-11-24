Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7134A523A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Nov 2024 01:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732410321; cv=none; b=i7oAqLUI5R2KtRXRNapHUpb71PhUyx9OHJPAUa2J8dI/QyCv4l+gVKgZPJe2+s4nfarSiBhyKgUcike3koV+Rk9V7+vLPfsBMmHn0Nlq3DGnhGTcv6F5R6eqHyoApsJwfIBaYqvJqPj1XemCwf+uvAeGKfh+nACiJ6V36sHNMlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732410321; c=relaxed/simple;
	bh=Gh7q6HjTKO876keVSIn2YiK+4YAPjUAegfnAlT9dGFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kmhWctMkrF3l2w9c72bIHJU7tGfQFR51JUKJoRTwsNRnIvk+FeXXG1SoFq8EkNa9ygHPBasYRKtbekJ8De2b7ajoabOI8/cMGNbw97VNB3iVlf000589uXsSatV2XSr0POtvUDw8BqmRLCE1MirP38L2c0D6oEdS0RkMqyREHbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPRPQNrg; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPRPQNrg"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E97A847EC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Nov 2024 01:05:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E0ZQ1Xoi7jnl for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Nov 2024 01:05:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=leocstone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1006E84657
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1006E84657
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gPRPQNrg
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1006E84657
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Nov 2024 01:05:18 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2ea711a76a5so2940489a91.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Nov 2024 17:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732410318; x=1733015118; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAwEK8ckYP2jo6LfWW1LjFBbSTo2ZwCKFOg8+ckdSD0=;
        b=gPRPQNrgkC3wv6FxcFwWvWh1vaO+VoP/qDQwPaIkl6NTzoHmhlnIsBLULL84iS3e+e
         cUQN6/9r0QXwkaFNIYGCG+olgvN6aJJoKVmDk1BMfbyytRUJ+In10uU4pqKzJMk/E8Kv
         0eeL6VHo8TCY1Ddffk9ABwa+E16lU9m4lxZxt5qZk1Jf3Mip+Q5/hE7CCv9zFpwka6bw
         M6+NsFJO7I1lTGj76SbIcuPq2OLrnroxl0dpl59aZBNiwV9zC3I/YsBWGFpiFTbi+FRJ
         fWulBbrTI1arCxMF0HCNgNXLXvy++M3lBqBO7wexCfCYGWOza620ADFg9E61a8FbB6La
         WeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732410318; x=1733015118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAwEK8ckYP2jo6LfWW1LjFBbSTo2ZwCKFOg8+ckdSD0=;
        b=St14w+n38ALN8HSFByBRYKn4K+biVwf/ZAVLEiimqzCTuBqG1pLW2sRI9oQ+0KDh2R
         9xAESZoSlGqzszK6oOz/A5Td/SQEQNMUm0dbo0gretmWLFIpjmBj1xIS38pHeRISrL/b
         v0rlmL3w7UxA2WxwBcOFwPSroVO2CZ4mwwFxb7Wr6MfSmWqOA9kenowzEt+7CobCKw69
         5D1pLmmB662EmFz/oUQbW82x0Vm5VZN6PdlgIi5GcNqXmxPnHqBVQyzr+PbNjtRbhxXt
         n7VIpJLL6E7DJDcX7zeJRgL7abguw7WfZxu/7hlg6tI7TOrdpNJ/50pSp/FurRCvLVx7
         VNpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi3ysMFcjHXZDGfjGixtHnmrnvZavGIx/KEtW2oALuOG1w6UlOcwFMv+NvKOK1FzCKkANVDn08Qb+H4y6s/OBTkPcpvA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yww2g1qogE4TiQo6d1w+TJgwViZQ9MlYOEp93N2ikG5oCL/4v/A
	tYh8jQcCh6PTdOcdQb2rIdjouzmTJg6sttx+DNGMRIS+RyMZDEPx
X-Gm-Gg: ASbGncuqsNJoSutL0T/bKPRCvKlmmX9ltKXNJqHrWCXcQRo5oO3PJuvGI44APSDypbs
	SE5tbmLe25U80RWkda6YYZFpfD23HM1fA9OJTmI51mDDhYzJHXoOHSdnjWa7leMcV7FuZT7Lg/B
	kxHOav8tChL8FmE57y4cUGXIqeqXdZ68pyAO38OYMNWjNz7Zvbk+hc6Hq3ZfAidU5yWGFHfev/d
	neWPAJ4Mb8tIJOm/oyXRXqXa/wJ2SI3ggaDsR4+6pMZGrhqcIuMLYIPkI3b1yNzBQ==
X-Google-Smtp-Source: AGHT+IF89OxBOuRBB9ZUdI9OCWFJ9uXfDxkS8V8O6OpzKlAmvgQ8cJW7GVdnY9cTbMAsgtRvxroHgw==
X-Received: by 2002:a17:90b:4a92:b0:2ea:4150:3f80 with SMTP id 98e67ed59e1d1-2eb0e330d8bmr10102168a91.18.1732410318077;
        Sat, 23 Nov 2024 17:05:18 -0800 (PST)
Received: from tc.hsd1.or.comcast.net ([2601:1c2:c104:170:86c6:5b62:b5b7:ec1a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de479102sm3855532b3a.45.2024.11.23.17.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 17:05:17 -0800 (PST)
From: Leo Stone <leocstone@gmail.com>
To: syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com,
	jaegeuk@kernel.org,
	chao@kernel.org
Cc: Leo Stone <leocstone@gmail.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	anupnewsmail@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] f2fs: Add check for deleted inode
Date: Sat, 23 Nov 2024 17:04:56 -0800
Message-ID: <20241124010459.23283-1-leocstone@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: 6740a00c.050a0220.363a1b.0143.GAE@google.com
References: 6740a00c.050a0220.363a1b.0143.GAE@google.com
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The syzbot reproducer mounts a f2fs image, then tries to unlink an
existing file. However, the unlinked file already has a link count of 0
when it is read for the first time in do_read_inode().

Add a check to sanity_check_inode() for i_nlink == 0.

#syz test

Reported-by: syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b01a36acd7007e273a83
Fixes: 4c8ff7095bef ("f2fs: support data compression")
Signed-off-by: Leo Stone <leocstone@gmail.com>
---
 fs/f2fs/inode.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 1ed86df343a5..65f1dc32f173 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -372,6 +372,12 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		return false;
 	}
 
+	if (inode->i_nlink == 0) {
+		f2fs_warn(sbi, "%s: inode (ino=%lx) has a link count of 0",
+			  __func__, inode->i_ino);
+		return false;
+	}
+
 	return true;
 }
 
-- 
2.43.0

