Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452861C174E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 27 Sep 2024 16:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727455906; cv=none; b=Ruo9518Rl1dSKnSZCNHMDS3DwLmzrxXue1bccXBbGum4+q2fyT1uSpoaLFEFGER2ZmBZg1qi088MLlRZGs40VyfZNGxXz8JVj1TgI5x9mx8fMX8t4QUXj+lPSHUBIbYVdvTtZ86vc0GKuz6tYbtEdvw31jQ9xu9u7YkkCiPgsGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727455906; c=relaxed/simple;
	bh=w1hDeaaqePkObd4w74ICxIIrNF2olAqnyLHEkqzZJjY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nbn+eLHc7UaVClAh1bl5FBpSl5HFMxZcdkVhyW+whZV33Wpmn2ClelHHynnXvoJ+J1PJT3ZzM+oiTPkiWEKUE8jq27IrPuEzbTr9Xg8gJK+6vJz6S/tUr0GaVWSkgZMTvqWxExUkpBAXlIEk80AjetFBLqow2Bwmc8Nren7qfl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=c+bZ3/Yd; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="c+bZ3/Yd"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3F2880ACB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 27 Sep 2024 16:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vt_LkFJfuhVH for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Sep 2024 16:51:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=rbrasga@uci.edu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B4FDD80AC4
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=uci.edu
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4FDD80AC4
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=c+bZ3/Yd
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B4FDD80AC4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 27 Sep 2024 16:51:42 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-717934728adso1826331b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 27 Sep 2024 09:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1727455902; x=1728060702; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rEYw1gYmwA8Qrj5YShUHffTTF3dzo6EdcZl8qQYjRd4=;
        b=c+bZ3/YdyJehKPOixavTcF+8UnDDD3EOGX5LBl7EvHmTkdxyJKtBpA69pycina1hWV
         pKjC4W/foDftpcOPVpPtqjL/3vXUA4dSY+bB5O9tHCPXJICCUrPIk6iE87SIrS7ezCdY
         vUR5w8ytMUuphecljvOlybdR5D/jycYkAqIhn8thctRoChFs4bfkiEKTddEMFmSBbg3P
         D7rMsoq9PViyrB7RifEtdRmKsYmMDy7tgivWcC9nzpDqhcam5cinSxoa7fADW8xHZ7Hj
         PI7y2NnXhK+FKq2TyZIECtf7gzX0zPd1+rUuUME1PIEfe0+hQNlQHQ9/gOvqUQM19Klx
         ClvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727455902; x=1728060702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEYw1gYmwA8Qrj5YShUHffTTF3dzo6EdcZl8qQYjRd4=;
        b=OYZms+dkCtOTnnWACxFAgNx/peW0G9jUFIOM13+GLrbMxykgkBsWHvAxxx16qdvus5
         T8QYzwF3v2q5uFaj06tu2Ujzji2u0bvb+D374YFBxuXe94VRzyvKKDER86OD8SX/SMKW
         iTW/5Zcg7oEKYIt4t+p2u42psodLLb3YYrDIhL7OoIwCNuEGFSo1Z/2xdbCPNJa7N6zm
         3/6se3CXSR2vTSu5iVoP4TY3GIVS+9jCD5JpqkgfrHjJGiJxEou9UJoYPa7Bgr+77MXg
         yPhc7yfV2frJ3n3uyVc4cM7hmdHEESxwKrR2SK17QQbipIoYYmil6Q478tpT8HT8Pb5U
         1ReQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN8scIF6waD9MIMdn3YEMPdRsYS4dSqkWLudsCToLKGnFLEv6PsDM/OgI7q8u040YwM6DYu9Rlix3jkse/Yf3COgaeRA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yx/H6daUAqMrG7A/9HXw74ExneSTODdF1l5W2rUxPR6I8upI7fr
	wHfotFekvCUnJo0hvuvHqP/8rNfi+6yy6GCpmWc5AuN5HboSKAb4VySn8yr8tls=
X-Google-Smtp-Source: AGHT+IFhIGmE5LlhA55s0kcrgULqLsbgUkU+TsikBbl64f/xmQdYg/RN8UoCzM3MFKkvAI7Dpi4j8A==
X-Received: by 2002:a05:6a00:3d14:b0:717:8ece:2f8b with SMTP id d2e1a72fcca58-71b26057f9emr6125090b3a.17.1727455902352;
        Fri, 27 Sep 2024 09:51:42 -0700 (PDT)
Received: from alpha.mshome.net (ip68-4-168-191.oc.oc.cox.net. [68.4.168.191])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26515da6sm1800938b3a.122.2024.09.27.09.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 09:51:42 -0700 (PDT)
From: Remington Brasga <rbrasga@uci.edu>
To: Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	syzbot+a3c8e9ac9f9d77240afd@syzkaller.appspotmail.com,
	Remington Brasga <rbrasga@uci.edu>
Subject: [PATCH] ext4: WARNING: locking bug in ext4_ioctl
Date: Fri, 27 Sep 2024 16:51:32 +0000
Message-Id: <20240927165132.17289-1-rbrasga@uci.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed the locking bug with the bisection found by syzbot.

Link to the syzbot bug report:
https://syzkaller.appspot.com/bug?extid=a3c8e9ac9f9d77240afd

Reported-by: syzbot+a3c8e9ac9f9d77240afd@syzkaller.appspotmail.com
Signed-off-by: Remington Brasga <rbrasga@uci.edu>
---
First attempt at patching this issue. Verified the bug exists, and that
this patch fixes it, and EXT4 KUnit tests pass. Though I am not sure if
the patch should be higher up the stack.

Open to questions or any suggestions for improvements.

#syz test

 fs/ext4/xattr.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/ext4/xattr.c b/fs/ext4/xattr.c
index e0e1956dcdd3..2b30b9571fd8 100644
--- a/fs/ext4/xattr.c
+++ b/fs/ext4/xattr.c
@@ -124,8 +124,12 @@ void ext4_xattr_inode_set_class(struct inode *ea_inode)
 	struct ext4_inode_info *ei = EXT4_I(ea_inode);
 
 	lockdep_set_subclass(&ea_inode->i_rwsem, 1);
-	(void) ei;	/* shut up clang warning if !CONFIG_LOCKDEP */
-	lockdep_set_subclass(&ei->i_data_sem, I_DATA_SEM_EA);
+
+	if (ei->i_flags & EXT4_EA_INODE_FL) {
+		lockdep_set_subclass(&ei->i_data_sem, I_DATA_SEM_EA);
+	} else {
+		lockdep_set_subclass(&ei->i_data_sem, I_DATA_SEM_NORMAL);
+	}
 }
 #endif
 
-- 
2.34.1

