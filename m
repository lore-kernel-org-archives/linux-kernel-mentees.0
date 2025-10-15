Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181DB32145A
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Oct 2025 11:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760528242; cv=none; b=kJDiT5cSPrysJKmZvIUG/TukJ2aufkUi5+I3Mx8KTIAJA6ZLYibIaiqfSlPghgcYhKtV8qqEYhd6YPKHTm55gmx/YryXaIXjWIwfEuur4znEqj/sMUEBZ/lCuOGyTg4LIu2SCSflUYe6Wht5VcK7vwLczEgjGJ3Vfd6UbZj0Jg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760528242; c=relaxed/simple;
	bh=c4aYKS54E8jqERLS+NN4OOzQlB4QxsJ61mU3bGEwygc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dyfo7L4ExSmV5/M9AKFZTWbvXt55XdXEZi/NkYxa1jXUDXPKCKrFq0L/TQglA2g3DdSy4OwYUyCXvIIef2cS1NPLLUGf88yUBV3oPMGPUzrVPKMatj1kHgyqKuEcrn/DRblpWqMHnxdigh4Zn7XTP/HOFxWDpUx0oegoid+3vBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LOfixYpk; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOfixYpk"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-78125ed4052so7479826b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Oct 2025 04:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760528240; x=1761133040; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x9r7lDMOBshgk2OBbZUZFD3lZ/ikkhF8KUnZZ8JlQI0=;
        b=LOfixYpkTWgnfJZp/SGn1K3670g7Ft36SG0gjiaQtQppPMcXn6wgJhUEEp9FlxZvko
         /ipBldq9GKMYeySkqjrEMCtZkiseonmXmm1KW22VGsG0BxnToKzOzp2JBHqNZybVGReF
         bmqydLeC5+UO1ZUXhkrHaOjC9sK8Zc1SqBOkcVgDETnXBUqKDDlOXvSN856TssI/4ai4
         mEdYNIZdoJR0hdRhcGoNEsPzyctrbIDPeLMkKvrY3MBsXAf13j3qZlbeENY9cS7WZwuR
         kegD/x8MdIgUBHlXTkho8icw21fDwAyh9eILMLcXzWfQ+bUCScObBr/GNqqkHKcwKGUP
         LcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760528240; x=1761133040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9r7lDMOBshgk2OBbZUZFD3lZ/ikkhF8KUnZZ8JlQI0=;
        b=SHz9IH5jVeH0ti3HPHVmhqlNTSSBgvRMqL/gw8dEEA8DppPVJmVO+l4SCK+0BBjLZ4
         IqoZLSPEemii5d/tJTEsbeiHBouI2ErO9aSDjW0oEY8LG1iiRitTkC9FqZUzZLpq68ue
         H4i3/SaOGi3gZ2/EQ/yRgsV2iQH2n206Si/wvBdllkiBkJMcvPJ8Iq4DGByux02+J+r0
         SOaco2AnZXLMke6FOriAMQCj8AepSijYPk5D+bdFnzpUHbD7NJ/0Xaaxnf2fPRhRMdta
         khz4pEDrp1USbi76KPm88eqv9wMjyZMrdbwkztsnffE44yPKmTYslYJLiyl6QWSKejUA
         33Cg==
X-Forwarded-Encrypted: i=1; AJvYcCW3qmQYzJQxbTML5CU9qdKALhbLRuQpxZ9/4xciY1VqieqXOEtpxPPvZNotzDgzkPzaNBCZPOSc5z4hGRUXWE3jj3wEcA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBAYRPdUZfD0eXNBeNJ2JK86j7q0CJ7Oigt94htP1AzP+CUlnV
	lpSbFm1GRTSsbvuHyw2HyrNuqvO4V8R9AFxBFw7uCwYMD8D0ie4YBOsc
X-Gm-Gg: ASbGncvXoV4yX1kah6lCgsMSf09qAqXm5+1i7AOkO47aGub43rCU7yPQciDZr/zBwGP
	CCmzad+VZPNxGSh2wvWjBzxrHO+CSC69HVhTqwtXKeJE3wC2rEhwpKBrCWuDIHmRt1lqBx8m73/
	hZtP8ysFy764yEM5BoYmVYMrHb0G8hRqkhLpI3lqMHdCuUBKN/HSJhul1zqn+PhFhXj9hv8Uest
	YyEMOeezJkVIfNP4//LrD5qo0YwP114SPfNMU20D6fjKYL00RdmniSagGSiyn2hIhOkOnX7cLeY
	p/q1Mlk0YVBDGylQzK1qwP4x14ArivSR9Z1fAyx1Q0Ebnmy1CVWFR2tw8UEny34C7pbHkJhSuTw
	VX4rbawF9AYTI5Jo61frHy+z/yxh69FCg/BrZabm9mf412BXvqyHbexE31w==
X-Google-Smtp-Source: AGHT+IF/kMdSW2mdiOvPmOOpT6ZAXFjqWzHKAwJiaUVYsXOzqJQMewVct8CF0Jj3G4kE299bLT4akg==
X-Received: by 2002:a05:6a00:a0a:b0:781:1920:d12d with SMTP id d2e1a72fcca58-793858fb6dfmr34996835b3a.12.1760528240330;
        Wed, 15 Oct 2025 04:37:20 -0700 (PDT)
Received: from tixy.nay.do ([2405:201:8000:a149:4670:c55c:fe13:754d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e3f89sm18115540b3a.66.2025.10.15.04.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 04:37:20 -0700 (PDT)
From: Ankan Biswas <spyjetfayed@gmail.com>
To: bbrezillon@kernel.org,
	himal.prasad.ghimiray@intel.com,
	dakr@kernel.org,
	matt.coster@imgtec.com,
	robin.clark@oss.qualcomm.com,
	matthew.brost@intel.com,
	aliceryhl@google.com,
	thomas.hellstrom@linux.intel.com
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	simona@ffwll.ch,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Ankan Biswas <spyjetfayed@gmail.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH v2] drm/gpuvm: Fix kernel-doc warning for drm_gpuvm_map_req.map
Date: Wed, 15 Oct 2025 17:01:23 +0530
Message-ID: <20251015113656.21447-1-spyjetfayed@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc for struct drm_gpuvm_map_req.map was added as '@op_map'
instead of '@map', leading to this warning during htmldocs build:

WARNING: include/drm/drm_gpuvm.h:1083 struct member 'map' not described in 'drm_gpuvm_map_req'

Fixes: 000a45dce7ad ("drm/gpuvm: Pass map arguments through a struct")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>
---
Changes in v2:
- typos fixed 'map_ops' -> '@op_map', 'map' -> '@map'

 include/drm/drm_gpuvm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 8890ded1d907..476990e761f8 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1078,7 +1078,7 @@ struct drm_gpuva_ops {
  */
 struct drm_gpuvm_map_req {
 	/**
-	 * @op_map: struct drm_gpuva_op_map
+	 * @map: struct drm_gpuva_op_map
 	 */
 	struct drm_gpuva_op_map map;
 };
-- 
2.51.0

