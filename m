Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C5C29B8DD
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 16 Sep 2025 09:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758015020; cv=none; b=mzGFmKJnNa2X3si3mkrd1IxPeQvgKNQXnWVI3vDJYhrBR9F1gm+nTeS6/JaEm2YdqfIvfY+VSI1GkKZxGthyB1V+uyteQqyBUPYaxZXZ2Qi//VtV9ISL5MUuz6OJN0CQ6aPDiCZaW97c3MhVGd1Br7lTmr4GP0yRwQOs69lT4Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758015020; c=relaxed/simple;
	bh=lJM0XDL6EKgKBKgqJdeQknKHJfnLg6JMRZ76ToIHEJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NjwiR/TYYccUmcsBt/mhaxqbMrSdlTiaZSq9hWTooDjUbe1ZsNy9g3lz04oVXC/4jnF1uHi1z9htPJESHeYn1vZRWApU3ed+Agge3ZuN/dujA7TlolP8P09A6PoCbdpRhzsacz+S8WzoF5+OrDcsfCPHf4f+bCj3AvnyKMTF/Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YiBOunlS; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YiBOunlS"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-329e1c8e079so4437282a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 16 Sep 2025 02:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758015019; x=1758619819; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xMegCBQz7YTxSeWsApsavoRdrbMxT8WcHe9sV3hQY/k=;
        b=YiBOunlSfiqR0w+O3o6cUZESU6dFvgugoeWepdXEKeGz0qGnxQr9VsOUDSnjBHfUKz
         GmeSm+dmutOpB62joAXBdkT+1AeZWDhHg6NhEiUeIOOprLZ8lZZLRvSI1evhgBJOWvGQ
         lhJBOzZw6/nPF2cXFDxG5cmxcwjp+xx8Yy1scAQ9Y8kqF56R5XwPHmjVYbu+3LrrWOaY
         YBYKlQT6rJvz+wA3fTlcWtz6RKp0NZt7dY8YhcdpNZGp03nAog085NWbFdk+td5msHCc
         6uXMkaXV2qXblwKbXDT3LAI0eLkGoczoK6zS+MUE5v18Pq0YKttuUtTIr+KgIuJzE8jp
         ZzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758015019; x=1758619819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xMegCBQz7YTxSeWsApsavoRdrbMxT8WcHe9sV3hQY/k=;
        b=FTH/+0k2b0Xw9Z8HaoeZWwVGPlszYRB31mJk9RnTKXIoM0jG11xyOEqsAxRGTGHQ9p
         78u5tym2Ggfg7hYFlY4+sGwaWPH6pT+grVL+neHS+NtUEz6T93J3S7Hq6CkoFCUkUzSt
         xjKCztnVHGlq6vJXs7QsZWne0Hm6q8SvaT33QzXsNmcbQRNYAbph4m1LdT5NZ2+dC14Q
         v/Bdghw+IbM1R5ryfeoWa6jdFQUCy2OQ1DtYEx0Bspqa040Ji08XA9KlzqZLdj/VI2bQ
         7KGgookKNs3SyywkuMcxOwBqZF4y7CQLY3a0Z15+KpkWgQrLtg67Yq/rk0nWK9nxJgj0
         dC2g==
X-Forwarded-Encrypted: i=1; AJvYcCX2ITWxElUqi6qvFnGtKZd8PqhY8KFENAGmZFddGSkrwl6ONJ0/vyKq3tfLkhMw+u2XJooii86YFifmGOGpdmmQO5Iwzw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzcTf86XygpQa5ukhAVANxIqvp2Pcx4V2+76pqlOIpjoFZ8cw0A
	rkRmRPhWGeD4MtppbGQC2wM6RJcjGVtLYGMqqZXr+tw5ssT6uVOc6WUB
X-Gm-Gg: ASbGncvb6oDBI4u9Q/ic6tdGLGitz7NFRDECfTwL8phqvJe23so7TVx04VwqyZg9kpH
	ZdOJ+2Gj3KvLPr81iWnqRIIBpdSLR1ma2ol+cX7GnDbGXLOG2T7d7bST5tvffy+iY8vb5/gvr1z
	/x4pjDcbYkIgOUYRvOY8CqPCqzCyUzuOxhFJNPOvWIGjm7wif0LwGxSpjnrG+gKHvgP2tFysUMU
	5EbZMdpUgMyHULci+vu3892jnT5KigXXqZUsejEn5aWAVZVWsasMO+8F+veTvu9ohwrLyIMSwAn
	L2Ug3D5YBDDz1rShe9ZwNOHymYR+i+IXDRfpF8Fh4h6RKckFY5MU+Mrq3YMr3jEeb9eHAKLqt4I
	cG+5sO76PEbK9U0XO8vZC61jN63T9naRmy1GW0i1JD4eZpZ0=
X-Google-Smtp-Source: AGHT+IHaY5c65oxrMkdcTL0n+OlnjEx6RcD6jC9gi1YeTOzARVykTuROW5jlE0gu3jOJro1VNfqXFA==
X-Received: by 2002:a17:90b:38d2:b0:32b:baaa:21b0 with SMTP id 98e67ed59e1d1-32de4eabfbamr18284658a91.6.1758015018661;
        Tue, 16 Sep 2025 02:30:18 -0700 (PDT)
Received: from localhost.localdomain ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ea3c72dacsm869074a91.4.2025.09.16.02.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 02:30:18 -0700 (PDT)
From: Rahul Kumar <rk0006818@gmail.com>
To: Felix.Kuehling@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	rk0006818@gmail.com
Subject: [PATCH] drm/amdgpu: Use kmalloc_array() instead of kmalloc()
Date: Tue, 16 Sep 2025 14:59:49 +0530
Message-ID: <20250916092949.4118999-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/process/deprecated.rst recommends against the use of
kmalloc with dynamic size calculations due to the risk of overflow and
smaller allocation being made than the caller was expecting.

Replace kmalloc() with kmalloc_array() in amdgpu_amdkfd_gfx_v10.c
to make the intended allocation size clearer and avoid potential
overflow issues.

Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
index 04ef0ca10541..0239114fb6c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
@@ -352,7 +352,7 @@ static int kgd_hqd_dump(struct amdgpu_device *adev,
 		(*dump)[i++][1] = RREG32_SOC15_IP(GC, addr);		\
 	} while (0)
 
-	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
+	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
 	if (*dump == NULL)
 		return -ENOMEM;
 
@@ -449,7 +449,7 @@ static int kgd_hqd_sdma_dump(struct amdgpu_device *adev,
 #undef HQD_N_REGS
 #define HQD_N_REGS (19+6+7+10)
 
-	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
+	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
 	if (*dump == NULL)
 		return -ENOMEM;
 
-- 
2.43.0

