Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CDD3C3456
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  7 May 2026 10:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778148776; cv=none; b=PCZu7dcXvp69kMDcaCJj1iMIdGnYXlPzsux88xGTauwrkDcMT+TSwyU+xfBWqdCG1lG0IzLfF+fG1NNKzxQk4OC4DYghqpbwHdWzKivm1YFL7cbaDw119DzTzVlG67kDQLK3UMtMO1+2EhRvwkXfPnD7k4MqHIq/m3UHwZg9hy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778148776; c=relaxed/simple;
	bh=3xfA1DkquYuRG5e/fkJPGHmYNlnl2sMR1OxKC/FswyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AM6/t/i07HgaDMyhDAZNpj0/hzshft0Qp8p65ZAD/AP9ypyobhc7ydrHtukdTuITwtn80IDOC/ierP/0DRdXtll1hjz2LpFAR6Toy65bMkEub4kdWSGzWh63J0yOFZn7PD1llQAm03cxQloNKuyHP72Sr+twWg2uIshMqiM6zfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eh/+3cnm; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eh/+3cnm"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-838d0b7c950so382603b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 07 May 2026 03:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778148774; x=1778753574; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3TsBqtt18Cwy3ovtqkmoggUEtnSub60FoPA8LRbU20A=;
        b=eh/+3cnmIWaZvbA0PhBm7SX5U1X4kGRAS5h/wPCDpzbZUbYJ9ZGklBNtmoICN9YUBD
         ro6DxT3mRjroWEL49K/fSvqJoUkAg5YiqW63o/IK7MLop2KgiQ76NIRZFuLiGVeB63xg
         I6HYBVqNzourGMoF4uy+lqaWke9TZEDtzds2538YBZQWaa3AqPYpJAoZkNnSlAsTpa3K
         wLWpQ6DZqtmOE+kYdEkGnbFHGUEox1ST/3UzMD0vY2n8rAol2lbRKUoLfp8bkqeb+VDV
         i0ttsz5JdsjiagXU2jMBVtZz581ndP/Dp/PLTsrfbh0Ag7pmib0sbxNacV9noABFauEI
         prYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778148774; x=1778753574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TsBqtt18Cwy3ovtqkmoggUEtnSub60FoPA8LRbU20A=;
        b=KaQaM5ZBPqxZuf9NkELRO6PksV5u/afdxXAG+hxSZJ4Y0IIag2w55nwnl4KMsEU2J4
         6UVmadnSlO112R1Ngiq5mGhoPfOrMcag05LYw3IWOGccNbM9EGJAwtYmgvXlTHn5rp4I
         qcJLawd9eoQpV9UHcv5CT6dZKkRsEIw58W5XveFphhGNlT0IXvVTyUGH5mZEM1+gSsjF
         3xHbEH0xy0m1Nyumeb8MUXar5sdeULR61MA15Nrzyr2qWwuu+1BcLaBdkszsWEqR7He5
         eZ+8EYS+/scfNFOmOMc3vuu0gQekNV2/ZhatrLFY8znUd5D1Pmqn6IqtWs2Ty6q3g0cy
         vj5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9UIwKWeMTYe/7cGZN6hSkp2DxQpQp/l1ffHxGz3utMIk5YHAwTXqWLrXP6caZpmGoTbCbK3UUB8d5XeaO8663o6OeTwA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwwY0O7zLHElRGKhYofsjIlfamsC4Vnxd9LM0/wdA8dqsSN+ava
	6Mg7SgOBBzqbZ14v1sf9hpFwsQqAAZyWFPrip6Z1MT7WTyeftAOaYLl18pNfXwJdkuI=
X-Gm-Gg: AeBDieuFmO1QM4TvhUYZf/TiF2PZxTS9pzSJht4Z+8Heh2lBfjIgucs9ljWV9sUH8TS
	oJkNWMPBA2Hdg4OmdWqy+df8drrC89ttBlbuU9/z6BThWPN8srrhEqgnPaaKqjuREid04FiW0N6
	jpL1lnAhhi2I4DsyYejAyfQgTWeCBPmeNFQapRc+fHe4meXhhjdT/OZ3sJ8Mh4YhWJcnq9HvqZj
	b7y9LnUS2aA9dgP78l70G1g61MoY5o43bEQDT/1jQSdCMQKU95FUQgC3p6nLbMnV6VFXezgEVoi
	+VvmlNoS9bPcTwdoCN82Bo9DCEguBftyBilqpa8sBDsY2tO+lZIIT7R9uDo1KRSZGDHpZ9opKVE
	HF27hopFboN6YJ1WRpUYINKVfEdrrz0zgl7uF9LzzMgBl4ylqOeTkPPMfhIef/vTk5iSRM6cgMS
	Y9L7DN4rwLF2P18ReGzDPWNo+2mgrgkboVKHn7BCDBFnWA/2eoJu8+g94V7W6vU2fGqInylL/ih
	o4FDn8XEQd71Lhow0xQ8cKc6pojzA==
X-Received: by 2002:a05:6a00:27a4:b0:838:a46:ce99 with SMTP id d2e1a72fcca58-83a5e457a1fmr6768497b3a.48.1778148774344;
        Thu, 07 May 2026 03:12:54 -0700 (PDT)
Received: from fedora ([103.181.54.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcf16sm9797998b3a.40.2026.05.07.03.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:12:54 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH 0/3] hwmon: lm93: clean up coding style issues
Date: Thu,  7 May 2026 15:41:40 +0530
Message-ID: <20260507101143.559475-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series includes code style changes for lm93 driver to fix
several checkpatch.pl warnings. No functional changes are made. I tested
the changes by compiling the file.

Changes include:
- Add blank lines after variable declarations
- Change 'unsigned' to 'unsigned int'
- Remove else blocks after break or return statements

Ninad Naik (3):
  hwmon: lm93: Add missing blank lines after declarations
  hwmon: lm93: Change unsigned to unsigned int for clarity
  hwmon: lm93: Remove else blocks after break or return for consistency

 drivers/hwmon/lm93.c | 87 ++++++++++++++++++++++++++++----------------
 1 file changed, 56 insertions(+), 31 deletions(-)

-- 
2.54.0

