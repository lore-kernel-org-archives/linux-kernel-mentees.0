Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911992F0C67
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 Aug 2025 14:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131213; cv=none; b=cXbWQ+d2sEAPFkdbzOItt1laoKscNf8vLkxWR06luL6GIT6xBxqzQAQuUJr8BVvEADFa9mBBPKWJRaykZhlLI+N3fB3G8XsL5WsFybor0HC5mQSXf5LRF5vbeoSD/Ubk+6wV6setG7WgoLo3yFYM+zfp6wpyY8la2ysCvtD9qAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131213; c=relaxed/simple;
	bh=6wDwSZQTdkZ0K6r7ARP+lPOkd/GdIG5zCPz9SFVrFE0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zcafx5MeywoRYUzM27gT+odllAWjUtCrMs5LovtTFbl+W1RKAV+aGXaBMcYXWmscq3tVOaP4SEg1imXKq3g1TRJWuqiZkYr/+M6/h45nQ98uqUnB3TugaNYVGM30owJDLahPOGge856p8BsjXMqB3rTLTxHKeaeZf3ZwgOnKZM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQKKnHMN; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQKKnHMN"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso3934000a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 Aug 2025 07:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756131210; x=1756736010; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jDPNTwpJax4vDS4+xWgLAHPOpHhyQT4nEZr7m0wZXMw=;
        b=kQKKnHMNKqRKbTt27+w9cedEaIzT4NPiEi7sN/t9nd+GSfUxEU273ybc/OXhgZBREa
         MJe7nE/J3K7rJ1X7sDvzRUhwwNeVGjB+FMI4nJfvN6L94Bo/iKTTnkTBauISMYXSoDeG
         AiHoCaoEn5Lp7EWKqhBHW84juZw2/KQCVaNE+lTkEvU46bBFM5ISPM68WZY95wihUdKU
         frir/7cf744+2BkVmyRe7uYshgdVYLoNUsLr/4heGh7lafYlL800ZSoizAQXizxjqqsN
         cgL2CYECYzooP6u6TMLiAUAkgWdUkNlDK12uxA2zseTZizmd4YLzEjJyMl0E8mT2CBUs
         RCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131210; x=1756736010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jDPNTwpJax4vDS4+xWgLAHPOpHhyQT4nEZr7m0wZXMw=;
        b=o98k806RUG9G33juf9rD9As+dRIo7qzPfXfLF1WKhg/c4PZqVYcekkkvY+TNUjxFmj
         t7Ci0oP67zTluM8F1DrHgXd8pQEJxWV1010fxOcgpy2RaHooyH8zcg4vnCkkpIpkNr5W
         aGLgq3tdbTMj14fEAsOgjN/vmLCwfszuZJuFodOyvRu3nJIdezu0Mx2Mqd7DbYzrOI4g
         TEv6GZzaFv5OHQInVWGGNN4Z1aRdvuJKS8lJ07smySVYJf5tucMOnSWfkkxntyK68o0l
         QK4UgqbSLel+5NVQXnEyVmjAkUfG6qbnWS1qPZZx+PbYa7hm81t/OmtMrLjB8m2ld7uh
         IDmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp0SLOaBeaGUnz+xJhMSNNyVLHUUGwbVQULJWRdNMWeL1xD7Sbdg4hj24PSXrmU1L5VhbT+sJ0YEmu8MtMYFwwsVAzug==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGbSNEpj1Y8TlzlPnoCVPJpUDbm0m8RQh9Nigt+vGV2eBc+JAy
	L4lec+aaNRvUqeiVNKDGTAmd18hNMHb0NxlqriALKF6bwKZ44GFFgcqQWij2Aghv
X-Gm-Gg: ASbGncsQ0WbTHvqr0IkBKXCcSeTUuxGSXw6E3jwYljddykJ0DGT0+QywPZnlF0J8FjQ
	swHg1/455J8ADUylzMfVNXzDJszGuAGyCnqd47gAp5NVbKL3mzCN8HpbRYS4AMIqM/g9qGpr5cj
	PIZPkRYgYEZOlgvJD47blFSOsxewYgTuLkqwPL/2q1euVjjV5q9FdmVeyIwL4yGo6kbqRKuSTNg
	1YHn53fembQsw3w6eHzewi1P60JDfslskV9vTNqdJb2+8YTrLGW0zbzzpsKzyYqL9669cUeyM/q
	GtQIW1Xa7GetTX9XKam9p2qb833gIJH3da51QYwwXsEo0jD7M9jJjuGBZLlrDMqQPOixRiNnNX9
	QpHHH4HUkPpejAMCQWcWqv804dsCiulY=
X-Google-Smtp-Source: AGHT+IGFPyKbr3RZ97yi89w7tRiaDA5JIHQrygXMQTece8/mtQ/CS7aBqTxuUTYyJ4Wf/gP1jX7cLw==
X-Received: by 2002:a17:903:41cc:b0:246:b58b:8b86 with SMTP id d9443c01a7336-246b58b8f44mr50517505ad.32.1756131210316;
        Mon, 25 Aug 2025 07:13:30 -0700 (PDT)
Received: from archlinux ([205.254.163.102])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668779f85sm70329465ad.33.2025.08.25.07.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:13:30 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: tytso@mit.edu,
	adilger.kernel@dilger.ca,
	linux-ext4@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>,
	"Darrick J. Wong" <djwong@kernel.org>
Subject: [PATCH RESEND] fs/ext4: remove unused variable 'de' in ext4_init_new_dir()
Date: Mon, 25 Aug 2025 19:43:21 +0530
Message-ID: <20250825141321.8049-1-suchitkarunakaran@gmail.com>
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

Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
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

