Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CE71D543
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 29 Jun 2024 03:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719631889; cv=none; b=d3QcjlNpI73+DWySLVS2kfhTVf48/ZFlZD5g3f8F0jPGrHOTdOjmkay5BMX18yCBWAu0mvE+81oqYz9LnoEuuknBFzlsqO6x++tRCI6AadfttuYnBZoQUPyHOywUj6XMP9JpGXhTtuUFSwTMvpAyH9H3XVTPeQAN+83PqbVgAj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719631889; c=relaxed/simple;
	bh=UMbUn3CgsoktVzkBOL+mHpKeupOeuLEClQKjfRD/RVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RX6lqNyw3ZRQTjAUJyt2ozoF3UNZ05r+2wWrkwya29yJSzeiuwmqo3Lj0ps7Gq/kreoGkQC6jDUQ+Ou4qfzPFQN1w6O8iSt1RkWjEVh2yhK3R74rDIhQfj1XPBwO7lMKhsbujoKRDL/fac02lORtDPCmp8cyRR102EL1ctRs9sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFgj1HXw; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFgj1HXw"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB12160672
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 29 Jun 2024 03:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PgB8uUC66kVK for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Jun 2024 03:31:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::33; helo=mail-oa1-x33.google.com; envelope-from=peili.dev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C068860638
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C068860638
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SFgj1HXw
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C068860638
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 29 Jun 2024 03:31:26 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-25980546baeso579645fac.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 28 Jun 2024 20:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719631885; x=1720236685; darn=lists.linuxfoundation.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mSl9MMzmnJSlDuFOdf3HeBK75wkl+RK1RWvEFXp2fhI=;
        b=SFgj1HXwaRjA0ZCOQRR4e7/Zx4TnsHVbh2MjOzoj9RlxZD2w6I84SvdOlaFutGyRl1
         PnkiaDXlb65mkfle6VikA1mLCOCVH8mYcYWb7ZEg9dmOhfjFqeBd2Dxn7Nmb1QEpbJeL
         HuXGYnV9eW+boSArUvZ2+YbZdhs4koyG8uI842q2vZ7UaJV7n+8vXGS5U5SI3FSnZi3h
         6dJnh2oF9rBMxpj2Lv+Clpu1EwayKhAMi/3ieZQVfXptHfF37LK7mRLb4lTErtRyTgvh
         nylIGt8QBMmRG9EEH8CM5mFbg29uN6unmnLJAnYLf59/og2kQD/7Smrh2JpOjGxjbJ8y
         OyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719631885; x=1720236685;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mSl9MMzmnJSlDuFOdf3HeBK75wkl+RK1RWvEFXp2fhI=;
        b=a+ID9r+z01CGtUcdb4UfCqaUs8pV3ykC5w0tbGbalzWuyYAPUty5p24+yzeoDzVa+Z
         iVgR2BpMX9QPSbMV+BegOmM2O4NCdguww8SafRJ8f0+OfORGgIbopcvkMhn+aW4Jtme0
         i4B7YeYuakQaB22PJmZBYH/w8XSS7Hrl8kYWv0O96wcANLl3zZp2OFEwXWxV7YXAM4Zb
         PqXAc/01c56ry7v5zmxbsgxIAiyTZgU4lsCljl29MEsKhOFQ6ayDj1oFM++4KQi1QJYB
         BoPVqv3WJEilJwTn+X2aZ6b8Uyijd3zKr95xdURwb4Bog8mP6JGDPSTKwynYOHxZohIj
         vGOA==
X-Forwarded-Encrypted: i=1; AJvYcCV1y/145Tt/EvJ5d+7QQoyf9YbqaHMy9as3B5E5b1/SEwsNvH0BrXAYJAL8r8YxCts/UNqNz3u3tytGIq3GIiIrvPbh2IsAqINM12nz0G6tlkUfiYvmCxbdbKmxEevw
X-Gm-Message-State: AOJu0YyQpHc48ku77R2/UzS6mDCMLeDuEVKtRfMRJSjWQZsktAhLd9uR
	dw5t9ILurL9QPQPsJbBxGA6UFpaT69LN3tOTLIwFTcvrn0RU4UUZ
