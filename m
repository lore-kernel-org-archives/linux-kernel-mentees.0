Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6EF448BB5
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Sep 2026 20:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790023346; cv=none; b=ROpKA752/GZ90ltzBYh4pphKLDcUcS9AoOq3ZyCu6t8sGfaSbPD/Q3ZXiQikPe+xOLhlX3vSpB3LAIw2UPix6bEJaWKzGHxjlMP5bg85ulgP7W2V3re2oSXOlFYgpL/K2Fe8jdvjF0f6WDwq4PwbwlfkEMGJdJb9o6cqa+2HSF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790023346; c=relaxed/simple;
	bh=Cbhq5AY4F38rOC/Kyo867bYsHX9pFIIo/xsqTNuiRaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pzr6cupH7SPB24gi6ElfWVGxrr0sVJw+Hj5ZIatuYJXXi6hODPv9gckyfgsU8/XrTg9bKoN3TXOK0S0Hy9k7hRzsGXuFqIeJXh3Qr3pXitGEcr3TZJJY3pDhlvM73mUbNqKP3A1zLnAEtabBVwusFRR3sNbBDh6VW7vWHUq9nH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nY0kDJHH; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nY0kDJHH"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd5cef0so2328118a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Sep 2026 13:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790023344; x=1790628144; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=19ujXM0/uR0vXBiub8+6aoHd0jV8R/3wu1J8/sZV+qw=;
        b=nY0kDJHHmvJYWotJ5P2i7lbRMVlyQiM+ZJDhEQH03pOeOkXT+NIsdbc991vqbHiu9G
         qy2G8E8dZ5UkgukRBh7aNXuUVXR8iU/wIZb/kCAt0ChKSRKPcobmHLD1XN4OVxVoptkN
         0OrQIwsWQXtwAL4o69uR4WzUdZIG8z2X2lcJ0jYn2kvLmPlevjy56eTYXesakCOR1sL2
         a1+t+MDqySDDTVIkAicdOqqCyDwfg3LHfpY34T3Oc9Zb1SpajXG+8eEemPi8bY3wa5hm
         QyHJvRg1w3setcD8zwpVinpJqM64ObyHkOFJlsh6Pa8Ul24A1DXoQDfxzQpW1euXbxp/
         2PJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790023344; x=1790628144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=19ujXM0/uR0vXBiub8+6aoHd0jV8R/3wu1J8/sZV+qw=;
        b=ypq3dqBKYtkmpxr4xz25OHBuoYzCl8Xtnx0yeD071aQEPXgw2/CYDo+DDAiJEAtV6c
         Xl4CDjorO0mP4kmpdK0k16keQwu3821gKfrhdRthgYG0hTidcDkIUtUPd3K3fSOMDKGM
         TzZFCCtc2dFE25xqVnQoml5hKEjc6mm8Obo9NCfVk958M9HbRaf7PoBO3trBo1tTHBod
         /UkInkywLhSf+H6+9qwUjn8iWPxGFkLAyQxLy9vncuWha9K9QIfgGa3X7+9ogXzhpMUJ
         gmiaNIlumuy4xkV6NUDU0vRBzLkL5FtEXSSfnG1GAM27YczLON960yQZvYUAb5j13ZJ/
         oiUA==
X-Forwarded-Encrypted: i=1; AKwUvBztYAmsd2fwmFe/TQYd0DRWC8hp0DWOFO89srBrMwGkwndNvPVWIH7veXwiedeoOt11yaEol0klGBb7mUdRgErTyQcnkw==@lists.linux.dev
X-Gm-Message-State: AFuF++nEq/x6O6BGn9AT/TrrW2yrCcDV3T3rn2grriFFP5j1R4/Zq+/2
	2yDWWZPcIOcKYF5ePRW9LiMJjGe+Zug5zJwbPFaVMgcJVDNmbheSqcGo
X-Gm-Gg: AYBFou2wzLyb2P4ZRonLuZrOPz7rCI5qcss68b1kWhkMbgfYRlXF37JG/tlTMBq8qA4
	3iWkzwvbuagkVZsxxPF9HyqUOXhbY/6lXoqQOM0vD2HiC4zzw2/RJRsL6324sHGcODyK4VthaWY
	YLf4C3IU+LfQL95dVX4Rg3OZW9qqeAP4gKJviwCycNBizDk9Lm921BzHDde69PCRSLlWpVQuGhQ
	+MI8ul1HfOaJ0BywY7tCY82zMtnZYc1gqCejPKnZz2bzV0/yar6PnnKTlrjZS5FLYzSJ+TZ2BqO
	UdIIJC66iQ24vMLIUcdAP3s2xYxwVWAhoLKkFLPhsrL8uwN9E5ze4ZgpDMrrxJ97pRiYwK4zq1T
	iD8m3NBLAd5M8s1yq4zyojNf6ZMYFzGVgEBLGvpCcu/55lT5I9J2mKCj5wbNOsBrpIEI2QTl5fT
	hqQM68YiZLIhSbjOZKFjZa/MDcHazYqSVcDyGGmlJVgcY1Gz14cv4vZ8spUrlXEDKORTxLBqqui
	KbvVr2pDe5PE/g4oyup
X-Received: by 2002:a17:90b:4c02:b0:39e:2036:8243 with SMTP id 98e67ed59e1d1-39e54eb71f7mr17140919a91.25.1790023343451;
        Mon, 21 Sep 2026 13:42:23 -0700 (PDT)
Received: from cfarm424.jing.rocks (cfarm424.jing.rocks. [2600:3c18:e002:2e11::c424])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a067021ca6sm967996a91.2.2026.09.21.13.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 13:42:22 -0700 (PDT)
From: Ridham Khurana <khurana.ridham222@gmail.com>
To: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Cc: soc@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	Ridham Khurana <khurana.ridham222@gmail.com>
Subject: [PATCH RESEND] platform: cznic: turris-omnia-mcu: Add missing MODULE_DEVICE_TABLE()
Date: Mon, 21 Sep 2026 20:41:47 +0000
Message-ID: <20260921204204.797294-1-khurana.ridham222@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver wires of_omnia_mcu_match into the i2c_driver's
.of_match_table but never exports it with MODULE_DEVICE_TABLE(), so no
module alias is generated and the module is not autoloaded when the MCU
is probed from the device tree.

Found by code inspection. Not tested on the hardware itself; with the
module built, the alias lookup

  $ modprobe -R 'of:Nsystem-controllerT(null)Ccznic,turris-omnia-mcu'

reports no match before this change and resolves to turris_omnia_mcu
after it.

Fixes: 992f1a3d4e88 ("platform: cznic: Add preliminary support for Turris Omnia MCU")
Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
---
Resend of the original posting, unchanged, widening Cc to the SoC tree
(drivers/platform/cznic goes upstream through it). No response to the
original posting or to the ping on Sep 9.

Build-tested on linux-next (next-20260921).

Link: https://lore.kernel.org/all/20260827113241.993923-1-khurana.ridham222@gmail.com/

 drivers/platform/cznic/turris-omnia-mcu-base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
index e8fc0d7b3343..f0416302a1f3 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-base.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -403,6 +403,7 @@ static const struct of_device_id of_omnia_mcu_match[] = {
 	{ .compatible = "cznic,turris-omnia-mcu" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, of_omnia_mcu_match);
 
 static struct i2c_driver omnia_mcu_driver = {
 	.probe		= omnia_mcu_probe,
-- 
2.47.3

