Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D3D2F5304
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 10:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759226713; cv=none; b=AtJjdPM/TlGHlx8eDI66kRWKKUDo9RnDmQT8mklTGbyFCufcrrTfCXn+VDuhHrxFktVt6WVpJyOfYJsQqFvYEMQjtT3y3hKhQPmoVu9WpaJeOeYI1e02udOgWFXJDp57I9xqCDjBn2YRvJ/ASPsj2LJwUigsBygoEQp6OmNEg5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759226713; c=relaxed/simple;
	bh=X9juzzfORJjmVkVgJzjLoShWeYViK7aCq/qnOB2dWjM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NjJP24567+PEJrv1wnrbwQvCDrGvCFutmBeT6OjukWlpaz+W/eTVenYUdJ5Ea29PBRrA7iQ8BkA6PSgkRgCmMnZEayUmylrZZ/i8nanIc3x1de1bZpwziILTAJbhyNUB8JA2tH08gPTnPVd7zkau9gmRDs/URyGzGKiC8+tux/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDzxHnus; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDzxHnus"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CB4540C7D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 10:05:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ijw_nbhs8Ygc for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Sep 2025 10:05:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 63F2E40C94
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63F2E40C94
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bDzxHnus
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 63F2E40C94
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 10:05:10 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-46e5bcf38e0so312485e9.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 03:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759226708; x=1759831508; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WoqmnjzpIbUw9OO6iTSJNLFiIVbBFRgd5p6mNVJqWNE=;
        b=bDzxHnusAd4l1C6I5KEZvLnIzKtwpB/zC5S3/3HmlB+ULjk/EajICy2wPxlPHvIYPA
         ghKcc2e5VYN5AFBcTy+4A4V7v3O2jv4vn+SJzGkwpJwowlA36C352h3NiUSDB8UoevH3
         QvwweoBrciDMPcfS15U3wGMn8Hhsi8VzOnSvvHAxqdgziNl+gpBtnZXrKa+ze1b9RMqZ
         yALy39k0OEUvI2Kv6QcJ/UJlgJ5esoOHjy0bX2RXymgGGqEiUid3E8R1b1mxkoAmTf2H
         rAc6HYxKCt8Up9j4XiVcUMEhiFRnz9CYhLhZsNCadtbzZKSqV6yMWvXMXH4bIl8eaT5w
         h3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759226708; x=1759831508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WoqmnjzpIbUw9OO6iTSJNLFiIVbBFRgd5p6mNVJqWNE=;
        b=bhYc5VeUMCiWS/3o8DKeubFU/Bpvpr7MyUKufTCGgh1hm+Eu1axUPM663AdTvGMcce
         QQXSIxQ3JUhQ6uccEabe0iAb1KwDLFK/Kxu/XGuQoNuzIJybtRZ2EDRpH7U8qFteiAqm
         RAMAejBMQ01JrShhC+HmAe4PUvBfVSE4cNJsM3SSlTJm61QPaCG0i/0j6TqJLzwyb0la
         LHSjFi0p8pkOnlYV5QA6Pu3nhbUwel86J0pMlNaOzWMfgX6P2hW3dpJbGxs3oZ69P+iQ
         LrmQXy9Yj1OoNiajkD9tbXeNQorBDfSbpoECIOJKXdVGLnl3hLJr84Xo/nOulCz/8x/J
         tvPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWn8J6xI5FBGpnty41214+bpNTecYiAGcuUhmsI8m/WrvoPDMqWBuOw+nCTJai+k9okh4WIalXjjRi21mBqyp2s+L/xBQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwHySDsQwQzONwKHMlpDQ43o5HepxuOkYUCsP3WE5zfVy2N000H
	qoZYesg1w5HxiWKISnXYzcK+cl9Ys2bQolRFBl6h+i8FyNkCBcOVDbrC
X-Gm-Gg: ASbGncvQD4VukyiyyFXbamocp3cmET5nwfMoiTH86dgC0uXVHEXts/Jvfeuua4Pnk8c
	ykFCKksGoBDYt4U9ES9klI+MZMVnKZBBhMSRvIbtaGyOAHMzdgusoA5lh8UHw2mAIFfBzPrmXS3
	MYG0bqEiil9kdLNvOITqQeV63BRPtD/fLbnT0xvHeta7IWHO1ngU4gozlVnt2rcUyCQLddg2EjR
	iwjYmkdEya1yFDErDEqFhfgO6gNLPQVu1zAsMfmyuT2WDclNAB7tA2GmFDqZaqZExOoRQNkTU3C
	yMYKnyW2aiUhRX4OJXf2RMpTHz8VlrZutS7cCKTTnNQhyjDNPsRXNKfBMhMN6CC8arRjqMJPLg6
	aNUbrSVnskgb4TujzoWEnjUOpQkly4ekosMO6JTHweEcLDMhxwKiIvn858/DHfF6m
X-Google-Smtp-Source: AGHT+IHR/hbTJBXGa5MRxuyi8MdBLzgo/Zj0q4wKBPTP845/xVxCCZl9+I5DcBEVzfMW11gF3Ur3Kg==
X-Received: by 2002:a05:600c:1f0e:b0:46e:5cb5:8ca2 with SMTP id 5b1f17b1804b1-46e5cb59fe3mr7885995e9.2.1759226707885;
        Tue, 30 Sep 2025 03:05:07 -0700 (PDT)
Received: from bhk.router ([102.171.36.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-410f2007372sm21238137f8f.16.2025.09.30.03.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 03:05:07 -0700 (PDT)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: clm@fb.com,
	dsterba@suse.com
Cc: linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH v2] btrfs: Refactor allocation size calculation in kzalloc()
Date: Tue, 30 Sep 2025 11:03:44 +0100
Message-ID: <20250930100508.120194-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wrap allocation size calculation in struct_size() to 
avoid potential overflows.

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
Changelog:

Changes since v1:

-Use of struct_size() instead of size_add() and size_mul()
Link:https://lore.kernel.org/linux-btrfs/342929a3-ac5f-4953-a763-b81c60e66554@gmail.com/T/#mbe2932fec1a56e7db21bc8a3d1f1271a2c1422d7

 fs/btrfs/volumes.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index c6e3efd6f602..d349d0b180ac 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -6076,12 +6076,7 @@ struct btrfs_io_context *alloc_btrfs_io_context(struct btrfs_fs_info *fs_info,
 {
 	struct btrfs_io_context *bioc;
 
-	bioc = kzalloc(
-		 /* The size of btrfs_io_context */
-		sizeof(struct btrfs_io_context) +
-		/* Plus the variable array for the stripes */
-		sizeof(struct btrfs_io_stripe) * (total_stripes),
-		GFP_NOFS);
+	bioc = kzalloc(struct_size(bioc, stripes, total_stripes), GFP_NOFS);
 
 	if (!bioc)
 		return NULL;
-- 
2.51.0

