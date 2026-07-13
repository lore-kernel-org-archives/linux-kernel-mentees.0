Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040CB33689A
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Jul 2026 16:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783959858; cv=none; b=p5JBTkaMXupaF0l0K/MX5q5Lu2WTNZC7jqevroaqh628+eAmMks768sLz/O2Ae9Sn/P0YnKfi0DPcbp83goex1wgEzHPj0TTt6M4lZAUnRZbf1HIVWfAGFls13HYRheN2A2VaxvSr9UN3LDZ7+HPQwZNQlFXsYUpxj42PQpx3Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783959858; c=relaxed/simple;
	bh=3Q+AodIikP9xCHgmvXlA1vIHQzvTfE3RDiDZXjwgjxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pxeLt2C0mvFqbvXlQkyUi/m+mpyRNZQlvtZbM5yN4hBK2gPjsRjlDFFY/IQg92zYgxTbSEYs7GoazdAFgsriUKshxM7thP7B8LGwtifszUl2kSK74TRwaKD+gEAc4DhfYl3y6liGNXT7O/4e2X3O7NLuo4XsN5+CyBEbpCz1M1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZQ3Jy2V; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZQ3Jy2V"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc891373e0so37984205ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Jul 2026 09:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783959856; x=1784564656; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WQC/83rTdPxjmMhg2uRtbJr8hdPQYpkf0x/BDJRkMyg=;
        b=AZQ3Jy2VboWuoWMpgc7obOXMv/Pm1formhZBNieBATKd5AWxKfJkTTgcWSQNzqeTRr
         1zaxXgvUrPVOcMu5C3tDHrMo3Kq9Kah0YezLV0i9Cv3KtMv89ZQ5qMbQJuT9qLtFZzEx
         XS1DexAjBcU4gJYJH9P28xVcDz1iRdhiig3sUGaHkhzlNDjaEn79Q76xx/Od4jxiCtKl
         p2iPFlI+VnRR5gKxKb8/4jon+YV7Wa3SypzWroAIewnDoWlX2X5ZTfsx9z9nhRd5byx+
         J5ahkeehfVZccHQ79/7Wp5nhkZPLLEeEVCKs9qUzJEu1qqJlV3HGiWw7By9MlbxkGmmO
         +rpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783959856; x=1784564656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WQC/83rTdPxjmMhg2uRtbJr8hdPQYpkf0x/BDJRkMyg=;
        b=aXWh6QU5cuOcnIuFUiy3/LDOdwnZplhNmrFGyDONi9FT/XFzX5Q7tEYlYPUegcGek+
         264cxDTaKZgAVXjxd7IHmfFVPT4Q7avhF7ZrFYcQQyp8L+yX85pMFv4DjfEMc7npWk4m
         oj85kAwzoCWuWrRWztMjdPTZGdjm3cvAvkGB9IWijBmYFYdMAj4G1vgxiiqZYSBAzsDi
         xkz9YMJNEVHBF/aAajhS2dN2u6wtNxH+6XMxjY/H+iJxjH54oKnNIUf/D3GAcNsZxw48
         1slcYCUcG+PhocWRvTGNBf58GD84Cv+7xEOgcCKUw7Db8pEWm7u9tXh2a0E7htfqfrsX
         hV4g==
X-Forwarded-Encrypted: i=1; AHgh+RpPlNDdJInr6m7g2C8zrNl5PermxKl/Ch1Z+x4L+lw8UQTG8qNQl66jdGiWkkFR4x3cNKjWPrwbpj4YwE7Egx54Q2eoag==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVUd9rJizbM7kCTJCIozN9sYKvYlJ2/a2POPl3L7JzED/cIil+
	VhzvTiqD585e6K/uYWd6XmMeBnLz/vSJPHQdqGCnCXRKzQnLsNwabGcVg16CLcua
