Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAC5261B8A
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Sep 2026 23:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789775025; cv=none; b=nDa9rUIepqORwr8vXLU31nknpD5mXZsFjq3mxFPqpeJwVK/yIKFbiu8aaw2Mevz57J2zrs32YqC2m7q4RNlXoXH53FU1EK6T5g7Hm+Gz2+MezLakCUQqq3p5AH3SYeV4DvYcDoEL2P3oblel9ruafncUDc/TCZ9gt8rKUdTxT+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789775025; c=relaxed/simple;
	bh=yVjbgC4CMiNqZuadtlsece2kkWi9WaJOKCsG9Uk68RI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CjNq9U7q6MAFM0wdB8diwkfPBjrZDOMuId27t1wqFWkZeSalDZ+pMjznRcGF0A4XlSjBpMa5MLkDTjr6nJVt8F6OD/kKWQYWAYAURLNX1vuL85L82uYkG5UrIoBiHTi2wbdtW1oihSzILMQkXKGIM1NAdjAPeE3kNOeDPlQ/+jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mw+wsdY2; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mw+wsdY2"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so442260f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Sep 2026 16:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789775022; x=1790379822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jgKahnX9yPSvT7KZdkfKMgtKpfOFWThRfybvZ/wWJSo=;
        b=mw+wsdY2eFeyW6/lX8M4xkHp4pB5GCUDjpOrM87ZyEbF9lJ5e/0BbUUnWU0suN+05e
         UWKjP4E6NjJnvMmDh+br30mG8J+0Hs6DOaB/R2FOvxLYEaMNtQBJe9hFCTTehHYsziWH
         +/kCryR2BzX0G0ihlLZlbszXrvfXozrCunR7hcypR9SDAjIvtrLXWpgS36G5jAYtp3kZ
         cJhixcWuPXdyj6KIV2/ByldRayMlOkXvFdJwleDNRb5QPjlm3TI4rqO51t6d5VtyYN82
         Rf8viqSbNDOF7SQ9ALZDwXdr8FsPBS7RM3UHjl7W1yh8R979mxRtTYMDqHlplb+ZiO4H
         +Hvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789775022; x=1790379822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgKahnX9yPSvT7KZdkfKMgtKpfOFWThRfybvZ/wWJSo=;
        b=qJZ2U8ZqHvvOrQtIHx34ExgXHVJLFosZpq/oyQisjVV6ivk3uWCOyqqTPWDp2mT3wF
         q7yiFLHJIry1wqYmYYahccha80UV8NCS7xeC7ohEy26whCzZFP9fOR274qr+eYXV9hn8
         NoDJWE6Ha3QDI7y6+qDMcfun201qYje8SMsKAZ+mUub8oyZwHLZCT+bBw7yW7cKLwuVx
         hXo1WcywL+XuUMW/M1MuPV2GwSPczO3OcZf0hnSJJIisgEPzn4awEMS2CJe3uoiKLBA7
         B/jQt9XTPS1QWElYtI42kub0xdRcBDyeArI+a8sH89vfeNhXgBCadxMwaVBL4XSnjHi7
         Pgjw==
X-Forwarded-Encrypted: i=1; AKwUvBx1obHG6+wHN19csW0qYT/H14qT6Jc+44ew0JL3ho1pdwCltFluxy3E68n6bXvv/+9Z1TtxrP5zxIaBJDlpaLFolKVSXA==@lists.linux.dev
X-Gm-Message-State: AFuF++lSUGAc9jHeVEkQiyObNab/ezcukVWsCbOoFDvaUBYO74qoZiAI
	NnJYF1/7o2Wrager+LZz/IIAPJ+GauXacVroQkjXaTAmGak0NS1pz5jt
