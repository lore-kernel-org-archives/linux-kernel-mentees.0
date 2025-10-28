Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859C818626
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 28 Oct 2025 20:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761681811; cv=none; b=lrq/5bpRbyc2RS2MMhiRQjM/3cVoyw4CyKY2r8cGCXaeRso873HkrGJcjKzY8QCuRpdL/48DPGpJMwYcaD1en6/mBnOd1IPRKKmVNh9yMGgi7eAYpXAA87AoKcPHGtq5bbA9pCQXYvpuWXnsKGxRKAwPxtqPlYPD+qhjnb3XHqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761681811; c=relaxed/simple;
	bh=BDUaSKODNKtMq7VQYWR0GriGBCfWmxRXz2MCLuAhAaw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=orve4FJmenVf6d3Vdb1co1kohwwZPrlANGVKbYEy/qOa0co0NFf5ALOwAjjSqJ9ZW04Bis8bgdIWNgT1KkI2MnOgh4TmHzvYZqFSJFals/xp3HEZw+xgEqFsNsNuR8pDvOe7SCCz8ap+DJuKEdyuWmrOUw8Xvqw4FIEvuVQ3p6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzhzgkeg; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzhzgkeg"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-33bbc4e81dfso6868417a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 28 Oct 2025 13:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761681809; x=1762286609; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H8joGPkRS7NaA/SU5NP/PHmANMNfQZvGYAt78YOV8B8=;
        b=fzhzgkeg4981XtDrVE/sXnlhkXWzzFFqPuhQXEI4Zu5Sal3AYHUEssBAbOj4+wVpUl
         JLIHjIVYrrSc5Uj5JjQIQzqZfQeRVMqssDYWYIYzjY9s/bPGAyCIFq93iLSxMnpFjPUV
         DdocZK3e6JbuNMCmAjEpUWU6CdOKGdstr+/RmfoK9a0kldZFKzkP1Ns4oWmjAToe2pf6
         YbF0apnlQW/eUSUeGt4OopJDxIT6X5Xjca2rYVkWqw76mY+JIdoTA+Ny+nRwdWQVS7ij
         MM15lQbGSFiRDBLQnMeyshoWnKTwXbod2O144Pn7i4GFtMpjJF9687slNF10XYxUoiZN
         Bcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761681809; x=1762286609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8joGPkRS7NaA/SU5NP/PHmANMNfQZvGYAt78YOV8B8=;
        b=LisKvZSg0RODJvNE7vYqVuS1XbRwZ/GGBjW8t2K87dGgyGtKPzErRD0p611jTTUPyZ
         whHQCiQrkNhKjJyfdRzVyRM0nQLIIzLJmUcKfKZwMRGAY3ES8f/5R61A2/eG+AjoF+NN
         MYuSu7gwXA+1q1cJOx581RJpGDTqRbfce2TkVLMaL2gmzKMuHxOVV5/uv4XCktGmBTf7
         m0REu21fPM2Pwuk5+uaVc7TxFjyG/mNXAOZSqEmZ0oWwWf/2slXR934oCa0Fuez8NbTm
         H/PGGj+swQDDR2LHfTEqAjU0jZSA/OvZG6LRuqbpW8GbuHp5fckxbxJ2MB8kB7RraMH9
         pQZw==
X-Forwarded-Encrypted: i=1; AJvYcCXtFZY8Pb4whSSVvYMWNqS5AaDwU0HbrxdCILcEf8/11ukHQsWSlcbheB3u18AuJxX6ReiMXfhUBFjwF301NXRu4Usrtw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHbhD78x5+yym1RmJM8aj/Fo0RWyXpAcxaUCSmfwpZK8t8wsRq
	boORfN4ayfRBHSavAYBput/9N+AOqhqe/CWv1cet8k1TrEN192NPCjGQ
