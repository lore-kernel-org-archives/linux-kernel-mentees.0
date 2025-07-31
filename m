Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258A221FF40
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 31 Jul 2025 20:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753994191; cv=none; b=j/Pe3JG1ImORCjskWu7sI4eJ2ZsrE+LQ+4TG3kn/F7/fHbrEics+oPNrjwuXIfvvlYJLVz6hLbbTq0KOYlxo/piXRBlEbJQRD8wEgRvKqeJJElpKa0foGTcrXNy/mogR8dm2359gffyCnq75kMPuTwBz+5VAXTqCpFAecaH8bRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753994191; c=relaxed/simple;
	bh=lllDj57kA6USq/JccDX4aEeiMCwv3lG54Maxa0HvAuE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NCxYXwad3iGwxfl0gIqAWd0pyjhZtuVMkdYCo74HiHVt/ipHqVG1f2OsJ1It0uneKT6Ftyc0Fv4YkQPIMPewYlGu3gA5kYJ2ZdLO507WrmezL5EbgbToUG+EvVKZLn5saBZuWCk5VA7acJgKfphMl1au8GZgM1zHPepAKYHVibg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0eIjiHp; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0eIjiHp"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5D5260EE9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 31 Jul 2025 20:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tLSlVnGjjPwr for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 31 Jul 2025 20:36:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com; envelope-from=sravankumarlpu@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AFAAE60E3B
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFAAE60E3B
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M0eIjiHp
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
	by smtp3.osuosl.org (Postfix) with ESMTPS id AFAAE60E3B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 31 Jul 2025 20:36:28 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-87c46159b24so29972839f.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 31 Jul 2025 13:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753994188; x=1754598988; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Bkzmad0FHY3Ddy5NFcMc3+By4Cx3sAMV/rP5o2AEJQ=;
        b=M0eIjiHpS+ta8UtTpLXBW2kDHw/mCXBugtc7KJ/Zqs6o255biHXl4yo8Jf4TvJroO0
         n2rhvwXbp1Htres3gRRwPD5VcbymKOQUPwOr7+2Yq1jUZQjZ81jB3zvTxL92fQE6jcH2
         46lw86IPx9LlAb9m4+BXMiZD17H3S+IGELHeVb1ijYyYvt/FhivFXaE5y1sJFNaL7Lwo
         xsPkLBeQR5rW0+X7sbUnLFsH53zhjtN6SG4D3lt+m2dfp6b4k6immRCATrwVnpld9t9h
         wy8y7HJixjHOBDr9lOwslszY9vw5H8409knD3wdxJ6i7b7SKzRUyr8rArCFJHf4aq+QZ
         51mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753994188; x=1754598988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Bkzmad0FHY3Ddy5NFcMc3+By4Cx3sAMV/rP5o2AEJQ=;
        b=BMIZTBMK4CmB7hbTWc8p+FxlRNHi9cSvK3iTurTYJi7jB1hItzwU3lMBF6lER4EhC1
         c1HzMejxR/lNRFXtxyQ/VjXTF76qXcvG9jvLOqjBiuMBH3eAGgWjt1t8ZKrrvB+s/Ldd
         OCc0L5We05Kv22GxCMlzY36uc/4bihw+vfdBKUNnffdH3mMXTFC9WnzZFeZTrLyZ0P+S
         imFxmBqrdeV0YNGlqtbF29k42xS/wrhThr5WtyKORK+DzfhVSgTArJqLpuuh5EuUTGcL
         6tNWrenKhLxKA3HZRHIRjxoupT6EkJWayZb8N17gXZGjrAasrf8gYa71PoSbjlMHzufT
         tVeg==
X-Forwarded-Encrypted: i=1; AJvYcCU8/5hj1XNJjUKicATohdjBU7LqYwZ+dETyDorKQHCbtBfDhK9T2BAMaibLlRQ3IxzB9eDqg5DEnz1t88jkJpsC6ADb8Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwwhjqE93lY0Jd1geqdzWzvLA3ijW1BjwwbitAXgkJ/OIox2fQm
	419WApKqMuIJtdLVboL8s2gynIVkaFOpebSEellcIk65a3/hkVMNc498
