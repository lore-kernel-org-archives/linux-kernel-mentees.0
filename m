Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27B21773D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 07:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716794038; cv=none; b=Y1guQP9CkEYlihaZhDod5SJgyKDehmb1XIXvQ+k+G0hTwtx2Qn4tx8swcmbbPTGM/0AFLvMQK2tyDtagBjHKJTbbihb5VMCIo6oriWzMQxRioImWDCUKdcwjZmzBmnEiQ/9lK/mVGlFBi7kSC9pDRR3JlOOyWfjzV5T1sSElJs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716794038; c=relaxed/simple;
	bh=hPOiU8EzJd6UGf1Qrqx8b1T+bxulcNCNVewdy3U/vsQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hERGDr6OKOOftE1v0JFufcsI5prHetI5wgqmTXXov844cIzldUTM2QfCGVtghckgztyTChIzNAUTd+arc/hNETPQ9BzHkYQ9tyXW7WAvpVUMXfeDkDptu/05cbXiuqtacMRB3Ucl8CyBhf0OpZ7WUSzcvwwCBjd9OuumhoXrOUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQ61HmEx; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQ61HmEx"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71B0D80D4D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 07:13:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SyPektxZAXvv for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 May 2024 07:13:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::2b; helo=mail-oa1-x2b.google.com; envelope-from=yskelg@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 94DB280D41
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94DB280D41
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SQ61HmEx
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 94DB280D41
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 07:13:56 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-24542b8607fso4817501fac.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 00:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716794035; x=1717398835; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uye+qPyIlPr8r1G8aGQy8xNPlvuLVvJZ8ppLZ/tUAB4=;
        b=SQ61HmExeLsABfkPTVFgpQaJIYOD/VaSIDn/4k+g7W3WyFHv+FqBdjk+RRGpuczZhM
         s7j/9FAsUQv4Za43COWJ3MUGfn/2LzcmVXYehZOoWqJHN9YbjfB93KZTXsGUmgHY/F+3
         cAJGbOJXHHdem0wEnF229RI46osDhHiHBycJuH2d+jx4RQjI09OvCPaq2iK34w71afjr
         v12heX0I5yUHigQtpZ3fx9Nikf06fIJw59C+TmUJ9GYPZtC+gNZ+KD66aOZsTi8RI9SJ
         fOj826M6ZETKr5Bqjkz2NKe67tIxYEdZkffFJC+akCvtyHBb0sWMKrDBmZn1Zix5ooNU
         A5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716794035; x=1717398835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uye+qPyIlPr8r1G8aGQy8xNPlvuLVvJZ8ppLZ/tUAB4=;
        b=TRGpz7G/uKy+t3c4K7d4ugaqWse7LXmI/HqtywJQZbWIeOyLuUera3fGqWGM+CTbus
         sg5ncpsODd8Vx9SBNd3X6Vxhk1PzmSWNocre6CCK2y8fS2mZ74dtae41bdX7fATxnIC0
         ZMJqA69d049b0S6QX3NzFs0Tv6OBwXWLfHj4875lJu/AqRrAqMd8hbqo9gJzAAGoqRDx
         v8Dfw5aCedtL5I0k9BuhTp1fGgKcdIt+nfv9cYV2MhmBP7fMLjsejeay2haXdrS+82mA
         mf05Bl9mXd5CCCz6+wZNXF+olLg5/XkNDtVXq7FlDgCboCFGn789gZYznPGr4wJuVQTU
         yfsg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ8pnQej6aaYZzRV2/myL+S5uPvSueMEAEWyGL1EtzoVvmVAhtkt0QletlblUOVAQj8x9GjECl3SZgorkKZDUHHVInpTLrSLDazNmjH3Hhd/pA6KtLnvjqhpgN39FD
X-Gm-Message-State: AOJu0YwohGP5sZF89gDP5M2BFPVMV7rWW8WGlAHRbF90TBw+7N+pioy+
	Q58jkKflrh9Vlwyxqzqss1WQGcIb65vgEcaIjMAgKJaJKa+7e86L
X-Google-Smtp-Source: AGHT+IGDFKLKRkNsLLmb9PBuSt2+uES2v9ZFulvy+8S4g4S8berIKqqGnZ6WVt4Fg9LxWzPpocp1WQ==
X-Received: by 2002:a05:6870:fbab:b0:22e:8a0c:ea26 with SMTP id 586e51a60fabf-24ca13e796cmr9174312fac.44.1716794035173;
        Mon, 27 May 2024 00:13:55 -0700 (PDT)
Received: from paran-QEMU-Virtual-Machine.. ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fd4d56casm4357253b3a.199.2024.05.27.00.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 00:13:54 -0700 (PDT)
From: yskelg@gmail.com
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
Cc: skhan@linuxfoundation.org,
	Austin Kim <austindh.kim@gmail.com>,
	shjy180909@gmail.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Yunseong Kim <yskelg@gmail.com>
Subject: [PATCH] tools/virtio: pipe assertion in vring_test.c
Date: Mon, 27 May 2024 16:13:31 +0900
Message-Id: <20240527071330.105268-1-yskelg@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yunseong Kim <yskelg@gmail.com>

The virtio_device need to fail checking when create the geust/host pipe.

Signed-off-by: Yunseong Kim <yskelg@gmail.com>
---
 tools/virtio/vringh_test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/virtio/vringh_test.c b/tools/virtio/vringh_test.c
index 98ff808d6f0c..b1af8807c02a 100644
--- a/tools/virtio/vringh_test.c
+++ b/tools/virtio/vringh_test.c
@@ -161,8 +161,8 @@ static int parallel_test(u64 features,
 	host_map = mmap(NULL, mapsize, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
 	guest_map = mmap(NULL, mapsize, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
 
-	pipe(to_guest);
-	pipe(to_host);
+	assert(pipe(to_guest) == 0);
+	assert(pipe(to_host) == 0);
 
 	CPU_ZERO(&cpu_set);
 	find_cpus(&first_cpu, &last_cpu);
-- 
2.34.1

