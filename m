Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282E7385D90
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 29 May 2026 17:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780076049; cv=none; b=M3MdqJiua569IR0br+qWIlIrXt7vkLE/T+EO2GPnfSPYZ/kUx6mOZq5S58bEcaOhGRrxSNEpXTQoGJxXehVJ5QlbnZ0qK5Jx10xmgFuTWkTrEeIjTpS3QGcOlI595AwS5AZVD03Vl8WbrnylIKB/cfB7g86OxqKq4L44bVosuUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780076049; c=relaxed/simple;
	bh=rjLfN0SAm0XetwEmFqwIqt7LwciP/mnuvaEnvxaoZJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IezTGrFOQR2wBORg1GVw/SQYDJ6H3ahuUfnx47NlEvKSGXfMOhXJdUvUlthUj18JLvmkis1R0bSBuwn2MPVQzrN1hixLLYfSozVNMMB6K5Jh1ViG81gMK9pxEylniYPUyUsA+btw+BJ4cuwHa+7kaKnoKH10reh6LH/7yX2a78M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2Glz1jp; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2Glz1jp"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c736261ee8dso6419341a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 29 May 2026 10:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780076047; x=1780680847; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xjaihLgvutZ1fFlKyQCNXr6DGsbYvGyqlu1s3B1StM0=;
        b=d2Glz1jpy8HWYbyNIcpy9X61GffxVlwjDAH9RBh4nc/V5I0XgGWNYKFwEEfjLXxca8
         1/komKy33BWX/MVk7iHrYFd7Kf0AKrOtJ7+lHS7OKgimJMzbNbdIxPEyXQf1jOvG2qQz
         CBQl0Hx8fxv/tYPEK8SFUg3ZXnpO2ct8jg+R4N6O743cyGJ2rAM6yDqc5dMku2f50j4G
         J5QRcg9XFxe/D7YINlpxmURm/LiHKPaMQ/shtVRUCU1G5E/zOcM33KsbTOzSfqCJ5Wmk
         ZEhshgw51XG482Af2OpieTC686Eab0tbQO6q/TZcONFCrCo+SVkovTvd+4OdhNxfr/0q
         zsaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780076047; x=1780680847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjaihLgvutZ1fFlKyQCNXr6DGsbYvGyqlu1s3B1StM0=;
        b=qFML63RCiBWrNsacIlXyFnBTS9ntMD594IoqHYfjFeblGbEBWEXP4Ww/PJ8gm4OZ4F
         AadaRieBWTahCzDWMxYYqlxADktWks24HyUob7/KJkWliVb6FZMSUEN925gPMvi7ibkk
         /zMCLhDYMD+O50JcPbjasvdWO/dMA8kyIOoutKNu9eB7bJiCbxKQ7O+WYq6vfOcPx1c7
         vq1QFjcJd7HnBluHwiIMYHhhLFgnIaIoscy5pwbkdm+Hk7hxL0U5ItOvFTe2cUeTuh+v
         ERDScXoboogF0PuepoJPg34DDv/EzIUilK7D0FXY94j1nOM2zcFC/VC61Ulmht9jRGVC
         YWIQ==
X-Forwarded-Encrypted: i=1; AFNElJ9wOH1Yl7GrKCqqR+PlaJqimOjaftUlMx77TeQxLI1W+CaRQgmFbAupzKnWhLKVim6DcRLJpEh3qh58gCRnYrXzf3pgEw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzvj8WfP2nO5m0gD0yymiiZvackHizalQfa5BwStBcrT/sBPLwC
	lk3Tn2ouBjYdURmcdg7FcEzfTpLcW1i9UfF3bWHbvULSUweSadpCTqOX
X-Gm-Gg: Acq92OF0bzUEtypSDeDVmPt90qVs3gZHL5B/sCFpwRR7f6vNDt5/wIb3soVGUR1BLCh
	HHJx4K3GyOBFCQpYWDb1DxOslodPATcUaxK2hHosv5MUh992XvpoYtnkaK8JHK3WUrXaKBabmLf
	W5X50M+/SDm14mZ/SmTDqbe4BAgse2L0W7ViUbhg56SRqIych8X8WVZjU/sSnp1JVl5X988h+i0
	n0ix+1/cu5DcfDinHCgU1sgIfBGBD2kR31cbNJ/PLnLep//0t8uoPWx0L0m6ERVzZwGWmRpo0NI
	J4FTJtyMrvbimZK6sAlC+cm+x0rTTH+LC5344PCq1fIjhhnvsk8roVP8sUuPIyrh0e//vA4CX5O
	evVSxV/vvVipRiPSwXAoKuaUFqNWJ5o6pXQiwdJzX/7auto6/ZaeoS3fSHI3NHyUKGYs0j0miPN
	RgNywWyDVg5LjCcWdY5dFIGBzyS9O7AaPJisgFtDU05IQtqQzNO0Ditz8bTg==
X-Received: by 2002:a05:6300:189:b0:3a2:c683:fa84 with SMTP id adf61e73a8af0-3b427f6d141mr220913637.27.1780076047144;
        Fri, 29 May 2026 10:34:07 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85772ba4adsm2361027a12.23.2026.05.29.10.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 10:34:06 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v1 0/2] Bluetooth: Fix data-race on dst/src in connect paths
Date: Sat, 30 May 2026 02:33:45 +0900
Message-ID: <20260529173347.43967-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two KCSAN-reported data races on socket address fields passed to
hci_get_route() without proper synchronization.

Patch 1/2 fixes ISO: iso_connect_bis(), iso_connect_cis(),
iso_listen_bis(), and iso_conn_big_sync() read iso_pi(sk)->dst/src
without lock_sock before calling hci_get_route().

Patch 2/2 fixes SCO: sco_connect() reads sco_pi(sk)->dst after
lock_sock has been released by the caller.

Both races were confirmed with KCSAN using VHCI-based reproducers.

SeungJu Cheon (2):
  Bluetooth: ISO: Fix data-race on iso_pi fields in hci_get_route calls
  Bluetooth: SCO: Fix data-race on dst in sco_connect

 net/bluetooth/iso.c | 51 ++++++++++++++++++++++++++++++++++-----------
 net/bluetooth/sco.c | 11 +++++++---
 2 files changed, 47 insertions(+), 15 deletions(-)

-- 
2.52.0

