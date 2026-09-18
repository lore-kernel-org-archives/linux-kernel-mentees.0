Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91A15187C1
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Sep 2026 16:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750012; cv=none; b=JDbP2NPdYA0W+dpc2joaCH8kyPB9SRmLV3fYw3t+Hphsw2chV4C1nUV+QBdyCHkcwvdbAiQkJz8NXx+zg5ijo1YCeQ3XOx6jxfip6K70J4aEss5gncTvk2hjeS+tSvRa57S2FdNJleT5khyxxUKtXfJaRctNGvN2p6miEJWXU9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750012; c=relaxed/simple;
	bh=wKMEjBLMtgcuZryZ1Ys60OL4D/gso7hVRXG0PKiZqjg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Br9i4E0kIWEA4FPCQMCNM4udAbLgq6HdFexXJMtZ4k1EGYZc4w1QcXV6N+wmi5UpPPZ/1Aq/Xc0cyZJwjsfC4ThbBYxcAMTDwVp+FhondUhgzlfiBwqqbXCI3TyqWBFPOB3XZrWdJ5Vbyj0HKkCKoLTAUdntbp8/upkdCCfMlGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=miHH6qGz; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="miHH6qGz"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac898fa4so824487f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Sep 2026 09:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750008; x=1790354808; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7otw+sAMt71PNBKElWj0ae0gBS5tnkAn3QFMjtVJGHE=;
        b=miHH6qGzFHy5cTblR67afRPySTB8qqBmQvQ5polXMwHmaPtFNR8pJA9PnTbglLMIun
         Jkx2dlnGtMWabKOJqTuLQ+P52bKH5ej3t8XhCl/W/1qjDITMfwx7TvS94Jrv9oHjht4J
         y6SmR7AhliJVwpIlHMSNvvMkmvuKt+zkVkBJHp54qsescYv9g0EZ8htHApAsNNk/ojKC
         tY4CnkHx4iX9lODFYIsAijLWGhqdkjL3TsDZV3JLJfgTJ/oqzxogyARegYkCw7QTw0HO
         WPx5ypIpclNVNzqg0d4mrdJA9f85lopE/363tSqgD43BMHqDfYn7HEG1VL9GgFft71ap
         VEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750008; x=1790354808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7otw+sAMt71PNBKElWj0ae0gBS5tnkAn3QFMjtVJGHE=;
        b=yleLKo8Zpe0VwKTGDPklWyhoFZc1/a49x6QRJkMMh1Lj3z+QwDDgkrFeBLud8K0oy0
         Bh+h8IqSoS6vpySs6MAVHNE9GKmh0QZSbU7egorLIqmDBaMkOmSQG6Icru99aamhP4vf
         F2vBjCg+/FQPpWaJeW7TgPoipeIcOlB3Gtd+zgoO8NCTE8i4aiBKp3UM6MsHyduDB0e6
         SCsEFgISrTd37F5KK/rjtRMA9581qYilThsSivGMaQXTxGpHbD0dBO/wD/xcEjtXJcb+
         vgoNTkDcV8duNB1QyNEMbE+Kra+xCdEelkEG7XbXEOW5/2fNZ/kBLmkR0uQ8GXGf99f0
         sC+w==
X-Forwarded-Encrypted: i=1; AKwUvBwVZkgDrSEAOGA5hVzsbyvLZEh/6A8c53HVnsqDZN9rFYFRbN3MCLlXuQd5U04vsAeZYDIA8FrzFtQWNx6/FloYoPtEXg==@lists.linux.dev
X-Gm-Message-State: AFuF++kztAtjnAElIxV6P4r6DIH3uR/pt4+L5kHbXl+wKQ5tqO4qo4ex
	DqRL1fPetjg5VnRnvSiEDZp5oB1avOfip7W5eTuEYeQ+dptaaI2WXIOk
X-Gm-Gg: AYBFou2KG8uAvwOk6jlbr3y6GIpSAg4w1hCmeh4KbM1lA8jF1nita0Z8T+YXO9Nm6tW
	N8JmkGg+Sc0O6qAkYR6thfZeQ4IZsyFc/ZVT3gRzXjPlIL3Jvgbp4m/roey4vKmq02M/sjuIzc8
	vfNKED/zjNMkVTe53R2xC+K9BU+Buoy9VxQAuv/axMda8eycXcBUZ2u7imU5C0PfNfLnAqlqUHb
	vXAU0RnncILxrw3lxdMiMdLEU3LPWJkgJQ7xZv52MQopFbGI1SURFMPtu/NIo7hIg24OChuBGcV
	qKdXSnE9cq4xjvWzM+GxhyttCK5zud7v4NdSQJu/fUpS9ri7sp6CgoCyXIlQKDrqdSumObL2dO2
	Eq1q1MaHVPzKYiM68BJEI2X1TFoYGCrp1jMo5meLa2qRqQUsie8VyBxmT5PvcXBdkiLm0aADQPN
	4lKc6VRYqmOWzCPqmOXbpWW40ZjteNhIMwmE3azSJ/tdnKI4oj7adIq3qW4EH19lvjMXq6yxwkz
	31SnPGh582xnH9cuD0u/ybUVgRJy6kngak5NryQ5rjWB7eJBUgPpN0GeZV9QDdD5O9a
