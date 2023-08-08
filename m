Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E986C001DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Aug 2023 10:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF44060DFA;
	Tue,  8 Aug 2023 10:30:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF44060DFA
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=lKLghmyj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 54YJPyzgU0SG; Tue,  8 Aug 2023 10:30:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BD10560ADC;
	Tue,  8 Aug 2023 10:30:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD10560ADC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8AF5EC0072;
	Tue,  8 Aug 2023 10:30:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 069AFC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 10:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E038460DFA
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 10:30:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E038460DFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iQv_lZ6v0R1P
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 10:30:12 +0000 (UTC)
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C29060ADC
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 10:30:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C29060ADC
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6bd0a0a6766so179931a34.2
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Aug 2023 03:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691490611; x=1692095411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ohd14K5oR+JrF5FR78MmbbdwJ7n6halDzi8bumggJ7I=;
 b=lKLghmyjaleYnZtOL3BsBEBNB7Xarddhnemn+fiVsBgYrgDl86KiPFH2q0mRHUyaiN
 FS4wc+HwYN6blocUFB2hATZWJzI4mwsfOjA9PeUbIQm6IBJigK5wbbFPKpIbqWIRezae
 4T6+yDLm0YEKuMoKDy3MmUqeCJD4QvFhcpeah7V0HAXQ8J5pQ8Lzh3DbI/IuCZILjFrr
 JWlpG6LXiigd8QNMzPq8GWmbzpmjYvMzgFcGeoW0iVvGj1IeQmNub8nLO5aytgo1CvSd
 p1kKwE1yNbn4nEgR8kbWGZKdOuH8TUj4Rn1srw94ZqBTjoAj148+7iaIP0cJ6OINS9jc
 wYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691490611; x=1692095411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ohd14K5oR+JrF5FR78MmbbdwJ7n6halDzi8bumggJ7I=;
 b=NzedFET9ddpMKKz53Gk8ahoFd9Y1dHW4J5Q7+j5YTIX0c0jahdkz9zllnpG7VrtcxT
 pTk4bjRYz4gryjZdd06fBNk10fZkApEA53sI5pFtMCQxY/sRrfQ5hQdxI/jLIFZAfAmX
 6PVBYMtu68F11vH7Ro0cARXQn/F6Sct612OZNu629JxN82DWu+pX0jx8hLzKCVzbwsLn
 39dB9zAoLNUNKsJtwfgMUpYS3zy5oD9Ru9JaDca3UrX2ZdaAYh3b32krjzr1Czc47k+i
 f+vrCJznI85+9MZh53q4+nQCiIlKs4rUCNctVkzbQcrAd0natUge+8bDN2WBg4Q4lDr+
 i4FQ==
X-Gm-Message-State: AOJu0YwkJ+L+EbL7YrXEmzDbVMObUzEVwM1uVK5RDJghtBTSSgKWXLfh
 fZ8urghAKloN5cDaSFVctbY=
X-Google-Smtp-Source: AGHT+IEJkrwzqWUu/RKDr5oW4yXy5UhYxO5LIGeFvcigdoleJ/sRDxBJJ8Urbuxi3n0lOTYGwxRNDw==
X-Received: by 2002:a05:6830:1e0d:b0:6bc:9078:81c8 with SMTP id
 s13-20020a0568301e0d00b006bc907881c8mr11518461otr.20.1691490610989; 
 Tue, 08 Aug 2023 03:30:10 -0700 (PDT)
Received: from manas-VirtualBox.iitr.ac.in ([103.37.201.175])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a17090aec0c00b002677739860fsm7483268pjy.34.2023.08.08.03.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 03:30:10 -0700 (PDT)
From: Manas Ghandat <ghandatmanas@gmail.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2] ntfs : fix shift-out-of-bounds in ntfs_iget
Date: Tue,  8 Aug 2023 15:59:58 +0530
Message-Id: <20230808102958.8161-1-ghandatmanas@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <2023080821-blandness-survival-44af@gregkh>
References: <2023080821-blandness-survival-44af@gregkh>
MIME-Version: 1.0
Cc: Manas Ghandat <ghandatmanas@gmail.com>,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 syzbot+4768a8f039aa677897d0@syzkaller.appspotmail.com,
 linux-fsdevel@vger.kernel.org, Linux-kernel-mentees@lists.linuxfoundation.org,
 linkinjeon@kernel.org, anton@tuxera.com
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

Added a check to the compression_unit so that out of bound doesn't occur.

Fix patching issues in version 2.

Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
Reported-by: syzbot+4768a8f039aa677897d0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=4768a8f039aa677897d0
---
 fs/ntfs/inode.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 6c3f38d66579..a657322874ed 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -1077,6 +1077,15 @@ static int ntfs_read_locked_inode(struct inode *vi)
 					goto unm_err_out;
 				}
 				if (a->data.non_resident.compression_unit) {
+					if (a->data.non_resident.compression_unit +
+						vol->cluster_size_bits > 32) {
+						ntfs_error(vi->i_sb,
+							"Found non-standard compression unit (%u).   Cannot handle this.",
+							a->data.non_resident.compression_unit
+						);
+						err = -EOPNOTSUPP;
+						goto unm_err_out;
+					}
 					ni->itype.compressed.block_size = 1U <<
 							(a->data.non_resident.
 							compression_unit +
-- 
2.37.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
