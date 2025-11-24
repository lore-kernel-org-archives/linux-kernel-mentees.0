Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C63231829
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Nov 2025 17:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764005303; cv=none; b=Bh0xpJxPtuxfBWjt57yaLSPLPCVa5bkFrzh/PPK5VXfr4xYI7P4ao7D/5uftwZUcHir0s0GjnZPh5fjheGjnhQkJ3fjm4cdgwaVxGb7jJFG4g4JzBaR28jlqcDsxShIG2mR/w/QHPhr8DZ1usShGhfWIuo8Zbi9YunfqpC9xv/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764005303; c=relaxed/simple;
	bh=3oH/wAdy55TtrwLg5CcQw140ZRAqpfNOOtj3sU8BhII=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QtzfTQ/IGoXQ26aLyBVYtwGg4a0sev+0FtrOmWTKKoeliGoZuffJmpxHBN/CbpMLS+i11MV+CPdaXt77UrtnTWJzYkxDv5p/A6+UzzSyX2zx60uAYFo4Uvip3PGw6T72ix+uhYO51ZJPIgQSffzPgHTBHQlLdnvrpZTORVzPRbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dn1klcfl; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dn1klcfl"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2C7E40FC7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Nov 2025 17:28:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F0kFRzv3w_Rs for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Nov 2025 17:28:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E4EE740FCE
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4EE740FCE
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dn1klcfl
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E4EE740FCE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Nov 2025 17:28:20 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42b3720e58eso3528988f8f.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Nov 2025 09:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764005299; x=1764610099; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3J1OuptE+eXhtOMpZOrEy7V0/XXBCdvwVjX11ZxUQz0=;
        b=dn1klcflrH72JL1Pvk5gwREQ417TeHvjtFiFnPAodHrq7np/X9xQeR9DHhYZvD2GTT
         93OFl53MnqaCRZUIALq8ntNoomQRP7AEBlw121fDMkfggZCDlJEnKSAISRqN254HqL7F
         dioY+xAus1fx5rrMl51+4mjF/pw8FJu+7uNlckt9PUOurZroIeoRHc8m1fxPTEj6Xdpq
         1vvmrNUVgbV+xLvz1HVGFjdbXe8ZR27FCf+DjdNL/rmzLF5s9rQDR8O6tGFcLlwKSbi8
         VUrtiANFAxUmTD1B5ty4lNX75wZVPgSFdYFytagN2nzf2FFa8qvBghjnpUCgz0t7dKvx
         wjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764005299; x=1764610099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3J1OuptE+eXhtOMpZOrEy7V0/XXBCdvwVjX11ZxUQz0=;
        b=IWlWIfAfFPMaFiUMfLnZLTpVx0mZ1+ekRu2nhHDlCQcOJyYQ1vq/lIHbjRXwWwWxit
         1vBkX3ZP0786E9NTAmmm3Mno4vXZlAJCoAwZe2jo+tmCyE/eKQh6naIgYMwzFYSQkmxs
         fKcCjorDg0fFSR3usMW3E11vWxYSVS+jVcPEVArOqtnDA6TbZncbvkgu5/jcL4/GwupD
         SCpLwZZ6SZmKx91uQAw6Ft7thpSQ9jSzWHYw3rMWdf4wWNnOW2l8OQh08Z0MUTCIVHDb
         Wb2LnRLR8BK80JIK1jbK1aiX1w+YuVbDoGZJD6EmpFkJyj8vNDD92R8jTdrVaMRJJzrj
         nWHg==
X-Forwarded-Encrypted: i=1; AJvYcCVGK8V6f+m4GQiRpnfQHwuKuWBMdHTn8nsqYQRDrwrOwG0IV4mAq1ZlTIGEv2ia1/+eJUU5HquO4upGTYLjUQq4ruUpfw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz/lnjQBFvxeSYSGMFd3IP+pHc4eyR71jOpTTstzD0B8uZ++Uc3
	iydjxgmhbVTR4H40Hs+3uFHOZA2AiQmzR0gESLUgfhLMk1dH4aTMd2Bv
X-Gm-Gg: ASbGncsuvhBtnzg7Iqx07yM6B00ttGJmMXLgr2nCBlnTKNGHytFFsmfppoXzjf3urpU
	AOjoWw0Ii0ofz15ydFFk56gujrr8/VdE2Ea9Jl7+Jzc+L+qEsms/dV+jOso7jSYk7wPQleFok1L
	rNm6QkJOMyejQV0s5t3GQCioxhrwIJeJoe/oIVssLqKQ9B/f9PytykSYn+LrXW4ex3cIjlDGTTx
	YddDAbM2ZbGl4Z8kaSNSOKgDj1BmYKAHoQQzY7Rw7eTggNvAzwOcBOCRM8HxruzvAh5dA7Tbf2u
	C3I9wkqIH3Fh25UiNKnleXZE5Fijcd/ScRKYcTJSaC6uXmjNUIzLyAu7l1esPBEXnuF4ZjiHRk3
	ZAjo1ngYaXndatW0LDnan+tGxQeOAgMukRp121vbkTDLGPNRR2Q3laRPJ09EtoM26tArVC2Vzj1
	DVJQ3Y39n/5ccBEnxtAv+3nQ==
