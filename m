Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801F37E6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Jul 2024 00:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719965225; cv=none; b=a6gPA1US7LcLo6u4wM9wApwGpW/rGGZow4+xcJ+58yemUUjpAlj3LEJMdhgLSlIvWccJXP+O71LS3osytrNGRyUpRRimmcTMGsNChYY9rhGIyyNWUyRXHAw4MhH0exNA1jjwCNWbpvuZgJoGW099dmFC70EgxrZv2+1p/+O5szc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719965225; c=relaxed/simple;
	bh=KOjkQB3I1BkmOGdUI7hd+tydhVz2TLsy35U2esSLVOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MyprmL0BrUDAkfjhHV4FPWF1Unqa+8A1nZSJJYWMP1UwD2hDempAlMHlgILqw8kXosUX2TH2eEfFAIFTAZKIotAqCooF42rx/URmUMk2Ei63gOM8WwqfiWaXIU32njAvwkLzDNS3iHhPLiBePXV1185guPbkoXTdG647TdC3+bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XsSPuBIz; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XsSPuBIz"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15B8B83F58
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Jul 2024 00:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1a91GRRPLdRU for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Jul 2024 00:07:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=peili.dev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DBE758402A
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBE758402A
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XsSPuBIz
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DBE758402A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Jul 2024 00:07:02 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-dfab5f7e749so5223959276.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 02 Jul 2024 17:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719965221; x=1720570021; darn=lists.linuxfoundation.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZvRNv/JZDDTRdI18aBXSlRlEYxDmftdVdHUvCCc4C4=;
        b=XsSPuBIzZJY/udY0DU60cbAEUzkId1itGiNFkMppKCbDSlYPLmR7EqywP/s+CDoao7
         zacjbYYYjrAwR2xjUN24H1LEr5Uv2KrbyTrc/9u85KYw3/oGUND0GyNvsWs5BhVc0U4A
         +6omlJE13PHIMZslW3qmIS0uboiZXBgbpP0QT+hJgc55tB80n8+5lLoSZISeJzPu3cA7
         IvylmDn/kqv0DTeDGqEbXul/x8SimzWBWn6IC8rZLEq6MwV3yyywgvmJQrf0kiFB9EKO
         9niqZiWKp3PXlR29P95Z/qPUSXtmYgPuXj0+7VzlSlC2FqTk7JFwXD/roVoPb0MVZuka
         oKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719965221; x=1720570021;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ZvRNv/JZDDTRdI18aBXSlRlEYxDmftdVdHUvCCc4C4=;
        b=KtOFWoGmibKwJHftyH5MwJpzROXZHj9AhruHWrlIut71c0oaZO8LjDCOHNvStmtSaE
         ucrME1on2ORPYSkdBaS3d98iPOi+EUwvPvpr5kCLm5SZcieE2VkLWvxyf22TPUIfszk0
         NXYt3JJQ3OdDgztlsVJNOI2NU+r+OaTDmeDbn/VQhCivU3e43OD00mWOWKmimUx68PyA
         eupj4fbbih2CriPQ7Qxs1I0kDdDcI7pboeRvncWAV5kogv5tduGESh2gROMHliS/J0o8
         rgv+EoAJRxNnImHjxeJwHu5wKxw6Uo1sAk5dhzWAIybX5dvk4ZYtGgZZfu7i01yOTKwS
         UtQA==
X-Forwarded-Encrypted: i=1; AJvYcCVf5LRb0UuR5X85PhqEf9Wng/XlmR9BRWIcY+SNZLW/2nPAEK2Pn98TyQxh14sk73k2OndKres47n5robycob9ck+kHns1ZH2PuIvMg4qyzB1vaiA77Vg3PGHjM0+Rb
X-Gm-Message-State: AOJu0YztSJ/sS2qUiyFb3/6QKSK1c0h+xE3Zyo6N7chhQNJm2a23FsP4
	2yCOPBulXrZfIyPi2q4eT+tX/ipbA219MZeS78UPbA08bZN3qCeJ
