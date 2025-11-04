Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C80334C34
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Nov 2025 17:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762276896; cv=none; b=toVS1s7/VdYAwSRfFIt0NjsfgNNRJRcWYhjnyRyHb7OsHI3s0BMpMqiL5MyPt1lPo4KiD6nQ4jWvQYecbTZvVddyOV7RVZA0xteyWUPK1K08XdjSdjMQV5pHyjHbmf0+ecDmUbiixG5O7AEbvS7PNh4dBNrXuGHfAi7uh4dooAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762276896; c=relaxed/simple;
	bh=bA2jIZ7Kc1WcFGSU0I+T8TPROwwA+k34BdJqOp9H0lY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oTuQAIEhGd7O9KZLEN5zwa5qolR8xqBHnYQvOuLHs1AqIvr9gQskLpc/gekP94A1n909jXMPSqXgm7ZdFeYYl9VGvrKUn50V762bS3LtrKA6pH61TosyQbyMAkAmL7qVanQ3da7OvhbsqLipIj5LadsMTwqbaexNcMxhbn1ipPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPOcluzS; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPOcluzS"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 084BF82274
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Nov 2025 17:21:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DUniL9ZUW0wh for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Nov 2025 17:21:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0B4E882273
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B4E882273
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SPOcluzS
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0B4E882273
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Nov 2025 17:21:32 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-429c4c65485so4409117f8f.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 04 Nov 2025 09:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762276891; x=1762881691; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gk7uqFJsT+OuuyILG2i0M0OWp3LEmpDri8uW85tcWA0=;
        b=SPOcluzS0PUhWfnWqiuUDKDfPVpy60qbxISHqUJpb3E1sTnCpKAElX5TvgsCH5XWLW
         ZlQIHbI29lpQJzLNPfj8hfH1sh/14QJ9gX9P0obhe/KbSTh1R+vm2hsc0F6py/h+sztQ
         o6T+tVWuW2c7/RmD748tqrplWQlMXe8ibiLmgqgoF6Ry6ZbyOw6HmNUHu4nw+snE8lKl
         an+BBgCgtL4Jy2FkN56Ktgz3MxqeJIWO8IjAy8JmVVE8d0nR3CVRrwAA57KCn7Vu2WHS
         4U2fiUaSpYrXq/t36LhrAGKPmePdw23UceKvtO1yN3lgYsxH3a++3n8JT5umMyU3kfoE
         8+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762276891; x=1762881691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gk7uqFJsT+OuuyILG2i0M0OWp3LEmpDri8uW85tcWA0=;
        b=VxchsRP5fW/8+qfTbXIEOfqjnAU6Efpg7RGeduA6kdc5KxXdXeXI9cYfcJHWenm0pd
         HSVcKvOkdNXADdpDtsk6jCEx7dWvEyQ05tITa0ayqeo/b2ZemucCIhvRlHVHbTV+RiX2
         WFlRPO5H5t7GiQtXIGT1F4XqWTo8w8im3msxGTNeCL0sWW987tPRuzli+2UNaeCj/xxe
         UgeNEMqqAHioF7DLrwodJVra0/JwFyNZkYM0eyZ4aan6wvhhpI2MNIkfi1z7/raoglZZ
         DUnWOtPfYO53tPWW9nQ6QK5k1+PevKJFMs5BD8XAA79UbvtMkoS3IaZ+y8x62DCxR61E
         Xz5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjh5toWVKpAgJ2B5ZSflIrRdO8S52WrIZceJxDVhfet3i0y82O5uvXB3+I+xkmzfVyparujJl62cjD+umIE6/pGsgQxw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyKVidC23nMDvLflSDuj0gDGdrn7+R7pD+OGOtZyVP3cDfhL90M
	2stbPZgVIgKXrcxIDQqc2NhU12lPzueDp7ynodOSjArR5vuEfedxBT/e
