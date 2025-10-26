Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DDF1E32D7
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 26 Oct 2025 17:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761501308; cv=none; b=pXU/LJsrtkHNjM6WWKidtQtFwI3+FEcgTWDpWLBq9fu0HNO1IufniwiO4cxaeam7MBg71yHtMacWE2yOyRw9Fp3e3h0FigPD+RVbW8bIPOivrjO1vpYQQmrgn+nTFBhHRGAacKI6BoaCRmt4nNvHu+3GyIBLuWgFnHDS5MTUomM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761501308; c=relaxed/simple;
	bh=wcVNI3+a/OZkRVcbPqxgDwyPv6jxzEQnw/ZSPShSkvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aqrUvXFwFGdMQ7dc/2hl0yIPAGXZMzRJpcc4jM5sJNM9qTFqIQLRi66dKaBQPDYNXiG5Bl41ILIzkfYsJB/ByVAQ56GynhpshByimJxXJw1bLLx/gWSmI320TKWMsyR8IkYcqyMpD9YZsh5U/4uQ9OnJPzhg20rAXdLhl/Qev/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmFAFWFd; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmFAFWFd"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-339d7c403b6so3830654a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 26 Oct 2025 10:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761501305; x=1762106105; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XW+6TLqRRcphYWjvidG8sptD1TC75wuXLwHskXrfas8=;
        b=SmFAFWFdIMuspu6QSr0m8wDPsQSEQ7vzs/e9GhmT5iA2an5D1R8oSwmGiPKmHgdvEl
         BbKHAFGupkC2sx4wzACotwTr8BlIDWExdxVWNVcc3VzxFmzmHbbpCtgHc2GePDfZEOo6
         LD9K9HnuESNY3EU3o9Ui0CmVrtsJnlMon6CvV4kp2R4tSSwEhr5p3aCf7GDhCDC53z+O
         PhiSuKB+mWcL+1VPJUgfXqhEYPhNXc+0oEVewBFd9H5TmXSF8WBM9i1Azga6eXoESF6t
         he/gpf2PFu/qscGasZRy+uFwSykYwU9O93w96n4iAcu8Iv/0sx0jhh4vIZ+5SatkS9Dm
         t3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761501305; x=1762106105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XW+6TLqRRcphYWjvidG8sptD1TC75wuXLwHskXrfas8=;
        b=WhYRZtX18ceDvTMoQ5YwkZOPRXpRAUQx2Xik+r8qyZzhD9QM5xTVoxaxELMdMBiX+t
         t0Xd+3Mk6/JyqCuDeJSwO746JaUFEOUbsmg/s+TocVh64uE5An7qrhkKaF88exrWlbuH
         rxOBGp9w+xn+JHi98YlZotqoNsXOws2EIGmEZsCHZtKw4ADO4M1pkrFUp91Hd5aPD2JF
         r1XpDEC1VznCfhdPMw2MnvPAdiKUzyhZuSUP8P248cjfga4G6EolfK8m33oNZxM441s4
         QJpGKVD6JSCUdB5M/XwbGCVISg19TFrmbFPdQjO8aOcdl87upndjT6hWIeJPPHCJScvV
         duxw==
X-Forwarded-Encrypted: i=1; AJvYcCXRqR2fv3VRJS++Gup9byORBq6guz81zTbbUFtaasbcQnHTyxDmxw+9K4ysD56WL9XRnA3g3qYcW4Vr9EYguvRg+v/etQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5UURBRiPPfP2Maq1kLCl4ASi5HI7FyjldX1mYMDm4fM3FrXgK
	7QaL5QGZPWxhbLgD5kJ4QEwzDym1tbWMR2XsKJQcFiExGzq4gYbaseXJ
