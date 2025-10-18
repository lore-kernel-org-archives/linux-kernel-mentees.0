Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352F31FDA92
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Oct 2025 16:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760806717; cv=none; b=R9uCUGpCCwm1Prqb/PAwIjjkcgtz0lXNpZYSj/G9+SAG5PZGu/RujrMAUZPyMqqifiTjGSKOkXNo8FG+Fm0TqTm7BWQqQK8Uvh2m9q75q8e6iHEtlx/fN+4uba93lceT+bqwOpwBRRRLXt3ijKijrMaulKu2RSJ3hCiS+a0j/18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760806717; c=relaxed/simple;
	bh=w7J82fnUD6xfEpzP95bpQv/8s1/Ygz1qLRmzDTIVvOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bNk4sokGuXWUkOdH7Up8VtkSOBeZVDaaBPMsQ0GW0asXeHkc/+m5A4UcmXk7jTMVez8wSqLOKONQf2S8DQTePcJe8OoOrKQsE9CGeDSvCYsoZQgdz/mq4VbnnzQ+j+5/CKbDyrSydYIviaS/G31CXvOFc+o7BR+aPxQN1QscUno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9ur1udu; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9ur1udu"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-430aeaffeaeso12964205ab.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Oct 2025 09:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760806715; x=1761411515; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1WBSTPx2pG3XQLINSM8ILY6Yp6IM7QVYiXHEETaCAQ=;
        b=f9ur1uduGc+JohmUg0GnMeFNTpMVSPl2IUV6cSr1KzwcOWTmptmSZlMxAdjvIT7vFK
         G3EZv//v5iJCWmdoUZ7bRRz3AB2ns6W+LMjrP1aWq3BXS/3B97ieIDcCRpapajHO8LYe
         AvlpgkEkr3P7UDOjk5jniDZj37fDhwwtLdKUqV/zOlRn61pn66OHsUAdsGppiNjwN6o8
         DIO+jx63GHdua8YA7j2PYCti2m3YxdHmlj93LXAjvviKpaXMg6kVvmS1FGNjG4fEAxdJ
         iXH+dgTPjLECMXd6Q7TFDlTK/ZgJtBAnOkWsdulc+fzJ4xxwqKZj/5M3D4Si3ptAFpMw
         nwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760806715; x=1761411515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1WBSTPx2pG3XQLINSM8ILY6Yp6IM7QVYiXHEETaCAQ=;
        b=ObgCqF5+2O2+CWpF3xRQndgGxJ+MOwy+41ECzchZAeNxsveFtYc39IiomwW25ADBbp
         F3nLnSAAbYlBP3+dMHh0BeuksjPcMahH998fCGkWnjKSijkapiMmjcNSQsAnJBXbMBqu
         lqGO57ZvBxCoyt1qmiRGCKtPFRfEJLX8hCB81rgOumHk5gi26Y2UZ32JKB1J1596rY4p
         EaMJY71nPjTTyAYjvJ8Tvhbu/YFGsYtI8iK/eZvb91HGEjpd6YIiEnPgJ7WZGIZ8Cnaj
         aRGxnTsWRKzwm9XyKwhQ8tH/lGORIic9u2wxdv0w/56ocyhpW4/Ltnebk8K72aL1tbZL
         9OIg==
X-Forwarded-Encrypted: i=1; AJvYcCVJfKGMvXKYjltgfzL6A0MwVkPreKdnw5tApPAH1WcxRgedOXr+oc5tEMWJGDqeWIOLuOkyCs66RF6zbydMp9dTbRUP6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzG/dllZ7pRRkBBHuMgVG1LFOeeKz8EWoQ4jRIXxkK6JeZzJ946
	UmMGUkXdOzePc6fd4sjKVBAk1IGfMLsWkdhjEpLnsbeZjwpAhThn/JFF
