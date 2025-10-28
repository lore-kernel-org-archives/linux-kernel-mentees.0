Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFC73396FD
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 28 Oct 2025 16:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670632; cv=none; b=pifWpveOfi+lFkUbi3MPyDkqxugbPMVo+QM6faCdoo/jm1+7MJy6opPZqToqYXkPwMCbhPE5aqib1FAihpaWGp7oswkORZMjZeAjMCZUBz+If/m9o00DKBbB8K6LE1wZn483quPPVTTNytHTNV9nLPRgEjv+xd+4tpWrkTPbyaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670632; c=relaxed/simple;
	bh=VWbzR5JJcNh9vxeY+++ECnRky78xd0PGd5/1QQmh4bE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VOIsb/8oygvrH++2oegX2QWEHcxV3MAhrVe94SpNx2rp0zHFtSp0oIPEzohJKCOOFZeH0g4juUON7xnarF0lBFQtm4tXfJIgERS+RC24Y2e/JWCxUIk2/C6SeIiKsfbLYCakSXnkISQnqe6jOJHIASbEjlSQm0emaRM/tKBKc7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NMKepT2S; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NMKepT2S"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7a2754a7f6aso7771810b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 28 Oct 2025 09:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761670630; x=1762275430; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FZSNxR68yHjL7zAo+Mv3sJfsksYIyvHAgD0mbxvBcYw=;
        b=NMKepT2Sj1ZnazEfKOL7mYRNCqnUY+o8oW67/AKkdibEMCtsX9iESs2AJbK/8VzUtW
         Eds4Ss0Zd5AZDy/Vr51pkApUZEelDFw39iDwcW2/9Og0zj9GLradDk9L7nCUSrEH1efG
         WVhRZfIooWdVchKNXqyMzEbz/ly5m7oweNU/lO9hxMsi9dPzbdSyNpF/gEf7Cq46r9hn
         tNAwoCH9ilLQBWjkqefkN0rTUn69pZELxjnGow3qqnglo/6mmEEksbhsFPxNzflLu6PX
         HE/dOcrepSPll6jLPEPFJL3c0mfj9C5WrblUqNDf6FvL5/EyLMwQv8F1buI3gR4VD1t2
         3eMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761670630; x=1762275430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZSNxR68yHjL7zAo+Mv3sJfsksYIyvHAgD0mbxvBcYw=;
        b=VAsE2Ru+lHq4zPGQn0N7YjhLcY5wu0mRpOdLX/rI8cDVPFCyk88ivHuZOARCLFmU6y
         SHb3ZKHQI6yDX9IUTg0L54lev4lsOtXxj2BsH9AQO5Eoz/E2EqJp3UnCabT5MOffUcPD
         J3jcd3n15M2czn+PZ3ukvAkUxUTb7pL9N2+vkd2diKfxQH/ykC1B/V75ZaD0TWHq0U91
         l/XlK5lGfvwIXiCOZhJaBGKhKPCHz6jqE4ftfgKU262w/kVPPmy7CfsEb6Riw+UrhlE7
         iVOQL2VQFTH3D3xZGVkbikFu3dmY2I5rfxQ61mmDk/2CQAEsI1Ctys1vdArLx1QoKq/g
         a3Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWYd3KgPXI0W7e0/NYf3V5mt2Iid5baZIcRVZo+C/Hgi6Ko4un1E4gdLPgipXaNHIKc6mJaMbBlUdARI4B127Gbi0wuhw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYpHzxOy4TBj5WvBHZIWIdPS8M3klwhAIC/1nY59XKgq694ptS
	5vmFjoWwzeytG5dW47ZpLvTxZAp0yMi8eQ5FHU2ug27cJy4buSUNVKrL