X-Gm-Gg: ASbGncv1TVdcHXG9Dr6SY94yt1rMEbZfVZg8GApUK/p/RxNXRpOKuOb+9xa3p39CQNh
	lDax1x8gIoHSNytgeNeA8cdJmXmKkKR2lRSZKsObtofzo/tbQPwUQfJEwLbMurMG/FSjmVMddKT
	Rhma0l1tKm1U+BJzyum/Fvw9yX3QF1f7mlYRDek21yHzCf+vMXgIEoPd9KKSN4D2XluYWind6Hf
	25WomvJkRoYQdCB+bzjSn8cz7/PS9Yp/QacY+EKIjszsIA37rRwm7I6eXa52sO/eP8kR4rIgQlA
	5X+UxZOBdlrPjVMPjxvPvIY1LWt3rqUlot7H+lnbvkzxBQh83O9MPjbzacmg3A9FmqzbL3eGW0L
	vw1TGBlvDZ//P5eHJxYyd9MzM2iR8Gp1J4C+dmH/09C0fYhBLBzsYeim4ohAh0fjd7URKb/XzNS
	QP4ChSugnn/57ycvSi3LL79l0=
X-Google-Smtp-Source: AGHT+IHw6r8Lf+6zjHlaPGrM/dmdCKU/6h6oK0JKKrXD5sL3aXoHzVWp5gzJ99Itr+K+yw6WuEQuQQ==
X-Received: by 2002:a05:6602:60ce:b0:86c:ee8b:c089 with SMTP id ca18e2360f4ac-8815a870752mr15789939f.3.1753994187605;
        Thu, 31 Jul 2025 13:36:27 -0700 (PDT)
Received: from localhost.localdomain (syn-035-144-110-073.res.spectrum.com. [35.144.110.73])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8814dfab231sm70312839f.28.2025.07.31.13.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 13:36:27 -0700 (PDT)
From: Sravan Kumar Gundu <sravankumarlpu@gmail.com>
To: deller@gmx.de,
	daniel@ffwll.ch
Cc: skhan@linuxfoundation.com,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Sravan Kumar Gundu <sravankumarlpu@gmail.com>,
	syzbot+c4b7aa0513823e2ea880@syzkaller.appspotmail.com
Subject: [PATCH] fbdev: Fix vmalloc out-of-bounds write in fast_imageblit
Date: Thu, 31 Jul 2025 15:36:18 -0500
Message-ID: <20250731203618.25973-1-sravankumarlpu@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This issue triggers when a userspace program does an ioctl
FBIOPUT_CON2FBMAP by passing console number and frame buffer number.
Ideally this maps console to frame buffer and updates the screen if
console is visible.

As part of mapping it has to do resize of console according to frame
buffer info. if this resize fails and returns from vc_do_resize() and
continues further. At this point console and new frame buffer are mapped
and sets display vars. Despite failure still it continue to proceed
updating the screen at later stages where vc_data is related to previous
frame buffer and frame buffer info and display vars are mapped to new
frame buffer and eventully leading to out-of-bounds write in
fast_imageblit(). This bheviour is excepted only when fg_console is
equal to requested console which is a visible console and updates screen
with invalid struct references in fbcon_putcs().

Reported-and-tested-by: syzbot+c4b7aa0513823e2ea880@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c4b7aa0513823e2ea880
Signed-off-by: Sravan Kumar Gundu <sravankumarlpu@gmail.com>
---
 drivers/video/fbdev/core/fbcon.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 3f7333dca508..2540d9046161 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -803,7 +803,8 @@ static void con2fb_init_display(struct vc_data *vc, struct fb_info *info,
 				   fg_vc->vc_rows);
 	}
 
-	update_screen(vc_cons[fg_console].d);
+	if (fg_console != unit)
+		update_screen(vc_cons[fg_console].d);
 }
 
 /**
@@ -1336,6 +1337,7 @@ static void fbcon_set_disp(struct fb_info *info, struct fb_var_screeninfo *var,
 	struct vc_data *svc;
 	struct fbcon_ops *ops = info->fbcon_par;
 	int rows, cols;
+	unsigned long ret = 0;
 
 	p = &fb_display[unit];
 
@@ -1386,11 +1388,10 @@ static void fbcon_set_disp(struct fb_info *info, struct fb_var_screeninfo *var,
 	rows = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
 	cols /= vc->vc_font.width;
 	rows /= vc->vc_font.height;
-	vc_resize(vc, cols, rows);
+	ret = vc_resize(vc, cols, rows);
 
-	if (con_is_visible(vc)) {
+	if (con_is_visible(vc) && !ret)
 		update_screen(vc);
-	}
 }
 
 static __inline__ void ywrap_up(struct vc_data *vc, int count)
-- 
2.43.0

