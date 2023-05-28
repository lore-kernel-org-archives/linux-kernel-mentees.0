Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AE7C77B7C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 28 May 2023 18:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDAAB822C9;
	Sun, 28 May 2023 18:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDAAB822C9
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Un9DHhM8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ufbb3VVc-ux; Sun, 28 May 2023 18:44:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B3867822A0;
	Sun, 28 May 2023 18:44:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3867822A0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E8AFC0036;
	Sun, 28 May 2023 18:44:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B9CDC002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 18:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FFEC600CD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 18:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FFEC600CD
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Un9DHhM8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YmyiZ0zYzdMj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 18:44:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71CB6600BA
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71CB6600BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 18:44:47 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-64d2f99c8c3so1932163b3a.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 11:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685299487; x=1687891487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zyjlDSIQffiBz94m+7qOi6jUFMwLIf/LyrTK9DsOjUA=;
 b=Un9DHhM8TW3EHQq43OAA0Ogd3lKDCjk40R7E2SKFoH0vJxv9UdeDIFWBxL66SkMdaU
 X3z9UxahVzY8yK3w1sPAcHVzArfQy6EvitNCRL5PeRn24pF2LcOSnS/pZ6t0R2+ycor8
 rvGEDN6tJtAC7si/wvow8iNmQXDYhWNr+VoYUDOP4QDosm6niKgufq4eBdmx9SDrmRae
 GdW0O86XeoIERzdhrPzQFLzFaLpxY54wZiPTDsGOpE3rR3Rafki6LmC5NO++/4wXEfJI
 8+HOCRTQVqqn5BtL8bUyD0n0fWEfY2q663fXaPQOOy1JfowlDKnKWI6W/BamTyk2lmYR
 rLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685299487; x=1687891487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zyjlDSIQffiBz94m+7qOi6jUFMwLIf/LyrTK9DsOjUA=;
 b=HOfPuXhRWxO+TQQiCkMY+y51Hqg07mMGmY0VyeMpansTZERT7WONjAnIKDjlXP275O
 YVZ4Z3Eqv0+9MgprttRy7Hd2ndfSXf7DS02dMQUcySKQxnV27d0629KuETXda/ko+tUp
 jok3eO38vTz5OTCOYctnGnUj7kBg9pdZ8mgxRrDUiiBP1ZSEo00Bbl83EF5fS3da2GWD
 8HC65Ze9Z0LXXkglrEyXZd0D15irpdTbHaTmuR48+m0opLvL68hT1btMthv3rDl7Ct9z
 PrG0YSRz1IBPwmLSH3S7nb/CwjsRMkUW/vMxKqyrFwYheiLmhxbjT34raw2r36T87m5z
 Gh2g==
X-Gm-Message-State: AC+VfDzuGdDD0AwMs+V/6kyqmh2B2VdtZH52j5rNuu6s2k6os/BKlktE
 TOacvx2sbo5dSc/ZE7q7WJQ=
X-Google-Smtp-Source: ACHHUZ5zW/1h08AQmHowCqrrh1SxgfsI0UBae44jNzqPq2Ab3Ujo7WM8MI5PGX9oSiEstous+gZbGA==
X-Received: by 2002:a05:6a00:170b:b0:64c:c5f9:1533 with SMTP id
 h11-20020a056a00170b00b0064cc5f91533mr12576431pfc.33.1685299486709; 
 Sun, 28 May 2023 11:44:46 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:602:9300:2710::f1c9])
 by smtp.gmail.com with ESMTPSA id
 i18-20020aa78b52000000b0064d4d306af9sm4155893pfd.79.2023.05.28.11.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 May 2023 11:44:46 -0700 (PDT)
From: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
To: skhan@linuxfoundation.org, viro@zeniv.linux.org.uk, brauner@kernel.org,
 chenzhongjin@huawei.com
Subject: [PATCH v3] fs/sysv: Null check to prevent null-ptr-deref bug
Date: Sun, 28 May 2023 11:44:22 -0700
Message-Id: <20230528184422.596947-1-princekumarmaurya06@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <000000000000cafb9305fc4fe588@google.com>
References: <000000000000cafb9305fc4fe588@google.com>
MIME-Version: 1.0
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+aad58150cbc64ba41bdc@syzkaller.appspotmail.com
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

sb_getblk(inode->i_sb, parent) return a null ptr and taking lock on
that leads to the null-ptr-deref bug.

Reported-by: syzbot+aad58150cbc64ba41bdc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=aad58150cbc64ba41bdc 
Signed-off-by: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
---
Change since v2: Updated subject and added Reported-by and closes tags.

 fs/sysv/itree.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/sysv/itree.c b/fs/sysv/itree.c
index b22764fe669c..3a6b66e719fd 100644
--- a/fs/sysv/itree.c
+++ b/fs/sysv/itree.c
@@ -145,6 +145,8 @@ static int alloc_branch(struct inode *inode,
 		 */
 		parent = block_to_cpu(SYSV_SB(inode->i_sb), branch[n-1].key);
 		bh = sb_getblk(inode->i_sb, parent);
+		if (!bh)
+			break;
 		lock_buffer(bh);
 		memset(bh->b_data, 0, blocksize);
 		branch[n].bh = bh;
-- 
2.40.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
