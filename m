Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEB81FF7C7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  6 Oct 2025 22:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759790350; cv=none; b=W08kx7a1LzudF9SdQ3YicPaxlz9VEmIb2Cq8iU64gzf2K0dvh+UdcQ1AUW/aA7JM0yokMH7wPsuDvG53oIEFo2G0KjR81+ZbTuL8w6M1sB1FACAPQOhdun6LrbrB5CY1AmUJU5Buoa53KA4Pwyv4cNWEedQNwvCMxznPEYe4w74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759790350; c=relaxed/simple;
	bh=476qFSj3sr1jIr2YGzC22ubQeJw0gVOQ7vtxudlpjmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mcKTlbcamoNiMBvkct0GipgALCk7nGD8gE7n7XgqRJKvb3R9VL2zNwKARUXE5l5SAnNTYBJKf3VCcA5OmBjpuslxIwgTDfATESyh6ttmvsiRWvjgtujDY9uN/pTZY7Q0svXEH6vfBVukD4AqM4Uhshd2OI81HA/bhKuoEK3kBGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKlhPA6A; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKlhPA6A"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BA95400DA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  6 Oct 2025 22:39:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cK8C2Cdx6euY for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Oct 2025 22:39:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=nirbhay.lkd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AD5E94078D
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD5E94078D
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LKlhPA6A
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	by smtp2.osuosl.org (Postfix) with ESMTPS id AD5E94078D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  6 Oct 2025 22:39:07 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-789fb76b466so4882630b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 06 Oct 2025 15:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759790347; x=1760395147; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=epHNuGWjtr5JgO8lZyH/Ct6cqyHhs3SVgqyLVnQj8Gc=;
        b=LKlhPA6A4rtaoyXtkorynKAiAsIcrVVQltuMPyRF3AcZ8Q7wZjD6CEqlB643F2OKKw
         Gm5k9ZMTPpHB///+2dpx7+8YCT+PlwdPGZFoXotjz4zw6LOk1XKPWtYYnbqtpxDnhHQP
         QOSWke66leGhUP747FgL64LqfwmtpScnzBIG5+/rqJLn3GzqnYABNTP1p2sAUpCnoWtS
         1ZalYgfHKUVNsxyAGLqjM6WuBNLizcZXjlJH8D2eFtHULHiQcQl+K2lc108xLrZ76esi
         XfY2NSbQBDoqd6x9kaYX4dp7KL5TZlo6i1W2KO7LBZdtVONAfUQBV8qb0N6v/niHKE3G
         OJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759790347; x=1760395147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epHNuGWjtr5JgO8lZyH/Ct6cqyHhs3SVgqyLVnQj8Gc=;
        b=dm3b7dFcOSe47fhcFtMjYVpKKkbwTdZZ//aEVZ27wk3zQ2TJTn2pX70K6CqzBKQOCk
         dTeXiHuHT1MtYlS3htC4Mfo29pqyLNmL/zDchjzecJXhs5uw4vtgGH9fWU3p+WOIumt0
         0vafmu2HT22UmToA0qESgAAiaXG/hGBcElsoRnGDdF2x+yT6aRVcNXiKPRWn68t+AtVg
         Q0xuoL5loZDHweQelADQplNr0cimxB+bcd3q/hRYQS2JKuuIgxs0i7/vf+I/gex48pj5
         +SnjK9MtlYqKUaFjWHO4122Ce4MTQkhOGOK3OBvs4VhlCLDGpHjI0JpZU6A9x5DF8u3k
         pBEA==
X-Forwarded-Encrypted: i=1; AJvYcCX3iK6MC6QEeSMi+2c8U9SNaLqCWLLsa1PJt2NKzYh0MkD7hBnuKtj0hc8K5RGnVexNFHJ6RcQX0GiY5Uv0l7Eos85QQw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YznBwXnLFUR6s7yKEzBSAoBiYzUM7JR2XQWFNvyapEBxbvkt7y3
	HxLnVnDWoG4UsUAkCneeAfFH3XS6MUlLIOOAXhjRJKVRLPYsrbLGYPTr
