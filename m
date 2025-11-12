Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E25E34B42F
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 12 Nov 2025 18:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762973956; cv=none; b=JCNiZgllPxQW82DWVx/JlDMXBUzMsCkzezG7m247vQ1ee545CrIEiVrY5Oj5BTbO+T1k/jF7VhV6C/nyEZ1fEB1jJiv6G3ZE7ECu0+XMrVSmWN4cyEKZnbZVLW3ivWJmWX5vFE7wFqjXuNogqszD7pe97987mUiX+5L/F3a/Tw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762973956; c=relaxed/simple;
	bh=e+vkzTXZpebv4x57j1CGKLaD1D6tZMW1EsZ1XwAHvFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FxZZro8tMc6l8OqA1tHpSI6Rde53AeBPp4r33bTuJcPL9eJNIUyfoaBQfsQyMZFnI159rnOv8kla4r+EGoEjziJUks71R1caTkMlPtnzSujxGMaJMWcLv+vHyFRIVodIQ5BhaDEPY54Un4TUQxL9fBRSb8hAJdnW29qnJxQzPYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3Mm1i/m; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3Mm1i/m"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b144ec3aa8so492785a.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 12 Nov 2025 10:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762973951; x=1763578751; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkHIbEfS/RNvXEomxAVQK3p1e0eKqwElvBQxcuWip4A=;
        b=V3Mm1i/mTRlh33SsDPngew9cn/ymZPBmf3XcivFBiK16+P/CuE1+Ql3ZhY9XxmAl2C
         H+mZkC/SQ/iawn3mZ/i6ALWj/3l0wrDIXek1T+lhmC/htSWyQeBplRxZ4vFklqPSa3n1
         KLwnUHgraqhU0sUfkBMj42jrNbBK0nOJnIfP0TA0VHrz7Yrh9Qgg8jvUzxWDwECHvFas
         GMwIE6HnpqkFWheTdw3faLJuIPN79vo2O6pHOQrrhng8l2V0xe0KxSd6r2XSYADHKx7W
         1LBtHERxEIrPQgWuZZMgOFB+xr13dzLN3CWFTkaL+b+TbQ7PYA8oVxt/fO3NZV7H+odE
         LNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762973951; x=1763578751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fkHIbEfS/RNvXEomxAVQK3p1e0eKqwElvBQxcuWip4A=;
        b=q6i1FvT0Y4/zhe8/SL1bJiQfS0jTDYD9AZQUA8CV+w5SoVLbHDOHE+MOJ1KeS3/5oH
         9Y6CH7+Ws+/xAFpspT+Qv56J67SOjItg9H3wfcPNvEaseVVNBcN7weWF+9X/3l/MXkXB
         WG0jOPBf0+XsaHWBQpP8hhS/SgksMmPnBtTCgMn9aNCpR5xFvYAr96dPdY9Zqzu2YjXT
         x72Q9oM0uvZ5pS5oiNhffRekpma8jk8FEJgBYKvXQo8GgxlKk/VUX2jCAmLDNmBgDjMp
         cer/w3gDXf6yYBXfLPahz1YSHGb4Gj4WLFH0dw7InAZpOhtDuZmJjwOKsd5cVCTKGNcb
         NH4w==
X-Forwarded-Encrypted: i=1; AJvYcCVeXGkSd8ynlwgd8bimrcfNeXT7axGCPS2eBA88uRBuoGkkS8+9aqVRRnbmdGV3X6+fe2h7HRGaMzKdd29u6LiBClVmSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsIpH7ITXIgCalCC/v+qDjmkuYeICVVg28rVr3p6ZUA9gFE0F4
	Y1TAIGT/kHc4ut/HRyhJBwOpNt2aowJ8jzFxzh+5Ag1pFMF1XkXFejos
