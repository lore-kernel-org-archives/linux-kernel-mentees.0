Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8630620CCC9
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 07:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747986179; cv=none; b=NdLuSTmC/qqjRJyV9cyY/9htz+/RCXY+pd9QBRWPMiP6Ep5mDOLUd4fXmpuWItxp7VjMuK+rM8qSw8l2I91VPND3dclfJNnxBEMLN+cbyaUdujLCsfUhfNdTqelaW1eluHKD48N1xsI5fNCOemBM2z3MVIh5CZbqhqG3Dt+J+Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747986179; c=relaxed/simple;
	bh=o8Z9F+s3H5s+WHRu8VrEBEw3xQJt57LQ6mx6MD0qMFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=obNpQYORdQY9XG1RlXEPr0YCtVibQevCwRxWZD3BIVQT7G+4mTGsgb0gIJQBGRM+e766+3gGf3DTcHX170IEcDFVFtYf0FUekrfFl6oAqjx5rReVDqfFJ6mLH0S9H3GaEDld4RMDmn390EO3FTF3d+wFP0oBTQOVYu8gqqCjVB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=kMI8XOlT; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="kMI8XOlT"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so97980395e9.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 00:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1747986173; x=1748590973; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sf5oVq0p4V1KNu2SAoViuAhUyDDrJF+OTYRvlB2marA=;
        b=kMI8XOlT8rD55qT+kZhG0Kvl587dcdCBRcqG6VyubzMn/QMebHPmV0RCaNVldfWgNb
         kNhQlKai/rCf8ZFVlIXZQnYBwRAypgiwWli9Jzr2LH61KO6pqh8Trv4z480BYGmxhwlK
         9trclUXNZkEyaxq78bZ8Yh0fAghHI0YUq5uOuMqz7T9lj99XEauUb2sNRbXSEnwV/bxd
         9/jp0zGuPn6xCB72hkLMkz44rYZ2sD3eMAI2CrdPfyhrQQBRvTAyoh8XPiBODWlsXMpZ
         WqMxeqBq14dlcqKURbY+NbzVaTOuR2QxCH4yfTPYDjTBjotQorUpLx2Cb1KLaaX0Gvt0
         0Wvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747986173; x=1748590973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sf5oVq0p4V1KNu2SAoViuAhUyDDrJF+OTYRvlB2marA=;
        b=ROgpj+MlcqAqe0trZN2/sqjqaGl2kHl43W54AsJDFW01mUNHgTGuq+XLE1sibdNS4p
         9fXdt/PcZZ+ERpz1NBzzvJobIZY0b1OA77ak35jwU2/sOuci9d/+YNjFguI673SJUNRQ
         GIxl1+Q1BnLoegNjd0k+kydtskb1DRrFeFDNtdKyXY7TCJlvkX71Ell+FvqxYWhHHerg
         Wzvzcyc3dsvG/IGJ02pwH3H8BOlYd8zK4fal2VftGxKsJ0xGbhSwjNex5k0MFtZVdfct
         pEUHz3RqwWaXVv5lbOudXyB0lY9FRQrn8OOxzLhc/v0RhzqJl8Uulr+3eJmLtEvjOUyZ
         bhEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/QupstiSeD+dNk7q0sxZckZzaOW+iW19MGM/mwzw0ZzVcyKf5hSLD16eB9X/a2omOTa8xzxVYxvGulbpT/2N761q+cQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YylP96Q1S6FfLk0L8KlBx3B3j3cS8SyQldAADWu9uqugrM2L5SS
	WZ0Dz5ghBRPTMSeUfwimyIiQX1plKcW/7itNk7DAyhVIB5n8CAYxd0RdxsUVYCmoj48=
X-Gm-Gg: ASbGncv1XMHf4+g2a8IolkW245tg90isATWRpe/buGsxeTDarcekN58jFuPcFxmS0OT
	V6F+8ZRi2PvRkR0yMg/CSszF5VxsghoPdEzzEoHO5ax0c4F4jLF7UtnOjJ4u46LmGmNv+UYQxQ/
	YE/b/qCWsBucwwi5L+eMjmE3h67n5yuHayBz3O9GKnicYX5L8b6+WuhZVqiCGZiGBXqzkFwtFX3
	KwfEAZ1s2VNHa0WIQhIs0FpBAh0JyCkZXf6EHf3rdYvS78/WvFRRxmX4mK0vm8oo9GOMGgXcvme
	s/1BV0hzzF9+P+1iBjKqGvP2lfMEtQIM19KXu88/YJjOS8JpBHkkrn08wDyzUNkcdzFSdwJzdZ9
	IYIw=
X-Google-Smtp-Source: AGHT+IGZ+zW9xJjdx7/pyHegoY0b4cvGq/St5kfIPDWd2+jyQJwKX8XOdYUArgxgNbWKJ8peo6soWg==
X-Received: by 2002:a05:600c:34d5:b0:441:b3eb:574e with SMTP id 5b1f17b1804b1-442fefd77eamr257454705e9.5.1747986173415;
        Fri, 23 May 2025 00:42:53 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:aeb5:4cbf:e382:76a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f23bfd54sm137616955e9.17.2025.05.23.00.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 00:42:53 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: shuah@kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH v2] selftests: filesystems: fix "memebers" typo in mount-notify
Date: Fri, 23 May 2025 09:42:32 +0200
Message-ID: <20250523074232.15274-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Corrects a spelling mistake "memebers" instead of "members" in 
tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c 

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
Changes since v1:
Improved commit message to be consistent with other commit messages.

 .../selftests/filesystems/mount-notify/mount-notify_test.c      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c b/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c
index 59a71f22fb11..af2b61224a61 100644
--- a/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c
+++ b/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c
@@ -230,7 +230,7 @@ static void verify_mount_ids(struct __test_metadata *const _metadata,
 			}
 		}
 	}
-	// Check that all list1 memebers can be found in list2. Together with
+	// Check that all list1 members can be found in list2. Together with
 	// the above it means that the list1 and list2 represent the same sets.
 	for (i = 0; i < num; i++) {
 		for (j = 0; j < num; j++) {
-- 
2.43.0