X-Gm-Gg: ASbGncvNgiofllkkEkPhdjpDqpSvUxj8v/14YzjYyOuS9GaeQQt6Owail/uUdIL6lzr
	zu0WT5Rs5NlabTDMa/cb15MimHRClVNk/S//B/iVBHFZiRuWZKUCaJUE414RgCa5t/6khhJIkc9
	Pa1EFgo+KwLY+Yr8KwLdXDhe7Rngp+KrUtssanZ0XuBXM8PUjMivPm6OPbwVOSIL5zHxTdTrZD5
	jdjiZV3GMQurJ24sYYFzLXvLXSCHbeK1tJveMnNqx7YFgqL7+fwB7yxvq4uKds+Eli4FKBpvP3q
	dGAtpIu37wd3f09a7s9qAx4r3RLRITG/SSmYTyz0GgpxlH/1Gb+PbjHhOQ+1r8A5xk1WcOw6E6m
	ufU9ljGiwjdamnETA6UzaHu6k1OQAHhZF8JOuo3RqTQ==
X-Google-Smtp-Source: AGHT+IF6xREOFF7VwHOye2oqD0t5qCm6RdBUaVqYPSYZgYjGI++60wK2ctzYcgxahLhIk9GjvsroCg==
X-Received: by 2002:a17:902:f78c:b0:25c:8005:3efb with SMTP id d9443c01a7336-28e9a6fd985mr177313305ad.54.1759790346635;
        Mon, 06 Oct 2025 15:39:06 -0700 (PDT)
Received: from fedora ([119.161.98.68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b87dcsm143480895ad.90.2025.10.06.15.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 15:39:06 -0700 (PDT)
From: Nirbhay Sharma <nirbhay.lkd@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: david.hunter.linux@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	khalid@kernel.org,
	Nirbhay Sharma <nirbhay.lkd@gmail.com>,
	syzbot+83c9dd5c0dcf6184fdbf@syzkaller.appspotmail.com,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: fix KMSAN uninit-value in ni_create_attr_list
Date: Tue,  7 Oct 2025 04:08:04 +0530
Message-ID: <20251006223805.139206-1-nirbhay.lkd@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The call to kmalloc() to allocate the attribute list buffer is given a
size of al_aligned(rs). This size can be larger than the data
subsequently copied into the buffer, leaving trailing bytes uninitialized.

This can trigger a KMSAN "uninit-value" warning if that memory is
later accessed.

Fix this by using kzalloc() instead, which ensures the entire
allocated buffer is zero-initialized, preventing the warning.

Reported-by: syzbot+83c9dd5c0dcf6184fdbf@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=83c9dd5c0dcf6184fdbf
Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
---
The following syzbot test commands were used to verify the fix against
both linux-next and a specific mainline commit. Both kernels were
configured with CONFIG_KMSAN=y, and no KMSAN warnings were observed
with the patch applied.

An attempt to test against the latest mainline tip failed due to an
unrelated boot failure in the SCSI subsystem (KMSAN: use-after-free in
scsi_get_vpd_buf). Therefore, testing was done on the last known-good
mainline commit below.

For mainline commit 9b0d551bcc05 ("Merge tag 'pull-misc' of..."):
#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 9b0d551bcc05

For the linux-next branch:
#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master

 fs/ntfs3/frecord.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 8f9fe1d7a690..4fe8da7fc034 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -767,7 +767,7 @@ int ni_create_attr_list(struct ntfs_inode *ni)
 	 * Skip estimating exact memory requirement.
 	 * Looks like one record_size is always enough.
 	 */
-	le = kmalloc(al_aligned(rs), GFP_NOFS);
+	le = kzalloc(al_aligned(rs), GFP_NOFS);
 	if (!le)
 		return -ENOMEM;
 
-- 
2.51.0