X-Gm-Gg: ASbGncu61QfWnAFL0N4UZAtytCSfCL1Dkb1J8v49/MQ1SE+1TAl593hB32gc3ylrEnv
	xWNfTD2yjcIhrrRjTQoUvvWH3RNahZbO1oCTEHgkmyhESCuWhqCoRG7VZSPQH75KAFXqPR844Mm
	K7r5Fan52/yMrPq4KyF4/OvLIRFzeAyq6I3hT/4yyVf6B/QZP1cpqq+H3jy29w0sECM4SmmlA41
	CGH3NSXeXo5xfL3WIS5sAaSRGN8pL4UgHPHNpYu9POKiJMmodhFqfNEcHH40m3sAN4onhPgBkGV
	rm5lt8SkgGxBtdAnRPQqRrQ3foOGvfRTUbPnzDNNcSD6/yTapG6Rj2Jcn/1wuikHTNCY4Vb0MJI
	dph1q18xq5Lb2VDe42zQf1p+55MwAFFCv1sIUnva/Cc3ZqY/UNDx4ppLHgoMtYkK71a+PXbsajj
	1ykzIbiNgRkmDNIzDjkUsN
X-Google-Smtp-Source: AGHT+IEZ/eFmBvYWxQT6tHvgfcJ/HtfGiXneBQsdqEwDBB0RGnuIeLuNXC6xaD38X4tP/8xo1OT0pw==
X-Received: by 2002:a05:620a:414f:b0:86e:21a4:4742 with SMTP id af79cd13be357-8b29b987041mr480654085a.77.1762973951464;
        Wed, 12 Nov 2025 10:59:11 -0800 (PST)
Received: from rpthibeault-XPS-13-9305.. ([23.233.177.113])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b29a85d2efsm244726685a.14.2025.11.12.10.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 10:59:11 -0800 (PST)
From: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
To: tytso@mit.edu,
	adilger.kernel@dilger.ca
Cc: cascardo@igalia.com,
	jack@suse.cz,
	yebin10@huawei.com,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	syzbot+3ee481e21fd75e14c397@syzkaller.appspotmail.com,
	Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
Subject: [PATCH v2] ext4: validate xattrs to avoid OOB in ext4_find_inline_entry
Date: Wed, 12 Nov 2025 13:57:13 -0500
Message-ID: <20251112185712.2031993-2-rpthibeault@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aRHSrpFone-SSkZa@quatroqueijos.cascardo.eti.br>
References: <aRHSrpFone-SSkZa@quatroqueijos.cascardo.eti.br>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When looking for an entry in an inlined directory, if e_value_offs is
changed underneath the filesystem by some change in the block device, it
will lead to an out-of-bounds access that KASAN detects as a
use-after-free.

This is a similar problem as fixed by
commit c6b72f5d82b1 ("ext4: avoid OOB when system.data xattr changes underneath the filesystem")
whose fix was to call ext4_xattr_ibody_find() right after reading the
inode with ext4_get_inode_loc() to check the validity of the xattrs.

However, ext4_xattr_ibody_find() only checks xattr names, via
xattr_find_entry(), not e_value_offs.

Fix by calling xattr_check_inode() which performs a full check on the
xattrs in inode.

Reported-by: syzbot+3ee481e21fd75e14c397@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3ee481e21fd75e14c397
Tested-by: syzbot+3ee481e21fd75e14c397@syzkaller.appspotmail.com
Fixes: 5701875f9609 ("ext4: fix out-of-bound read in ext4_xattr_inode_dec_ref_all()")
Signed-off-by: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
---
changelog
v1 -> v2: change Fixes tag to reflect that ext4_xattr_ibody_find() used to call 
xattr_check_inode() until 5701875f9609.

 fs/ext4/inline.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/ext4/inline.c b/fs/ext4/inline.c
index 1b094a4f3866..7d46e1e16b52 100644
--- a/fs/ext4/inline.c
+++ b/fs/ext4/inline.c
@@ -1593,6 +1593,13 @@ struct buffer_head *ext4_find_inline_entry(struct inode *dir,
 
 	down_read(&EXT4_I(dir)->xattr_sem);
 
+	if (EXT4_INODE_HAS_XATTR_SPACE(dir)) {
+		ret = xattr_check_inode(dir, IHDR(dir, ext4_raw_inode(&is.iloc)),
+					ITAIL(dir, ext4_raw_inode(&is.iloc)));
+		if (ret)
+			goto out;
+	}
+
 	ret = ext4_xattr_ibody_find(dir, &i, &is);
 	if (ret)
 		goto out;
-- 
2.43.0