X-Google-Smtp-Source: AGHT+IFvnDviwYP2MMWVIyiZGWuWfw8Pha6PWftZA89tPNoEvhz68eBNpCbXiLVaSfSolspbTBiLpw==
X-Received: by 2002:a81:a50a:0:b0:643:fd49:2db6 with SMTP id 00721157ae682-64c7123b008mr112444957b3.1.1719965221531;
        Tue, 02 Jul 2024 17:07:01 -0700 (PDT)
Received: from [127.0.1.1] (107-197-105-120.lightspeed.sntcca.sbcglobal.net. [107.197.105.120])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64a9a23bae7sm19621077b3.42.2024.07.02.17.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 17:07:01 -0700 (PDT)
From: Pei Li <peili.dev@gmail.com>
Date: Tue, 02 Jul 2024 17:07:00 -0700
Subject: [PATCH v2] Fix WARNING in __ext4_ioctl
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240702-bug8-v2-1-be675f490db1@gmail.com>
X-B4-Tracking: v=1; b=H4sIACOWhGYC/13MQQ7CIBCF4as0sxYDAwpx5T1MF4hAJ7HFgBJNw
 93FLl3+Ly/fCsVn8gVOwwrZVyqUlh64G8BNdome0a03IEfFj2jY9RUN00FzbhGNUxb69ZF9oPf
 GXMbeE5Vnyp9NreK3/gFVMMGU0D4cpHNWynOcLd33Ls0wtta+AGDL1ZgAAAA=
To: Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>
Cc: linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, syzkaller-bugs@googlegroups.com, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 syzbot+2cab87506a0e7885f4b9@syzkaller.appspotmail.com, 
 Pei Li <peili.dev@gmail.com>
X-Mailer: b4 0.15-dev-13183
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719965220; l=1799;
 i=peili.dev@gmail.com; s=20240625; h=from:subject:message-id;
 bh=KOjkQB3I1BkmOGdUI7hd+tydhVz2TLsy35U2esSLVOw=;
 b=PCjjmgpOOOYcDd86Cde/YaT+V68Ga0Vs4zKgw6YZC7RbX1jiHDk/V1rwonT4uNkeJ0EkvlnOv
 nTJOcIdwcM9AGEL1bQy6u3HPgDrwEjXy+pIFdcQGnFEu5wxQ39Dv93o
X-Developer-Key: i=peili.dev@gmail.com; a=ed25519;
 pk=I6GWb2uGzELGH5iqJTSK9VwaErhEZ2z2abryRD6a+4Q=

Specify the size of s_volume_name in strscpy_pad() to avoid buffer
overflow.

strscpy_pad() by default takes the size of destination string as the
size to be read from source string. However, as s_volume_name is only
declared as an array of size EXT4_LABEL_MAX, we are reading 1 byte more
than expected.

Reported-by: syzbot+2cab87506a0e7885f4b9@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2cab87506a0e7885f4b9
Fixes: 744a56389f73 ("ext4: replace deprecated strncpy with alternatives")
Signed-off-by: Pei Li <peili.dev@gmail.com>
---
strscpy_pad() by default takes the size of destination string as the
size to be read from source string. However, as s_volume_name is only
declared as an array of size EXT4_LABEL_MAX, we are reading 1 byte more
than expected.

Specify the size of s_volume_name in strscpy_pad() to avoid buffer
overflow.
---
Changes in v2:
- Add fixes label
- Move workaround into commit log
- Link to v1: https://lore.kernel.org/r/20240628-bug8-v1-1-417ef53cca33@gmail.com
---
 fs/ext4/ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
index dab7acd49709..0c4fb579757a 100644
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -1151,7 +1151,7 @@ static int ext4_ioctl_getlabel(struct ext4_sb_info *sbi, char __user *user_label
 	BUILD_BUG_ON(EXT4_LABEL_MAX >= FSLABEL_MAX);
 
 	lock_buffer(sbi->s_sbh);
-	strscpy_pad(label, sbi->s_es->s_volume_name);
+	strscpy_pad(label, sbi->s_es->s_volume_name, EXT4_LABEL_MAX);
 	unlock_buffer(sbi->s_sbh);
 
 	if (copy_to_user(user_label, label, sizeof(label)))

---
base-commit: 55027e689933ba2e64f3d245fb1ff185b3e7fc81
change-id: 20240628-bug8-7f700a228c4a

Best regards,
-- 
Pei Li <peili.dev@gmail.com>

