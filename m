Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFDE20D4FB
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  4 Feb 2025 14:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738678120; cv=none; b=XgQfZE9SUvcka0FTzU+EHHltX+chCFGTnmSPb+g7sGlQ5V5Orsujo/jkivoFnWc9sZdAlZjaSf+oA8xXFvJG74mGjXmRr/cJlkPXfsmqkWu4tNT9JQnzhT/QjA7X0MxYcD3OMkBD6VxpoQpTaZge/fCp2Xv/mdrrbvYqdV5dRnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738678120; c=relaxed/simple;
	bh=lzZC7nwSzDbj4fR9zSQyo/j1VaKH5TZnWQewenU65gI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mEmhSx8M7Tshoi92lCAaPD5dbnM+2Yu4kPCj2kzageUaJvrROBjyv6L9dwSrPb92JJOG6qDhUoXRCKhGR+1EhVpSoRavdZEkPElRKulKWLDzWOVi/mzH1mWSoDeN5C9tfTAiGNZZk1Z01W61HoF7dELU/t/acz7F3WlbzSx/HNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjJ+DIxL; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjJ+DIxL"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21669fd5c7cso101402945ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 04 Feb 2025 06:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738678119; x=1739282919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DxFFXjBXPh0mZXgN1D7X6dwazx3m6suk992pVSePYAI=;
        b=VjJ+DIxLbtve9dFB2Tp8I6j/3TLUliMyf8ctqm49f9Pt5HOxleylVQUluBi1pN5IB3
         DEBbrWy3IkLh4LGwH+jnNg9QEBn0AZcVXmhBPW/uTrkWUfPBmEMzykUhpz42yWkdvkZh
         n8FFT/l1tL7y8/e5XzE6Sw1eFKExoYDdE1g/K6ymnVEvfBXesdt8frxhLEzvjkzX3jzF
         /5Gaq2bVTCIvz6Sq6zCDgVI3IA/QPC5BIOJegCaknryLor9oD4gYRFlWsiOiKJ9U+2eU
         lKFU9/fa5DcrImHAgGtIT1+mdkAY+cLzVbMW8UXjO7/aTqnxjtZQn60JH8ZJIJ3Ci8MM
         Hg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738678119; x=1739282919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DxFFXjBXPh0mZXgN1D7X6dwazx3m6suk992pVSePYAI=;
        b=Zrv0y0GfKRVdtwsU2pXLL68lQhKvrMQ934sQ8bPBhy1t2grcP7mMNfLgBkC9t8N1p5
         /IstzKePVBJKDIgtki57qdV3XkIEonPM+MN0yZ+U80k1sL+YHZM4WfbLZSyy2yS92E6x
         AIkFoAR2LUfI9CxST7F/7VMNm5M75kH0eYBQ+cxygp6mqsyFilf13M3GyHLfBS4E+Jkc
         GO2A0FqyH3LtR+iYFgrPSqkxz1XPgKhJCMGhM65mq1ZAHwjGnu3J4PdOE2TJCK/iT/HT
         vSBs9Webz8rWc1t50qksg+0cR0oLZjr7on0iFlj7F5IXXcMtAF9kw359ilYpX8G3z2AU
         4hBA==
X-Gm-Message-State: AOJu0YzhKCkUHi6Ngd2k8+BOMW3I/zJrSOE6aitQSWEXKVocr9XWVrSz
	WlvrWCVUaIbEadJRNUo3HUmM9eGJqlJNSxNg+HUU93W6Vr7yG/gdOMLKVLpN
X-Gm-Gg: ASbGnct2WpnsmcKaqBZ+bMsiqA1hBs0MCsyDs55ab1hpmCrVgGT8r6GX2HCAwNW9dVB
	2Ddi0a1P1JeuHdNMEeTDCJedoBByqIzLG5SWTp/LNSiq7RpUOnZfv48gBwN063NrQbfd2vGL6CB
	xocvgke5fYUa8PpKcb2bPEWRp4iyl3Ez1RVqSeCrkngBJ0vaGGna/XEaNsT1hyO1Fflkm8iyAvx
	WquHnp2xrxqTkxo50W6BzgvoU8gtfIV4hzVnwQck7tCe7rOr2Ii82PNDq0IX2nbLh2gl6AFMYJn
	p2O1h81QRJDxaH4R5BY/DczAA0CeUOu71ibfaQ==
X-Google-Smtp-Source: AGHT+IGmJOJKIJz8LAecFRFuK1DLTcWKV9FPgCagpZN4eNuZ/47DsGbKgNgNCBUMJ0+ep2xl2FiMWw==
X-Received: by 2002:a05:6a21:8dc8:b0:1ea:ddd1:2fa7 with SMTP id adf61e73a8af0-1ed7a6b8105mr42979558637.28.1738678118422;
        Tue, 04 Feb 2025 06:08:38 -0800 (PST)
Received: from localhost.localdomain ([2405:201:5c08:585d:6eb6:f5fb:b572:c7c7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec096c62bsm10039452a12.67.2025.02.04.06.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:08:37 -0800 (PST)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] vgaarbiter: documentation grammar correction 
Date: Tue,  4 Feb 2025 19:38:29 +0530
Message-ID: <20250204140829.7649-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Corrects the following grammatical issues in the VGA Arbiter documentation:
- Fixes subject-verb agreement by changing "co-exists" to "co-exist"
- Corrects pluralization by changing "server" to "servers"
- Improves sentence structure for clarity

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 Documentation/gpu/vgaarbiter.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/vgaarbiter.rst b/Documentation/gpu/vgaarbiter.rst
index bde3c0afb059..d1e953712cc2 100644
--- a/Documentation/gpu/vgaarbiter.rst
+++ b/Documentation/gpu/vgaarbiter.rst
@@ -11,9 +11,9 @@ Section 7, Legacy Devices.
 
 The Resource Access Control (RAC) module inside the X server [0] existed for
 the legacy VGA arbitration task (besides other bus management tasks) when more
-than one legacy device co-exists on the same machine. But the problem happens
+than one legacy device co-exist on the same machine. But the problem happens
 when these devices are trying to be accessed by different userspace clients
-(e.g. two server in parallel). Their address assignments conflict. Moreover,
+(e.g. two servers in parallel). Their address assignments conflict. Moreover,
 ideally, being a userspace application, it is not the role of the X server to
 control bus resources. Therefore an arbitration scheme outside of the X server
 is needed to control the sharing of these resources. This document introduces
@@ -106,7 +106,7 @@ In-kernel interface
 libpciaccess
 ------------
 
-To use the vga arbiter char device it was implemented an API inside the
+To use the vga arbiter char device, an API was implemented inside the
 libpciaccess library. One field was added to struct pci_device (each device
 on the system)::
 
-- 
2.47.1

