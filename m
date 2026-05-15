Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E1048097A
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 15 May 2026 14:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778853976; cv=none; b=hnn89L+pKGQ0ue9vuuGL80QrebrzGHNcJX8krBrV+qthCFveFS2ieX10iotlfKtWnxP65vfI4WrgaatKI9FzCquFCG3Y3w0mHLQZWvb5inkPb5mxr1DPiApb6wyDYAQLrjiuetd4861B5mR3h7Lex64oy/x32C5W3ZD78VHxTJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778853976; c=relaxed/simple;
	bh=TRL9WCHL5UCyErTDrc0f11Zk47DI/67SrIrUfAfV1k8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ceIKqK1/0GeeF+O0WFu412MdbuCi7Sq23LSfi9l5TYg3eT0APd/fbisfLDo2QTsCUHhh4iYZOJtyD+AEKHwlWZzrqeuE1ZPKWNim80om1X4AVZStXQHj/+gm4Mo95JmyV/n4n3z+wkto/2FFIDvtcch+hrVFWDIQCcHygwRrzMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sjhEDuA0; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sjhEDuA0"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-90d13fa59e8so460845185a.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 15 May 2026 07:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778853974; x=1779458774; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C6sNNHau1zGoI11CF45AQfPed5cSOPSS4d19nyt3UUs=;
        b=sjhEDuA0dLYe6zq24KGkp6j9rccIYaMbxF5AAKY8YxTdeBKhA4byRdY1EqD5f3GXJN
         PdTjHji2d14TJAVLnzoZFUxKzZnSeAzFPNbQNyj9O/yAPRx/bNKcHPClV2iy7KbiUGWq
         TR/TFl4QCB2mt9Hp1EvpAJ4AjxscTmzjlaDwszN3v4wt5ZBZqQA26AcvFouxuVG8/tbk
         7AMStk4Cy2wwM0/w5LSle5GtVfASeg85ge7hpCl9vpdk7++0t4kqNJQi/ws5jodIIThP
         lPqCMumpc7mFnyIf+9l9WnzRQKF0qzOqFcNXYxIoCxBBV3mbMy3Oi85f83ucP/1kg8ZE
         rZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778853974; x=1779458774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6sNNHau1zGoI11CF45AQfPed5cSOPSS4d19nyt3UUs=;
        b=DIf/mTiMiyJEk3AQ5+Eh3pUypHUyIEc8C9Wa+PaiVCfhKHYDotyh/xN/cNQHCs5wXa
         Kp9zEi9HAm9UbihxWnBA9CXquw0V1FQOij+L8cvfQ7AjmSfFs2KbRDdyhBajZvwHRaS6
         pH8qUMf6gBVNBuWX1AxKPCKCmmYT1KGaXFKL9I662foXFZrWMGq/riyez31G2dI1XG0m
         bnBeqVxzsDzEZTVRGLY8ca6K2ovLmNjCL4+2HRVFJpPW+5hd7Vvyg8f/LbtLeUJO9qTP
         /IuyBdgbjBmWX+AR54i3hj/RNBMgJw7RbaXWcpjDQNpjesBBkCvVfcWbT40utze8o8r3
         VVng==
X-Gm-Message-State: AOJu0YzHt0mv3gjhWbFiEGIYYQmV7gtiCp4m8iwXNvDxlUiCtkRFd8bK
	LgiaUL04LrROTlRTuqh5Oi4f0o5+FHhp0B4b5j8vnqNwsZwiVB2xOXmH
X-Gm-Gg: Acq92OHEH2W+5v40kmfW0hwSbwO+zCkt/qWTBUTK9Cgny8VGc0cO4U7shkAQC7DwpjS
	UEjITOzCh/MjBfWDtcBGLmX87dvMSqu+PIUxleS6ZZEagBgKYROduTjs5xICfxOkGBXYuZE66Zc
	WdqK0EqnhpBJiXpDHbdynhxW0UWJHrED8O2wCqsNQiW/1IFpWnvrbXncyPROezhKKL0VPqQlCx0
	5KjGpNhwQR4iUCwHWChqPtaqC6POhkSOMOKt1NtRKF/hv0CdtuiXG6Wd2oOcdP+enA5WHwm96fl
	W2P++qqqBwFZLiBOg4VPSyh2Tc5itY11qNsu3mhD1I2QxyBc57p3QLe8gzUEl7HqXFbQmYWzB7c
	3k+ZFv6Zm72dHX6fw7eTj5Pjg4UlMcujapFStvnMS64lZkg1y8/Xzbt4wSq0EALn/Pr0UVH2oWD
	fQ2Gw8R9J0QH/zAg==
X-Received: by 2002:a05:620a:46a3:b0:8ea:ed9a:21f5 with SMTP id af79cd13be357-911cca9d84dmr693200985a.4.1778853974246;
        Fri, 15 May 2026 07:06:14 -0700 (PDT)
Received: from srv712302.. ([2a02:4780:10:3ee7::1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bae24879sm592350785a.18.2026.05.15.07.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 07:06:13 -0700 (PDT)
From: Howard Chu <howardchu95@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Howard Chu <howardchu95@gmail.com>
Subject: [PATCH] Makefile: Add EXTRAVERSION field
Date: Fri, 15 May 2026 14:06:10 +0000
Message-Id: <20260515140610.164282-1-howardchu95@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Howard Chu <howardchu95@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index b7b80e84e1eb..1cc7b86a3d75 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 7
 PATCHLEVEL = 1
 SUBLEVEL = 0
-EXTRAVERSION = -rc3
+EXTRAVERSION = -rc3-why-you-trippin
 NAME = Baby Opossum Posse
 
 # *DOCUMENTATION*
-- 
2.39.5