X-Gm-Gg: ASbGnctUqpPK8XOkDL88O3ptB2LIM/JdvIy+EXZXDndQF1ywolsz2ZHJfGR8Fe1/f4Q
	cyh8GDbIdiUzZ85uDbwpHGUTjOiI+T123kBp70k7uVZNz+zZeMjtzTC9JDog+/kUCDZ9IFZ3MnY
	TL7tfRg0xTGa7H0hpI4T7ed9d3XsE/Eu5xoaTh6CS5fryoGJYDzIgVnrNDHunevYsDub2EmeGk+
	Eup5aNHK6T8yZfdkaDI9x8gY2xntYMQBJz9jelp6mAhXEtZEaOH4iBRNGqp+Yy+ViZB2pBMVm65
	VAYDlaj5S+q9Yz67uGs70CYzbYgdlDeNWnL4h6mLi55jQbwO/apWiyoB6eCJ9IS2y+WjoBEc4CQ
	7DKkqN1uYPFNAP/vLbu3oBtvxzP0DLPF6q7uV/U4QH/xwGU6qe85dVZp2kFq/Ze7serFNtzVCkB
	gAYtaA8K42sTM=
X-Google-Smtp-Source: AGHT+IELoaHLTPtLdfqtX2gyAJ6rc7yZLL/Fk6dfAmMUtx7g1a7eIhcZzPNyI+EikioHE3gnkd5PRA==
X-Received: by 2002:a05:6000:2681:b0:429:bb4c:9589 with SMTP id ffacd0b85a97d-429e3276a4emr106522f8f.0.1762276890618;
        Tue, 04 Nov 2025 09:21:30 -0800 (PST)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1f9c8esm5724211f8f.33.2025.11.04.09.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 09:21:30 -0800 (PST)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: aivazian.tigran@gmail.com
Cc: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>,
	syzbot+e7be6bf3e45b7b463bfa@syzkaller.appspotmail.com
Subject: [PATCH] bfs: Handle directory bfs_inode->i_eoffset == 0xffffffff
Date: Tue,  4 Nov 2025 19:21:22 +0200
Message-ID: <20251104172122.4029513-1-zlatistiv@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement bfs behavior for interpreting i_eoffset == 0xffffffff
as "unused". When the field is marked 0xffffffff calculate the
inode->i_size field from the number of blocks allocated.

This prevents spurious reads outside the device during bfs_readdir and
bfs_lookup. This is the only on-disk value of i_eoffset that will pass
the initial corruption check if it is larger than the actual disk size.

Syzbot stumbles upon the bug by mounting a bfs filesystem with root
directory having said i_eoffset, which passes the initial sanity
check that compares it with the total filesystem size:

i_eoff = le32_to_cpu(di->i_eoffset);
s_size = le32_to_cpu(bfs_sb->s_end);
(i_eoff != le32_to_cpu(-1) && i_eoff > s_size) // This is part of the
					       // corruption checks in
					       // bfs_fill_super

Since BFS_FILESIZE expands to i_eoffset + 1 - sblock * BFS_BSIZE
when sblock != 0 it wraps around back to a large value (~4Gb).

Later when listing the directory or looking up a file we start
attempting to read past the end of device multiple times,
which takes some time and we are stuck failing again and again.

Testing:
  As this is a relatively simple filesystem it's operations were
  "manually" tested, meaning filling all 512 inodes with random
  data, random reads, writes, deletes, etc.

Reported-by: syzbot+e7be6bf3e45b7b463bfa@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e7be6bf3e45b7b463bfa
Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
 fs/bfs/inode.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/bfs/inode.c b/fs/bfs/inode.c
index 1d41ce477df5..aa5e66290f6b 100644
--- a/fs/bfs/inode.c
+++ b/fs/bfs/inode.c
@@ -79,8 +79,13 @@ struct inode *bfs_iget(struct super_block *sb, unsigned long ino)
 	i_uid_write(inode, le32_to_cpu(di->i_uid));
 	i_gid_write(inode,  le32_to_cpu(di->i_gid));
 	set_nlink(inode, le32_to_cpu(di->i_nlink));
-	inode->i_size = BFS_FILESIZE(di);
 	inode->i_blocks = BFS_FILEBLOCKS(di);
+	/* For directories i_eoffset == 0xffffffff means "unused" */
+	/* Calculate file size from number of used blocks instead */
+	if (S_ISDIR(inode->i_mode) && le32_to_cpu(di->i_eoffset) == U32_MAX)
+		inode->i_size = inode->i_blocks * BFS_BSIZE;
+	else
+		inode->i_size = BFS_FILESIZE(di);
 	inode_set_atime(inode, le32_to_cpu(di->i_atime), 0);
 	inode_set_mtime(inode, le32_to_cpu(di->i_mtime), 0);
 	inode_set_ctime(inode, le32_to_cpu(di->i_ctime), 0);
-- 
2.51.0

