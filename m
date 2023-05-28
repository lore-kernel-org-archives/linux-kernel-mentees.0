Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3088C7EE37
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 28 May 2023 17:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3144082310;
	Sun, 28 May 2023 17:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3144082310
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=DRIPVUue
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vCY2QDY5i2Y6; Sun, 28 May 2023 17:36:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 55C87822EE;
	Sun, 28 May 2023 17:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55C87822EE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20EF8C0035;
	Sun, 28 May 2023 17:36:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74814C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 17:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C0E260ABD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 17:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C0E260ABD
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=DRIPVUue
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aq2Ho9qk38WJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 17:36:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E7EF60AA6
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E7EF60AA6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 17:36:20 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-51b33c72686so1486132a12.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 10:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685295380; x=1687887380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QT9S1V0tn+Qui24xPwzImeTWa71ArxoGK/RfxcM2d0g=;
 b=DRIPVUuedYZtjirHGYj5dUvMQIum7vUn6Z71/nqVBaB0lVHj+RMRCsG2Fe+dupaXlY
 1VBKgfxlvABZtmcYfkY8K7MiVMYHFAs0Tk/IMJjuplh9Qvz1S1VXcjROJ9gBFUyNMSRN
 smEAms53NIZ1sXp+ibCs3wzLuKwSFtsEzuHGBEj26uDjPIcbXqw4iLObhTu79C7zdXVu
 qqqwBlF3vQ8AeeC9LUOaXkb8XD9bqTxgU/udzGdFTC34d5aZeZEW8AoRqM0jitAIWASu
 MvGZJvbf9L9uEDQHXP0JzndLFA8GcmMskYxmMPwLyJsHbuF3uF8Wj9VhIbLnuP1HEUa6
 5IbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685295380; x=1687887380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QT9S1V0tn+Qui24xPwzImeTWa71ArxoGK/RfxcM2d0g=;
 b=TaQd+7nmnXsueguBUQMjw4/7bolqDpxPl81DuBysrTtVofhp2gOgU/v8zLmV5cqtCn
 khOVt1pRN60cGT72SSRsi9NfUHyIXMqvC+xl5hbw7TSv66OFbb27/h6/3+F4qHBFtEJf
 j4kcc/dImzaPb1h9hyO9YUaq9fxLg82baKP0G8byA2Bc8wuPyJXbn9W0/TKaNlMAwUBB
 WeDCWgiqarVj6liPcK49WF1dxhGbqFDncIlzFOcaAFeaw0plbBLee7PKRoK/dVN4+4t1
 T6F/EEE407IH5KDWhIbVmgwYq8XiSAL+Sv26cYP1fdRAZAOcGQNHkY3QAze9PbX1/Fvs
 X/ow==
X-Gm-Message-State: AC+VfDx18xK3/ZIoyGyVP6RGHwU8rblMet1IjsnftiZRJQRc9jxRiScA
 DhOvLLwUFA6USAYsaBmXr+U=
X-Google-Smtp-Source: ACHHUZ6qqGWC9hVv+TK7lpazsLsOWxoZOc/uttkq1ZXUkoJLGkiKn9TJqT5eH2JYww8vrvNBIWpOFg==
X-Received: by 2002:a17:903:2451:b0:1b0:39d8:2fc2 with SMTP id
 l17-20020a170903245100b001b039d82fc2mr2702102pls.49.1685295379709; 
 Sun, 28 May 2023 10:36:19 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:602:9300:2710::f1c9])
 by smtp.gmail.com with ESMTPSA id
 d22-20020a170902b71600b001b03f208323sm828575pls.64.2023.05.28.10.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 May 2023 10:36:19 -0700 (PDT)
From: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
To: skhan@linuxfoundation.org, viro@zeniv.linux.org.uk, brauner@kernel.org,
 chenzhongjin@huawei.com
Subject: [PATCH] Null check to prevent null-ptr-deref bug
Date: Sun, 28 May 2023 10:35:46 -0700
Message-Id: <20230528173546.593511-1-princekumarmaurya06@gmail.com>
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

sb_getblk(inode->i_sb, parent) return a null ptr and taking lock on
that leads to the null-ptr-deref bug.

Signed-off-by: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
---
Change since v1: update the commit message.
The bug was reproducible using the reproducer code and assets found in
bug report:https://syzkaller.appspot.com/bug?extid=aad58150cbc64ba41bdc
I used qemu to reproduce the bug and after the code fix I rebooted the 
qemu with updated bzImage containing the fix.

qemu-system-x86_64 -m 4G -nographic -drive \
file=./asset/disk-4d6d4c7f.raw,format=raw \
-enable-kvm -net nic -net user,hostfwd=tcp::2222-:22

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