X-Google-Smtp-Source: AGHT+IFYcHtKnTQuGnZVQa/KwkYM+ou4ckUgNPHvgqeID7aDViND63oKXSIlG5aX5GpVhrDgW43P8w==
X-Received: by 2002:a5d:5888:0:b0:42c:a449:d6a5 with SMTP id ffacd0b85a97d-42cc1d27b05mr12919046f8f.34.1764005298543;
        Mon, 24 Nov 2025 09:28:18 -0800 (PST)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa35c2sm28315690f8f.25.2025.11.24.09.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 09:28:18 -0800 (PST)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: aivazian.tigran@gmail.com
Cc: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>,
	syzbot+f51a2a34984e4d8888fd@syzkaller.appspotmail.com
Subject: [PATCH] bfs: Fix calculation of offset when moving blocks
Date: Mon, 24 Nov 2025 19:28:15 +0200
Message-ID: <20251124172815.100111-1-zlatistiv@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bfs_move_blocks performs an incorrect calculation when
looping over the blocks that are to be moved.

When looping over the section of blocks:

for (i = start; i <= end; i++)
        if(bfs_move_block(i, where + i, sb)) {

Here bfs_move_block will not move
blocks "start"-"end" to "where"-"where+size"
but instead it will add "i" (which is initialized to "start")
to "where", adding additional unintended offset.

Example reproducer of the bug:

dd if=/dev/zero of=./bfs.img count=200 bs=1M
mkfs.bfs ./bfs.img
losetup /dev/loop0 ./bfs.img
mount /dev/loop0 /mnt
dd if=/dev/urandom of=/mnt/file0 count=75 bs=1M
dd if=/dev/urandom of=/mnt/file1 count=25 bs=1M
dd if=/dev/urandom of=/mnt/file2 count=25 bs=1M
echo 123 >> /mnt/file1

Essentially this will create 3 files, file1 located
right between file0 and file2 on-disk. Writing more
data to file1 will cause bfs to attempt to move it
after file2, where we have enough space to store it,
but due to the incorrect calculation it will attempt
to move it past the end of device and trigger a NULL
pointer dereference in bfs_move_block.

Even if we have enough space to account for the
unintended offset, the content of file1 will now be
garbage due to bfs_get_block expecting file1 to be
right after file2.

For example:

dd if=/dev/zero of=./bfs.img count=200 bs=1M
mkfs.bfs ./bfs.img
losetup /dev/loop0 ./bfs.img
mount /dev/loop0 /mnt
dd if=/dev/urandom of=/mnt/file0 count=1 bs=512
dd if=/dev/urandom of=/mnt/file1 count=1 bs=512
dd if=/dev/urandom of=/mnt/file2 count=1 bs=512
sync; echo 1 > /proc/sys/vm/drop_caches
xxd /mnt/file1
echo 123 >> /mnt/file1
sync; echo 1 > /proc/sys/vm/drop_caches
xxd /mnt/file1

The hexdump reveals that our file now contains zeroes,
except for the "123\n" we echoed at the end.

Fix this by correcting the calculation. Additionally add
a check for new == NULL inside bfs_move_block and propagate
the return value of bfs_move_block as a return value of
bfs_move_blocks in case of error.

Reported-by: syzbot+f51a2a34984e4d8888fd@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f51a2a34984e4d8888fd
Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
The example reproducers might trigger a WARNING() in mark_buffer_dirty,
which is observed often when blocks are moved around,
syzbot has already hit that bug here:
https://syzkaller.appspot.com/bug?extid=2327bccb02eef9291c1c
I will follow up with a patch for that soon.

 fs/bfs/file.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/fs/bfs/file.c b/fs/bfs/file.c
index d33d6bde992b..649105018014 100644
--- a/fs/bfs/file.c
+++ b/fs/bfs/file.c
@@ -40,6 +40,10 @@ static int bfs_move_block(unsigned long from, unsigned long to,
 	if (!bh)
 		return -EIO;
 	new = sb_getblk(sb, to);
+	if (!new) {
+		brelse(bh);
+		return -EIO;
+	}
 	memcpy(new->b_data, bh->b_data, bh->b_size);
 	mark_buffer_dirty(new);
 	bforget(bh);
@@ -51,14 +55,17 @@ static int bfs_move_blocks(struct super_block *sb, unsigned long start,
 				unsigned long end, unsigned long where)
 {
 	unsigned long i;
+	int err;
 
 	dprintf("%08lx-%08lx->%08lx\n", start, end, where);
-	for (i = start; i <= end; i++)
-		if(bfs_move_block(i, where + i, sb)) {
-			dprintf("failed to move block %08lx -> %08lx\n", i,
-								where + i);
-			return -EIO;
+	for (i = 0; i <= end - start; i++) {
+		err = bfs_move_block(start + i, where + i, sb);
+		if (err) {
+			dprintf("failed to move block %08lx -> %08lx\n",
+				start + i, where + i);
+			return err;
 		}
+	}
 	return 0;
 }
 
-- 
2.51.0