X-Gm-Gg: AYBFou1XJ8O6e98rK4BPMEdTTqepiAzwJdk/MADILuH/Q4OwZaZAgdeeWA31cJt4IiE
	3nRXoqy0Owk/xWlMESQk9a4uoP5y+fYOeRHHy718/dXXuophN3Gm8QOIQtYEhg+Z1yUZYsQFwjq
	kqG46WGV29Oa0CSCFnsS0yh4gpgOAYKg6Fp4xN5c258y6Q2QpuLyh8dOZjFWpJvwSXu4T6s40by
	4D26cP51x0mU35cCZ5+cc+7ZHqRdo25g1iJt8QzJOfI105YCdVO45DPZjmLlyVzlAa6Ushr3Y0f
	tTPxw2aPAWCqkud/ge2unIWr1rKYuaC5FGgk58wd20TEYmJ5pSwSXJmWKbuXjFEFrUdEDT5wqlQ
	O/PO0JruZ/XcdyqaR6fjtC6S9D/57WRmBVtFt9Ric3sJgK+VOBRZVH7qi3yjvyGJt23HOMb7Y27
	cW3s3Chd178tS8+yzsP7/OfcoTqA3SSDrld6l4SBpPWXuFqDaC/E/LbUBXsJE2CL1r+tcT69cBK
	nQaHBEET9/VFe8N/fh08xiKsSvhbvdkLJ4QAK+L/a9fyS8VF1W+1pGyEUMLQGUbpu0=
X-Received: by 2002:a05:6000:2688:b0:487:146f:7c88 with SMTP id ffacd0b85a97d-4871d98cdcfmr6375274f8f.4.1789775021601;
        Fri, 18 Sep 2026 16:43:41 -0700 (PDT)
Received: from Raghu007.. (sgyl-44-b2-v4wan-174108-cust110.vm6.cable.virginm.net. [80.1.81.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487243cede9sm2482874f8f.0.2026.09.18.16.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 16:43:41 -0700 (PDT)
From: Palla Raghunath <raghunathpalla.0209@gmail.com>
To: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>
Cc: Benjamin Marzinski <bmarzins@redhat.com>,
	Milan Broz <mbroz@redhat.com>,
	dm-devel@lists.linux.dev,
	Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	raghunathpalla.0209@gmail.com,
	syzbot+48d935cf48a4a76be346@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] dm ioctl: don't let data_start run past the buffer
Date: Sat, 19 Sep 2026 00:43:39 +0100
Message-Id: <20260918234339.54105-1-raghunathpalla.0209@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct dm_ioctl has seven bytes of trailing padding, so the smallest
buffer userspace is allowed to ask for, offsetof(struct dm_ioctl, data),
is seven bytes shorter than sizeof(struct dm_ioctl).

get_result_buffer() sets data_start to sizeof(struct dm_ioctl) without
looking at how big the buffer actually is. Ask for the minimum and
data_start ends up seven bytes past the end. Callers add it to
data_size, and ctl_ioctl() copies that much back to userspace:

  BUG: KASAN: slab-out-of-bounds in _copy_to_user+0xad/0xd0
  Read of size 312 at addr ffff8880169e4c00 by task repro-dm/140
   ctl_ioctl+0x5e3/0xcb0
   dm_ctl_ioctl+0x25/0x40
  allocated 305-byte region [ffff8880169e4c00, ffff8880169e4d31)

A DM_LIST_DEVICES with data_size set to 305 is enough to hit it, and the
seven bytes that leak are whatever sat next to the allocation.

Clamp data_start to the buffer size.

Reported-by: syzbot+48d935cf48a4a76be346@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=48d935cf48a4a76be346
Fixes: 76c072b48e39 ("dm ioctl: move compat code")
Cc: stable@vger.kernel.org
Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
---
 drivers/md/dm-ioctl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
index a6b8e97755cd..211569dd3c54 100644
--- a/drivers/md/dm-ioctl.c
+++ b/drivers/md/dm-ioctl.c
@@ -656,6 +656,13 @@ static void *get_result_buffer(struct dm_ioctl *param, size_t param_size,
 {
 	param->data_start = align_ptr(param + 1) - (void *) param;
 
+	/*
+	 * The buffer can be as small as offsetof(*param, data), which is
+	 * less than sizeof(*param), so don't run off the end of it.
+	 */
+	if (param->data_start > param_size)
+		param->data_start = param_size;
+
 	if (param->data_start < param_size)
 		*len = param_size - param->data_start;
 	else
-- 
2.34.1

