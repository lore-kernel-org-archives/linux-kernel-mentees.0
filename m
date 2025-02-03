Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BEF204C34
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  3 Feb 2025 16:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738599571; cv=none; b=Rn83x+dUj8AnCT+zwQpZdXN8j6lSrnY05HBKprevisuh5VRJiEicB97UiZfrrhY5DFdPQUsoMB5sk21Ag83v0/mrXoNUCKqrfdKlzUO0DZdq3Q09g4OivQeX/V+w4fVxKkPJyoHig58HO2OTIhddoWGxuXgx2zkGoMisKnGbRz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738599571; c=relaxed/simple;
	bh=qinQt7wASeFf0Havw9p6QcLUlC/f+ZP2hKrK/KzcsvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GxA1kOZB9t2O7DziCna0cfHfPqUoCJZ76x/jyBoCvbmcobb27dft41OFZlnQjMHluMEa8gWgDP5DzSkLAXPDNuuB01WwS0F7UzlDq6C2BWAFCX4pxeN79vJU2zP9H0zC/hYqHAmRG7JxtIS5AUEA1649lDhsNjmD8sQZrrBrPwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cVn1sahx; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVn1sahx"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-215770613dbso61390945ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 03 Feb 2025 08:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738599569; x=1739204369; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R7X6yE+z3+YM3voKFI7mGJEh5PgUIAgLmSw61EntbZ4=;
        b=cVn1sahxhtpBTnHSeMz2xP8F4Dg9egdyGDrlmNU7FfMwkzb3BaLmoVqaML0nVUuhRr
         /k/6Lyxi7N/UB+9Af238TS5/BE6Uzvr+70ZYsxlmwNNPNKTnNqQt6RJZR4fLGYnbmofY
         j1MkTRdAkp14s0DoNsp0OkqiZ3q8ankolQWKHwmMytFvLoxuC3EkuRSR8HE8sa4H4Tnk
         bTisTsNTAilUeBe5anXUyDStllc0P+Vo2XTLxNJSuT964I5Gm7vPGUcO+aEgSFaHPY6n
         hUSoI9nOLVtNhXAthpCo2OnlK7+xVCBzd95BfOhhtB4uHd7rIc+/Q1n2+ZGCIujQPRdD
         bwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738599569; x=1739204369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R7X6yE+z3+YM3voKFI7mGJEh5PgUIAgLmSw61EntbZ4=;
        b=OGJ+iTbob1pg8577nhwp632Zhu+ClNhmnW5KBbCeB/r/vWPcKGg1mwb6EbQ+IeVnZb
         iNFoNL1YeB7Jknfp8CoyhPejxen0gZ8gsffBg4m6Z5ute2+2ilKXp3cff35pTFGxHuQr
         DkBNPoZsISNRi0suWTsICaJU/EC1kjKNIAXDQEwziqPM5FIXeOcpLZtXJYIGfxW5d/Aq
         sESli0sXV5jBSRvGO0DPywPDiUpfZLGH0uukxbDm6JM1nH+ncZ9xMgjUrKtm65NIUJy7
         UDp7CYuaTQ5PQf0Q15yw5QcSPevZc5GgMBmcjhfAzuTWSTWc5hckOWEW9i5OHltglIj5
         GFjg==
X-Gm-Message-State: AOJu0YxVL7xZA7znTf4lraXah6grS6om0Q+dnRZR/2xe9ViwqPENjI+k
	xZe28MTjzQW7b1meRK4mWWHQ74/7gNXAk8tcYSd5KCchjHjfEBQX
X-Gm-Gg: ASbGncv0A7Dsayeo0jr/E5v44xxRjlq5hGv8De+vzbYQf9AGvallxyQUvim9DP8YNK4
	zY5pw7bOw2c49JNxElaI0ZEVJHPNQrMGDttZQtvBWKQPb9yP/XZY30AUKHGSTgvJqVREwh1ZG67
	BOva8PsRI951fuH+Q0IlpVSIy3V6q5qpt6iJ71Bte8heIFt2rfgK/57vrEMzFnoG41VjrnFoMCk
	MM7wCr/dQkr1y17u+pTZZrmJBg0Tmpf311S3qrDx97lsWKZVK72cvdVpfRrdZNzKy9j0hewQYlL
	ctH283NZn11CugtUBy6Ms7OKAhRktp+CtOOomw==
X-Google-Smtp-Source: AGHT+IHckQx32NYfV0RKRBmdLVRCT23nHFajVlPXzIw6gASBnxD79fm7Ls7sHjEWDzSmoJQPb/n74w==
X-Received: by 2002:a05:6a00:3e13:b0:72a:a9d9:5a82 with SMTP id d2e1a72fcca58-72fd096a1bemr32480223b3a.0.1738599568921;
        Mon, 03 Feb 2025 08:19:28 -0800 (PST)
Received: from localhost.localdomain ([2405:201:5c08:585d:6eb6:f5fb:b572:c7c7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba47esm8849887b3a.96.2025.02.03.08.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:19:28 -0800 (PST)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] documentation grammer correction 
Date: Mon,  3 Feb 2025 21:49:20 +0530
Message-ID: <20250203161920.14028-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I am submitting this patch as a part of lfx mentorship application tasks.
This patch contains grammatical and spelling corrections in the linux
documentation. Please let me know if any further clarification is
required.

Regards 

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

