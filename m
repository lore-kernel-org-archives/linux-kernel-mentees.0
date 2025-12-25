Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EB02D7D3A
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Dec 2025 07:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766647721; cv=none; b=YRIHpn4AAz1MfPaoaHwShnBVRWUbWyPIPJsqtvCNvBlmGOSp37F660jWpc5eOfvk5Tuxab05vIbeZbRhxbuWnvb+DVtE8c3yckdA8DDpPL7R+iQL7/VeeB726ZvB5qpgkvltcqg1e7IMvfKkCKZ1a2jzv1+USJ4rmJJZXX6MBjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766647721; c=relaxed/simple;
	bh=nDbknJ7IUdumOxpo9hBQLkqYxDx2G2kdEPg/Zd1nCmo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b+WERLqE4YWXuOeNwZCtLV3NAFYlX/DneLDrf97Oyd8M1Q97pnMThwNm3k9t6jLMDZOqeR1IBVj1afjEe7sSYoPtJVd20OjvT3jM/ZS2UOabUOiPjseEL8J+ZcaHmlOneioQwJTpOS6v+0Rwm2LRDohfL0pOODi7aYuNc54q+AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+anTNFy; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+anTNFy"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso7387884b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Dec 2025 23:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766647719; x=1767252519; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p6BFcbd9iyFXSrOLN1khZAr09vJHb19aUamed8L/NRg=;
        b=B+anTNFyRo7GY4rmHhN1KoN8RDc0tzvpNcexgHUNoSIJIT1wz5r9BOa3KqYSuDS9Cs
         nEurfsxUISMyVDxuuLNm92suYTCCx0Y0VEWoU13CMjZtHT+RJnjFcoWyCIjLceFSMPbX
         SiJ3lglsGYhBzl7yTR3fhWyIBAw8zsaKsnDhKUco++jPCXj2wuxKogutPHOz0KZIceLW
         0IgkvRxOx64i7WuZvIXuOlLHxdtfREbh4xCksPuHL0jrmCOYc56l5LW/wNPpAx+npK2g
         R8LjQCaLU6OXsvQSODJuPNtpIn5Q6VfsYOJqxBGCFIRQ8nXuYCCMZVO0RHNvRUxodcVo
         fDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766647719; x=1767252519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6BFcbd9iyFXSrOLN1khZAr09vJHb19aUamed8L/NRg=;
        b=AgreUic+jdcnCgD3qHlbJNzCxLioQxJj5No+MhKg18fXvoezUajTtMFCiLcTIWekWM
         iR9pQuZvFbeJxqGmRd+zV0vLhKDqJykvsRl3Z0MdbJvEsHZ8WSAm3/ht7gcRUqO2Adj2
         1JEXRa1ryLR7p4QX3/hPD5B2+0ufZGIaf8hqIwcxV5qU1FqVNpUjsmzf2VRQrqPkPnup
         WdYRUmn5Hw/7GQmGBpjXkee3GWeCocirkfXQ/Bh8YWz6/7ofmkaYllP4lZRNg1k0sJJw
         jXjssRs0YjLuarFxgG/9Teagv+5Fb+MW+l+V6bWx4CID+DBLPEJWplayRmGtuce1nQ4Z
         djDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJn00HNQPI5kMMcv1XnCHePdvToRsfFs8sdmahbm06NJmu3V4Ap5IyWh6HgdwTfnQw1IyF3GEAVj1x2rkfv12rGoJYKw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyLFtAg4eIkCFG3szKmrN330+P0/aqQ8w9NGcx/k20VHx8RnKFI
	sVB0gp8x/wFzqDBZycr2Ing8pVvvc2QCWOe5czh4T4iWqkvX6IhNlY1t
X-Gm-Gg: AY/fxX5iVxNA5falpQUQixVUgMkr7hoKq0/09eX67vAz6RbQehXi1mwSIfAhjjoTzVg
	XKz4b2tHHu7WQjAIdkDm8YI++z4ePxEUCtAB6LD9ZLL2hkgF9bkrYL+3wvD88Bz0q/VhFrNPYRM
	VbP0hu1WjwZPExAoIAMq1XDePGsqchoSu2/TqkVj9d7XdGInutqjtE51qipFfybuZfi47sxas9F
	ACMUfF9BZHVekuXNH1qPBPJzhgBOPi7vuOC8aVFoYEVbS2Rj99kvBbWr3ff0EvRM1MajP9+3MWZ
	CBwt9vtIAQVNvpmyTjMi4coX6Y94Xsu1fBOgWPn2B5O3ra4MpQm/ESibRbueXaWfUsLyD34jRc1
	LiLwuB2pxMsfDGl5Z1eqMV5zlfuuqD4kCNmS9d9qlN4mdj9GwceB+EUqGsmezWrEOJNLBHdjOVV
	REMDULdgd4k/6B/Z1QIe708nB3rwaKfE5G2Xdc/F4=
X-Google-Smtp-Source: AGHT+IF2kBqM1Pc1oeCfW9iKt8MagjLl70ZYlJlrxss71glv1f95LGdDpd860qL8p+WKwgQCmnLTnQ==
X-Received: by 2002:a05:6a20:9189:b0:366:14ac:8c6c with SMTP id adf61e73a8af0-376ab2e8f52mr18576741637.66.1766647719168;
        Wed, 24 Dec 2025 23:28:39 -0800 (PST)
Received: from localhost.localdomain ([111.125.235.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e79620bd3sm15961406a12.4.2025.12.24.23.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 23:28:38 -0800 (PST)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	brauner@kernel.org,
	jack@suse.cz,
	viro@zeniv.linux.org.uk,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>,
	syzbot+00e61c43eb5e4740438f@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2] io_uring: fix filename leak in __io_openat_prep()
Date: Thu, 25 Dec 2025 12:58:29 +0530
Message-Id: <20251225072829.44646-1-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 __io_openat_prep() allocates a struct filename using getname(). However,
for the condition of the file being installed in the fixed file table as
well as having O_CLOEXEC flag set, the function returns early. At that
point, the request doesn't have REQ_F_NEED_CLEANUP flag set. Due to this,
the memory for the newly allocated struct filename is not cleaned up,
causing a memory leak.

Fix this by setting the REQ_F_NEED_CLEANUP for the request just after the
successful getname() call, so that when the request is torn down, the
filename will be cleaned up, along with other resources needing cleanup.

Reported-by: syzbot+00e61c43eb5e4740438f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=00e61c43eb5e4740438f
Tested-by: syzbot+00e61c43eb5e4740438f@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 io_uring/openclose.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/openclose.c b/io_uring/openclose.c
index bfeb91b31bba..15dde9bd6ff6 100644
--- a/io_uring/openclose.c
+++ b/io_uring/openclose.c
@@ -73,13 +73,13 @@ static int __io_openat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe
 		open->filename = NULL;
 		return ret;
 	}
+	req->flags |= REQ_F_NEED_CLEANUP;
 
 	open->file_slot = READ_ONCE(sqe->file_index);
 	if (open->file_slot && (open->how.flags & O_CLOEXEC))
 		return -EINVAL;
 
 	open->nofile = rlimit(RLIMIT_NOFILE);
-	req->flags |= REQ_F_NEED_CLEANUP;
 	if (io_openat_force_async(open))
 		req->flags |= REQ_F_FORCE_ASYNC;
 	return 0;

base-commit: b927546677c876e26eba308550207c2ddf812a43
-- 
2.34.1

