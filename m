Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB2A1E835D
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 19 Aug 2025 22:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755643880; cv=none; b=bCqidFhamwUSTes/HSrF1eRVRUCtkdUDERpPUf823HF2tXpBbEYhlEsAPu0P3Cscii4FjieyvxZc1rxqkQQoSWo0NyHJJ0UexifOgYA36PujGxvnp+Mzgt0rQIDTbQ+HTuSl2IwfgcJjmKDZFN2WAJT7vrX5vzdVuTmvsJmMglk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755643880; c=relaxed/simple;
	bh=oJ22349EL2XHEtGg6jM/vc8AGMGDUVBvJzvBkmp8xTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B8LbM4CLYdAgx6kXYWJ+yqVAn40UZa57WB/p5AxO9T1+KxviiqE8EzlXfpbUYqojVGw6zua3a07tDYtBOVklwB3rzLkdyNi4eyRxYWNpfEZ0by9qAQ6im80yb70iDIXdakOVnwE2UdFUDgNk81Mq8vQ0KiaSuP6HPHmi/DtAM3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gbp3EHNx; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gbp3EHNx"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-323266b6ff5so237601a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 19 Aug 2025 15:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755643877; x=1756248677; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nfoBdX0Tov8AX3bmnwCFuwfCT/w+2/RjttzP8RxelqA=;
        b=Gbp3EHNxC4haXLqkwCzz64aTf8p5lMt6m5zXWmRRENVqgUrHegqS8kHIXWUWlioDiH
         6GW4d9Y7MDo+GT7rasxlkXc4+aIddqLYy9TH2DkZQUeMgaZxdTpwrMedU1yCYROztwiR
         gU1bA6UQLQ5juoEDPKsJOkAdBXRm7GFo+awZ/QrpDDIv8gjyN/2T/aHNZA4QkmuWi4C1
         ZWTs5nwSu6dhyb+Ikvd/HPRo/AcuZejMTI8Z3OKY5u28KKCuQl44vMiWhiFJQ61bmB8L
         8hHSBz785T9ichgjJOpcLz4oxSdgAU7lvRTDiA2oskiExvLGgOHmazTKdeoEiEdVi0/O
         zfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755643877; x=1756248677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nfoBdX0Tov8AX3bmnwCFuwfCT/w+2/RjttzP8RxelqA=;
        b=YCypnjeHd/nZ8/VSfC01vkDbT3tnc1iEOEFi1u223OH18djK1/Cp/B4Lq9UQwp7fwQ
         Zp+Gm+C+KA7rxZyVag241Wrs+XIw7DXcOU7OWuISe2qfB8/Pl/3zL8t0M+RJTKNzsUhV
         XFYbk9R/xMrUX63XHKQQKyGufF6t9iTL3q//WsJb3Sflb9eiMt14xckZ+xofiuc9T2Vf
         Fjfg40qBpuaEUy8YpRd7GbaeNTmpjMEuniXFbDSyjibdCr3rkWmCmg3lS9sdd0bA3Xki
         wofcnVKZoXkMOGAN3+TQf1dpDC9s+WxafZOyeQvxVap92kbnw+HiAZTpUnijWJr6wZj8
         GypQ==
X-Forwarded-Encrypted: i=1; AJvYcCXav+zD5zGBYim24kpiJaVQ5W4rhm+SFdTnkzU4DTjpLJxKFRxXny+NYkzH3tehXwZUALO+OGO6XAMJCLpvjeSpVdOtQA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxxmEyLqUcnbJrOxBnXWQTsff8IWDPWk8Jo+/VuCktoOKzP8kTu
	XrXbw3b4RXl6bO0KXHydmy7gkRoYR5iZz0ZhQZdjQN/D41idGDMGxjuE
X-Gm-Gg: ASbGncsYcgL7ng+2g5Sez9WVLGdryPejDh92UGw+6Zk2pwCpiIYd8wZnSqKVIER3mxR
	nS9xCSBcAPDPDDzwYdj38RQ1d4w7KAESg6LFVGHSBNya7CnLuWLW30rj7PzJRPltCFDNCOJjlQ5
	9Hk3DD/7sS822b06wzevkzGTlM4Iphtxe//LvsQ56PlQHAkNu2W+EjA+TZxsg8/9KHqqgtBtdEL
	1cHg/TTXb8c/Haik8Vjyh96631mwFKDGLJdrcfpFIWEHK0AiknBO2jfMj6H3iZU1Orpu9qyVb6c
	N9Tne+ky+TLwyWtwF9v2yqw550d1NLE8GxGNrFtJKcJW+MuSH8R2Y7+2whiol2bXV7YLJndW9b0
	b9DpGWUL1uBk51F+Qp84c39E4ruY0Lk2jenVc1MDE49Bqik4klU8k13+l+jDFwg==
X-Google-Smtp-Source: AGHT+IE80zrRdknPxonsTThO68UT2PygfiTcozDdJMAjg7zruSz2CuFtBrDLLBAerfeggg9rrKKCGg==
X-Received: by 2002:a17:90b:2d0e:b0:2fa:42f3:e3e4 with SMTP id 98e67ed59e1d1-324d33f9646mr4872042a91.3.1755643876589;
        Tue, 19 Aug 2025 15:51:16 -0700 (PDT)
Received: from primalkenja-desktop.. (c-98-207-35-177.hsd1.ca.comcast.net. [98.207.35.177])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b476408e4casm651400a12.31.2025.08.19.15.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 15:51:16 -0700 (PDT)
From: Vivek Alurkar <primalkenja@gmail.com>
To: corbet@lwn.net
Cc: Vivek Alurkar <primalkenja@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] Fix typo in RAID arrays documentation
Date: Tue, 19 Aug 2025 15:50:29 -0700
Message-ID: <20250819225034.8739-2-primalkenja@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changed "write-throuth" to "write-through".

Signed-off-by: Vivek Alurkar <primalkenja@gmail.com>
---
 Documentation/admin-guide/md.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/md.rst b/Documentation/admin-guide/md.rst
index 4ff2cc291d18..8b9866cacb87 100644
--- a/Documentation/admin-guide/md.rst
+++ b/Documentation/admin-guide/md.rst
@@ -758,7 +758,7 @@ These currently include:
 
   journal_mode (currently raid5 only)
       The cache mode for raid5. raid5 could include an extra disk for
-      caching. The mode can be "write-throuth" and "write-back". The
+      caching. The mode can be "write-through" and "write-back". The
       default is "write-through".
 
   ppl_write_hint
-- 
2.48.1

