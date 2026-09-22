Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166A4443AB7
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Sep 2026 09:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068876; cv=none; b=gM4XPes/j5+zFmZMHi7/xj70AkgbmJuSMYzbj+7M15IWpALrv42KGX7ezNX4T6L64BKEflipA1WXmJ3vm19xOff8jYJV38UNMzXlt+bTaEhnaKz6Y2cHkqN9eVbQ5D7799Z1k2BlubzbdVSZYxrAejEJruZ/u1Qbf2ArUzdNBkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068876; c=relaxed/simple;
	bh=QwgutwokZ3b0qwkGY6l4hQt9JqC8neMMcSvmNTqPuqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=duktn2b5oMBuvuxWNUPp0MW+puCcmaNlQCoYG8WzhD/LCnRE3AG5qrN3FecSY40sKVBMebq4dVM3Wbf6GRMxD1n1XWcRKQd65M0YpxbffdE4juwDll+E6y1u3bpIirZulUkjwcMaegxmnI+pSrvcYgUyTLnysycMIN0ysYVvkMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+MZh6PW; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+MZh6PW"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc5121bcf1aso3164361a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Sep 2026 02:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790068873; x=1790673673; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VhqwyCXWCrR9ZsZI79xSj7TfrvM5uh6vx6A8zPKncw8=;
        b=F+MZh6PW07Rk536xYTtyEfSeu9On+agB/sjrJCz4LB6oe6BFNWurFPi/7PCklFeE/F
         NVkVjTo/gDyVDgxXkvCA1ltRedRbMieSso4+lSYnly77fksRdfO4KPqJWZy0ETUcRwVD
         j94BW0OsgVW7n0/WAieS/jJwqgLRD5wK8+ZhzzUf1tzmBJnL/lYv2M9d5AfF9PEDFFKW
         gAcFkYFHBADpVrYxucwZ3VsqupKoMRPf91nBzf8sQauJmm48eUxlLKm3PJMjfXJRZqUH
         sMKYNShEMnzEcoqyG5r9Q3H3UQ+jHGoap2/lPW6AX/LdYmHm55raHik6UdeIqu5t8p2x
         dBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790068873; x=1790673673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VhqwyCXWCrR9ZsZI79xSj7TfrvM5uh6vx6A8zPKncw8=;
        b=juvG2mCu/T9AsedaeZyFytW0d84MnjyvE4EPAuVG8E0jByQKwZiRRSKlDvYY05T+gJ
         GqkHaCtKS/2kMmeSbz5r8M6Sw8PShv3NI5gTGDS1MqMGQ5V8MEUNU7OC7AfpFXaAPNJL
         wOlgmy06J5dtssRHtS/DR/QWEsC2MS5bX+a7h+nDpxRcp376ezjRY9x8iQfeJD/SFI3q
         cALvzZULAAdHxVjc/tqDKaNbIT0FCNvUDRmSddE6SuhpBSh/UXcstOjXbfWNneSCgoUo
         UQ8DdMuO13W8KTX/fAfWVzhj349xSlT8HQsi/ycDQy/72dXUyh55Zt0apRQhimZIN/4Z
         vCRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvklyI2cOxcumyYCk5elczvOoMpMaAFmf5crj/X8TT18QqZ97rg0euTtnY+Rmrocq7OBpGxiu00OBDmKex6P68Gqsw4w==@lists.linux.dev
X-Gm-Message-State: AFuF++lmIL6Nzy2iDbRg1vfASJhPqVmAOucs1QSi4A6HpaGzZ+762shH
	N4gW5sMvDIf2kiYBV6stOcBtQ1JgzZLFe82rx1Z3Rh1LxXBuJzETqH9c
X-Gm-Gg: AYBFou10fvDydo0bc9xO6/G6RT+SmwcFkT+XvaYCG2qDFLwtYmy2JbFNBE2fKB+CZ2N
	aIZdeRfWMAIZ+AJmNb8zNTk2FxRxLJP1FCPNKh/s7QW+oyW47eEm8UAlfmTd9V2QzD3dOrqdeEd
	mBQoByuwGU+HyLiNMA6bVxnhDN3Rl6a5qgE6tPw7Y+3oDAkl8OAfoI7EtnedFEXOCXhyUj2Vcvp
	U/5JEk5glc9Aw4c/qs+c54u6rd8FUbBNRe6LVDGURTFnCRzKcvfRKMoLlztnbVZGZ4L8V0nSYlq
	3rNr3TZfhE6UUurRlftkwzj6oUiO91YlbIZh51L9g4ssQJCjsDQkg0hPhHId2ogmmSMYWDo9ji5
	6YeJHx5R3I1NMQ1Rz0pKkYBAigFf+pmVaCGyVqrDupfiCSEG+W+PlecfG/MRvIpXxVi55vvCRfc
	gR8ScbbxDgv9rThdesofsYvAy8aAWn349a3A+3ISUL84MgbvNVRdik2lbQhiymxEXJ2wmjBSqT5
	CMlBUfmUdEHx07yBxA=
X-Received: by 2002:a17:90b:2686:b0:39e:4546:fb26 with SMTP id 98e67ed59e1d1-3a072e96de0mr714758a91.0.1790068873149;
        Tue, 22 Sep 2026 02:21:13 -0700 (PDT)
Received: from cfarm424.jing.rocks (cfarm424.jing.rocks. [2600:3c18:e002:2e11::c424])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06caf4a73sm899819a91.2.2026.09.22.02.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:21:12 -0700 (PDT)
From: Ridham Khurana <khurana.ridham222@gmail.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	Ridham Khurana <khurana.ridham222@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] gpio: zynq: fix runtime PM leak on request error path
Date: Tue, 22 Sep 2026 09:20:58 +0000
Message-ID: <20260922092102.1053513-1-khurana.ridham222@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_get_sync() leaves the usage counter incremented even when it
fails, and zynq_gpio_request() returns the error without dropping it.

gpiolib does not call ->free() when ->request() fails, so zynq_gpio_free(),
which holds the only matching pm_runtime_put(), never runs. The reference
is leaked and the controller can no longer runtime-suspend, so its clock
stays enabled.

Switch to pm_runtime_resume_and_get(), which only increments the usage
counter on success.

Fixes: 3242ba117e9b ("gpio: Add driver for Zynq GPIO controller")
Cc: stable@vger.kernel.org
Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
---
Build-tested on arm64 with CONFIG_GPIO_ZYNQ=m. Not tested on Zynq hardware.

 drivers/gpio/gpio-zynq.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 15a79d9a2e9e..13e4c5f0e297 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -798,15 +798,7 @@ static int zynq_gpio_runtime_resume(struct device *dev)
 
 static int zynq_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
-	int ret;
-
-	ret = pm_runtime_get_sync(chip->parent);
-
-	/*
-	 * If the device is already active pm_runtime_get() will return 1 on
-	 * success, but gpio_request still needs to return 0.
-	 */
-	return ret < 0 ? ret : 0;
+	return pm_runtime_resume_and_get(chip->parent);
 }
 
 static void zynq_gpio_free(struct gpio_chip *chip, unsigned int offset)
-- 
2.47.3

