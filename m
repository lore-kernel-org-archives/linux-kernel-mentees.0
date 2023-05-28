Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C7FC77B7C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 28 May 2023 16:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FAB941B75;
	Sun, 28 May 2023 16:44:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FAB941B75
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=pfMkzO7i
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JPyNsBLu4sah; Sun, 28 May 2023 16:44:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 06F584056D;
	Sun, 28 May 2023 16:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06F584056D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D23FEC0036;
	Sun, 28 May 2023 16:44:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 223EDC002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 16:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E39E440646
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 16:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E39E440646
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=pfMkzO7i
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yuSWK6LUYKPT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 16:44:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64C6D4020B
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64C6D4020B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 16:44:50 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-64d30ab1f89so1700601b3a.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 09:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685292290; x=1687884290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b44Rf60oUaAcGpO0dqWTBH48dBelIzQdyh7QejEWNW4=;
 b=pfMkzO7iNYYyZrGO1+4DEegnXhVL43zkPA6I4WmsGPE/Djny/b8Zbi/CnZtiGT5WyF
 Tmv75y5Ud8nyfAQiMuy6YLhVtp/jSudbXQwepjI53+JkbBSQjA17u/+HBMez8/wTPTKQ
 leHQcXo00D5Q2DCjCh+xJoYGRlObwF+Cl5w4Exe6umO0DMzKfsmk/J+EI2vdn/7jBqLT
 LzL15LzivOPhD65Tq4kjUvds43lF3RLSIX4H5kGjjLgcjfBD6ixs9qcMPF8XSIhzuuab
 N2HXvCnYBRFQUSAatsqN8/BEyeEKIpzx30pbck1KggfYExilo5TjoyRaWshHH7oUH6pc
 BWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685292290; x=1687884290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b44Rf60oUaAcGpO0dqWTBH48dBelIzQdyh7QejEWNW4=;
 b=Jpe9DcN6kkk9Aw6BFKYau+kD54KvNAGitKz6YzqyGyec9wWMQN6wd9IEfX80Y6wKig
 i/SAvD9+aWW12Opwrx+En8XeYSz1dXPOs0WJQujiAd6r7drgsj5DowbdiLy/0p2HgWZb
 SBqzxL/D2B9783aQnogbInY97Tef0AWCi6GiaxI0aIirT/UfS0kFroJELYgWlZis7R4M
 vroOL72M0nRosZA1Eumaszb9F971NF/wZJYplGt/1GY9M3VB1epsXM/DARMsvXfAHsYo
 nl1KqMc1SmycE8OhjH/QgnuAD1R9BzPzcaKrrG4Ne8AUHPYOUoJ2kpmgZZMcKr1BZKN9
 C8MA==
X-Gm-Message-State: AC+VfDwW63n7aGUfsprakjPCk4sOlivDTaPLANJquNEXMYPoYU6LUIlX
 2um4FJMft3KpICPopwyatz0=
X-Google-Smtp-Source: ACHHUZ7NSNvNbKHvtljwEOul0/xFQWnk69MdXE4dhsxoVDz0dqkfiMeSNHYtR3tsToLehH0gaL1olA==
X-Received: by 2002:a05:6a00:b89:b0:64f:bf12:a7f7 with SMTP id
 g9-20020a056a000b8900b0064fbf12a7f7mr8603253pfj.5.1685292289703; 
 Sun, 28 May 2023 09:44:49 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:602:9300:2710::f1c9])
 by smtp.gmail.com with ESMTPSA id
 p24-20020a62ab18000000b0063b7b811ce8sm5303810pff.205.2023.05.28.09.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 May 2023 09:44:49 -0700 (PDT)
From: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
To: skhan@linuxfoundation.org, viro@zeniv.linux.org.uk, brauner@kernel.org,
 chenzhongjin@huawei.com
Subject: [PATCH] Null check to prevent null-ptr-deref bug
Date: Sun, 28 May 2023 09:44:00 -0700
Message-Id: <20230528164400.592092-1-princekumarmaurya06@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <000000000000cafb9305fc4fe588@google.com>
References: <000000000000cafb9305fc4fe588@google.com>
MIME-Version: 1.0
Cc: syzkaller-bugs@googlegroups.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

sb_getblk(inode->i_sb, parent) return a null ptr and taking lock on that leads to the null-ptr-deref bug.

Signed-off-by: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
---
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
