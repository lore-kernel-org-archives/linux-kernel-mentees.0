Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FBDC77B7E
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 28 May 2023 01:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2469A41E99;
	Sun, 28 May 2023 01:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2469A41E99
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=kfln9wFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UTjMsywNRqAh; Sun, 28 May 2023 01:25:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C278D41E6A;
	Sun, 28 May 2023 01:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C278D41E6A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 945CFC0036;
	Sun, 28 May 2023 01:25:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8829BC002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 01:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5959F401D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 01:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5959F401D2
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=kfln9wFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ut2M8iB7_h1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 01:25:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B34BD4013B
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B34BD4013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 01:25:44 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-53f70f7c2d2so241025a12.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 May 2023 18:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685237144; x=1687829144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b44Rf60oUaAcGpO0dqWTBH48dBelIzQdyh7QejEWNW4=;
 b=kfln9wFDTku231dnl5jv9gXmGxBLGm+GeLHXFO5shj4wLFIQRB6HTAdTIm+c/wYKQr
 ZMLsXHI/iwoAF4F5Q3Ng906IsSifrgE87Ki68CLmCGSYQ6so66zVJ5iVkJiy1AUR06ul
 vwy68VfOB3iQs0OIYV/XTEr0a/F1Uv1RuCJzHdZUJjdLfZp+FhlWpHVrvrtvd7R/RQog
 ekfPe7XAQeqFH/8KhvUnMpGZfhDWU8bhslgo80l3ZbiYnZK5M0ziWB+rBq476IrTzwli
 M3PCQQu4xZ4lB8Mih9jznWZxSLnjMrVB/cwN61XHk+N3KZSpL3lhPikqjBG8icmW4cgv
 xwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685237144; x=1687829144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b44Rf60oUaAcGpO0dqWTBH48dBelIzQdyh7QejEWNW4=;
 b=NUW+CUk0Pqw2DMIEQIBgGkt5Yi0Oxg8ifEpmaaEVPRZQDs7bfYJc6T28CXJPwasl+7
 y6FJKss/bIBawnJAixslIB/iFTKPuR3QpgpeMG4013Z1Bsw5CaR12A3dt29CfU5LBSRJ
 DzawPS6P37o5wzO7qbaR2+1R0T6qIAC7bBgFx4OCAO4RLh04udF5xuYR2hIgQ9JfPt0A
 XouxMqfYtGN+soa2opxnnfeT0enzGDs4CrtiNMnZa3w5YUBK/ljjHW9CTs0C8CXqLSYM
 v22tc5nTH9/km4aGg2WlEjtUecrx0LQfurK+A/lbtRNC8JUbsCTpp0Q2fGL1GNePoFMA
 DguQ==
X-Gm-Message-State: AC+VfDx/O6Jv5SeWhJrb9Yd4YHmpIdxyiUm5P4sXjRKArnMfoLG5nury
 qYmwijSlPF/4DsPnYLVEpHk=
X-Google-Smtp-Source: ACHHUZ6JuxPtigaUbnEpUtjjk1rUCSKj5kJKVbQCnvdh3E/PCl0hVDi9NO5g++x4rI44sENmtS9huw==
X-Received: by 2002:a05:6a20:100a:b0:10d:8f40:6469 with SMTP id
 gs10-20020a056a20100a00b0010d8f406469mr4147880pzc.48.1685237143737; 
 Sat, 27 May 2023 18:25:43 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:602:9300:2710::f1c9])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a638c15000000b0053449457a25sm4752313pgd.88.2023.05.27.18.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 May 2023 18:25:43 -0700 (PDT)
From: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
To: skhan@linuxfoundation.org, viro@zeniv.linux.org.uk, brauner@kernel.org,
 chenzhongjin@huawei.com
Subject: [PATCH] Null check to prevent null-ptr-deref bug
Date: Sat, 27 May 2023 18:25:16 -0700
Message-Id: <20230528012516.427126-1-princekumarmaurya06@gmail.com>
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
