Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7399718DB0A
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  7 Feb 2025 16:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738947219; cv=none; b=PI5VKpQeIO1yYA58ytAuHkG6Y6JsrtdwOQq/murbVQHMEBGYetrPWSP7AoYENQe1D4WISwrTJViY+S8uB3KAoaHHp/GIciGyEFglmWOJBtEVoZc01iac1pfURGY5S61CsqHnlhKfTdjoEhaNnMDoL6iGTa4W+dEedLyckHa3hvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738947219; c=relaxed/simple;
	bh=lzZC7nwSzDbj4fR9zSQyo/j1VaKH5TZnWQewenU65gI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kXZkoKOrqnFUJevZWLDcuagB9Z3EJrCYPG/UrqpgPr+0xZ2xQQUVX1tSwYxxkJ01Rl+qOlxtSKUzmlD7blxrazx87OGmwGzIiteAS+A2wL7C4QpCJ7PvwXBWOpNz2Ny+TCxLh/wgH7e3PAWI8Ledxx+TFPzeEkSsV/ljaiV3cEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FOe1f39z; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOe1f39z"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21f55fbb72bso15835915ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 07 Feb 2025 08:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738947218; x=1739552018; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DxFFXjBXPh0mZXgN1D7X6dwazx3m6suk992pVSePYAI=;
        b=FOe1f39zN6KgdLG7OUIYBQ83ufeo1y2p37uxAxhYH1YN/57gA0SY3dNjrZdk1+ENlI
         ufDsqFBlEvwmcK2H8o9JuJKes8p+7RvGqbmIW3dnPhCv7cXdk1yD6Rr2YRS9RZtyvzHH
         3BgjgxNcOqCfVxt0BmhstUODvd8JaYLx9GQuZX4g76bUNo3f4LJ49fVpnBRFIEXmj3Fv
         arMdNVLmite2CiWUXHe7OzTiGEYd2aKi9ZeAs9e4AAW4PiajYHqzTw5ojR3Z62cRmivg
         pa61TbCQplt3QeC37jj2gXJT3dlY5TB2Tkxf2DZMWQa3Dt+0vsMQ2F+ATSPnU7RSpEWn
         /YFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738947218; x=1739552018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DxFFXjBXPh0mZXgN1D7X6dwazx3m6suk992pVSePYAI=;
        b=KlXefhuQC8UYFKtd2jZWxgkula8GUZRde7Ul8/ZWBX+r4iqFSKyy0lhQ3wrp6BbzzN
         OqyQPWrpns3XXrz6BZVA3CUK8RC5absgQB5NL5AlMOHnNapMg3I+oIBLHynhtJXbzjFQ
         7DfSZr7oZfGGi2kmBUJgRvFu95KpTQnh6ajkvX2cjN9dXCDxNfETTK+CiKAQf+unV27d
         OkHihRDGjG2yiduOW5oDOe/DReTkY5BhgSGiRhx94VPw8Rgi93mszTbv9bkLYhJE+4dO
         ng7Z6WInwMc58au7edABnbc/DnkWnOWT8Qa44P2Dv9O8inHjvXPfm5J/hu2Yjqq+nH+p
         qfQg==
X-Gm-Message-State: AOJu0Yx8Xiy0IaWYBLSc5WsHoHNMFxuDX4W+KAVjOUrCSvbYdkaz46q/
	88ww4SqJuX9htd2h1begLEIfpQiPBI6xIa99QIbC8usdmY3N/tV4BldGb9gA
X-Gm-Gg: ASbGnct3pLAZVijP4uIXSf2GZdLo4rZGntmNCGXmY5vnlNP4BTGh1SVaKkOLBR9Fvbx
	5wlVWs3ivhaSVScUVabbfYQWBTmRQF+OoQH1Knbj7+6jxuwuVZxtUlySMy/ZLPMpUZ6ioHOmkPj
	IDxUVaaTO6p6GJvkXPfi7d7OIaMDw5kb7ij3bgZFnuakL7X9WyigSX09fXgiWYmIew68QKHkhH1
	G756d2fLDWwmSzMSy3Pict2MBLwaE+I4upJcIN9B1mOW2R+EAfPyFFjOzLcXU0J9Ko5AsTn3a2n
	CRatZsGEC6f8uca6+XTNnt3w4hV+azNfyn75+Q==
X-Google-Smtp-Source: AGHT+IHloNittrDbs5jUYxV/yVOfttQCzuZ0Pek25uqtlRj5RWlIk5xsGyjvZADLruZUGFUmfRvU7g==
X-Received: by 2002:a05:6a00:9286:b0:725:322a:9438 with SMTP id d2e1a72fcca58-7305d4135bemr5871199b3a.1.1738947217412;
        Fri, 07 Feb 2025 08:53:37 -0800 (PST)
Received: from localhost.localdomain ([2405:201:5c08:585d:6eb6:f5fb:b572:c7c7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048c15baesm3205820b3a.121.2025.02.07.08.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:53:36 -0800 (PST)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] vgaarbiter: documentation grammar correction 
Date: Fri,  7 Feb 2025 22:23:25 +0530
Message-ID: <20250207165325.3998-1-pranav.tyagi03@gmail.com>
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

