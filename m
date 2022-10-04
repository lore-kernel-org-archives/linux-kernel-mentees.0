Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B611CC433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 Oct 2022 03:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D86160C31;
	Tue,  4 Oct 2022 03:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D86160C31
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ctblUqYu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xGe7M6HmqBkx; Tue,  4 Oct 2022 03:16:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4C11F60B04;
	Tue,  4 Oct 2022 03:16:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C11F60B04
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F414C0033;
	Tue,  4 Oct 2022 03:16:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5A1A5C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Oct 2022 03:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21B7460C31
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Oct 2022 03:16:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21B7460C31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sul8yuFPhIQr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Oct 2022 03:16:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CD7460B04
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CD7460B04
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Oct 2022 03:16:45 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id r185so2794624pgr.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 03 Oct 2022 20:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Flg3/SpxZ4nlW0rldGn9nsAn/YMX4bI0O25ZeoXC7Ig=;
 b=ctblUqYuosqB1quvT3Bznf0Bk3tuq0qXvibeg4/bptRlCh2Y3wcYoeB8YaviOCSfrX
 mHLBG4QygPS4VQ3GVdIIF19qv62BE320QvDB6QMzmNZsGCqRN3/apITFrxWSANT9Lrum
 hFoM9n5NnCm9XgZB2AUZIAelG6AX4MPvKsdD/2Z/v3bs1DdZSexsi3HExGMqu/6HqEvF
 b3It2bOzeW8Pzjp6kHEldbRIkrRE1rL6l16DixN/daHAdZo8Px0RP6au1IkL54l/3Cv/
 czKo9QmRkjh7cakDPAts4TkKKuSHAjoCSlp7DyjlTxNfEt4c3xx5wz/QvxEbzfhxj7a7
 3KEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Flg3/SpxZ4nlW0rldGn9nsAn/YMX4bI0O25ZeoXC7Ig=;
 b=OGi7XaTYP9nA7jdmR+BX0/4uP9xO3JC+OmQ6DvGJtAkMiMaGxsYMiGkzk/pS1mZlly
 W/94y7vESJ10oNZvANMO3g0mFOFSX6/FGgyzQ0qR0UDo2JdF5hO/zcPK4XLE7tR69qQT
 bSDzC8fzf4DyiU0Ke0crzcD8ITR8TN68WNR5gFI+f30Oq4bO1M/LH2he29MsSnnA848H
 ObMPkADLCmpL1I4CrA36JYPLTSYLQmflhlvRrKoXmmZ9+E/+4kOKcA8wunH06iUN+fLC
 G30VG6mooQGZwIyFpaf3FiScBM4/OTm2DTuvMriu8ysQoNo/vsZErric+KI3SUBAbdzw
 8O1A==
X-Gm-Message-State: ACrzQf16U87YgM7WbVmt6LA9k4DOT5sgQou8C4v9teA+ZtN5zi2hByac
 ZNUqjLTN24hoQtI+9LqWm/U=
X-Google-Smtp-Source: AMsMyM6ihKXmuoIzYH2AKcrJ/ujeBN/lJxh6ggAJBg3SJOS718b0OtaKU0DMRJLYCNDSxjMdEl6uwg==
X-Received: by 2002:a65:6a12:0:b0:445:84f6:676a with SMTP id
 m18-20020a656a12000000b0044584f6676amr12807775pgu.40.1664853404600; 
 Mon, 03 Oct 2022 20:16:44 -0700 (PDT)
Received: from localhost.localdomain ([171.78.165.127])
 by smtp.googlemail.com with ESMTPSA id
 w8-20020a63f508000000b0043b565cb57csm7609408pgh.73.2022.10.03.20.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 20:16:44 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Subject: [PATCH] fs/ntfs3: Validate attribute data and valid sizes
Date: Tue,  4 Oct 2022 08:45:02 +0530
Message-Id: <20221004031502.20007-1-abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <000000000000c2333105e9cc7b1c@google.com>
References: <000000000000c2333105e9cc7b1c@google.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 syzbot+fa4648a5446460b7b963@syzkaller.appspotmail.com, ntfs3@lists.linux.dev,
 linux-kernel-mentees@lists.linuxfoundation.org
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

The data_size and valid_size fields of non resident attributes should be
less than the its alloc_size field, but this is not checked in
ntfs_read_mft function.

Syzbot reports a allocation order warning due to a large unchecked value
of data_size getting assigned to inode->i_size which is then passed to
kcalloc.

Add sanity check for ensuring that the data_size and valid_size fields
are not larger than alloc_size field.

Link: https://syzkaller.appspot.com/bug?extid=fa4648a5446460b7b963
Reported-and-tested-by: syzbot+fa4648a5446460b7b963@syzkaller.appspotmail.com
Fixes: (82cae269cfa95) fs/ntfs3: Add initialization of super block
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 fs/ntfs3/inode.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index e9cf00d14733..9c244029be75 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -132,6 +132,13 @@ static struct inode *ntfs_read_mft(struct inode *inode,
 	if (le16_to_cpu(attr->name_off) + attr->name_len > asize)
 		goto out;
 
+	if (attr->non_res) {
+		t64 = le64_to_cpu(attr->nres.alloc_size);
+		if (le64_to_cpu(attr->nres.data_size) > t64 ||
+		    le64_to_cpu(attr->nres.valid_size) > t64)
+			goto out;
+	}
+
 	switch (attr->type) {
 	case ATTR_STD:
 		if (attr->non_res ||
-- 
2.37.3

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