X-Gm-Gg: AfdE7ckiyBXkrOAadIvqVOOnliHYv+Sssg4uf+1GuHYXWxY0Ac45Hjn+ENl1MaWfk6M
	cs0gHM/1TJ5JY2jEIQ/iBiC2UaNm/Fa1VPMq1xtMew8mEmTXxDMUZ8UhnLwqyXMrKD9hi9KZz7k
	t+EyNBoPC5OFyFcpZVf1A6i4qQv/w+HXPoF2Py7fPuUraSCzLWCk0op33KnkQjMIbB23B64b0vD
	0j+B+qNA5fx2lJh8BQ3kc9oMjIaH1sosXdiBlVLCy4xnvHnnGIY3hkxXHqhRCuf2SHzFwOqfIGg
	XoukKqUxxeqiA/78t9AckovXWkrfJ6//lXsx7pXyb8WacSkLEQR3JxxuGJusXKL/HpM+yw7lrtu
	1CympENVF08Vp39Prn6LomISOEyqruJC2cEggeLe5P/VI2TUfWO6GVd10FKQiw82UbKT7CTxhvQ
	q6Bm4iiqJ01yvaUVRmfRuiWfvaeZoKtqZfJhyR
X-Received: by 2002:a17:902:d591:b0:2ca:c68:c554 with SMTP id d9443c01a7336-2ce9f15d1f6mr88684135ad.38.1783959856288;
        Mon, 13 Jul 2026 09:24:16 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:fef1:348:93e9:93fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d59e51sm103838005ad.76.2026.07.13.09.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 09:24:15 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: tfiga@chromium.org,
	m.szyprowski@samsung.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	me@brighamcampbell.com,
	koolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH] media: videobuf2: move vb2_querybuf() kernel-doc to header
Date: Mon, 13 Jul 2026 23:24:03 +0700
Message-ID: <20260713162403.13545-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the function documentation for vb2_querybuf() from videobuf2-v4l2.c
to videobuf2-v4l2.h to match other functions.

Leaving the comment in the source file prevents the kernel-doc parser
from extracting it - thus become missing from the generated HTML.

Additionally, format the comment block to be the same style as other
functions in the header.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 13 -------------
 include/media/videobuf2-v4l2.h                  | 13 +++++++++++++
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 4baded4fd..5a1ee5eb9 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -635,19 +635,6 @@ struct vb2_buffer *vb2_find_buffer(struct vb2_queue *q, u64 timestamp)
 }
 EXPORT_SYMBOL_GPL(vb2_find_buffer);
 
-/*
- * vb2_querybuf() - query video buffer information
- * @q:		vb2 queue
- * @b:		buffer struct passed from userspace to vidioc_querybuf handler
- *		in driver
- *
- * Should be called from vidioc_querybuf ioctl handler in driver.
- * This function will verify the passed v4l2_buffer structure and fill the
- * relevant information for the userspace.
- *
- * The return values from this function are intended to be directly returned
- * from vidioc_querybuf handler in driver.
- */
 int vb2_querybuf(struct vb2_queue *q, struct v4l2_buffer *b)
 {
 	struct vb2_buffer *vb;
diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
index 71d2864fb..d51e10c10 100644
--- a/include/media/videobuf2-v4l2.h
+++ b/include/media/videobuf2-v4l2.h
@@ -72,6 +72,19 @@ struct vb2_v4l2_buffer {
  */
 struct vb2_buffer *vb2_find_buffer(struct vb2_queue *q, u64 timestamp);
 
+/**
+ * vb2_querybuf() - Query video buffer information
+ * @q:		pointer to &struct vb2_queue with videobuf2 queue.
+ * @b:		buffer structure passed from userspace to
+ *		&v4l2_ioctl_ops->vidioc_querybuf handler in driver
+ *
+ * Should be called from vidioc_querybuf ioctl handler in driver.
+ * This function will verify the passed v4l2_buffer structure and fill the
+ * relevant information for the userspace.
+ *
+ * The return values from this function are intended to be directly returned
+ * from vidioc_querybuf handler in driver.
+ */
 int vb2_querybuf(struct vb2_queue *q, struct v4l2_buffer *b);
 
 /**
-- 
2.53.0