X-Received: by 2002:a05:6000:178a:b0:487:1266:5be7 with SMTP id ffacd0b85a97d-4871e26674emr4855205f8f.26.1789750007431;
        Fri, 18 Sep 2026 09:46:47 -0700 (PDT)
Received: from Raghu007.. (sgyl-44-b2-v4wan-174108-cust110.vm6.cable.virginm.net. [80.1.81.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48720072efcsm5135585f8f.25.2026.09.18.09.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:46:46 -0700 (PDT)
From: Palla Raghunath <raghunathpalla.0209@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	raghunathpalla.0209@gmail.com,
	syzbot+e8ebfecec06a009dd2d3@syzkaller.appspotmail.com,
	stable@vger.kernel.org,
	=?UTF-8?q?=EC=9D=B4=EC=83=81=ED=98=B8?= <kudo3228@gmail.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Jan Kara <jack@suse.cz>,
	Deepanshu Kartikey <kartikey406@gmail.com>
Subject: [PATCH RESEND] romfs: reject directory entry chains that do not move forward
Date: Fri, 18 Sep 2026 17:46:41 +0100
Message-Id: <20260918164645.9230-1-raghunathpalla.0209@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

romfs_lookup() and romfs_readdir() walk a directory's entry chain by
following ri.next, and stop only once the offset is zero or past the end
of the image. Nothing stops an entry from pointing at itself, so on a
crafted image a lookup of a name that is not present spins forever.

That loop has no cond_resched() and no signal check, so the task cannot
be killed, and it spins with i_rwsem held and the dentry left in the
in-lookup state. A second lookup of the same name then waits forever in
d_alloc_parallel(), and it is that waiter the hung task watchdog
reports, which makes this look like a dcache problem:

  INFO: task syz-executor239:5636 blocked for more than 143 seconds.
   d_alloc_parallel+0xd13/0x16c0 fs/dcache.c:2839
   __lookup_slow+0x82/0x2f0 fs/namei.c:1904

Require the chain to move forward and return -EIO if it does not. File
headers are laid out in increasing order and both loops already treat
the chain as a bounded forward-only walk, so this only enforces what
they assume. In romfs_readdir() a cycle never advances ctx->pos and has
getdents() repeat entries forever, so check there too.

The hard link chain bounded by commit d30b5a954e0a ("romfs: detect hard
link cycles") is a separate one. Sangho Lee posted a fix for this chain
in July 2026 that validates it at inode instantiation; it has had no
replies.

Reported-by: syzbot+e8ebfecec06a009dd2d3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e8ebfecec06a009dd2d3
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
---
 fs/romfs/super.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/fs/romfs/super.c b/fs/romfs/super.c
index 7f783d6173e8..846b57f265ef 100644
--- a/fs/romfs/super.c
+++ b/fs/romfs/super.c
@@ -143,7 +143,7 @@ static int romfs_readdir(struct file *file, struct dir_context *ctx)
 {
 	struct inode *i = file_inode(file);
 	struct romfs_inode ri;
-	unsigned long offset, maxoff;
+	unsigned long offset, maxoff, next;
 	int j, ino, nextfh;
 	char fsname[ROMFS_MAXFN];	/* XXX dynamic? */
 	int ret;
@@ -191,7 +191,16 @@ static int romfs_readdir(struct file *file, struct dir_context *ctx)
 			    romfs_dtype_table[nextfh & ROMFH_TYPE]))
 			goto out;
 
-		offset = nextfh & ROMFH_MASK;
+		/* likewise, a chain that does not move forward would have
+		 * getdents() repeat entries forever
+		 */
+		next = nextfh & ROMFH_MASK;
+		if (next && next <= offset) {
+			offset = maxoff;
+			ctx->pos = offset;
+			goto out;
+		}
+		offset = next;
 	}
 out:
 	return 0;
@@ -203,7 +212,7 @@ static int romfs_readdir(struct file *file, struct dir_context *ctx)
 static struct dentry *romfs_lookup(struct inode *dir, struct dentry *dentry,
 				   unsigned int flags)
 {
-	unsigned long offset, maxoff;
+	unsigned long offset, maxoff, next;
 	struct inode *inode = NULL;
 	struct romfs_inode ri;
 	const char *name;		/* got from dentry */
@@ -245,8 +254,15 @@ static struct dentry *romfs_lookup(struct inode *dir, struct dentry *dentry,
 			break;
 		}
 
-		/* next entry */
-		offset = be32_to_cpu(ri.next) & ROMFH_MASK;
+		/* next entry; the chain must move forward, or a corrupt image
+		 * will keep us here forever
+		 */
+		next = be32_to_cpu(ri.next) & ROMFH_MASK;
+		if (next && next <= offset) {
+			ret = -EIO;
+			goto error;
+		}
+		offset = next;
 	}
 
 	return d_splice_alias(inode, dentry);
-- 
2.34.1

