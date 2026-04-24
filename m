Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FE6303A0D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Apr 2026 15:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777044197; cv=none; b=GlrZCvLCpDS4AudcL2nAb9kEnO48lUoZNaHW/Zr/wNqVtU+Cf3GbxKxfspTBYgyD7WEUwt7dRkOdNEMdt3giN//QnxXY9z+BbYPDzWYqLQC4ayOlD6PgXVfnumkumME0cm+GSdtcZO+u4y4E0oWfgDMnwj0odWeo12Or28d6Lms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777044197; c=relaxed/simple;
	bh=87aAIT7JLiM4IKflKuaLO5AfGd6MxQHvEtXiFf1Gi0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=juXCvfbG5Fl6imLVX1cEJ9nXOAOZqcGa7dlporIcqN/dcz4TduThE3/ToLTip+HtnE89tIq1D5AQGLfHo7JRhivHhUWhsje3pGqmfFUDo5KpGxTSoEX+zhXhJq9xAKmvE3xPUQsJ2AuJIyDTsmwXdblWia1p1r58OROe14LC35E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7WC4sPp; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7WC4sPp"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D324C428F9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Apr 2026 15:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UqfarIAYl8Qz for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2026 15:23:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=abdououhbi1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C7659428F6
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7659428F6
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O7WC4sPp
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C7659428F6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Apr 2026 15:23:14 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so57570785e9.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Apr 2026 08:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777044193; x=1777648993; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tsBKJQ94VXQFSEK55ii3607B/EMG8Iu5B+b4vCeqHeM=;
        b=O7WC4sPpSdgxasE+Mz61gwYrz970XDgYVZdCPDuDUfrGsfPaaeB0SNSsHSKftHsizM
         yyuFHI/rPkOZGIcKeADlV7fUfKTcYBUaDt7Nxcib31c9lsdfJFARhq+X6wlsE77LyWLZ
         u2IrknK2SOBboU8GkXGNPatRsUatrelylom26y2u18JvLjv1tcIeRmszxUzbn0Sv1w+P
         UbdJCFLH6S2Mu6ukTmdbnI99FCD+oTWOJnqHMovedNbI1H1gRUQtsl8sx6f2uZtoq0zj
         heW64UL1x9VsFttKcV7L21cpkvidfFV/Smxv0p3kZunOkdkGVx13FzsdHpXeOzwwA57Q
         jhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777044193; x=1777648993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsBKJQ94VXQFSEK55ii3607B/EMG8Iu5B+b4vCeqHeM=;
        b=W9l9sE5BYizbgdyZFO8DVDVkaanAZ3NAIyju/CoR4WM8GcHqAcGcfzT2wrqrBSPI8R
         tns32GSuzyqgk/o5hCBocsEC5BIrXAR/bn0ASe5coFyQe9qJ6ePlU2kRseguoAft5Xi+
         9p+P/i0bOpW9FKYzA63NRrCedGHuXZgcAIJH6OjwiiT40zSVrBRwmqHAFbvFG93Z7O/L
         SPuApPB4lQSpAJfwgDEJXoYFOY2yRsz+ypWdwwWjdgxRf9nz1SF99yHMTdiQAecLXwrN
         eY/0SGZ8eDkfbyrrLv1BTQZ+GgdRCj1vNlAJmYzGsT2pITMq0JM5PAbtG8KHIV8BtxXS
         JlIg==
X-Forwarded-Encrypted: i=1; AFNElJ8WocmTa/VMEJQG7klTWPz3pY+5EFE0qkvlCDu9OQL8s+y+pOtAvn4XX8/pdD0H2jNBqz704FA+0XTFzu8q20PvEdFcmw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzyeuwEaWcgXPyXSiAWzhAdtodFEqE7JMz+3tm9aMkndAnwIs20
	5W+HtIbfC39JIjaJ1NAj+qqlAjWB0yyLBq1s8j6o6rfeu9h7CmmtcSVW
X-Gm-Gg: AeBDievM+8UpnC/xw21lR7DvMtDPjW9kRgtZcHGZosPKmrFfJpH7pz3bJ7cIVbp2vq7
	tXD2uJZwVUvVN4MlgV7TMYFNezeTnVBOewcePYY3WiLhI1GrBMOq58B342i/ETcOMHqxdUrC5/6
	JE5RHuVNjjU+J7yEhwZU6snOc3tWcEoXpjaNZejvwWOAj3acRRXJ8j2gvaoNy2PZQlhHOO331rV
	Hph1LjlUX6tw3kHJtwaqf7LI7BrUr3P0N4nHi9qQqUeoIKVKefZKZ8OS5yPYnBiVLptjXoCFZVE
	6hLVIj+rx/hNcg1ZThSH3FoKGFe/3yJwvlcUxr/OGUPU0mk+JUXYPZ4UiKlo8uR/w77RaKgXUZU
	XPq0G40jEReY0au3JLoMQcnNnXU0zxBbJtPVRp7TA0TygSOiLP/DO4kTEt5DR5+vq6stvchqgbr
	/fya4GE/0ZEjNJAzRWZ2x/BLPeyg==
X-Received: by 2002:a05:600c:8b84:b0:480:1c69:9d36 with SMTP id 5b1f17b1804b1-488fb76e4aamr503935035e9.17.1777044192443;
        Fri, 24 Apr 2026 08:23:12 -0700 (PDT)
Received: from kali ([41.142.67.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-489e124f6c7sm109113735e9.29.2026.04.24.08.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 08:23:11 -0700 (PDT)
From: Abdellah Ouhbi <abdououhbi1@gmail.com>
To: tytso@mit.edu
Cc: linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Abdellah Ouhbi <abdououhbi1@gmail.com>
Subject: [PATCH] ext4: Use %pe to print PTR_ERR() in namei.c
Date: Fri, 24 Apr 2026 16:22:45 +0100
Message-ID: <20260424152245.142308-1-abdououhbi1@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix coccicheck warning
./namei.c:150:25-32: WARNING: Consider using %pe to print PTR_ERR()

Replace %ld with %pe and PTR_ERR(bh) with bh pointer.
The %pe specifier automatically converts error pointers to
human-readable error names instead of raw error codes.

Signed-off-by: Abdellah Ouhbi <abdououhbi1@gmail.com>
---
 fs/ext4/namei.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 4a47fbd8dd30..c0cabf172020 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -145,9 +145,9 @@ static struct buffer_head *__ext4_read_dirblock(struct inode *inode,
 	if (IS_ERR(bh)) {
 		__ext4_warning(inode->i_sb, func, line,
 			       "inode #%llu: lblock %lu: comm %s: "
-			       "error %ld reading directory block",
+			       "error %pe reading directory block",
 			       inode->i_ino, (unsigned long)block,
-			       current->comm, PTR_ERR(bh));
+			       current->comm, bh);
 
 		return bh;
 	}
-- 
2.51.0

