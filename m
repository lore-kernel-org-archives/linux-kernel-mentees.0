Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE583630AC
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 17 Apr 2026 19:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776453332; cv=none; b=SVV6Xcb3tYm4dwmirE8wJlaHyCY2SXlnRBsrOw2jiX27k8NoueD1kWbJwxPzHZ+AL6h6IZtkXuRj7Krw9xchxzHTxMEXqrbjBYtVV3HdFe4ZKd7X/HbH7X84+O7yWJNXQCHjrr7XfmPPzW0C/SAkIokYU89JNpBIamKSv8nV3kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776453332; c=relaxed/simple;
	bh=zwOsI9YqoPTo8fi0WymBV6+U/2mo9JYQHx4uLvXs2r8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KzZXQbuheceJVG7apSdonrEjV5L/OpGKk/+r5tel18D1K7scE2MHkZO44t675yU6LBN+r0Bc5L0eHMXSQLXxWMKZeT/WcHg2c5fUgrVwHxk7QhNt4UuBg2F20/BrRckHzKwLoudK7we28UCFgpvHESt0n3TF7ulyeyA79YNA5vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kb6BmIpI; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kb6BmIpI"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35da01fc0baso712647a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 17 Apr 2026 12:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776453330; x=1777058130; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gh+Hk3Cy5JAjfm750WfXAcGG5BEiaUMyViuuazgvLVA=;
        b=kb6BmIpI8zXDPMy/HsCo9fhFCSCik9HeB0FNsLknTm1XMYanRUCj/zoAzj4mznKk0r
         igOycaECH8iuU1z/7TL+zJS5mkWVYv5X3qr0JcVkDIeSwG7Omc7eK0QNRty8aihMke3/
         bXmOPR6UCJZGwBibKjD8cN0gZjNHRP1DiBMMS5PmL6cR8Z8Cwgv9w3jDUXAX5PEePwIj
         TsPKERCvG0ssRwp7DXT2TsO/ufhM7j+AyJNgYiqGY/8nzJu5XBdOk6Fl6EKfa6sbG2GZ
         d3Pg/siDkkQtaz7Fw3VBHp+dOOqgKQKurH+OVjfOHp9ki1/NwMvSXTA/ka4+C7K1YfVK
         tEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776453330; x=1777058130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gh+Hk3Cy5JAjfm750WfXAcGG5BEiaUMyViuuazgvLVA=;
        b=lOxKtqrG39khn7iBpdZUbHMBGqzBvyN7+3KbMoWwFB40AmrmepgA+luNf2XgURHtsA
         qLf2NezD1yLh3an1Eys3o1DijcNwV3bPLKbA8UVcjcCLVlK+Irnm7Z6zTSA5sFGBNFwX
         G5ctJIQVqoBV+4ZbeADLD4DBR9NUu8g23E75XpxWQrN14HTLdwAlZjYArdyrQg19yPvE
         d9KSKI1+i7PXPpC2knAmdkusP5vf72vWSknlwT8S/VJ2aFJ5elKGve5NccuR34IPC11f
         AjATs76aKtJqfdTGaAmezv/1zg2+iGNYZMwzWwadK7mkYGHH/8onwoDjfhjsI4UaSDwC
         NaJg==
X-Forwarded-Encrypted: i=1; AFNElJ9dSBbULie1O7P3YjV1DIQouUOGGi1mtdlXOyY4La5Iodejbkkkk2tLEzWdCocsM+LvUF9czhm3MNC1R5V5l1KMIR+IRA==@lists.linux.dev
X-Gm-Message-State: AOJu0YznFk0aFjoI1hjHKcH0R/iYlPXqWoyIjtixBCoCWHDuo2UxDK5B
	66fEzyGdtbHkTVY5FTK+uTcz3GG1i6K/iKpNv4JcXl3D4Yp92QeGYLff
X-Gm-Gg: AeBDievDsItNbUvNv0/IyRCxhI8N3VfhI7pPEF30ZkoUt+38jwthmg5ajYsD7YpR0y6
	zwslsadTZd8bEb/+hmXWLpBSYWNkIhpl4w6MHynotuCb5Yxax2uO0/k0KeZ7PsD4Iu9bT6XkUYB
	Q5x+IMQ6g1rY7oK93sv645cpfBOyJuDoy0rCTIIKVh/n4ErkpLZJsyW7C3t3aaNQhtwJVZWJlz1
	6C7i71IPZMfDQXlKW+4zCBZaY9ePwwAZq44GSPPBVXmDjebTVTDBvhcpH7s7dZfxDm1GGk6UfsG
	S77vQ7/FDTBDZykxoYwPMH717Bdvy71DaB0LdITvBikfaMqD004u7ZhFP3H5s20n9yB8SO2dm1P
	28+xz5o4x6M+UglnpCoHLeB+xsj2naUQ/kyZCkICC18pgyCPRbxTjseC8pHe27LUFy6pOhcI0Av
	frFJZVXPNjU8S54wPwqDTLJn+HyhU2eBB3ikArnIvFBXEqUM9fjvGkyfycevVOYBGzpg8wmxwPL
	Yz+QneFNkAG4P/AJA2dytgozYaV
X-Received: by 2002:a17:903:2acb:b0:2b4:6398:6aa2 with SMTP id d9443c01a7336-2b5f9f3a802mr46557695ad.27.1776453330154;
        Fri, 17 Apr 2026 12:15:30 -0700 (PDT)
Received: from fedora ([103.181.54.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa92c428sm33800605ad.0.2026.04.17.12.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 12:15:29 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: sergiomelas@gmail.com,
	linux@roeck-us.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] Documentation: hwmon: fix link to ideapad-laptop.c file
Date: Sat, 18 Apr 2026 00:44:11 +0530
Message-ID: <20260417191411.713958-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ideapad-laptop.c file now exists inside drivers/platform/x86/lenovo/
directory. Updating the GitHub link to the correct path.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 Documentation/hwmon/yogafan.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
index c553a381f772..68761947a1a8 100644
--- a/Documentation/hwmon/yogafan.rst
+++ b/Documentation/hwmon/yogafan.rst
@@ -135,4 +135,4 @@ References
 
 4. **Lenovo IdeaPad Laptop Driver:** Reference for DMI-based hardware
    feature gating in Lenovo laptops.
-   https://github.com/torvalds/linux/blob/master/drivers/platform/x86/ideapad-laptop.c
+   https://github.com/torvalds/linux/blob/master/drivers/platform/x86/lenovo/ideapad-laptop.c
-- 
2.53.0

