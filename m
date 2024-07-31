Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACB74F207
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 05:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722405299; cv=none; b=P0aPsW/SdfB3msrvqIOHwqFKtfZ/ZHiMaIwRUmi793TV7dhuSkaTEQ7PzTqr7iMHgevymZwNPHA2PQWLrH9CGKPtStso6pi+wjmu68dCl6JaRcz+rAhZ6vT5wNpNjiUZO8Qco/MmObN2AJ3QP+jKlOVYDBMM4uk2NreIZrta52I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722405299; c=relaxed/simple;
	bh=cwyFIu1cSoyn0zMzWAtkwWlFKfT5rGb/RT3pVVBRS1w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JuBnfDQjsNMHrahWdbbEFEq8oV/VsAiLOjJBzei6+493VL8vU/bXxVoEyf7iysfkYnUbPVVXfJCoNbzAnjAPgU5Q35ybz6o7Rjcssxi4vr4G8+Po4Ob1oLaARGoovNQb2lBFNt0bsd6KbrzP+0XX/9Oe0YfC/VkL26kuIiS9+0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=LxMNZN7D; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="LxMNZN7D"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CC3B406E9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 05:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yRNWKOTkZRj5 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Jul 2024 05:54:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=rbrasga@uci.edu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 370C9406DB
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=uci.edu
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 370C9406DB
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=LxMNZN7D
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 370C9406DB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 05:54:56 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1fc4fcbb131so47578845ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Jul 2024 22:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1722405296; x=1723010096; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tKqvRSmHkIVmsY2tE+MEGPilglpL1hNRDaBy1R6HENs=;
        b=LxMNZN7DJngGBSDSAv4BIEnSHjq58J9EOgyOVkKYjjClfgiJPm7HPZv2zAZhcYr/lT
         Hn2A/JRc5FF52mvErGm7kjc450e2vCkqAnp9GE1OjzXnzf987naqN19OlUz0p2XkRa8X
         rgarYGIjNMM5wF6vCp2kCKdyKwfmUMupOYxFvXGaDmtLprxqhPXEMlKoG0vvlk4WgvTi
         tovVzZ6a0CQe/xLLLCICuLBRLJT0f9Uk+k5f0l5gHl7R8LPlIu58AI0/ykxGXI0ADita
         8izqawjvNWhu2wp0lCEnuNzfyoKRT0abJV6q0A51+QhTzdQ6+xIeDe4VCDZePBCxAxwi
         ZhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722405296; x=1723010096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tKqvRSmHkIVmsY2tE+MEGPilglpL1hNRDaBy1R6HENs=;
        b=FTSSI5UnO9jcMocCEARZSG5yWvBxLFudyfgoTz3PuFkpToxyKF1kmTjLAHexWBE9/j
         cz95JheljZpjCqYDJ29u/Js6eM2faLbBI2BTpdOn6yQlO0PZCa4bsMdJ9SjarJWlYLhi
         RCMhDfnmfKa60ZLqab0ti1tbK18lJ1+SYLTsJo8CjsgcH760bOJsUQ8F0S7UT0bdSYh7
         875V8BUKQkxLaZ4dKX+gzuJRRhT5J7ff8HC9wQvc3ZcnO0ykznCzvrGsIN7i84eMmOzk
         KqrL1cH46U8vfF445JP1IP/aropck9+T8aienGOYgoxVmJSKGH67pLRmt3tncAbr4PTr
         o9cA==
X-Forwarded-Encrypted: i=1; AJvYcCVqizX85DSpIQoPTIeb4CzW9wYIIb3gCmqIk+R407Lqd0qW0t9xicSH+UGyJlayTpBum2dA3wpzvJPrs07cMSfHObcOg7w7WDcqpBqni7GzIyTE2zvhHsb7DPwbHjoA
X-Gm-Message-State: AOJu0YwD0Qa22XA2q8+uiiAQze5OHuYOvOhw+70FXiOrgsRS0QfnYliD
	TWjEpKqWE2maO0migH2kzhvUapSqJkse0hKewcU4XmZjMV9NTog7knjoWdCWLKw=
X-Google-Smtp-Source: AGHT+IFhCVV0PZXpK0cSSWZ1v4yPQWI6euzChZEKm8M/bxSqMPBGp7wJxtefAjhZ7cUEpLN3KGIPHQ==
X-Received: by 2002:a17:902:ea0e:b0:1fc:6740:3ce6 with SMTP id d9443c01a7336-1ff048270a2mr147043735ad.20.1722405295409;
        Tue, 30 Jul 2024 22:54:55 -0700 (PDT)
Received: from alpha.mshome.net (ip68-4-168-191.oc.oc.cox.net. [68.4.168.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ee4ce6sm112339595ad.157.2024.07.30.22.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 22:54:54 -0700 (PDT)
From: Remington Brasga <rbrasga@uci.edu>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Remington Brasga <rbrasga@uci.edu>
Subject: [PATCH] drm/amdgpu/uvd4: fix mask and shift definitions
Date: Wed, 31 Jul 2024 05:54:51 +0000
Message-Id: <20240731055451.15467-1-rbrasga@uci.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A few define's are listed twice with different, incorrect values.
This fix sets them appropriately.

Signed-off-by: Remington Brasga <rbrasga@uci.edu>
---
The second UVD_LMI_CTRL__RFU_MASK is incorrect, so it was removed. It should be
`0xf800 0000`.
The first UVD_LMI_CTRL__RFU__SHIFT is incorrect, so it was removed.
It should bei `0x1a`.

This change aligns the uvd definitions, please refer to:
drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_3_1_sh_mask.h
drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_4_2_sh_mask.h
drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_5_0_sh_mask.h
drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_6_0_sh_mask.h

 drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_4_0_sh_mask.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_4_0_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_4_0_sh_mask.h
index 8ee3149df5b7..2ef1273e65ab 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_4_0_sh_mask.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_4_0_sh_mask.h
@@ -340,8 +340,6 @@
 #define UVD_LMI_CTRL__REQ_MODE_MASK 0x00000200L
 #define UVD_LMI_CTRL__REQ_MODE__SHIFT 0x00000009
 #define UVD_LMI_CTRL__RFU_MASK 0xf8000000L
-#define UVD_LMI_CTRL__RFU_MASK 0xfc000000L
-#define UVD_LMI_CTRL__RFU__SHIFT 0x0000001a
 #define UVD_LMI_CTRL__RFU__SHIFT 0x0000001b
 #define UVD_LMI_CTRL__VCPU_DATA_COHERENCY_EN_MASK 0x00200000L
 #define UVD_LMI_CTRL__VCPU_DATA_COHERENCY_EN__SHIFT 0x00000015
-- 
2.34.1

