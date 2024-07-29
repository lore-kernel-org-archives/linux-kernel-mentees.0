Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9060318EFD6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 22:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722292619; cv=none; b=hSiR9TJh8+Zf4vrobFBjl6Lq+Zwu4b49ofyQOTFaghtuyDrIrxdfuNVNmoHwInTePVo9WzGaxo4QtdXFJRqtkswi4is6HpPCbQdqYNCzp+E445I5xU4/cL8tsRafw4S7DM6CEdcZ/SuJYg3oXJ7CgurcelCJ0bIeeTrbYNazn+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722292619; c=relaxed/simple;
	bh=SrQ+kHpUP2ACt9WyyeUgaX7R+oZ0qjLs87U991V0AQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K/UICkyvP7TSq6Xl++GpQgzQJOyXhY+SEtJ9Lq+TD+iRQrTNmhHCknKS7dp6wNli/kj/NPjd8bU39RKNyIbHgslJAuvRQiO7/R06wRys6xYA/zX4tUYtzNgy7iypZ/XSQ0V1xzuabVTEoETHAVhXV/IaZ3c8RdY4YEdZTybSIts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKwGG6bW; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKwGG6bW"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 421434030D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 22:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Unm3eZDTU2kj for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jul 2024 22:36:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EE5FC4022B
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE5FC4022B
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bKwGG6bW
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EE5FC4022B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 22:36:56 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-64b417e1511so27340587b3.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 15:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722292615; x=1722897415; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qykVGFoGPcAnIbrizUh5M0ZKMFEc/YBfKf7lW7RpEhI=;
        b=bKwGG6bW7TbLASlcDNUevfieeH5BfJMwywkO9mSdn+JB5/00AIrvWuX/pQ3OGE8I96
         4mLa+30k3Szt6/8BaOFjNN2zMt/8p0hK8E0fH7WpXYYdr/kMMkMbsRO8sPUMMRccdvvq
         cARUX8+p2/LAULKbr9StFQeGvKsi2l8xFPVTIu3Mh1ZktL4vVqAzJFAkH788/Zl88RPu
         z6IAE9oQX81wNKcv43M6fp690LbWkZdkCM+/0VD8NBFm1X7cN0WWgysoOKvLYPg/rHy+
         mPTkMcVwc7x4fTO8IiMF2KkxU4BPvcGPKui6EoVzCDe5TIZL1onGzLMtExSiNzLMdSKw
         7FgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722292615; x=1722897415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qykVGFoGPcAnIbrizUh5M0ZKMFEc/YBfKf7lW7RpEhI=;
        b=QZ/G1epqMygEqWBd4gespg6xGhxWTM/2uOuVXSlTTG0ppr1frMIqKXtJU0KinCmyNe
         +u/Ofr0qwYf3iz0/KF66vXh3MTSZ0BBOTBGCBFm/DMyhzBwfMsW7eDTNTG7BLGoW1nKF
         TE9Xp/s8My67WpR8uW+KhyxPDetQmTDISRR67nK0B+OydMyGYw53kfoaG5uGYU/15UKI
         SBqi1AOaBQ7e/J8nRZorw5dEYoTC9kvKldN+/4lgOf2SJyJRe/p96lAKj5S3y4CqW0TH
         KfaiJXI0JtNMtLd4cOolysOnTz71ucnVAdb+cduX4jgOkebzwuTjnQvbcKcLu3HS17b2
         dfKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqst3i9lwCCSz+AUunUbuArAih8A6qxoNrh0tL0zZqxObG0MOuj6YQnayuWzBJawNvqTEgz4n9GGnQefFTh9KYUBv/ir5S7351pi57Ig5+awB1sv6PRmuLwAaaFYMM
X-Gm-Message-State: AOJu0YznvzGT4FUtVyQF+RYlmMUTIvX5j1ykzsBtLSki7iaXvOPkjNlg
	TaCsGJhWORBB/BHWPPn76JbxY2Tf+k19KyTVLiSCFgo9+sPZ69cU
X-Google-Smtp-Source: AGHT+IGt92RufeRBsEBYPFgHHPuL4Davoxqe1ZhzlrAzS/6JFKrpECT14BVY2VmjwmydjD+68IzJkw==
X-Received: by 2002:a81:9485:0:b0:65f:8e2f:f7a6 with SMTP id 00721157ae682-67a072ba561mr110499807b3.24.1722292615485;
        Mon, 29 Jul 2024 15:36:55 -0700 (PDT)
Received: from x13.. (syn-035-145-047-162.res.spectrum.com. [35.145.47.162])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6756b024ab1sm22882937b3.91.2024.07.29.15.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 15:36:55 -0700 (PDT)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: W_Armin@gmx.de,
	corbet@lwn.net
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] [PATCH v2] wmi: Fix spelling mistakes
Date: Mon, 29 Jul 2024 18:36:44 -0400
Message-ID: <20240729223649.135639-1-luis.hernandez093@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There were a few instances of typos that could lead to confusion
when reading. The following words have been corrected:
Binay -> Binary
singe -> single
chaged -> changed

Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
---
 Documentation/wmi/devices/msi-wmi-platform.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/wmi/devices/msi-wmi-platform.rst b/Documentation/wmi/devices/msi-wmi-platform.rst
index 29b1b2e6d42c..31a136942892 100644
--- a/Documentation/wmi/devices/msi-wmi-platform.rst
+++ b/Documentation/wmi/devices/msi-wmi-platform.rst
@@ -130,12 +130,12 @@ data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
 
 Due to a peculiarity in how Windows handles the ``CreateByteField()`` ACPI operator (errors only
 happen when a invalid byte field is ultimately accessed), all methods require a 32 byte input
-buffer, even if the Binay MOF says otherwise.
+buffer, even if the Binary MOF says otherwise.
 
 The input buffer contains a single byte to select the subfeature to be accessed and 31 bytes of
 input data, the meaning of which depends on the subfeature being accessed.
 
-The output buffer contains a singe byte which signals success or failure (``0x00`` on failure)
+The output buffer contains a single byte which signals success or failure (``0x00`` on failure)
 and 31 bytes of output data, the meaning if which depends on the subfeature being accessed.
 
 WMI method Get_EC()
@@ -147,7 +147,7 @@ data contains a flag byte and a 28 byte controller firmware version string.
 The first 4 bits of the flag byte contain the minor version of the embedded controller interface,
 with the next 2 bits containing the major version of the embedded controller interface.
 
-The 7th bit signals if the embedded controller page chaged (exact meaning is unknown), and the
+The 7th bit signals if the embedded controller page changed (exact meaning is unknown), and the
 last bit signals if the platform is a Tigerlake platform.
 
 The MSI software seems to only use this interface when the last bit is set.
-- 
2.45.2