X-Google-Smtp-Source: AGHT+IGWOucm3yANDUxSUMd+Sqwxzia3bJCdr5UpKwsT9yw8LfxMGazEPdAT+FPDio4CDnhliR47BA==
X-Received: by 2002:a05:6870:e9aa:b0:254:a2c2:d3c3 with SMTP id 586e51a60fabf-25db340df60mr35138fac.2.1719631885592;
        Fri, 28 Jun 2024 20:31:25 -0700 (PDT)
Received: from [127.0.1.1] (107-197-105-120.lightspeed.sntcca.sbcglobal.net. [107.197.105.120])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b397b7sm539594a34.68.2024.06.28.20.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 20:31:25 -0700 (PDT)
From: Pei Li <peili.dev@gmail.com>
Date: Fri, 28 Jun 2024 20:31:22 -0700
Subject: [PATCH] Fix WARNING in __ext4_ioctl
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-bug8-v1-1-417ef53cca33@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAmAf2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMyML3aTSdAtd8zRzA4NEIyOLZJNEJaDSgqLUtMwKsDHRsbW1AMPc8nx
 WAAAA
To: Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>
Cc: linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, syzkaller-bugs@googlegroups.com, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 syzbot+2cab87506a0e7885f4b9@syzkaller.appspotmail.com, 
 Pei Li <peili.dev@gmail.com>
X-Mailer: b4 0.15-dev-13183
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719631884; l=1333;
 i=peili.dev@gmail.com; s=20240625; h=from:subject:message-id;
 bh=UMbUn3CgsoktVzkBOL+mHpKeupOeuLEClQKjfRD/RVo=;
 b=mek6p9iKGykiUOqRtZH7wiiHEclyE1V/+I/m0KTKQaC6EZocWYSaK0oWt3Z2kN5Ilf1L3JCNN
 60WZ9Ny256PAqNlMP0GuYamNeNQCnNL3me4L548CY510ClW366+MJNB
X-Developer-Key: i=peili.dev@gmail.com; a=ed25519;
 pk=I6GWb2uGzELGH5iqJTSK9VwaErhEZ2z2abryRD6a+4Q=

Specify the size of s_volume_name in strscpy_pad() to avoid buffer
overflow.

Reported-by: syzbot+2cab87506a0e7885f4b9@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2cab87506a0e7885f4b9
Signed-off-by: Pei Li <peili.dev@gmail.com>
---
strscpy_pad() by default takes the size of destination string as the
size to be read from source string. However, as s_volume_name is only
declared as an array of size EXT4_LABEL_MAX, we are reading 1 byte more
than expected.

Specify the size of s_volume_name in strscpy_pad() to avoid buffer
overflow.
---
 fs/ext4/ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
index dab7acd49709..0c4fb579757a 100644
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -1151,7 +1151,7 @@ static int ext4_ioctl_getlabel(struct ext4_sb_info *sbi, char __user *user_label
 	BUILD_BUG_ON(EXT4_LABEL_MAX >= FSLABEL_MAX);
 
 	lock_buffer(sbi->s_sbh);
-	strscpy_pad(label, sbi->s_es->s_volume_name);
+	strscpy_pad(label, sbi->s_es->s_volume_name, EXT4_LABEL_MAX);
 	unlock_buffer(sbi->s_sbh);
 
 	if (copy_to_user(user_label, label, sizeof(label)))

---
base-commit: 55027e689933ba2e64f3d245fb1ff185b3e7fc81
change-id: 20240628-bug8-7f700a228c4a

Best regards,
-- 
Pei Li <peili.dev@gmail.com>

