Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B8DC4727C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 09:06:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DFC620B1F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 09:06:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a34Jtsu0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DFC620B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BB4DF86BAC;
	Thu,  1 Oct 2020 09:06:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mm8vnA4Wm1kf; Thu,  1 Oct 2020 09:06:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BAFE886B9C;
	Thu,  1 Oct 2020 09:06:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AD30AC0889;
	Thu,  1 Oct 2020 09:06:03 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9FBF6C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 09:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 80CC122FF0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 09:06:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CfEmQxdWp3rS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 09:05:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id C5AB722FC6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 09:05:59 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 34so3534945pgo.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 02:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o+n930xyfkrF12hPhSCQSJtiGdIh1Oqz/H5hvm0xQ2E=;
 b=a34Jtsu0JJNqL+ebJlBV+1sTp5jHO3arcKpfJkh+K55BWhKHBDp8S6SnJuYgbxiSlu
 lp0eNiBLX4pIxo0IYgTgfhm2zuhBh8O2UmvP3uyptpYO3utovwbzTMKftqNx5K2iRNzo
 BXLpa+WfF2X0AYr3TGL0QXZbgP3cVCn5Uo+ujromNLp9vD46zb+fhEaZUpma+evsCE0E
 +zNHnLIvPH2lurCRUak86+bY6jblUfw7iKQbRK/+oZzRg0pFivsxwmF4jyUaAJ8IYUI4
 iVsDC3gEPjT8tjVYZkWoS0282eVasCq3uwkps5VJGd/4aa5FjUFmL8S5LzI9VJPhwxtn
 GzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o+n930xyfkrF12hPhSCQSJtiGdIh1Oqz/H5hvm0xQ2E=;
 b=i0Je508NZFqAC6/DSik8cVzAvCmSkbUGgfq/N4o1wLb3FUykJYPMX01sGGLjw852mG
 0TJfpP3OrL2QTSaX7YTQtEC4p3NDiF5bjyQ5SSZecvXIBihdax20VMtqnJJUatCWRBzl
 Io/yCcmL+1X2J5+6kbcnuHXIkB36GCbw1iinaKKTh6ERMcKWt7YEHehbsfGvn+ZAjx9A
 pLjBd0JD12lcW9kgYXdye0CSzi1g3yyN2KTviIf1FjDz2ZqD4CMGBB0xvgdI0Ovk2ho5
 ye1mM4kSONPjR3eQYwn4zcRIpsxiNkLnRFlJMk+os15spbRUEXBcUXQ0OqrOYpzgVMQS
 0/Kw==
X-Gm-Message-State: AOAM531c1/ehSsiJry0BA880snkRz5Q0LuYNSPCvUZawUEDM3hQLM3xs
 4auwRg/Ubj4iCA300c23/8s=
X-Google-Smtp-Source: ABdhPJxEo2cCaMAsL2FuAUfE+cu6vWbE7YNB1CKjOvfZm/YpDXdKe0OwpxnXA6BQHS+XYEojiaVgIQ==
X-Received: by 2002:a62:26c1:0:b029:142:2501:35ef with SMTP id
 m184-20020a6226c10000b0290142250135efmr6072501pfm.79.1601543159103; 
 Thu, 01 Oct 2020 02:05:59 -0700 (PDT)
Received: from localhost.localdomain ([45.118.167.204])
 by smtp.googlemail.com with ESMTPSA id q5sm4489607pgh.16.2020.10.01.02.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 02:05:57 -0700 (PDT)
From: Anmol Karn <anmol.karan123@gmail.com>
To: jack@suse.cz,
	jeffm@suse.com
Date: Thu,  1 Oct 2020 14:35:47 +0530
Message-Id: <20201001090547.431840-1-anmol.karan123@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: syzkaller-bugs@googlegroups.com,
 syzbot+9b33c9b118d77ff59b6f@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] fs: reiserfs: xattr: Fix null
	pointer derefernce in open_xa_root()
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

d_really_is_negative() checks for the dentry->d_inode whether it's NULL or not, 
but in open_xa_root(), when it checks 'privroot->d_inode', it doesn't check whether
privroot is NULL or not, this leads to a null pointer dereference while calling it 
from open_xa_dir() while initializing xaroot.

- fs/reiserfs/xattr.c
The bug seems to get triggered at this line:
	
if (d_really_is_negative(privroot))
		return ERR_PTR(-EOPNOTSUPP);

Fix it by adding a NULL check for privroot. 

Reported-and-tested-by: syzbot+9b33c9b118d77ff59b6f@syzkaller.appspotmail.com 
Link: https://syzkaller.appspot.com/bug?extid=9b33c9b118d77ff59b6f 
Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
---
 fs/reiserfs/xattr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
index 28b241cd6987..a75480d0ee7e 100644
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -121,8 +121,9 @@ static struct dentry *open_xa_root(struct super_block *sb, int flags)
 	struct dentry *privroot = REISERFS_SB(sb)->priv_root;
 	struct dentry *xaroot;
 
-	if (d_really_is_negative(privroot))
+	if (!privroot || d_really_is_negative(privroot)) {
 		return ERR_PTR(-EOPNOTSUPP);
+	}
 
 	inode_lock_nested(d_inode(privroot), I_MUTEX_XATTR);
 
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
