Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCE524501B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 08:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759221338; cv=none; b=ZFRgOfTlo+Dv6O3XkY/9PkdKXvapl27X8A3lya/0OLPNNuzbRTcAZzlBp9RLY8QVYWvzfCrY52fcSLdJj/R5CK5dp/Nz65E6e62wHDt92qVJzkzS20yIRthjM8N27k3GZ3Jz/jc9aMcHxlQOKLxt9xhecsdTV574GdT3xiJOBWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759221338; c=relaxed/simple;
	bh=ADEdvYCZrQhbb8wIcB8O8HKwCMDJp6UBw/AeIwUpfK8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KpvSWNIhm7GEePbnG5Zv6gYICewDFCRR6QAaBH2HU8SLWlUcO6eOaHXxJ/2PwXrvtqhYWJDZqRV6KCEp5GJLNhmsldcyAqrSPebX+Fo5UAtgDXNfNCV2vCMZVvYh9pVD/FNL1rkK4agzug5ckX8r9Y1zD4Lsg+hZdAEzPukcH5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5yKCQHe; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5yKCQHe"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F195140C6C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 08:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gyG-dehpHPNo for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Sep 2025 08:35:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1F2584023F
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F2584023F
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i5yKCQHe
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1F2584023F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 08:35:35 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3fbd3d76875so200936f8f.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 01:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759221334; x=1759826134; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GUJqvmeemqRm1gvXL7Ny2YCLo6gR6Nwv5491LCLZ8/Q=;
        b=i5yKCQHeVAf+g41k0//ojlWDSBFQoOl6d2MdJXDgaq6OtsNFg52Pkgb6JU9NUbQMf/
         OuJrFCgm3y9iqV1m8qfPM0I2ymM5u6YfLsjpTcMLYUGr8Vm1/AMKwLiMu5Tx2cyk6Dky
         DwMO6sFfv16RsnmddDEBVPBI8y+SIf7cc/L03JyW3Nx0Y3TJbk+7Opu/XIfySGDsFh44
         P8f5gNYyPTHYbJ28lbwcMdMdgNxMCNbhBxSfBg0skxK/KWrCkWVt/EbAj2lRNb7UY89Z
         xcEwbcTtNz9Vm9P6YiChthGI30giJB2/Ly60T6SMdOK+GfpH2foK75YEEBL50gWhCr2i
         gyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759221334; x=1759826134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUJqvmeemqRm1gvXL7Ny2YCLo6gR6Nwv5491LCLZ8/Q=;
        b=UoDFB2wfEUWuU55gm80C4pEDJ1KgJwdbsMokv6EzwoVoJY53Q1W/Ft8BsWcLllGdK9
         Y9LuOl2DF8hGVsYo4IxCmPv/r3M5hus50p0rSHwcVJFiCJ1fxWap649dNBLU1zq+P3Ef
         7DL72PzQrFBvkEHytdus2d5vbbTgZKj9eN3Co0WzBlOmTIDXpZ93eUubsEfWs1VvqfeP
         KczOaRiSWaE7hG/JIf49A578iPpY5dGJtJ8Wj7noZe9fzydvoq+B/dVcpTvcU73zIY8Z
         +u38zZzfdw0kTPzGdVHI6fDPgG03/yERj2SBGHAdFah6Cl+RG/dvmnBTnHEaV0HoUsa+
         03ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsZWzlbGUUg5XhcBEaLG0nDAZ7ZnSpYa6bZEeYyZugmYR/WAyu9r5Be9lfYLcUYzpfuQYkloasIa7rLuaNqzTqpOhRlQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyOlQi5bGhkr8Rvt3V48TF3kO8Zjb1YpF0MUoaTUvQ2OTX+V0FY
	L/v23LYmdO2DdE4h9Mk4wRbVu/mJKTc+hGqjoT6wjoHZNnhONCWgixaE
X-Gm-Gg: ASbGnctUKV+1XhW5y3Zp7ePNovOVCdTiEUy/xdZ2R1BUhLpNRY6G7mXAD4XZyzt4mEs
	6bvsqk8jNVLG7cmh69QJORAnqj8lciYiZv6+/VsuXKznIWKhTpg0/Ma/7dBR+PeCzoYQN4Uh9oH
	lhDBDB2uMC9IGNtOp1S/9NsCJDoVHxKFUoygShjLuGKsqQlYcUh3WjuQrju9IEuEDJpTnLdRPD3
	FKi7p0YiqihHhqZ1au4N4Joh43k8N552ywnDZTLKLmjj6U4bha3ls9RnmkopjGOWL0eFUh5hgKi
	Eg4MWTqPhnB2Z3jRqfFjusvSTEvBtxpEtTWGIqb70y4r4XOEl8Mh7CnE38C6HJoyZjwp+BDWx+Y
	XVg4Cv7AieUv8YHEwgoOAR/5cCmptxFCNR+tQhWidE28BfJKTzSV7IprMvl7RbS3o
X-Google-Smtp-Source: AGHT+IEnc4h4ssP9sS7icqNK2zeN2NBLAu8VYYr2nlceMXRBqj2zPJC/ON5vQZnbcoK/iRDFPcwyVQ==
X-Received: by 2002:a05:6000:26cc:b0:410:f600:c36e with SMTP id ffacd0b85a97d-410f600c731mr8845629f8f.4.1759221333463;
        Tue, 30 Sep 2025 01:35:33 -0700 (PDT)
Received: from bhk.router ([102.171.36.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb72fb1a3sm22132771f8f.10.2025.09.30.01.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 01:35:33 -0700 (PDT)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH] init: Use kcalloc() instead of kzalloc()
Date: Tue, 30 Sep 2025 09:35:37 +0100
Message-ID: <20250930083542.18915-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace kzalloc() with kcalloc() in init/initramfs_test.c since the
calculation inside kzalloc is dynamic and could overflow.

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
 init/initramfs_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/initramfs_test.c b/init/initramfs_test.c
index 517e5e04e5cc..fed1911b73cb 100644
--- a/init/initramfs_test.c
+++ b/init/initramfs_test.c
@@ -97,7 +97,7 @@ static void __init initramfs_test_extract(struct kunit *test)
 	} };
 
 	/* +3 to cater for any 4-byte end-alignment */
-	cpio_srcbuf = kzalloc(ARRAY_SIZE(c) * (CPIO_HDRLEN + PATH_MAX + 3),
+	cpio_srcbuf = kcalloc(ARRAY_SIZE(c), (CPIO_HDRLEN + PATH_MAX + 3),
 			      GFP_KERNEL);
 	len = fill_cpio(c, ARRAY_SIZE(c), cpio_srcbuf);
 
-- 
2.51.0

