Return-Path: <SRS0=IxsT=CZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F05BC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 05:27:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBF1B21655
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 05:27:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0ZiSvqZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBF1B21655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7D706231A1;
	Wed, 16 Sep 2020 05:27:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JbXkpCDbM4Ss; Wed, 16 Sep 2020 05:27:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DF80323115;
	Wed, 16 Sep 2020 05:27:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C86BBC0864;
	Wed, 16 Sep 2020 05:27:18 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54AADC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 05:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3D5BC86DD7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 05:27:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d1eiz4ebIErc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 05:27:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9CC1486AAB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 05:27:16 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id e4so2565810pln.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 22:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VJVDbbAlJ3EVegFgwxB/3/h59utgDfMyQ6scbBMOYNk=;
 b=A0ZiSvqZool5kn3WbGpLkkhh1vZthuLxPC3zqqCNTVibSFcUjMOQ+IUGBS76hngwPv
 HkhVhMiEAN1f4INTdiJhlJVzg883lrpc+AIXKZNa+mFvXd5zEosYgM+SJqH9NRkHVBlk
 ArrNt4lfQtr894OODK5r+0MnLMvB0bYcbUnzaQhmpwjc2fXXu4C8mCZ191kIWCQJ4t6F
 kDYQSIRirP6Tp8CkHTRvLB7vW4upDxNNvNPDLLocCqdRtZ9cyNjvo7LNjeZhyedD/+s3
 kkNAmVK5nV4Maqc26fX6hZ7qhAp7NuT6skNoWfE78Ptl2PspbfuAjO2gTZ9DhKuyyVZq
 zspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VJVDbbAlJ3EVegFgwxB/3/h59utgDfMyQ6scbBMOYNk=;
 b=CONjnhB1qsBbwSeqi9t0az/BlOsGvC5ox2kl3Ok3mWA15FOMO230/rW9j/O7AiWBq1
 yAdnpQ9ozZNP7w0Fu30zrLpZRnTHo5oQdiqR97gFljgulhOS31wr8z4aNvHQxxT7VdrG
 N0phZgGUppNRppHq4APVKUDcTPIAvsOvcRnl9F/5nOSZwThN1TgiNK0fpourQtzyuvID
 mvrlwSbQeACK9SGA1qQFzo6NaXzYr6KhXCd0IR8YwKGpzWh5wWrzCXnsIUEWuSBEf/QB
 ahD7fMipTZ/ubm3cUuvo8ToEK05e4dAZp8yRebPtfp+tIAp3qEENAL3z1s8OPuYc5dwq
 aM4g==
X-Gm-Message-State: AOAM532iIubXP0I+z2hRuUjuoH7h4QMIrZgOWdgOoO721L+s66WrlN5I
 p6M0XnGVqMBYlo3afoz+N6X3ktTjHxzas5ucQTM=
X-Google-Smtp-Source: ABdhPJy8G9XX2Xhtqw57CWyGwxACp6HRAIaTDwKifUE1VrFl4nVVK524/rBCPvr4xEp0GINizv1eCQ==
X-Received: by 2002:a17:902:b086:b029:d1:e5e7:bddb with SMTP id
 p6-20020a170902b086b02900d1e5e7bddbmr4635762plr.59.1600234035653; 
 Tue, 15 Sep 2020 22:27:15 -0700 (PDT)
Received: from localhost.localdomain ([49.207.198.18])
 by smtp.gmail.com with ESMTPSA id md10sm1172565pjb.45.2020.09.15.22.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 22:27:14 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: 
Date: Wed, 16 Sep 2020 10:56:56 +0530
Message-Id: <20200916052657.18683-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 linux-kernel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org,
 syzbot+4191a44ad556eacc1a7a@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] fs: fix KMSAN uninit-value bug by
	initializing nd in do_file_open_root
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

The KMSAN bug report for the bug indicates that there exists;
Local variable ----nd@do_file_open_root created at:
 do_file_open_root+0xa4/0xb40 fs/namei.c:3385
 do_file_open_root+0xa4/0xb40 fs/namei.c:3385

Initializing nd fixes this issue, and doesn't break anything else either

Fixes: https://syzkaller.appspot.com/bug?extid=4191a44ad556eacc1a7a
Reported-by: syzbot+4191a44ad556eacc1a7a@syzkaller.appspotmail.com
Tested-by: syzbot+4191a44ad556eacc1a7a@syzkaller.appspotmail.com
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
 fs/namei.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/namei.c b/fs/namei.c
index e99e2a9da0f7..b27382586209 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -3404,7 +3404,7 @@ struct file *do_filp_open(int dfd, struct filename *pathname,
 struct file *do_file_open_root(struct dentry *dentry, struct vfsmount *mnt,
 		const char *name, const struct open_flags *op)
 {
-	struct nameidata nd;
+	struct nameidata nd = {};
 	struct file *file;
 	struct filename *filename;
 	int flags = op->lookup_flags | LOOKUP_ROOT;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
