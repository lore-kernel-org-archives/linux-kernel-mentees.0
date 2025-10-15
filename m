Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F8F30DD26
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Oct 2025 11:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760527137; cv=none; b=jl9mU3q0zf4P4uQNByjqyTZIkXoejxd0BVbXObTNARPwqyqV0T9QpdCkHPr1M3PTjQXfXvSe2GfX6Ncq5webP/SJtqZ5F6BJF1myOsH4QXLqveLYwgsZ1KXY8eRf2V9miJLiSwEvw1MS4dLV2SAPEoqOdxwBZc69PtxOnPExmQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760527137; c=relaxed/simple;
	bh=SzFxEbyxEcDRigJfL5eL/SkazLCkh76xI9qUKlEw35o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m323aPYS3TlUwAFtZIYrI1aKmHeG1VM56QoelxzfNsoggReplEKVT7LWtFION0eAsmvs8k99U1a6yPm2qJQ8ENX2nYV/C7LJv9xv8BdOdky3Lw15NP4FkEYTT8Blm6L/nToFi82QOtw/P6ceDttF7ug+1Vftb4irJ5Ylzx7vt8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3TvN/bg; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3TvN/bg"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7841da939deso5791524b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Oct 2025 04:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760527135; x=1761131935; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W2vnTLcw57Y069vTGfiFWbSfImvEmfVAFfbmVAA9rgo=;
        b=C3TvN/bg4WapR3r70pVFC95ZFxYrpDclJNdOtFSw4KrazBrMG6YTMZRAW4n+jaRRbJ
         iGtbtev2Ucibb1hvs+gDg8ZdtjQo8AbhJJKALOWo401lMLbFOZ2EBUi2rsW3qzmfy630
         qT0wGbRDT+xiY7u8BqAPeB4wNlfrlKzSp4NgF72ciurj/pShOgPM1vlUE1qzYcCAuHgx
         dJKHNqlv8NAYT1BZoIKbl19XEMUMspDPTDp1HEpKpT8x3vLk5DwbtxQBat3RbZ77YoSb
         olvQfBqlM/wNr8AWLgAUzpmzal6zGXhOd6Pi31xDVotmspmbGpB80V5Bn+v79CXOvHlO
         DVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760527135; x=1761131935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2vnTLcw57Y069vTGfiFWbSfImvEmfVAFfbmVAA9rgo=;
        b=bVfor9c8KDMHtHLtYUaIpYeiij6/n21EvzOi0zW2USiJfYk/Hj9oTpdjexdMv8o1oY
         /dp3wkjdBlVRKrVxktXXHUT7SEjLmD37Yh4YjImiDIW7QCsksuKlTOkziuq7nRr2lwkN
         hrv42ZPA6fQCMYBKw2AIZck9y13P2vFiefZUFjnAtetuIm97Ze5yqxxhoDjMt0fmTQ1j
         MoTv5AGbXvDvpHyE4a/MZN4JLqSvszQy9M5LG3ChOiVcVvlldu0W7HuHFYQMJDZWToqa
         60dEtEbnkTRTfuyEAErhqRnpLOIrR52TfN1vol8loimC5PUMHj7ZGWYmyfJ4hRNIPPaw
         tX9g==
X-Forwarded-Encrypted: i=1; AJvYcCXCMdNOl8sU2uQ0Uk8lLwF969UrOsQ3nJv9uK1vVaOAPRkhBhR/2gDkzqVTHvCQ4HuNDEZUTKRpkCnw8BbfEGyVwcLGQg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSWAQXxScUtf5UlqXScIFlF0BGAcn4/OE6V3HE0/zI6dsT0uxY
	ItwzuFy7cjsDIbbRpNntc1mmIzZp76EO04bwF2J+CM59YJuLKnvil3Xa
X-Gm-Gg: ASbGncufaKPmQWE5aVyiv6C8XdNz75Ph/JbxBAMLUzdBiLLvptAdLcKuCi19Z1hskiT
	zjfXKG16l4+Ro9XHUW+XJrAHvBS0eCPJUNR8SuPCODolwzbaqiPw0iGEZVVQxZJsnG1dxbK6how
	KMxFaCEzkXw69lsThiYdwUkon4SmmyGtpMAMyBC1qKnK9FowGNvUvo1mfP3JW/H4xMnOxzgMDk7
	pDSIZmKJ96GEDvvwQluOomqwsfAI6sAUK5lGoFD9HL90iweJNNARl639/4tYdmnWRPS51KI2bQs
	OeWRebJpZ1ZypJ5YEXydDXyplh9ZbqHxG3e+8BgzA62sTClWHaU+SpeDm6BQjYfCokrJmgwQvrl
	JOVquAz3qxxWcznTVx1JP6LmfrxwmE4x7oKmKwl330Ks8Rdg59nWIRPyTVQ==
X-Google-Smtp-Source: AGHT+IFxanje2UwITyO7JhKP4HwVngGwSfVPKTDvSZY8WDRIMIBK8NNPGmeF09cgQwzpalXD/vgd7A==
X-Received: by 2002:a05:6a00:4b01:b0:77f:1550:f3c9 with SMTP id d2e1a72fcca58-793859f34b3mr35946413b3a.12.1760527134951;
        Wed, 15 Oct 2025 04:18:54 -0700 (PDT)
Received: from tixy.nay.do ([2405:201:8000:a149:4670:c55c:fe13:754d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d09aa20sm18322631b3a.39.2025.10.15.04.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 04:18:54 -0700 (PDT)
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
Subject: [PATCH] drm/gpuvm: Fix kernel-doc warning for drm_gpuvm_map_req.map
Date: Wed, 15 Oct 2025 16:47:08 +0530
Message-ID: <20251015111828.18944-1-spyjetfayed@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc for struct drm_gpuvm_map_req.map was added as 'map_ops'
instead of 'map', leading to this warning during htmldocs build:

WARNING: include/drm/drm_gpuvm.h:1083 struct member 'map' not described in 'drm_gpuvm_map_req'

Fixes: 000a45dce7ad ("drm/gpuvm: Pass map arguments through a struct")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>
---
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