X-Gm-Gg: ASbGncuAk2cg2TFn20Ju749OoUsuofI8FAE7PAyTlufWH62XOhJfEawy1SuVeuD2XUj
	5Pih4RCqLuIYgzXl+k9nuvcffurt+8X3y5PVdBx/mFewXUjqTH+pO+b+5RBapspKqhKlXnbMPmP
	T/QBoxKChGe+cp05rDMkU3ivQux8o6nj9o8G/FzrS45fZbSUaRUvGjdKdjnvoe9wk7mINj/AA+D
	KMnJ7v1Iw3Uxh5hCMaIWcphutBn7DqoUBHTQLQUnHnXe+dBKaqMmExNMETlXjonwI0dgR3YTubo
	6+HEbeA7Csuc9kU9I5mQEihNnoZtt3V256CJFM0zaM/YCZwWaTHQkA7RW2m+SreJ1CbG84EUOj5
	nfAN/xvtisXDuHXSFJl0SMsGrAZm4k+Cb3Lb1xbDfnzbCMt0re85zdOT/JyT8jAORq5TBLruUxM
	UPck/uBFkL3vKKB/s+cc4=
X-Google-Smtp-Source: AGHT+IHYzX3zBX9m/HOdpIkdCjhBMv9C2sbByBuod4kCB2jxgbvqLV3QWhnzZ0epjRo8NPkrViDs8g==
X-Received: by 2002:a05:6a00:3d4f:b0:780:7eaa:938 with SMTP id d2e1a72fcca58-7a441bde268mr6351210b3a.12.1761670629662;
        Tue, 28 Oct 2025 09:57:09 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a4140699basm12133857b3a.50.2025.10.28.09.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 09:57:09 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: andreyknvl@gmail.com,
	gregkh@linuxfoundation.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	snovitoll@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	syzbot+d8fd35fa6177afa8c92b@syzkaller.appspotmail.com
Subject: [PATCH] usb: raw-gadget: cap raw_io transfer length to KMALLOC_MAX_SIZE
Date: Tue, 28 Oct 2025 22:26:57 +0530
Message-ID: <20251028165659.50962-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous commit removed the PAGE_SIZE limit on transfer length of
raw_io buffer in order to avoid any problems with emulating USB devices
whose full configuration descriptor exceeds PAGE_SIZE in length. However
this also removes the upperbound on user supplied length, allowing very
large values to be passed to the allocator.

syzbot on fuzzing the transfer length with very large value (1.81GB)
results in kmalloc() to fall back to the page allocator, which triggers
a kernel warning as the page allocator cannot handle allocations more
than MAX_PAGE_ORDER/KMALLOC_MAX_SIZE.

Since there is no limit imposed on the size of buffer for both control
and non control transfers, cap the raw_io transfer length to
KMALLOC_MAX_SIZE and return -EINVAL for larger transfer length to
prevent any warnings from the page allocator.

Fixes: 37b9dd0d114a ("usb: raw-gadget: do not limit transfer length")
Tested-by: syzbot+d8fd35fa6177afa8c92b@syzkaller.appspotmail.com
Reported-by: syzbot+d8fd35fa6177afa8c92b@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/68fc07a0.a70a0220.3bf6c6.01ab.GAE@google.com/
Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 drivers/usb/gadget/legacy/raw_gadget.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index b71680c58de6..46f343ba48b3 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -40,6 +40,7 @@ MODULE_LICENSE("GPL");
 
 static DEFINE_IDA(driver_id_numbers);
 #define DRIVER_DRIVER_NAME_LENGTH_MAX	32
+#define USB_RAW_IO_LENGTH_MAX KMALLOC_MAX_SIZE
 
 #define RAW_EVENT_QUEUE_SIZE	16
 
@@ -667,6 +668,8 @@ static void *raw_alloc_io_data(struct usb_raw_ep_io *io, void __user *ptr,
 		return ERR_PTR(-EINVAL);
 	if (!usb_raw_io_flags_valid(io->flags))
 		return ERR_PTR(-EINVAL);
+	if (io->length > USB_RAW_IO_LENGTH_MAX)
+		return ERR_PTR(-EINVAL);
 	if (get_from_user)
 		data = memdup_user(ptr + sizeof(*io), io->length);
 	else {
-- 
2.43.0

