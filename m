Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62508269CF0
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 17 Jun 2025 12:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750164359; cv=none; b=rAaxUbPorIjdsln4/uCNsRA4MgNDVEyA98T+DIdk7m6/Y/MC25iPiSw2t8yluLAQScgaucxsqAsqERji0Not4yrJ8clgpeOtsiZZzjvx406d2hmQSwb4fMB+FJL/4fxqC409BnB6yQQ8Fo6eSPJyyHjfe/QjczbLdpJM3KS1Rho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750164359; c=relaxed/simple;
	bh=kxyBVKCb12l5V36NGqS8vayy13b/AHgRj5tbAPrSDoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NiGyFgS+Ck/lX/mmVyaDYuJ/8ksGONuZwkzIxs6a77QTEOVOCoTI5dfktQQPGiaAkN6xKG96h3tnn/aWxSQUluDaScWcfWHOYOC6vfqbcAx309mH5HqKhnXmXTMKwLVnZHePLKtuC0AdixmDQk/dqLnldjCjmVIR/Yosi//fWUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDiPca+r; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDiPca+r"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7487d2b524eso2854925b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 17 Jun 2025 05:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750164357; x=1750769157; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bboBEhTeDelkuNOFpiEgEDZG0DvToOz10wOL5urng2w=;
        b=bDiPca+rsRzRDax1FDnPNNVNlVSM2SSxT01Z/OmOCRNuR+zH2sqGF+rQfZsAQ1nax4
         PbgPgZvcWdqT1NV3AUDKkMIRG08EUq2dNM+p6NsIR6QyAD+vvSRA7mpmvhZLTnY3htuc
         pba2lUvGs4i/Macg4l01npeOJgB5soTH3QlZm6do8uwoSt3GIaxByLnbI+rfqgLMUZN1
         urH8LjNuWuCEf2YsqZmIrA0WfTWnJrXnJiJgTSNVMNoL+EC30sMFmWVd0xfhPwcHDBcC
         gnXLGYrk3O+U0Vh5i3dfzImyq7nvUrZUER8CuSjjxgnC7Lv4tB30UuTYwCyhEmGtXcfV
         FMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750164357; x=1750769157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bboBEhTeDelkuNOFpiEgEDZG0DvToOz10wOL5urng2w=;
        b=uvWSC+CAqS7i1cw5Ktu/GcsqnycMY9nuPLPVdYyk/b5BhWp2K/1OBZpkWLJNu2aHm0
         Vsfvq+gbttYaP13JAtmTjmuHmk/6ZIbhRFHF3hCiUjZ2cgBBc1H9FN31+h4GAk6DSGjS
         K7QZIddtu6gqsUXkXNRot14gyCBo5dLczEOTjSp1YmS7Q62TRZvwaN+H1U2ER70W0/qd
         DFrSiae+cBHrn8DX9v18fuEG419TP9nszr34g1a6WiWq5MOO4lYx57BPVURIwxm05d0f
         VDoyacn3QYLVWqolBvBJFFXXbVC34H5TrmMf+hXymAhVYUTgqrsdzbNaCXMsO1wfZdXw
         numA==
X-Forwarded-Encrypted: i=1; AJvYcCXLtyuchu4apMnXDUjZKy2IP2NWeF9eYc+xdiDCNdWLXd+3l2+iUwzeNyr8dSm0sZWR5x7w2zwBkSuePpqVDFcKp4ywPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3nlgtDj/kpVrYEs0Rj2cQX/xgbTsiSDvfN+N0GTBvyP6SSMZO
	gW47ipJ4v03LLfpSm6rYg6z5HVtofsHrhzfTAONLM4tnI6TcAQKsdK/B
X-Gm-Gg: ASbGncs9lr2QrE/eHnzAkGxtwKqZlAuTO0051mxsoH7gVsc7D8YrSLmSKW7wYXQOXFH
	oxp3EgATZS8QU/2Os5J3IsH1XRGIkQosh1uqTCpUQBEMjZ4BTnQq6sPlKEX/LYe7hpG2NHTuVmS
	El9N8i2c1rDUrm7L1UpuJjkJ3NRehCoIBXlRPDolZDBlY7LlqTF3XEPDcxYBiI+Y2Xmq4sv4lXZ
	FtF2ztWmO8rX+5/SyVW+XN46F6YBzklSdoXfa9K54AIyJw7N93XZ7OvqqDBuK3LuOkV78qhjL0V
	tTM4nEAcibIPgn1cAwGAvZqT3zuhVNRYOSHLy1pnmlk1m2VQJaPcxlxd9q6mUS0tbiyV7hMLyRd
	FogHH+obp1G023Z+Mvg==
X-Google-Smtp-Source: AGHT+IEcnAlq96r83hmBuDkaSLgE/L4K81xGQ7b9uueV7j2AKCyIg6m9EZcjORiZ90c5PRRiDwhXFg==
X-Received: by 2002:a05:6a00:1895:b0:740:6630:633f with SMTP id d2e1a72fcca58-7489cf728ccmr20947000b3a.8.1750164357351;
        Tue, 17 Jun 2025 05:45:57 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c68:884c:5800:7324:c411:408d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890083bb2sm9005450b3a.94.2025.06.17.05.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:45:56 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: Carlos Maiolino <cem@kernel.org>
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] fs/xfs: replace strncpy with strscpy
Date: Tue, 17 Jun 2025 18:15:46 +0530
Message-ID: <20250617124546.24102-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the deprecated strncpy() with strscpy() as the destination
buffer should be NUL-terminated and does not require any trailing
NUL-padding. Also, since NUL-termination is guaranteed,
use sizeof(label) in place of XFSLABEL_MAX as the size
parameter.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 fs/xfs/xfs_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
index d250f7f74e3b..9f4d68c5b5ab 100644
--- a/fs/xfs/xfs_ioctl.c
+++ b/fs/xfs/xfs_ioctl.c
@@ -992,7 +992,7 @@ xfs_ioc_getlabel(
 	/* 1 larger than sb_fname, so this ensures a trailing NUL char */
 	memset(label, 0, sizeof(label));
 	spin_lock(&mp->m_sb_lock);
-	strncpy(label, sbp->sb_fname, XFSLABEL_MAX);
+	strscpy(label, sbp->sb_fname, sizeof(label));
 	spin_unlock(&mp->m_sb_lock);
 
 	if (copy_to_user(user_label, label, sizeof(label)))
-- 
2.49.0

