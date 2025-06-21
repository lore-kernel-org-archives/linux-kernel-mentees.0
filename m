Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F9918BC3B
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 21 Jun 2025 05:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750485128; cv=none; b=LPf+a9hYNiEppqgxMC2Mihw2ED5b0WQm9CCsHhxsGSeDkq4tv0lp/W2tpAvlStw55ruAOZ4RLIyY6Yxrh56WpNItSnDAhkizUSzwMdIIpU3h7CtuCvfWtN1vqrVtKXU+0xMH3w1LRY7inp0H1zVE1ZSZKtJ86bFyQz0KB8jonEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750485128; c=relaxed/simple;
	bh=I2qfDeaK/yT5SBxGqMaxj0vINrFUNTL30vXC81G8BN4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rtyuOtv2vrpN+Gr/GScQqFG8jwBKFMIYFjt+FDznUuZt+LkgYU+mg6o2u4m8WyqxhmqimrGhhCtwGhMPDfPYXeQzxXaO47eytF/eQ/5pNXL16F3bY++RubdTL8m7fmGamHlpT1u+2HDiaU76WRZN82CaNrPRXsVRqLrN83wA1BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlInPoFI; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlInPoFI"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4519dd6523dso1173715e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 20 Jun 2025 22:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750485125; x=1751089925; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WQpUEjf0YxYX6Ci4pItp/DxE3akefzENzegjXg1pXvE=;
        b=BlInPoFIIi/8Chwn2xc3tVnfcwCNjqm8rE1nr5//NUjWCRUQCmAwLVvVyTCfH0Tv7v
         ruRcaf8xalAeasB/FsDOL7sRGhaUJYK/EiWhOSaC70C2bBCJyR/AKWyiz9ZZ0m+Aldy6
         +BZa7jZHFxPAikGqYNGkopgXTLXInMp81lfY0xdQPSwxKgPIVDSIjrNMRvJup88dwCld
         PcORdx5uOE4mieaDkLiOcyFuaPT7AM8VVJWRxiA1Ynv1LHM21ucE0VrEnXpTweSsCBoU
         IUEDjX65c3z/845Nnif7Z+/4aXPOKb2OP6pFrxrYhhh3KCcxjCVeoRyQy1ZzEklw1YeT
         F7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750485125; x=1751089925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQpUEjf0YxYX6Ci4pItp/DxE3akefzENzegjXg1pXvE=;
        b=IMovO+cw/qYC9t0JVw7bcZhkUzx6xB4h4wMOCvlKSp30CD+iFjieLxM7D+ASsXTkoe
         0ctFeASVmEZeXvBWdCu5EHt2LQ8YSeafcQaOuO+2OibW65lTYOBRjCD8RUY1mvM9ybhR
         WJJ1gH4/fRLP/hfKLcyECaIizN2JLnGGQLV22kEcuMKd/WLJxAh7JzLhNOOsKWodywrp
         BZy3AAqR/3XDnureLhkN8crarzqdwKCkCR4ZCi5+JP9xq1AUfEK/p72T2XO9mcHPkLmj
         hSFzxOsmZ9cuXveyE2OJis0dV/HhSCpFTCIuaOPV57Ha2Z3S5VKYA1zRuTryrjt2exTV
         vRVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHCmgFZGdOfkYKwUDI+4Hh75hGagMZiBDk+WWs+8RsY6rS/hLx0qhYLFvV4bxJrVwZCy3ei9aFjn2s13SdLL/V6QtZdg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzl+LU7DT/hPwjZNO3q2DDLACmOZV8CI8L/CjiseqsrCaZN8p1O
	kmzBWWIbLu8BTuRaF09mknG0pWsz8KBNd5X6NfldbhnH5L1BOj5TZ+Ei
X-Gm-Gg: ASbGncvxPlUS9EuZGNMNVPugLlBPTYBhOUC8YerAE3kjadtOmjQvSEAOeHis8zzGe4h
	0ZaLPe0qVQWAi6CVtgn9TbtOWfeK5PmHRxrh+mVLjErbkXKbr1b8+8utngn25nVkeQLshZNYi7D
	qXXyCgXSjK8Imb9IfT77okwxtasHybrYzdAYrvZI4O69N7l7KP+q3YE/1nCNvk3Zu6UBC0HQvs2
	LufMHDr6EDjg8c8naxXQ01o4+YtBt5j+L6ftoA4aCKCPrOLXDFLanA8KONKHjY+otIMVxpL1pPW
	+NIhGCboETzjm6M3aOcvy2GCtLdACUONJQtgLlRsL5TiLgMZZlyNMTKhzokXLXEMkFThskGJTlU
	1eZVWA/ARHDLeEXNJn/6kZJ2JdJxBkicqow==
X-Google-Smtp-Source: AGHT+IGpx8LAUbfT+/oAv5emrbinMdbFFJI0Ah20iXYdZhFuPKxIxIt+hSS5OM2azlVyMH9Ov14N1A==
X-Received: by 2002:a05:600c:5494:b0:453:590b:d392 with SMTP id 5b1f17b1804b1-453657bf79cmr18822625e9.2.1750485124972;
        Fri, 20 Jun 2025 22:52:04 -0700 (PDT)
Received: from localhost.localdomain ([102.46.244.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1190d13sm3785172f8f.90.2025.06.20.22.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 22:52:04 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: rafael@kernel.org,
	lenb@kernel.org
Cc: skhan@linuxfoundation.com,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH] ACPI: fan: Replace sprintf/scnprintf with sysfs_emit in show functions
Date: Sat, 21 Jun 2025 08:52:00 +0300
Message-Id: <20250621055200.166361-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update two sysfs show() functions in the ACPI fan driver to use sysfs_emit()
and sysfs_emit_at() instead of sprintf() and scnprintf().

- show_fan_speed(): replaced sprintf() with sysfs_emit().
- show_state(): replaced scnprintf() with sysfs_emit() for the first write,
  and retained sysfs_emit_at() for incremental writes.

This change is in accordance with Documentation/filesystems/sysfs.rst,
which recommends using sysfs_emit/sysfs_emit_at in all sysfs show()
callbacks for buffer safety, clarity, and consistency.

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 drivers/acpi/fan_attr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/fan_attr.c b/drivers/acpi/fan_attr.c
index 22d29ac2447c..6a53da3d6d82 100644
--- a/drivers/acpi/fan_attr.c
+++ b/drivers/acpi/fan_attr.c
@@ -22,9 +22,9 @@ static ssize_t show_state(struct device *dev, struct device_attribute *attr, cha
 	int count;
 
 	if (fps->control == 0xFFFFFFFF || fps->control > 100)
-		count = scnprintf(buf, PAGE_SIZE, "not-defined:");
+		count = sysfs_emit(buf, "not-defined:");
 	else
-		count = scnprintf(buf, PAGE_SIZE, "%lld:", fps->control);
+		count = sysfs_emit(buf, "%lld:", fps->control);
 
 	if (fps->trip_point == 0xFFFFFFFF || fps->trip_point > 9)
 		count += sysfs_emit_at(buf, count, "not-defined:");
@@ -59,7 +59,7 @@ static ssize_t show_fan_speed(struct device *dev, struct device_attribute *attr,
 	if (status)
 		return status;
 
-	return sprintf(buf, "%lld\n", fst.speed);
+	return sysfs_emit(buf, "%lld\n", fst.speed);
 }
 
 static ssize_t show_fine_grain_control(struct device *dev, struct device_attribute *attr, char *buf)
-- 
2.25.1

