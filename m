Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E55343D85
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Apr 2026 05:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776490461; cv=none; b=lgcM4hdOEtta7Kli1ekWYAYhqjtXZCziZrIUy/GdkViaeM/bP6OIzBPlZqfweL3ng5KbD/UQKatl+iFfr25LeTcEr9zQD4FChcFfzjSHeZr2rRzuWU9jNhzZhx2tfH0BA8eU8yoFjCxTko+j3nOL/YrXSYB7w6VGMd0C5V41tvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776490461; c=relaxed/simple;
	bh=dxbxBb6TnRkHxYFAqTGmkEtNLztSZkN8uclWlfV6SBc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lZoqPvgt0pwsncnTNLQoNCl0ExNyIYltSLDKJgK965QxyqeETTqgYNAitMFHTrqI1PPTTbzaYQ/kGE0AaDi9LUCD5g2jHX8RdctuKMw5+tr3fvA1A/EQSsSIerCIEMEGXnbyhhkaBntxBnhU9aIZKMp4GP7T1K6YGNYm/FLSp8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/Yt/28S; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/Yt/28S"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b4583f0a1aso7969625ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 17 Apr 2026 22:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776490460; x=1777095260; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/XN2z1dmL8Rxs7mT+ZQ0R3Y5Jc0sLY9a/dtkkBH9kE=;
        b=U/Yt/28SGWB4OnOct+BC3dOnGqznGCSHZuSQ+QJqi5gA/unKtQZsdz8fTJjq2yDtuN
         wzaX4SfKJ9/oT4xRRQ7F1sktNl/nlcSA3Op1+ZS/Elw2cIpYWznwsRYTK3UYO+zOWaZf
         4UL3NcblGRmhCS96KeBaZ0jz7TR6XtAmfF0wdWfG1T5z7CfaXxzGCp6RvEX8AgbNe/NY
         zuApQue+hOOyKLjQZHbAetDZJj4W+uG+98IKMMO+LJN0/Up25NEOtaPSQBbGHSA6mr1K
         6Ne1PIGbSogy9fOQji0FVSiIY0h3gI0pAKh1LIlr1cNmTMq867uhsodHTfgkIuNzYWkf
         TglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776490460; x=1777095260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/XN2z1dmL8Rxs7mT+ZQ0R3Y5Jc0sLY9a/dtkkBH9kE=;
        b=RrCOra8VRK8ZCxv+BzDGrY0LcjxuUeJn0bWR5YmRSsL4TnKUmqkEDe5sN+CoAJJ3hU
         Jo6yLhSpP96ZDAzAnpIkTANGalh/LPCBTq92M2sV7ph64Bm+POjIFwdrVzvpd0V15xFO
         CgLCOtrPFUPV++F/pkkzz+T0qLu1mMLGhVWUk09fapfauq1IoWBgdkWqE81ZKnOCpcCD
         qUpGnWPc9rcl3MLnFOxybqVWaV4Ubuve7/rbsLgomrZQLWTFTJKFJRe4PJ7yUK7Xm8Si
         oH+WSrbyTY2DNef9VcxgHkdasGaN2MmuC3SFINfI3c7OtOxNGyHKMDs2cHXSUG6LL5AR
         9eMw==
X-Forwarded-Encrypted: i=1; AFNElJ9mFvtPOeWcHZ68uJ0jCXj3HmoDecUc2DubVML5bE7Tq+CdxDkEBpcKuQbxJFTQxBhyjENbAUow8/M6HxAANpMWW+nrKg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfzGOIJQCOm1R3M9e5zmbAFFdeJNYs1pabof9xu5UtcaVOFRQZ
	l2e5wtQKuU4MLrbsmwuoVWnt+o+1REbMwoVsZEV4o7plyAT7fkG34C6f
X-Gm-Gg: AeBDietWgdvJPE0mDdVTjhUg0KzKkIulLPJ5YfANc5TpwRry2yaf5Nhe+J12G7ISjVb
	3Oro4gPYllUNzff9yYFyaIITsprivmur9By3aXgk0BLIb++TDp+kUaYc+YjGY2VRiHW4hZtxJ2F
	YcwAjinxL+/zaTwZXggUPNVQ/C8rK52JGzMpouw6yB52kntFqm4hxnW9FhDT3xwMMx+eUrr8Vt2
	rJRByK1dEWOKcALGPmnuogHDsbTImZwsshrSrSxkAWFx3Wb2Bvt/2Mnat0rVF25titnNadkYJ/1
	Gkc6ombMISDYCw4e/lV/T/rnHxgLxCgfEYAa3i4rdlfmL1eJuwZVWK6ORISwp2vLI3baT3q3nuT
	SEI+vfylR/nhhm+/OuZmIaPe5VHLYhqivp9hvj2Va//iwGJp0zu8iifgEOs5EKHMEK9rBkYfrly
	HqxLfebzi5PncW+KHvGK21fXotj6RkNYaLwL8ZNn2d7RtHwJ5ZFcDdjbeHVw==
X-Received: by 2002:a17:903:1b03:b0:2ae:ac0c:5a2a with SMTP id d9443c01a7336-2b5f9e7a9a0mr59106245ad.6.1776490459624;
        Fri, 17 Apr 2026 22:34:19 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff3bfsm46251885ad.7.2026.04.17.22.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 22:34:19 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: luiz.dentz@gmail.com,
	marcel@holtmann.org
Cc: linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH 0/2] Bluetooth: ISO: Fix KCSAN data-races on iso_pi(sk)
Date: Sat, 18 Apr 2026 14:33:59 +0900
Message-ID: <20260418053401.128483-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Found while auditing iso_pi(sk) field accesses after a KCSAN report.
Patch 1/2 is the reported race on iso_pi(sk)->dst in iso_sock_connect();
patch 2/2 covers related races on other iso_pi(sk) fields accessed in
iso_connect_{bis,cis}() and iso_connect_ind() that were found by
inspection during the same audit.

SeungJu Cheon (2):
  Bluetooth: ISO: Fix data-race on dst in iso_sock_connect()
  Bluetooth: ISO: Fix data-race on iso_pi(sk) in socket and HCI event
    paths

 net/bluetooth/iso.c | 59 ++++++++++++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 25 deletions(-)

-- 
2.52.0

