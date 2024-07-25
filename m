Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDD0C8DF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 13:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721914608; cv=none; b=sOd7nbScAQk9gK2otqvHEqStRI0B2udrgDViygTwQUT34hLOX6YgqnSFZm+nSucPvX8iFhRSJjHS/+rvydkF1n9bNs/EVlRGnS1od/ZnWMg8SQHWPFnaPJiQdarlj3o0TsmHv7RrNKCx8DA9cO4b7RAZAAiG9DdBS29SzGDjAdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721914608; c=relaxed/simple;
	bh=J5MGTw4Lo37SVAoabN3Fr/KKgg2UEJjeG2UpeGbbvz8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=r+qZIiOoPhxjoNqb+NjSTsRv3BNfNH7+0yEy1T9CSq6W5saAqbu6njK/f3L1wspAhrnZu5Wht3l1eD+PCkioET4fDjQwTMA+W92XFBZnC+xraafJmjjPAuHGUJnJE+2PAiOhjBuF1oAzLaoiMHaHvdQMIY0zi1yflJEDIJmsBUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BoRmMw9m; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BoRmMw9m"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33AB7409B1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 13:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4twHe1sAIWKS for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Jul 2024 13:36:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=sergio.collado@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D52374026E
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D52374026E
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BoRmMw9m
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D52374026E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 13:36:44 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-427d2c8c632so6861005e9.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 06:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721914603; x=1722519403; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ci5WccFjX7Id9FxFRfbLX6JJ9WpQtxw7zRs+FLTrQyo=;
        b=BoRmMw9mRBIO4JQ4S/fceDoFFPeLnV9vwfTqD6zNMcb2K5CZMlu13F0XT5o0Jhybv1
         Po/tbK7YjqcDIls8X8HRJLIMus4bNpzCe9HMl4sEcCmB2HTMAWoFmpJs73qrkG3Wbf6W
         B7wXK3jqJ7huIBC1JfXiyLmFDwgj6beYUURdRGRI0vHpKfZIwpl50cBJC51lm3NI1yrS
         qGC57pD/QICDtVRk8Yfz7qadlCoDCHa1Liip1CItMZmXm87Q9d3Bij22TlO2ikK6toTF
         FPNfyfiHdile8X52Ew0m0IUmqL1lV0Xanprg0fjCbjTS5wOzEduKUTNsJJfb/i70ya+j
         2irA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721914603; x=1722519403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ci5WccFjX7Id9FxFRfbLX6JJ9WpQtxw7zRs+FLTrQyo=;
        b=F8fgA1UmZQhG0wkz8p985d53TefMmqiulkcTngJYhTAeFa0Wk2pdxJuEGVuSLWEiI2
         hju9qmfU6pLbLg4zX40M1JhU3YIWO8a6iEQ9RCTuq8K3Op6AUjGvIHeDQKuXb5vHyQkP
         9fzcP7figiqTnXkYJ/UMr26BUR3KmdVbeyechx6XDEr3L2oI9Cba5OVGTj4lBs2V2AWB
         7Ln8Qgau9WSMmEEx1nIXsB80ux5vLEbV6hioqX5ICEqIc6x2XExjP02BUTiST3jDo3mH
         fXfWFG4PoYbPznMQQuiEBuPXGkDA58v3NxlUXc76VvdbEc07opucgmlUcBCy7IbnVKQF
         H3Tg==
X-Gm-Message-State: AOJu0YyRIc/E02vnrfLA5csdeGLdg37n1+7toD/DuLpEJnPuqhuYxvZ4
	QcL3ivZwRUHH4yDqjT3Py/u8yx/0T9ra286hfhBH53o4eA9qLEzF
X-Google-Smtp-Source: AGHT+IEf069GnhZM17p/H3KJ8SZnEu8EBtK9yPg40M3mQXRhH0/CJRsEcTugpE8Hlx+7BnCCCjxjGw==
X-Received: by 2002:a05:600c:4ca1:b0:426:5dc8:6a6a with SMTP id 5b1f17b1804b1-42806bae7admr15268185e9.21.1721914602560;
        Thu, 25 Jul 2024 06:36:42 -0700 (PDT)
Received: from laptop.home (83.50.134.37.dynamic.jazztel.es. [37.134.50.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428057b740bsm36977455e9.46.2024.07.25.06.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 06:36:42 -0700 (PDT)
From: =?UTF-8?q?Sergio=20Gonz=C3=A1lez=20Collado?= <sergio.collado@gmail.com>
To: stable@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Filipe Manana <fdmanana@suse.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	David Sterba <dsterba@suse.com>,
	=?UTF-8?q?Sergio=20Gonz=C3=A1lez=20Collado?= <sergio.collado@gmail.com>,
	syzbot+c56033c8c15c08286062@syzkaller.appspotmail.com
Subject: [PATCH 6.1.y] btrfs: do not BUG_ON on failure to get dir index for new snapshot
Date: Thu, 25 Jul 2024 15:35:59 +0200
Message-Id: <20240725133559.151607-1-sergio.collado@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Filipe Manana <fdmanana@suse.com>

[ Upstream commit df9f278239046719c91aeb59ec0afb1a99ee8b2b ]

During the transaction commit path, at create_pending_snapshot(), there
is no need to BUG_ON() in case we fail to get a dir index for the snapshot
in the parent directory. This should fail very rarely because the parent
inode should be loaded in memory already, with the respective delayed
inode created and the parent inode's index_cnt field already initialized.

However if it fails, it may be -ENOMEM like the comment at
create_pending_snapshot() says or any error returned by
btrfs_search_slot() through btrfs_set_inode_index_count(), which can be
pretty much anything such as -EIO or -EUCLEAN for example. So the comment
is not correct when it says it can only be -ENOMEM.

However doing a BUG_ON() here is overkill, since we can instead abort
the transaction and return the error. Note that any error returned by
create_pending_snapshot() will eventually result in a transaction
abort at cleanup_transaction(), called from btrfs_commit_transaction(),
but we can explicitly abort the transaction at this point instead so that
we get a stack trace to tell us that the call to btrfs_set_inode_index()
failed.

So just abort the transaction and return in case btrfs_set_inode_index()
returned an error at create_pending_snapshot().

Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Signed-off-by: Filipe Manana <fdmanana@suse.com>
Reviewed-by: David Sterba <dsterba@suse.com>
Signed-off-by: David Sterba <dsterba@suse.com>
(cherry picked from commit df9f278239046719c91aeb59ec0afb1a99ee8b2b)
Signed-off-by: Sergio González Collado <sergio.collado@gmail.com>
Reported-by: syzbot+c56033c8c15c08286062@syzkaller.appspotmail.com
---
 fs/btrfs/transaction.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/btrfs/transaction.c b/fs/btrfs/transaction.c
index a7853a3a5719..604241e6e2c1 100644
--- a/fs/btrfs/transaction.c
+++ b/fs/btrfs/transaction.c
@@ -1701,7 +1701,10 @@ static noinline int create_pending_snapshot(struct btrfs_trans_handle *trans,
 	 * insert the directory item
 	 */
 	ret = btrfs_set_inode_index(BTRFS_I(parent_inode), &index);
-	BUG_ON(ret); /* -ENOMEM */
+	if (ret) {
+		btrfs_abort_transaction(trans, ret);
+		goto fail;
+	}
 
 	/* check if there is a file/dir which has the same name. */
 	dir_item = btrfs_lookup_dir_item(NULL, parent_root, path,
-- 
2.39.2