X-Gm-Gg: ASbGncu7DC1JuPpKEg+Z5+nHffgaW3DlJPOopxj7u+w3B/zpjRcpIiwQgMoY37vKAuL
	YNyfLeB5a4+u+ZcVfwy2702/F3ypvDeZd6q748xzEVswNtqjwJ/HG2TvCbM164nvACEsfAliaOU
	+wQwNAl8RnX1BCAY5M756agvinYyYGbKkGQh/shkUsCcc6xEnQKqX7KMBXs32tMPt5LtI1Dm4e7
	wFLN3S97Y+/epYRiPpPBzCXlbxLXPL0T1Yb1Z3IzUx0DKCuIwmP+d3Fx1kG8nv6S4COFDNwVwFh
	Y0LUQMFsW8FdbZmTYCfWOIlEx0UZEjC6HKFBdazYenhuTuyQEC9DEdTxWrhk1wRdXPT9MCEmLAa
	YirlsIObU+klEejVhcYfW3yY4djFCuxcW2N47nHL8VzZTNhuA7C6bWRAaKE/cK0R+NXrH/7W/Bb
	d0KJkI97X9X9hDc8MxqOQIzyUBhxjLJG+Q5PbmQg==
X-Google-Smtp-Source: AGHT+IFax4JLp6peVjA4GRSNGg+x5gUWORdeMvPmm1KtEIj6rMAl9UjikOCZ4H3Vmq+EX50VwOXgvg==
X-Received: by 2002:a17:903:1c2:b0:294:def6:bc1e with SMTP id d9443c01a7336-294def6bd88mr4468365ad.15.1761681808551;
        Tue, 28 Oct 2025 13:03:28 -0700 (PDT)
Received: from brajesh.. ([2401:4900:78f2:772b:141e:4f0f:8f8f:6f84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d4254asm128996765ad.82.2025.10.28.13.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 13:03:28 -0700 (PDT)
From: Brajesh Patil <brajeshpatil11@gmail.com>
To: miklos@szeredi.hu,
	stefanha@redhat.com,
	vgoyal@redhat.com,
	eperezma@redhat.com
Cc: virtualization@lists.linux.dev,
	virtio-fs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Brajesh Patil <brajeshpatil11@gmail.com>
Subject: [PATCH] fuse: virtio_fs: add checks for FUSE protocol compliance
Date: Wed, 29 Oct 2025 01:33:11 +0530
Message-ID: <20251028200311.40372-1-brajeshpatil11@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add validation in virtio-fs to ensure the server follows the FUSE
protocol for response headers, addressing the existing TODO for
verifying protocol compliance.

Add checks for fuse_out_header to verify:
 - oh->unique matches req->in.h.unique
 - FUSE_INT_REQ_BIT is not set
 - error codes are valid
 - oh->len does not exceed the expected size

Signed-off-by: Brajesh Patil <brajeshpatil11@gmail.com>
---
 fs/fuse/virtio_fs.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index 6bc7c97b017d..52e8338bf436 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -764,14 +764,34 @@ static void virtio_fs_request_complete(struct fuse_req *req,
 {
 	struct fuse_args *args;
 	struct fuse_args_pages *ap;
-	unsigned int len, i, thislen;
+	struct fuse_out_header *oh;
+	unsigned int len, i, thislen, expected_len = 0;
 	struct folio *folio;
 
-	/*
-	 * TODO verify that server properly follows FUSE protocol
-	 * (oh.uniq, oh.len)
-	 */
+	oh = &req->out.h;
+
+	if (oh->unique == 0)
+		pr_warn_once("notify through fuse-virtio-fs not supported");
+
+	if ((oh->unique & ~FUSE_INT_REQ_BIT) != req->in.h.unique)
+		pr_warn_ratelimited("virtio-fs: unique mismatch, expected: %llu got %llu\n",
+				    req->in.h.unique, oh->unique & ~FUSE_INT_REQ_BIT);
+
+	WARN_ON_ONCE(oh->unique & FUSE_INT_REQ_BIT);
+
+	if (oh->error <= -ERESTARTSYS || oh->error > 0)
+		pr_warn_ratelimited("virtio-fs: invalid error code from server: %d\n",
+				    oh->error);
+
 	args = req->args;
+
+	for (i = 0; i < args->out_numargs; i++)
+		expected_len += args->out_args[i].size;
+
+	if (oh->len > sizeof(*oh) + expected_len)
+		pr_warn("FUSE reply too long! got=%u expected<=%u\n",
+			oh->len, (unsigned int)(sizeof(*oh) + expected_len));
+
 	copy_args_from_argbuf(args, req);
 
 	if (args->out_pages && args->page_zeroing) {
-- 
2.43.0