X-Gm-Gg: ASbGnct8ePNddzchhj9ur+qj6dfCYDUYgD3IMD/w+D7om7PtVPfFqpRPeaEcIdumg03
	UImimDn3RUiQNBy+jXGyEg3gOxWn8xe7CzwvR8wpjC4Sodbhhy0J5fnkqwK2SJPqXI3vNwXUmQS
	coYNhGOCueMUJWpEteqq9m1YG6A2bZuHFFfiB3myteiGBSeQmZF5x3GBSIuzrAANheWiNxUOvkr
	CvwRQacXjnrJaXUDjEMIDM0/s1aTr+FlD/lXI+wNyBMc88s0C6p3AbRUGezIgIQzxPcOuSFULe4
	/45YvehTqZs9uAOuKNi+X71dKD4fAmfrk00Cu4N6UWOgP4kpt3U8WFEFVsgN+GA5YeZ2Yl8SqK9
	2GYZ2sOFFhwoecMC8T9WsXSbWeYUdQMTVMXM0HSfVUbnWUDwo46IBE4xFw1MCu1roceHvYzceoB
	3XMEKMVJZmhkcWia0nhicBwJ+oakyIywqZXBFtMTFzavRASGj91Hd6ioR/USw=
X-Google-Smtp-Source: AGHT+IGmyUsFoSszv+fFX1S9Hfb5LIc8WC5/DDJ3AFJI2cwDTPzwqnf8s2YrglMNMXLSksHQruG3ig==
X-Received: by 2002:a05:6e02:1689:b0:42d:876e:61bd with SMTP id e9e14a558f8ab-430c527fb41mr119609355ab.28.1760806715225;
        Sat, 18 Oct 2025 09:58:35 -0700 (PDT)
Received: from nairdora (108-75-189-46.lightspeed.wchtks.sbcglobal.net. [108.75.189.46])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-430d07b4614sm11927545ab.33.2025.10.18.09.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 09:58:35 -0700 (PDT)
From: Adrian Yip <adrian.ytw@gmail.com>
To: stable@vger.kernel.org
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Adrian Yip <adrian.ytw@gmail.com>
Subject: [PATCH 2/4 6.12.y] drm/amd: Check whether secure display TA loaded successfully
Date: Sat, 18 Oct 2025 11:56:42 -0500
Message-ID: <20251018165653.1939869-3-adrian.ytw@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251018165653.1939869-1-adrian.ytw@gmail.com>
References: <20251018165653.1939869-1-adrian.ytw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

commit c760bcda83571e07b72c10d9da175db5051ed971 upstream

[Why]
Not all renoir hardware supports secure display.  If the TA is present
but the feature isn't supported it will fail to load or send commands.
This shows ERR messages to the user that make it seems like there is
a problem.

[How]
Check the resp_status of the context to see if there was an error
before trying to send any secure display commands.

There were no code conflict when applying to 6.12.y.
This backport gets rid of below error messages on AMD GPUs (per Shuah
Khan's machine)

  kern  :err   :
  amdgpu 0000:0b:00.0: amdgpu: Secure display: Generic Failure.
  amdgpu 0000:0b:00.0: amdgpu: SECUREDISPLAY: query securedisplay TA
    failed. ret 0x0

Compile test was done.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/1415
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit c760bcda83571e07b72c10d9da175db5051ed971)
Cc: <stable@vger.kernel.org>
Signed-off-by: Adrian Yip <adrian.ytw@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 8553ac4c0ad3..a8358d1d1acb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -2171,7 +2171,7 @@ static int psp_securedisplay_initialize(struct psp_context *psp)
 	}
 
 	ret = psp_ta_load(psp, &psp->securedisplay_context.context);
-	if (!ret) {
+	if (!ret && !psp->securedisplay_context.context.resp_status) {
 		psp->securedisplay_context.context.initialized = true;
 		mutex_init(&psp->securedisplay_context.mutex);
 	} else
-- 
2.51.0