X-Gm-Gg: ASbGncumuzYqGlg99vMGfti3N/Qk/Wpgfx/zx2Xkk9VX0MMUfHRzP5Ng9ChfuRjnblg
	qdrSP755s2TWPwSdQx5GoTI8b6qxppUfqguyO6CtbyjtIvjyrKDv+LXtAqzX6TDHOappQnayTSY
	D+sc/o3mbY9GO3DbBFrmHGDJukZZTqnZ1Vs6x9tCRkOCyoG/zB05EKSpKDHeOEKhyj3GAJ6nCdD
	qu7grMi/ClLUVwXeCwqcKmZbXFBzllWb2FEOUvUo7ALVh/XWBljGymdZacyuwKgpIm1v24CDPm2
	ZU1zz5NhFZ/m4Hlw9PmekvJLnuswKv01VchR26YlEqFhmw4lfPtzM+qU3PgMnZ86rZCzheDInnD
	0iSRZtg4AMMZToscWWCZ94W0JdiQuq3gvp6frtkePaArW+cbxrNQw1QMMLjVJ3bhlgkAmrZI9Gu
	DqLSJ4Z6gl+qPyLSsWxqcGXeuG//mXKnoyfRqyWyXeA1Or2vo68IW/AhWyZVQa1EDGNroxnTAsL
	AUw0Q==
X-Google-Smtp-Source: AGHT+IFr6d0VRylVsQquJ/FhyU5BSy8+T51ENiIhdQPVdDI89GUzWkH6pWfficRysWgAQfUU6r2+eA==
X-Received: by 2002:a17:902:da8f:b0:290:af0e:1183 with SMTP id d9443c01a7336-2948ba3ef7emr100193725ad.51.1761501304768;
        Sun, 26 Oct 2025 10:55:04 -0700 (PDT)
Received: from debian.domain.name ([223.181.110.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e4349fsm54813845ad.107.2025.10.26.10.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 10:55:04 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	sdf@fomichev.me,
	kuniyu@google.com,
	ahmed.zaki@intel.com,
	aleksander.lobakin@intel.com,
	jacob.e.keller@intel.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [RFC PATCH net-next v2 0/2] net: Split ndo_set_rx_mode into snapshot and deferred write
Date: Sun, 26 Oct 2025 23:24:43 +0530
Message-ID: <20251026175445.1519537-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an implementation of the idea provided by Jakub here

https://lore.kernel.org/netdev/20250923163727.5e97abdb@kernel.org/

ndo_set_rx_mode is problematic because it cannot sleep.

To address this, this series proposes dividing existing set_rx_mode 
implementations into set_rx_mode and write_rx_config

The new set_rx_mode will be responsible for updating the rx_config
snapshot which will be used by ndo_write_rx_config to update the hardware

In brief, The callback implementations should look something like:

set_rx_mode():
    prepare_rx_config();
    update_snapshot();

write_rx_config():
    read_snapshot();
    do_io();

write_rx_config() is called from a work item making it sleepable 
during the do_io() section.

This model should work correctly if the following conditions hold:

1. write_rx_config should use the rx_config set by the most recent 
    call to set_rx_mode before its execution.

2. If a set_rx_mode call happens during execution of write_rx_config, 
    write_rx_config should be rescheduled.

3. All calls to modify rx_mode should pass through the set_rx_mode +
    schedule write_rx_config execution flow.

1 and 2 are guaranteed because of the properties of work queues

Drivers need to ensure 3

ndo_write_rx_config has been implemented for 8139cp driver as proof of 
concept

To use this model, a driver needs to implement the 
ndo_write_rx_config callback, have a member rx_config in 
the priv struct and replace all calls to set rx mode with 
schedule_and_set_rx_mode();

I Viswanath (2):
  net: Add ndo_write_rx_config and helper structs and functions:
  net: ethernet: Implement ndo_write_rx_config callback for the 8139cp
    driver

 drivers/net/ethernet/realtek/8139cp.c | 78 ++++++++++++++++-----------
 include/linux/netdevice.h             | 38 ++++++++++++-
 net/core/dev.c                        | 54 +++++++++++++++++--
 3 files changed, 132 insertions(+), 38 deletions(-)
---

v1:
Link: https://lore.kernel.org/netdev/20251020134857.5820-1-viswanathiyyappan@gmail.com/

v2:
- Exported set_and_schedule_rx_config as a symbol for use in modules
- Fixed incorrect cleanup for the case of rx_work alloc failing in alloc_netdev_mqs
- Removed the locked version (cp_set_rx_mode) and renamed __cp_set_rx_mode to cp_set_rx_mode
-- 
2.47.3

