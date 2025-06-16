Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9F4298998
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 16 Jun 2025 11:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750071816; cv=none; b=u6Tq/oAfq/iM+1mY5lY1bt4Sf34BLxbfsIxgq4+hqzmGpHvAbiR9WM9Eq3RlsrMWbxKe1+ZmD1FOH7qAkJKJkkK0ul53hmBnGykPWjPEIY67rMgq3uJbCLSIQyY5jzXRUh/5HoeeG1JGMr4OxthIT37K4vcvMzPpTjnfVlxvCO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750071816; c=relaxed/simple;
	bh=m4Q97Vl9Pu9GM4C2YDP6SbvlhmPxpHgL709nuEfJrfs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pKFwEvmABM8KUvJAh5zxf4dGP03ULlQTIORFevkSH0Pg7q/9W5D8zt2cqtPnGHiJLN6rp+s0J0GPgQ47OmEGTF7dKUORdyjSCgZBl/girvxwI5rjDEcz5/I0nak6FeOwjz5R0oqFne9idPxxZ+OMoU6IBMMSpN+ghuTsZoF26Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXawf1uS; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXawf1uS"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso3830568b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 16 Jun 2025 04:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750071814; x=1750676614; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5o0Hn0fW6RFNxHio5FVElS24SR1RndyfYKHO5SLow+0=;
        b=cXawf1uSW/PqaFkA1GuXQmdD5pgWnPdFIV0Qcy0Zh9+VWSP84fDqVmxyJOHvRXzqrn
         yD5+NWeJwsaHSDrB7dRGfXt0QY8uoNQVWq6PxVyVpWxA8WiinVca7TbouzLn6GqchzQo
         nMScips3SSol8W613xdyj6naPA9rYJBq/MtQvbY8w7N6hi4gYMuZk1dLH0OgRT0R2Tlg
         vtv9zDe7YcivgAWNK9mxmRPC0XEoVV9S1vXwPnIHZNiVwkT1Dc/10okMl9xVGVpu6OZ9
         PG2G2KWnSJitU8+cDjX4oxudWYgK95H+TKpkQWzUQRMBrf1x+WRvnHXYCyQurWsNm0TK
         CRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750071814; x=1750676614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5o0Hn0fW6RFNxHio5FVElS24SR1RndyfYKHO5SLow+0=;
        b=BB1qINzPOWYNrf5N/wnzEcnz8Dkuk9yM0YN1tNjAKH7iNhUwSNXdFxnFH41IJUJINK
         vBry4WAtVt7O4Lg+Mv4ZWxgGJgwR98+Af3mdcVs8biegdIbFhDD03yjBhHsrzONKBKZ4
         fA0/lRar3JxvmkxVSocofY0KIxwKimFhs3wFfeet/IVpAQJVmnkfk0WUNtGQghsYo/ji
         xxPq4T/P4OONnilq6Cwb8aZMOSY2YX9INU00SE9QN4piieiN2zDWcNcOL3fbMZ9AzwNa
         u3M4TapDoioCXvXCBC7OkFiWGdQ4bPNkIKJjPDGIM0JC4OhP43z40vvXVehcD94p7zs/
         7ocg==
X-Forwarded-Encrypted: i=1; AJvYcCVfFJ1MMZztrD+KjKFyL3+g3V1TZ57WcuLG0FdD+9JW3nkioF1mLbmlCiLHiYOJhaRnPr1e9IZ7KK1No3vejfhCc2VC4w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/xjSQo7cMydbMI69ucip1HPs1AA1qB9uazPBMz9EmUDNnO5A0
	q1PWpQykRgAu0PnNPZ95zfo+NiVOXs77tHKZqpGGg0qnYvIFeQa5OqNz
X-Gm-Gg: ASbGncsd+Y5VJbE1X3GQ1lqXaF550O/vMgwrfvLeG37SMMwcXVcKwXCl9jAwXWgiHvs
	9Tuior+0vUbxCUxXvtQm1E4lJ4F8dMlNUOdBgwmhkwBphzDnuSdDoBctbpeTVu/d91S11GpTj4p
	Yr8rsdOnBCnSIwMWBGyIqqndp6GQwNUvxDLA82VZwnGUbjN3pzMtZdL/D2GWxCX7WD0aB8Mg3Pc
	pg4PMt7CMq9krFMd1flmQh6JExthQYeVcRZz39TSwU7zaqLwM7BPPUmkVzi0KNweWmIcRg96FEA
	wL8r4EogX752sXKaTk8HeB53cJAhObgL1Kibw6rVbZt3z44oRMRVEpLRm4lkbheIRUnGD/MJCYW
	5WE3yQ98=
X-Google-Smtp-Source: AGHT+IF4SzbHZUhbFwosMC0lnmCIR5cjaOPgH5kNe6x7SOYohIs8eQs5+7xY8DfNyKJWCnS44WQWxw==
X-Received: by 2002:a05:6a00:2381:b0:742:a0c8:b5cd with SMTP id d2e1a72fcca58-7489d039b81mr12234599b3a.19.1750071814445;
        Mon, 16 Jun 2025 04:03:34 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c68:884c:5800:7324:c411:408d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890083c7csm6508293b3a.84.2025.06.16.04.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 04:03:33 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: cem@kernel.org
Cc: skhan@linuxfoundation.org,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] fs/xfs: use scnprintf() in show functions
Date: Mon, 16 Jun 2025 16:33:13 +0530
Message-ID: <20250616110313.372314-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace all snprintf() instances with scnprintf(). snprintf() returns
the number of bytes that would have been written had there been enough
space. For sysfs attributes, snprintf() should not be used for the
show() method. Instead use scnprintf() which returns the number of bytes
actually written.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 fs/xfs/xfs_sysfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/xfs/xfs_sysfs.c b/fs/xfs/xfs_sysfs.c
index 7a5c5ef2db92..f7206e3edea2 100644
--- a/fs/xfs/xfs_sysfs.c
+++ b/fs/xfs/xfs_sysfs.c
@@ -257,7 +257,7 @@ larp_show(
 	struct kobject	*kobject,
 	char		*buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%d\n", xfs_globals.larp);
+	return scnprintf(buf, PAGE_SIZE, "%d\n", xfs_globals.larp);
 }
 XFS_SYSFS_ATTR_RW(larp);
 
@@ -283,7 +283,7 @@ bload_leaf_slack_show(
 	struct kobject	*kobject,
 	char		*buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%d\n", xfs_globals.bload_leaf_slack);
+	return scnprintf(buf, PAGE_SIZE, "%d\n", xfs_globals.bload_leaf_slack);
 }
 XFS_SYSFS_ATTR_RW(bload_leaf_slack);
 
@@ -309,7 +309,7 @@ bload_node_slack_show(
 	struct kobject	*kobject,
 	char		*buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%d\n", xfs_globals.bload_node_slack);
+	return scnprintf(buf, PAGE_SIZE, "%d\n", xfs_globals.bload_node_slack);
 }
 XFS_SYSFS_ATTR_RW(bload_node_slack);
 
-- 
2.49.0

