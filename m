Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAA12BAEA
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  1 Sep 2024 09:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725181718; cv=none; b=o/iTz2BKEb23aW+rfujESi8cnZo/0oUanioEqTDqzkyq1djPPsG4soMiY219e4yFTybpMfBu744Njqgvl607tBiAOOn/etvXz6kmSD2LsEn86+0KWssib1ked/inEaeaE2M5cZtI7c1dbwlUXKuIIza2FW/X+T1icBJpqDfjHgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725181718; c=relaxed/simple;
	bh=P04YwUjCOryVjCfcYQnu0tg+EzgnSL5TKqfNGDD5QM0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ShCH2tCUJ6+ALn8WzCRsccVbpSeVVl/rUe62Y+XqcBlxWcZQZEHTJNSkG+zO3E13qACjL5+hfFESiyB1K7549tHgP/MoPaunVDHNDKL/A4La08WND4FM2rWQV9DPYXidS/AyhflJ6FUZa+Tu61qsKBjBxlAWouW/fhMZul3YhMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLc0Y6i1; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLc0Y6i1"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71423273c62so2501206b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 01 Sep 2024 02:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725181716; x=1725786516; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uf/Eq6QcdVJLK+5uWcgN0sie61+2Ba/1R5i7PSUP4RI=;
        b=mLc0Y6i1x2zL6UAzBtaqBHiCd93vvOSH8wFkkxXcgg2m7hlztEFizCSNed2O6b4sNK
         3ZqYed6eUL9qyDnyHcxMavAIYWy6otasAwvNADdgTiVojjQkwcVdrBASPkXiVWEqiPqW
         C9oKUd0wdTlAb2N1yufV8eFHggZYCPzaIKTHRjOWo732UrefQJ2BW9GN3gzHBevHRp2y
         3uBKXTSSK4XwPOQGJvzbxZ2aMGg4TMvzDVtdF0ZsPO+YhTwrOWo9PUrTF3vXo11y+7Ng
         od4dNTchT4kNgIS3kIK487sO7XhmRsVgEmsrZWV41tdYumnkJRJA9yqjH0sbxfwvz4bo
         2CzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725181716; x=1725786516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uf/Eq6QcdVJLK+5uWcgN0sie61+2Ba/1R5i7PSUP4RI=;
        b=qxhmIx89AIn+5HglIyqz2Z8flR97P6VHDhKFMbW2FTHEtNSCvm3hXChcU08FOBs5Jw
         ctJ21G0aDxASkx4C8xpWe5efulJLOHPvdhz0p0caWF/UYLFfTFSVCse/W3mXbYtQ3gKY
         ZTMAA3H/5ACZi+RxzJErsh3HbmbSUp2VqD8lp3esf4ADXjX3Zy7gonCF9FAHbte5YqWK
         l496psmGdoA729GVQia9lB4NRCtj6rw6iL1EwcnXgpTlLJftznlDKQqgnvJdyDssuLJR
         b4fhk3BKw3VE4W5qA/IWkRE8HJ/WGTtOvB2UhJ9KJF+6sREwEEsex+UtYHer9rrP49Ee
         JgYw==
X-Forwarded-Encrypted: i=1; AJvYcCVbXSGuVVunzOF6UckHMWcDtDyyzy0LxZZjI8QNGLtza2GqPWfJF2wWerCAhbI2nxOXdEbZ1N1YeM0Fll1S9HKopx1Obg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyzta9Pcxns/YMm87vj9MBb5eghYGfs1ZfbJiqiYvtIx8+5HQKc
	9G6iAG7vnMKjfy2YPJ6L+eXYq6gvxxSGNDMHL5rSYKQ+PAAolo9F
X-Google-Smtp-Source: AGHT+IHAGAa6ehS3sdl3Svp4SmGi0hoXaI3TEwD3+VLMGce9iXE9iXi/5JFvtfwk9Hzfm5STJegqNA==
X-Received: by 2002:a05:6a20:d70a:b0:1cc:e47f:1004 with SMTP id adf61e73a8af0-1cece520b85mr3490106637.26.1725181715734;
        Sun, 01 Sep 2024 02:08:35 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c1:3a:c065:a024:d97:d9a0:1860])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20563b718b4sm6530795ad.298.2024.09.01.02.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 02:08:35 -0700 (PDT)
From: Amit Vadhavana <av2082000@gmail.com>
To: rafael@kernel.org,
	linux-kernel@vger.kernel.org,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	ricardo@marliere.net
Cc: av2082000@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] ACPI: CPPC: Remove unneeded semicolon
Date: Sun,  1 Sep 2024 14:38:23 +0530
Message-Id: <20240901090823.18766-1-av2082000@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove an unneeded semicolon, as identified by the kernel test robot.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409011554.KG79Y5xu-lkp@intel.com/
Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
---
 drivers/acpi/cppc_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
index eecd80e848cc..28adea68e1cd 100644
--- a/drivers/acpi/cppc_acpi.c
+++ b/drivers/acpi/cppc_acpi.c
@@ -1138,7 +1138,7 @@ static int cpc_write(int cpu, struct cpc_register_resource *reg_res, u64 val)
 		default:
 			spin_unlock(&cpc_desc->rmw_lock);
 			return -EFAULT;
-		};
+		}
 		val = MASK_VAL_WRITE(reg, prev_val, val);
 		val |= prev_val;
 	}
-- 
2.25.1

