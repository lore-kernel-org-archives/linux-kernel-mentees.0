Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC522194C94
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 06:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730961050; cv=none; b=bZkkEE5IxS56tfl8FJ5zw8iam76tDDdTna7PkW9k5jyijmgVPhdHmJm183z7O6as2FscXeGX2bYPQJpVQhNL2xnXwnZ2an0ShZWd9uQ6eZP3ytKvXIUu/vNJC+BmaqZD+JdCiIS94KRsj51DFMd69GUxyTlsV97zCG6ZMzhtBLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730961050; c=relaxed/simple;
	bh=GgDJgOiNgVI8N8G/EOt8OU1m3SnBYIsSsjBtbkTqLBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZOzjiTMSIbVlDwTsgFZir/1nCfBdBEsN8ko7fEwAejwXDb8wBEqyslyXX3p5qTPiZedtUbMdsZLQ2fbPn8nlRVsRYHABGWb4H2+WQXWa1+yzB1mZEo07Z9aqhk/1psg+OKrj3z1axMuI5HlwVfrQvzomF6fPrkvGN2vMlyDhGbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3jh9lBl; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3jh9lBl"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 885F5407CE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 06:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yhEv04flhf1C for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Nov 2024 06:30:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=xandfury@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B4403407CC
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4403407CC
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F3jh9lBl
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B4403407CC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 06:30:47 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2e56df894d4so472349a91.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 06 Nov 2024 22:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730961046; x=1731565846; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owbnmuQZ9HZHq+2PC9PglRkgSxwQfmb/ODC1/woQOnw=;
        b=F3jh9lBltqkF7TAzWgG/UoDdjPgzgw6q0q7/GwWwR8ymGzCu4ARTSShesyEPZrVsLG
         KSKsX+VDd8A6nR8IAp6My0xEQESaB+Sxe04M+9m5apebH/d6o+095nOfB+9BIepcPMbH
         wdd6VtUp/lD0XFVrXo9SsMuX0+LUKJp/sfxpg6+iBLzdGfgC+jc3VQF1yYIDPZ+eZObC
         q3LidKuaHKSBfZgREY6LhJgOsfQOQkV5qjY84hLFgmoy8q7oEGbAK3lKDPj5h49IsH4O
         XUUJ7zUPFlXs637SnMQ9bSUHDJd9byQvbaclqUY05MtiM0zHha4LyobMNOZmL83WTmMe
         0IjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730961046; x=1731565846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=owbnmuQZ9HZHq+2PC9PglRkgSxwQfmb/ODC1/woQOnw=;
        b=idlUo4EaXzGDF5B4Jbzy4S9NSa8pf4sqoIuASoU4O++BodNLMgf0mhEaqyU/pQlLHb
         y61jx/XtMBdFFI31E3233427N/bRHe03YXSvnG5ikiDGhVrjRcLfPZ1kHAG+iBWswhjH
         BTQ8Rlw3fTepGWOqgvG48QFU5KXU3rlU+lX6uhEcTvMIJbDVoCRPAfg+lr7oT+YaXrZi
         BqjeZrwsifZxi4ZwN0xxGxXBQ/+rP5pMYohxL9f8TbMFBplIiDmMHqGzzKyYHTCI1DHf
         90HqRiUj8cIgYt0vrtNp8WqfIPfGUYXUi13CTfF3FiXfW4C2MaDP94A8XTgRtwFXoOnP
         ZkYQ==
X-Gm-Message-State: AOJu0YzJiWPIQ+2iYnepb3Wy5rZwq4nkDM7XU/S9ZeG8WnJ7fB5b6oi9
	iUKGDCTaMW27sCDqzi75aFY6c7MYD0FftaRMaIHI+YXoeyP2G4M/Itk3RmCA
X-Google-Smtp-Source: AGHT+IH5NUn/Vle+lUfKJAyWvt6cNdPb2EL1M58IFWaao2+0AiOU34caE+ttcYy32beMitPvhN5i/A==
X-Received: by 2002:a17:90b:2dd1:b0:2da:7536:2b8c with SMTP id 98e67ed59e1d1-2e9ab0a37bdmr8694a91.36.1730961046515;
        Wed, 06 Nov 2024 22:30:46 -0800 (PST)
Received: from 1337.tail8aa098.ts.net (ms-studentunix-nat0.cs.ucalgary.ca. [136.159.16.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5f8f4e2sm725206a91.26.2024.11.06.22.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 22:30:46 -0800 (PST)
From: Abhinav Saxena <xandfury@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Matthew Wilcox <willy@infradead.org>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Richard Weinberger <richard@nod.at>,
	Abhinav Saxena <xandfury@gmail.com>
Subject: [PATCH 2/2] Documentation/mm: Fix trailing whitespace in page_cache.rst
Date: Wed,  6 Nov 2024 23:30:42 -0700
Message-Id: <20241107063042.106228-2-xandfury@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107063042.106228-1-xandfury@gmail.com>
References: <20241107063042.106228-1-xandfury@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove trailing whitespace from page_cache.rst. Fix detected by
checkpatch.pl.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
 Documentation/mm/page_cache.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/mm/page_cache.rst b/Documentation/mm/page_cache.rst
index 138d61f869df..13425fd5c8fb 100644
--- a/Documentation/mm/page_cache.rst
+++ b/Documentation/mm/page_cache.rst
@@ -12,4 +12,4 @@ Folios
 ======
 
 The folio is the unit of memory management within the page cache.
-Operations 
+Operations
-- 
2.34.1

