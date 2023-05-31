Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F54C77B7A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 31 May 2023 01:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F51D404B1;
	Wed, 31 May 2023 01:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F51D404B1
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=psGoUI86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dcBkx8dyLzbE; Wed, 31 May 2023 01:36:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8731840017;
	Wed, 31 May 2023 01:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8731840017
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57151C0035;
	Wed, 31 May 2023 01:36:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6B6AC002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 May 2023 01:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA8358219F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 May 2023 01:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA8358219F
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=psGoUI86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7uBMNuMecCcH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 May 2023 01:36:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59F718216F
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59F718216F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 May 2023 01:36:31 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-39810ce3e13so3538181b6e.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 May 2023 18:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685496990; x=1688088990;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sGGyS7PZ3izlD8uBHyD50YNbDhchZ2LRm+rdUWJP4bw=;
 b=psGoUI86pEOj/HZhmzkG65J6nlnC4qWnwFmr9pO7FE5KoE0rQTN3uPvuXEk3eDY1g2
 US5WjcAUMlNa1rF2LLkCh+bqlhD6Lms0UyqQJYP46Hle7kBSmpSl0ixQaIO2ahm6t9k9
 cXFK/n7DMzhE/P5Hh6oeVRVueGXmBXkEWiVzT28LhZ8XpZbqeZQ5kOQUiJXjJFBp27L4
 2fD9IF+iRJFLHJEWvOmtnMmt2q5ZgMFI888JekkOKjRRhKa0ExA7TfLBCjcVIkfuqJ87
 DNMAPmy/AabJ2HmZv5NPDAG0i+vChOVOEr/xOKVxHU39AXJde2dh22SFQ42KNfeORu5z
 nTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685496990; x=1688088990;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sGGyS7PZ3izlD8uBHyD50YNbDhchZ2LRm+rdUWJP4bw=;
 b=BMTGH6Qzhwew4ybmSsy0lN+ILJroUp6R5KRJ0lv4IxKTdU/Gz348v7ZoZOtB1E49Z0
 TSOCw6co3pJPo0WNHGdc+bHv152iQ29XkoN9LWK+zJ2bsRcT38hY/djzv4AhJxK2qItg
 YfvDrfOTvg+uiy8cwTXzKPDZFshj0xX4UomYsP7yUh5t03MzlyKmGPgoqzQThfdiYB/F
 SegcZSCvU+VuP2Uhu4UemSHZ5NxL4mu5+xAelQBoVo8MqNNM4gw9xJbfZk/YZnBxVgCj
 JFZTWEQ92sfQomau4Kruq0cVVv7nVU2vm8EA+qe+eDAbv1TmhZUPWvFZZ4nJFmmjQhZC
 YFSQ==
X-Gm-Message-State: AC+VfDzP5R5bHgxLEFMK58UBlbC9CIEC86TWRo6MAI2eBozITQieLznm
 BxGvu+UpQF7b2GAKFZ0xvGQ=
X-Google-Smtp-Source: ACHHUZ4J4Uv1VDY46ZEJ1JN/HequWr+HWLdhTcLel8YjgDuoyoK4icwe7BCMPHgi2JUZ3kyTsd9aqQ==
X-Received: by 2002:aca:b5c4:0:b0:398:214d:16d4 with SMTP id
 e187-20020acab5c4000000b00398214d16d4mr2139701oif.30.1685496990271; 
 Tue, 30 May 2023 18:36:30 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:602:9300:2710::f1c9])
 by smtp.gmail.com with ESMTPSA id
 jb12-20020a170903258c00b001a69dfd918dsm6612877plb.187.2023.05.30.18.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 18:36:29 -0700 (PDT)
From: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
To: skhan@linuxfoundation.org, brauner@kernel.org, dchinner@redhat.com,
 viro@zeniv.linux.org.uk, chenzhongjin@huawei.com
Subject: [PATCH v4] fs/sysv: Null check to prevent null-ptr-deref bug
Date: Tue, 30 May 2023 18:31:41 -0700
Message-Id: <20230531013141.19487-1-princekumarmaurya06@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530-gefangen-ersonnen-d1f1b6eea903@brauner>
References: <20230530-gefangen-ersonnen-d1f1b6eea903@brauner>
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
Change since v3: Added cleanup code for the branch[n].key on 
failure code path.

 fs/sysv/itree.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/sysv/itree.c b/fs/sysv/itree.c
index b22764fe669c..58d7f43a1371 100644
--- a/fs/sysv/itree.c
+++ b/fs/sysv/itree.c
@@ -145,6 +145,10 @@ static int alloc_branch(struct inode *inode,
 		 */
 		parent = block_to_cpu(SYSV_SB(inode->i_sb), branch[n-1].key);
 		bh = sb_getblk(inode->i_sb, parent);
+		if (!bh) {
+			sysv_free_block(inode->i_sb, branch[n].key);
+			break;
+		}
 		lock_buffer(bh);
 		memset(bh->b_data, 0, blocksize);
 		branch[n].bh = bh;
-- 
2.40.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
