Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9488C199237
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  6 Oct 2025 17:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759772834; cv=none; b=oHp/Rv7TzOBPSAIYWMJjS/ZDm85Q4TyLoEp0bOwRypmDsDBasGFuKGZS7p/9R7sXl39o2xU2CtZPVg1PlhowBS4P0A6sY3uS14Muel/OeFL1Qb22Dtg3cTvJNCrMNjrYU6D2L8o6yW3sl8yy74xkGXoIC6M5ROvFvJpg9/LZ6Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759772834; c=relaxed/simple;
	bh=RIiagnyRRBU18SYukiZhday7InM2c8S8PNgxP9C7a14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eVFNgSz2Nu6ix2tOBGfC5CWYA0IXT5SRxMdSOop+iY0ryhZ7kbJ4v1gIJEaq4vOtVOO0NUHxvUNSkOx0JLV+WhpP43xfuMVjyq2Iq0Uh9d2N0nRd3CmHaZ9emV8IASoHe1B0wIXzBb4WBEHz++mOKFHcH3S3ydkApbztCGVr00w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPSwoVz4; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPSwoVz4"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7811fa91774so3866379b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 06 Oct 2025 10:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759772832; x=1760377632; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8fcadXEt2TbOOW1SS8BtpXmdQoRjzLU/r23ulkh5ITM=;
        b=kPSwoVz4oJNotM3o0OkzOw5gOiWnNtJ8aAO43VrFEoIYUfrlnrXml49eNTu/OVF04h
         b4n7lIFccv096AgeDlUz0oF7Yo7jc4Zufm+10yMNaJ7kFzFym8Fdgr0qXdVgmsgbl3UO
         LiTX4DBNnm6Rj6HtcPXtEKMkhzGty9Be45Aweh/C7T96+OZ3z5RPZl/4ivPCw5GUXzz0
         jXSbfUkiHoxoanzg6tRCVJvJMju5NHKtbhRwTwIcRmS4W+tl2fflKz6OQdNMn8CbqVjA
         c7bU8JJpYdqWQ+OpaKuboPU5wItNXORcnkcuuYzpTcFDWeQHtg9jMCNQN2uMl7w/HvtW
         I3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759772832; x=1760377632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8fcadXEt2TbOOW1SS8BtpXmdQoRjzLU/r23ulkh5ITM=;
        b=tD8vtp5QZYZ5khzI5QNtR3oZ8QS5UwHjUwb5SEwR8P0jZ+ZizKqbYjGC5bK7lnqnQp
         nK5tGlzMLM1BPQgTvmIfwUkYQgkVMW/oOccHeYXHIRfbO9eWjUhCvNlqot8VNpoWD8NC
         zI4YImMVaK6RDn6XlrMIsH6S2qptGLOXUdTTEF33zWGiU9W0QXM0KuQyvgOsCg3x+fr8
         Gh+rUiTijqpFWHjP9+jwn00T+vKyXALmqsLtP4N3ePxdYtOpof4QMHbtCuMCIRwhVUi2
         6OVSZoidTrK63NvR4Yj7Wjwej/3jhEHu9HKRA7lIhghd7TPkwXnLrycIDlllKwlgHefQ
         Z3wA==
X-Forwarded-Encrypted: i=1; AJvYcCWmVxg9uUJSObM84f5WZTaQheGKxqlx0XwiDR1pmD3EpZ4LngtvGBM3EwtrqgdfN4ajYZ9hMVgKPapzF4P596f/VBPtMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzxdHtc5YL60FJSyegmnj7bqc+pRSthrYeWJAltKiMBKhbpYREN
	n9I3SwNVoy4bl8Nh9F3+Pd9d3hf17GddIG2vND6AKZXuGmCA/3ekiFkv
X-Gm-Gg: ASbGncsvhl/FIy3uEnFKTinaeh8qZvahVntPepZbO9F7ZCsMNMygDIrbfH7A6qGCmzv
	VFZwO6WGpNgLs+8x1WoeXSrvNEEmZB5dzSIkp8K1obdzhkpqcS09nunBbWuovaz+qKZ3fZyh3Zv
	Jwv6YFrufSaVHpy1YserNOAJDtNvXL7ohZdXxErDQs5nvfsqrnflkRrRxz8+Gz/GJLmtHfC2IQm
	n9MkJQD0uMwoLIa6IuPyHv7h0Vu/AwMK4tDBEgLGWw/QiBCUqe9SWIfgGUC5Up5k+RLnmSwA53q
	oSXKOsV5g7n/Y885JpVRzAS7x+fL3dBLn0Nco4uU2uw6D6e7ZmyBWlBSoEKBg8Cn/zwxZeAiZ8u
	8zQPkehvAlH2a521fX1Qvf1W3V2P9Bh6F+8RVRQR0B86MEAD9bASRzFopu8RmFsqxu6QObe8AEw
	==
X-Google-Smtp-Source: AGHT+IEAZ3GTNkzOlBaQRRxaIIrZTAJwj5D6x0H+u0usVi9mnU3RcuVZuSifIPdG1jRzEv56AOGPGA==
X-Received: by 2002:a05:6a21:9994:b0:2e6:22da:91bf with SMTP id adf61e73a8af0-32b61dff85fmr12599233637.9.1759772831719;
        Mon, 06 Oct 2025 10:47:11 -0700 (PDT)
Received: from kshitij-laptop.. ([103.120.31.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b0206e50esm13084516b3a.62.2025.10.06.10.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 10:47:11 -0700 (PDT)
From: Kshitij Paranjape <kshitijvparanjape@gmail.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Doug Gilbert <dgilbert@interlog.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Kshitij Paranjape <kshitijvparanjape@gmail.com>,
	stable@vger.kernel.org,
	syzbot+270f1c719ee7baab9941@syzkaller.appspotmail.com
Subject: [PATCH] scsi: fix shift out-of-bounds in sg_build_indirect The num variable is set to 0. The variable num gets its value from scatter_elem_sz.  However the minimum value of scatter_elem_sz is PAGE_SHIFT. So setting num to PAGE_SIZE when num < PAGE_SIZE.
Date: Mon,  6 Oct 2025 23:16:58 +0530
Message-ID: <20251006174658.217497-1-kshitijvparanjape@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cc: <stable@vger.kernel.org>
Reported-by: syzbot+270f1c719ee7baab9941@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=270f1c719ee7baab9941
Signed-off-by: Kshitij Paranjape <kshitijvparanjape@gmail.com>
---
 drivers/scsi/sg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/sg.c b/drivers/scsi/sg.c
index effb7e768165..9ae41bb256d7 100644
--- a/drivers/scsi/sg.c
+++ b/drivers/scsi/sg.c
@@ -1888,6 +1888,7 @@ sg_build_indirect(Sg_scatter_hold * schp, Sg_fd * sfp, int buff_size)
 		if (num < PAGE_SIZE) {
 			scatter_elem_sz = PAGE_SIZE;
 			scatter_elem_sz_prev = PAGE_SIZE;
+			num = scatter_elem_sz;
 		} else
 			scatter_elem_sz_prev = num;
 	}
-- 
2.43.0

