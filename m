Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170241E5B95
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  2 Apr 2025 20:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743626794; cv=none; b=NvZssTpPSXUnfpUC6p2GhWDPtD+nocS51GXrXjreMjc9fdzEy+oIPIMNFSN8tWTpRU99hRVwHw8lSKY2360Yadwsj66gEVmwqP8SvmVY3QIUnCCwyuR+zzG8oqTPCrv10gMvwxRhJRL5ilrCPIBeJ7e+uMk6s3idBWM/F08er5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743626794; c=relaxed/simple;
	bh=TM/cjw8nSDv8ihYQl/9y04h6oXeIK8tcY6ShdqhfNEo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EcBdfHTk8+iQgZ7JJH11iwpTvvyl25yJPHsXE+sgkMPBn8rq4SAzKVe2A0VL0CfAllra8nI5aFqEKjym3El7XaQnsITqC1MEm0wBSwsY2zX8HYvBGDEDnckN5rZWXdBamQvPTJPkRDCpx74bCXuJX/g/rjY9RDmudaPl1L/pXv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MV3ztstb; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MV3ztstb"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4394a823036so1588835e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 02 Apr 2025 13:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743626790; x=1744231590; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DTwK5q9mc4wz5gH+Pp3KkIddp0zv+fxCMOX/651n4c=;
        b=MV3ztstbZrpum39+pmnmC4USt6T4Pi1lFfo/hVAX8BByi0c/U9EVAqF00dWJ74U/1c
         7jNmnpL6K+AI+JmM0wNEHlFPYfY2JZI1jLqopYdJBgT6zOZFPr7tebVIhX0S0IWB++bO
         0ikqm4xhWw4UDTUtDxLtZtkIm745Okh41oETyqd9q1oUR8G9hJYKWHmeZj5GGDWj/5O+
         Q3dhC5Xu98Sul7oRjCOsHH/MhKiUsdg8eEijIPAtA1+pKqXNLnr3epK6TLVB5g+5s8BL
         Aklm8sPRRuleLG3Ljrq7caSZxx9abAncctVmIgujErQ8w6W3LrysrLHlNPpbFTbUOEMU
         NzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743626790; x=1744231590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DTwK5q9mc4wz5gH+Pp3KkIddp0zv+fxCMOX/651n4c=;
        b=p8SZeI7KOM+MrWMxhbeUW193FotenLWFBeEpNanjnYstmMmcYKcSkstKL2wopVIFUT
         GPNOJo4m1bwWTslLPgDP1IkMcytBCUbv1jbSWwpmidC02Y/fQhn5NFb01OBDkMQHYsSg
         QxRv/VDyq8LFmIL6z5Gd2lg7ZMbToMWAIcpvtoJay6LQAzqd6pGCjNsz9q0eKwMVEX9L
         /TnyTJ/p0U7NEclVqzxm6Kq9aVWej2eobEvsL9ZfCgENIXXWEMClqDOGemBIj9hLQ4l6
         eh8wBlIVtxHWFIg47xhIIm6luG04bxCLHL3MS/MA2//wvdz5oQSZc8hMhGJ+ETTCtls7
         prkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvwYcmvwPFiuTKIN2/g09sd8FUC9yH0ge0YQxGD7nQv+ou+KMGLf5biI67nV79GSFBliOxYGmqbx2E3Sj4AgTqq9FsCw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyvfD7oNqYTqEhYhDUFPLN2SerVRAkXQKg0CFAO5lcHbMPcVVsi
	Y/2r7XZJcTC5RR9VLTj+RQOiXweptgnYROHpwiwiuLZ1hCArKRT9
X-Gm-Gg: ASbGncsVwwQhbH65kySnQr/lRKN8QqP8ZIkCmbmAGzx+i+CCqoWZ3KLkCCt+x4WMOxL
	Hk8HmegMVS/zLiX65UOTFkO/W6OH3yp8L0J3DTbxGGCc6WXvib3w+cIJEk+hyYmKuhKQx7ifY7o
	p2jEapDHBgcpei4jNdJpHG7ND1NiDuuJy14fWELXHaAdmPP2oFvCa2IQ0/hrfAci4/kDTaJ+aCC
	zVzmOVyzU2SYUvuS2esfVW4NpsZYtN41eTlSGeDJdCuIV3uhor2vRekQ83XQhwAmUB5SuhrvZFh
	k/0aL3kpBAnLdUf71MgX0lz03ZB/ynFZPFq2jOO8RxiUyIYAH44ZaKENfAQ=
X-Google-Smtp-Source: AGHT+IGc5EgnYI0nU9SzcptgdoJNo7uglRlaGotleG5vWRU1VAiUz7nCM+VvX8q4LjzKe+XhIGKzaw==
X-Received: by 2002:a05:6000:186e:b0:39c:1404:3748 with SMTP id ffacd0b85a97d-39c29752ddcmr3791945f8f.16.1743626790306;
        Wed, 02 Apr 2025 13:46:30 -0700 (PDT)
Received: from localhost.localdomain ([78.170.183.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e097sm17649906f8f.80.2025.04.02.13.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 13:46:29 -0700 (PDT)
From: Baris Can Goral <goralbaris@gmail.com>
To: martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Baris Can Goral <goralbaris@gmail.com>
Subject: [PATCH v3] transform strncpy into strscpy
Date: Wed,  2 Apr 2025 23:45:55 +0300
Message-Id: <20250402204554.205560-1-goralbaris@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250402201106.199362-1-goralbaris@gmail.com>
References: <20250402201106.199362-1-goralbaris@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Description:
The strncpy() function is actively dangerous to use since it may not 
NULL-terminate the destination string,resulting in potential memory 
content exposures, unbounded reads, or crashes.

Link:https://github.com/KSPP/linux/issues/90
Signed-off-by: Baris Can Goral <goralbaris@gmail.com>
---
Changes from v3:
	-Description added
	-User name corrected
	-formatting issues.
 drivers/target/target_core_configfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/target/target_core_configfs.c b/drivers/target/target_core_configfs.c
index c40217f44b1b..5c0b74e76be2 100644
--- a/drivers/target/target_core_configfs.c
+++ b/drivers/target/target_core_configfs.c
@@ -143,7 +143,7 @@ static ssize_t target_core_item_dbroot_store(struct config_item *item,
 	}
 	filp_close(fp, NULL);
 
-	strncpy(db_root, db_root_stage, read_bytes);
+	strscpy(db_root, db_root_stage, read_bytes);
 	pr_debug("Target_Core_ConfigFS: db_root set to %s\n", db_root);
 
 	r = read_bytes;
@@ -3664,7 +3664,7 @@ static void target_init_dbroot(void)
 	}
 	filp_close(fp, NULL);
 
-	strncpy(db_root, db_root_stage, DB_ROOT_LEN);
+	strscpy(db_root, db_root_stage, DB_ROOT_LEN);
 	pr_debug("Target_Core_ConfigFS: db_root set to %s\n", db_root);
 }
 
-- 
2.34.1

