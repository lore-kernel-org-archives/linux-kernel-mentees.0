Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F9AC001B0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Aug 2023 05:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A753E81E2E;
	Tue, 15 Aug 2023 05:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A753E81E2E
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=CTrcNKyM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MGQ5lvW1FBmn; Tue, 15 Aug 2023 05:23:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7114181E28;
	Tue, 15 Aug 2023 05:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7114181E28
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4BBD3C0072;
	Tue, 15 Aug 2023 05:23:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5119BC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 05:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F5AF81E2A
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 05:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F5AF81E2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZWJa1YLYaqI
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 05:23:00 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0634581E28
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 05:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0634581E28
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1bdbf10333bso28917145ad.1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 22:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692076979; x=1692681779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KHF9DwBt/KL1PFI7RDqx5fwl57eGwDq8ZK1tGPWeBhg=;
 b=CTrcNKyM9wenReoMPPTsvZw/gbr1FG4sXAejfeRM4bbW8H59tBTiIeMhNjXTVTioGk
 xVZ775pmy1FLUUtGTYeI/sx3EsGalNoU/VgzGPBQ6srC+XO6CUkQfHlildtlbx/ag+bU
 Xpvi9yEubrzVuqcgBwF8pLk4MFy6IZaMrJuUp1nmC0s2X+VymajjhWPm9z7mgU7591h3
 D5/G7LoGl28xD3KsMigKiLRmdx1jWA04486fOIQ6IqlYptEQzsw4QMX7qRlJr5MyWf6I
 VW8lKUVFjmDURwQk3Y0TNK6p2lIhw6ZLIjPUDechn6NzTXLfsFtB8ehEXfD3MvcPfTat
 OvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692076979; x=1692681779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KHF9DwBt/KL1PFI7RDqx5fwl57eGwDq8ZK1tGPWeBhg=;
 b=PoVv8obBGV+n/izSWqotN1UTqv9o20nGhNmke9r9XIFe1ex6OhOwpmHiE/pMjyJCH9
 CuZFr5f+lNSofXUteaQOvPLUDdtoSRF6dZ0XODeuoXl9Xc/vm/esaLUJKv9gLgowreMj
 JmfPde7+rOQqmUckEvJwpXqaNDAJ4lk81D0zumEHuin/rzuRGEtgFmIRsGT9lpsoGNyI
 fHcxEepnlT49KoFvrtYK6SYAheMWBs0jT2kleaJ9Ba6aw4eVC8GvyqYg8FXnPqye/PXT
 r2qaMEp6YAkN57payckc+i+CC7kkkvT06+qMXtfyEuI0pvVdRaPwOP/KD7ELOQuYLANw
 VA/g==
X-Gm-Message-State: AOJu0YxPjcvtnkef9tBR9Wu9uh4UFStqSUoHCDemz3fsBq6PqbyqCSW6
 rYaV7ryfhy+0ZAlurdq547o=
X-Google-Smtp-Source: AGHT+IF16TCyVtCgJTpVSwrOqeIBxBUrJvxhSI8dEuR715qV8vVR1nTShXLVmQC5gffHOlV4IQyhCg==
X-Received: by 2002:a17:902:6acb:b0:1bb:59da:77f8 with SMTP id
 i11-20020a1709026acb00b001bb59da77f8mr13032408plt.48.1692076979138; 
 Mon, 14 Aug 2023 22:22:59 -0700 (PDT)
Received: from manas-VirtualBox.iitr.ac.in ([103.37.201.174])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a170902e54a00b001b66a71a4a0sm10311347plf.32.2023.08.14.22.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 22:22:58 -0700 (PDT)
From: Manas Ghandat <ghandatmanas@gmail.com>
To: anton@tuxera.com,
	linkinjeon@kernel.org
Subject: [PATCH v5] ntfs : fix shift-out-of-bounds in ntfs_iget
Date: Tue, 15 Aug 2023 10:52:50 +0530
Message-Id: <20230815052251.107732-1-ghandatmanas@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <BF7AB30A-8AE7-4819-B99D-8147D455AB95@tuxera.com>
References: <BF7AB30A-8AE7-4819-B99D-8147D455AB95@tuxera.com>
MIME-Version: 1.0
Cc: Manas Ghandat <ghandatmanas@gmail.com>,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 syzbot+4768a8f039aa677897d0@syzkaller.appspotmail.com,
 linux-fsdevel@vger.kernel.org, Linux-kernel-mentees@lists.linuxfoundation.org
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

Currently there is not check for ni->itype.compressed.block_size when
a->data.non_resident.compression_unit is present and NInoSparse(ni) is
true. Added the correct check to the compression unit.

Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
Reported-by: syzbot+4768a8f039aa677897d0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=4768a8f039aa677897d0
Fix-commit-ID: upstream f40ddce88593482919761f74910f42f4b84c004b
---
V4 -> V5: Add recommended check to compression_unit
V3 -> V4: Fix description
V2 -> V3: Fix patching issue.
V1 -> V2: Cleaned up coding style.

 fs/ntfs/inode.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 6c3f38d66579..d8ac221f212b 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -1076,6 +1076,16 @@ static int ntfs_read_locked_inode(struct inode *vi)
 					err = -EOPNOTSUPP;
 					goto unm_err_out;
 				}
+				if (NInoSparse(ni) && a->data.non_resident.compression_unit &&
+				a->data.non_resident.compression_unit !=
+				vol->sparse_compression_unit) {
+					ntfs_error(vi->i_sb,
+					"Found non-standard compression unit (%u instead of 0 or %d).  Cannot handle this.",
+					a->data.non_resident.compression_unit,
+					vol->sparse_compression_unit);
+					err = -EOPNOTSUPP;
+					goto unm_err_out;
+				}
 				if (a->data.non_resident.compression_unit) {
 					ni->itype.compressed.block_size = 1U <<
 							(a->data.non_resident.
-- 
2.37.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
