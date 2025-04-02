Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C8519CCEC
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  2 Apr 2025 20:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743624707; cv=none; b=kOkHQEre6140nlOCoG06aGK+Pqse18NTdG6/CuVVLscjxpla49HWriPz6oTNUSXomfyyKDg04q2tcfz2buyxZ84pJeOcXP844+633Rwbjb5JPSu6C3CUdiKneZ9XFbQjAdCeNzd/9/NAwKf6++NMEKZZ8CzYpLr734CMHoXOrI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743624707; c=relaxed/simple;
	bh=C1PR5ak6BaQhI/cm5C1E9zZzBcveWm4cZ7+iHi9Dj0E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AJIxWX927pC5C6WYp0LAaEpzN27dtx4mB77gFXEpkGdjziAL5zWskiXVXSofAFkOVD9Arvr+y2Y8O0foaEckT/AJNRTpZ5dAjaoLlbvYnnGKfpREmx86WFVARBGMZBUrV845jW6QS2QnlFeTgxcMJwVMgQbhLUvNtKiBUtmMqO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G34lKwGr; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G34lKwGr"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c1efc4577so112844f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 02 Apr 2025 13:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743624705; x=1744229505; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bQ8M1xr/N2skOjel5u1xDDMGxqw4id4IVIFe/7m2EY=;
        b=G34lKwGr7dKYZ39kPjo5PAs44M2WyswspFf6RvwraIUeIx7Gfm7kZ/peGA+cal/VrB
         Um1qyCahPlgqfaz04M29ZtP71HbO8D6i/rOcxoB6uPqaJGLnvjex2vfSJ6yk3AzFVUHx
         QfZIxxlXdYDCiG/j36SaH0KWms+FqKqzdex7CSPXjjtzuA3H2a1UYIOlh293eX99/KVe
         3zx8coUZOfVuWV1BQNMou6SrlQdXcbFsOGGpjgNnnFh7GHP/1blz/aAZ4vMcnIZrYmVM
         H9kvwfbbuJiny3F9pA+s7R63BvmZgCo4dtxZ5chzHxTADqAO9JefrRfR/MWyOuRc/y2E
         0TEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743624705; x=1744229505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5bQ8M1xr/N2skOjel5u1xDDMGxqw4id4IVIFe/7m2EY=;
        b=VpCiV0k9gxt2whLdxfJDfDIEfLH5bFvynzzjeMvCNZ3/IwklnIkJNbyKlWpEHCy543
         TLtrsIATr7JsBVMnFyhjyGS/YIae6Mayva0mKyJMFa2dzErC3e1nH45m6TJfLWbtfXA7
         sXqINgRSbjL4gc5mf4py35cR2cbksfrdCH7myp+QHEUBYLUwyaigGBSUkkaP0J4rQvaq
         UjT64LVNn6gGfxjVD684VpzMpwHYar18LvR6sBMDxh16ay9YmqyT1JKOW1+FJ/lxA7pf
         /VHfplTCwSKhAXUNVwSp/+Aqb/quUO9yAqPiwFRO97zhZ8GBIayIQqVGbaliCpoT/qZk
         QMmg==
X-Forwarded-Encrypted: i=1; AJvYcCWnZjEkti79Je84IpcAhtlxtxLPxk5C4hIaTJZMr/IrZ/SxPNAiM0FnZSJS/cYAYyBUCT/SPPJBj/JVC9U71Aw/qmRGdA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlQCS5W7NDeOF2LzqwoYwwBJIaC94x7hLFOVFUTXoqAwln2FR/
	bmdl+6Qf6wLgkcyh3mLixPMunJsIzHa355D6YCyntqi6L1RjwjRO
X-Gm-Gg: ASbGncvy0G//VKmQmfuVzaFrdXxMY2WWQJnKk38gkxaQAoRqMJNSX42Oo3mS30DqqOl
	UP4lmMAqknVHLQuLgk5knyCbVYD/4i9EP3DaKc7umLaU6t6oyczIEDzs0v3Xp+sRu9wgD+MIijp
	UucfSdfL5nGLlIYj+3F4tXZzDYFajoi4+e8rw772//aIkwTr1TfzSA4Qcjl8cHaVtElKP/uG9jh
	YhKd3QRJcGjhm9TrCWd7Me9puxkvnG2C3UorV9W/WOY0jLy/FUTIxYqWLpyLE94fhOobyrhWC0t
	jmQYbpqwpU5WG2MM+e11VpzeXRhd0AFiqH1UwTFJlpowSrRyJFq3aK09XUJjWeiF4MvqhA==
X-Google-Smtp-Source: AGHT+IEAwYw/iWvyS3ZlRdO2/3xlQfSJZ7j2jpAzqMmakmE1R7n7fAR+0Gy9tZS3YLwRWhN97nkH+Q==
X-Received: by 2002:a5d:5c84:0:b0:391:489a:ce12 with SMTP id ffacd0b85a97d-39c2364fbd3mr6633261f8f.26.1743624704298;
        Wed, 02 Apr 2025 13:11:44 -0700 (PDT)
Received: from localhost.localdomain ([78.170.183.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66ad1esm18128953f8f.52.2025.04.02.13.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 13:11:43 -0700 (PDT)
From: Baris Can Goral <goralbaris@gmail.com>
To: martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Baris Can Goral <goralbaris@gmail.com>
Subject: [[PATCH v2]] transform strncpy into strscpy
Date: Wed,  2 Apr 2025 23:11:07 +0300
Message-Id: <20250402201106.199362-1-goralbaris@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250402172504.101576-1-goralbaris@gmail.com>
References: <20250402172504.101576-1-goralbaris@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Description:
The strncpy() function is actively dangerous to use since it may not NULL-terminate the destination string,
resulting in potential memory content exposures, unbounded reads, or crashes.
Link: [1] https://github.com/KSPP/linux/issues/90
Changes from v2:
	-Description added
	-User Name corrected
Signed-off-by: Baris Can Goral <goralbaris@gmail.com>
---
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

