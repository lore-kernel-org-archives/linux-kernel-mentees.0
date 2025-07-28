Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1376F1A254E
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Jul 2025 15:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753717290; cv=none; b=FGqV2t8SWlnnwOT/IQLMz6ynO1oNnB3U/08Me8Ai9Cwy1zgAYfOnwwUd6lBK2BzImTPjq/nKTCvqpfNKURvB7CR9ys9sTyJxc6Z7AACzNEOFUK+2Of7h98/8GWtL9ui6mxmMEM73CiZXBO4ooknRw/gmqrSteQuzRoV4izbV0E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753717290; c=relaxed/simple;
	bh=rMZI/++Sl83oEviYROVHczJ3NA9sNaqcT1YdK0dP1Q0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=okugGTij158/JyyYGyatG59NlQcP5V0SrdlVujhJpL7qmMSaMQsFD+gDuw+RuisbPElHyBqb8mdQ7VuOzZb6hO6HjjlT3+idrt2p+47h7vm0k+3i1dTOahsHvZir3w3Wobceoha3PCtvRgBMu5mT2jYfV7mekEA7bHlWql3tqdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLp0PPRs; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLp0PPRs"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-23fe9a5e5e8so14084985ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Jul 2025 08:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753717288; x=1754322088; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lf4c4+X3SHCf0c7CaWo3n9zdv/g/JaUx8MF3KOPrPUg=;
        b=bLp0PPRsK8tjw0jIdoIMCmGfklG3vhssA6STCGzCNhhVwAvQrd3FENu89N5ymMeuqG
         xHC8rSCx0BM3B+dsXEavZPSsMTUHaACXww6ExnBKu5gNA03Jl2t2q36jPQKaBXXmtfHC
         yaBTDywiOHF+IiDXBOxrqiLN9V8jOLfTtEWpGEW5o5h7ERCfXkPAis3ky2yp1RHab0Mg
         wIH/9a2cXnmSYKkGlzeJ3U/n8RBfCmxQhlU9sR79yCx8Ngnzjo53OJBjROAGwIuIn29Q
         FoXfquqv71LJp1iegHvwI5VdlYgvvy68YK3rgmBr4oOFT+txFon9/ihE5MUxyxq3SRbI
         jCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753717288; x=1754322088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lf4c4+X3SHCf0c7CaWo3n9zdv/g/JaUx8MF3KOPrPUg=;
        b=O4NKVMSxTc6MFQ4NuYqe5WkxGMfdYdxRxMaPNBJ/2fV74uBxUG8ljtYbtvuKpNhUbb
         6PJJEMXEd5azLvqOHs29glImvdkxgwj/4UM4AjDSxk4B+B9UufOJYIz97qfjFjBWRS3/
         /+iOHYCcxXHOtyb5Hvvrl+u+t+PJYy1XBPlce9Nts9WRHG+Vb3BbIMn2fK+d4fVYTwg5
         ApzchPb2FFBUcVztBXFyGFx7yNcpnbP7xK1hn+/4smaBcLBvsFHi/CMyed9xBHG9v+JR
         VVWS7R66mOXSkcXmoOb1mzH7j00TztVTBeEC+IVrdMEnPJamncKMoTaO7XGvCXStyp/Y
         sVxw==
X-Forwarded-Encrypted: i=1; AJvYcCXdQ11W4i05WCIKeDbn1VvsD7CMq430cSV2qeS3K7PyYLlfGeNkUlzKjQt8IPtY/Ep8eXb/d99QYRqEYNMQVO8gWb0ibg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyrPwL9GnmVwZN66IuUn8O0AC/j8KPuqRv1GV8qmcM9/JSot02O
	61VOU/holENC++o+bU0ouiooVoVPZdIe9x+f/AP8O2eOiFp+e9VAXtaZ
X-Gm-Gg: ASbGncu0lyNxGuOSZ6KxNVe5mxYYTs8LvrrNdvrTrfZde2/FpQgSu8NShEXYi2V2i9T
	si5SXbV8fJ78qcQ5lBnPbw4v4zIxoJZ6EQF8a2lt/o2Vwk6JWbHVhF3mNDfWsN2Bf2V0N7qobMr
	ZFbTKPKPw1n6hX8900WNtsRh+geH8oZXUL8jveYg/RXmj91zDClJLFwWai7xQkr67mAWuFltTo2
	mprEHJn6cCS7vF4qT4vmu4BBEr0UYomDonFrfBkDubCZIgFf2DZNs3HQ8anU4fBwy1Um8QHzW68
	LbLHgd/NAszV1c0Rajya0VgwR254q6Jd9w1V5SmvnW/EkLHYOUBGyA2z9fupEF+hFUWwi0q411o
	oyolMh+6pmggvPu+1JRScqflnJU98rQ==
X-Google-Smtp-Source: AGHT+IHHYZnbOE3Rnoq0U8uMtLJaRU8HxAJqhVzzJC1VVDJaztpfjHvSCzur8LQWHtjsVVHq5/0lmA==
X-Received: by 2002:a17:903:234c:b0:237:cc75:77b0 with SMTP id d9443c01a7336-23fb3129b41mr159525605ad.30.1753717287840;
        Mon, 28 Jul 2025 08:41:27 -0700 (PDT)
Received: from archlinux ([205.254.163.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2400a07224esm33226435ad.212.2025.07.28.08.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 08:41:27 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: tytso@mit.edu,
	adilger.kernel@dilger.ca,
	linux-ext4@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] fs/ext4: remove unused variable 'de' in ext4_init_new_dir()
Date: Mon, 28 Jul 2025 21:11:06 +0530
Message-ID: <20250728154106.55730-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable 'de' was declared but never used in the ext4_init_new_dir()
function, causing a compiler warning:
variable 'de' set but not used [-Werror=unused-but-set-variable]
Remove the unused declaration to clean up the code and fix the warning.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 fs/ext4/namei.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index d83f91b62317..bb2370829928 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -2965,7 +2965,6 @@ int ext4_init_new_dir(handle_t *handle, struct inode *dir,
 			     struct inode *inode)
 {
 	struct buffer_head *dir_block = NULL;
-	struct ext4_dir_entry_2 *de;
 	ext4_lblk_t block = 0;
 	int err;
 
@@ -2982,7 +2981,6 @@ int ext4_init_new_dir(handle_t *handle, struct inode *dir,
 	dir_block = ext4_append(handle, inode, &block);
 	if (IS_ERR(dir_block))
 		return PTR_ERR(dir_block);
-	de = (struct ext4_dir_entry_2 *)dir_block->b_data;
 	err = ext4_init_dirblock(handle, inode, dir_block, dir->i_ino, NULL, 0);
 	if (err)
 		goto out;
-- 
2.50.1

