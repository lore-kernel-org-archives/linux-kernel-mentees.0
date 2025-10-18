Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478CC225A29
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Oct 2025 16:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760806722; cv=none; b=Bq/QOgjh3bqLlA2cg+0+x/61OIncLa0L7wTAC9Nq9L5gSm1GvMFuWgzMSGgI6ICtfTtkdBsw1C+v8ukIDOhgzyyEOW+hqaf0cTmathEIp7Zx6GabDtoUMVMQ/n+lBqtARAnqxGuCvK+cGfgM6ig6Sxv9w8M/xewBQrX59+qBS1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760806722; c=relaxed/simple;
	bh=23ewjXJ3BzVpzfN1aBXik27sMddVr01HXAy7SGZ8tU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KADKBubgKv9H2YGiNXSDQxaHAxXZOVz2ndykgAEDr5kzf1IsULtTn2cMPGh+13p7Y58Kx6e4dj9rervFFGP/G+tR34P3RS18zb2xTLSzBCN3v+Vbwb3Yx+9QyrbhXByCfXylaA/IusuteqetbavzmMA54Oyk2fvaSGBR9Hn6RnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJ9PqTTW; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJ9PqTTW"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-430ca4647c7so7245585ab.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Oct 2025 09:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760806720; x=1761411520; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEET0KVM5chlyitbvvEN7T7JusMwE1pBm8UXQW3X9tQ=;
        b=gJ9PqTTW0h2F89h94QDwPQrOrm5doSW2MsES0FtVF6gMSy5tCc3GxA7DIXfg4CD1qC
         AsDxOUfKrzxYLpQVL/WYUKxyHfUBlvW4bOvpqt+OOoQ9Nv3MjFcPVu2muXvg3mt8S0NS
         k6fRcF0YBawpv5gbwJGDe5Jmg06wB39g/6J9E9pMTg1dsvvGA1a7NKsF5Qguj+WkZwny
         21Ca8qGX5viS7sdUfzM/GbCI/jR2NMPLQv/pWK+W5qHI21+xUVJY76hgPxVJt4/ZfliO
         3FB3/Qfgibc9OwGPFzvPQ+RWt90P3qILZkMk0NUzF3Zn6Td8HEkZdB5xVz1movuFm1Ls
         5SYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760806720; x=1761411520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UEET0KVM5chlyitbvvEN7T7JusMwE1pBm8UXQW3X9tQ=;
        b=XYOFyCcD0lQvWvuLnrgsskyFmPtvKv9TwpuWvM25se8MSlE2M3AD2y0Dyz8yL8fa4N
         FgpJtxexdUdNEIHk59n9hTqJEmHtgH9gXqZ9/yefaUHXutj5KRDvl7o0i4apkR0eEWUz
         gaaSKRq1443c23HIAwuneRmpVrvfdAqTn1yYySYnffSva4CGHZ25m/r97nuLDp8GVGe5
         xqTHfzTSiSq02eami3d4eYKfZFkQ1VE4iOXgp27TzIOKRigXpWLTObm6u6vYciR3ykgc
         SUwcN6FhH0XBB/910r+bwFHmgAavK+hLsTjw64H74xWEJCx5o83tp205ytgjJavxqRm9
         kTtA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ+k3GpbNuFwX7lU3rwe7x7gKEIzyFyco9SsjoU0b2XqYKufIGhVUbZ60a2beD7J+kKC9a9nKBSN3QI9QpUfceedpu1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywd/Fi50NJp2aFw06/S/vxNFVzXzlE4944jUMdlov0Lv2+oQGK6
	Yo4pGgd6vjZi2wz74Blc416U5DwAMau9CXnDeL6MDCDRHdej5nmjQ3/R
X-Gm-Gg: ASbGncvexcTtGGoyMS4frJSL82xOWllUhrF+KuTGQXAAiygNwQob8bLUr1m/ATjLro3
	BC228USizsULFnQoEHZEgZPVdPEa3kMmwm7ElOnyDRWtTSE7z9gMPuNupqaLGSCgAirsjrT60gb
	V6VfSTsZ6fZGO+Tv01JwIctjkOeu+QeGHAHRhXXxEXGtJ6WtBQ78xRhp8LRwNiAamyEbF5aa4AA
	zpc7h+wiWwv5VnjC0jD567n8ZnO592QwNqKfUmqT7ESfAoQOokJ9Bw7lzfmoZNeyReDqQXSuhhw
	wNZcYSNTS7a8KGGp+RDsGU8KfWBXHy7JqLact6fUTDtp0HGmB/JL/Aws4CAxmyxqgX3B5NTtQrV
	sMRELOpsYY7GHDVAaD0oP5W87hEaY2TsEquagTLRq89C8wpmyMv/NI2Qq+i11qhkLJ27XgL9BdP
	vK0kumzGw17gYCll6z2U4CisvRd1dnpScwBEXymXxzK1oa3pf5SB0ZPBpmSM8=
X-Google-Smtp-Source: AGHT+IFCNSF9mGRrBZYYhBS2A8zvP5w+BXMIBNv8w2krK5loOYKHGlSyH3pHY40YSUNyYon4Zl+PSA==
X-Received: by 2002:a05:6e02:2167:b0:430:ac80:7fff with SMTP id e9e14a558f8ab-430c52d772amr110212355ab.23.1760806720345;
        Sat, 18 Oct 2025 09:58:40 -0700 (PDT)
Received: from nairdora (108-75-189-46.lightspeed.wchtks.sbcglobal.net. [108.75.189.46])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-430d07b4614sm11927545ab.33.2025.10.18.09.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 09:58:40 -0700 (PDT)
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
Subject: [PATCH 4/4 6.1.y] drm/amd: Check whether secure display TA loaded successfully
Date: Sat, 18 Oct 2025 11:56:44 -0500
Message-ID: <20251018165653.1939869-5-adrian.ytw@gmail.com>
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

There were no code conflict when applying to 6.1.y.
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
index 0bc21106d9e8..e22eaf9d450d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -1959,7 +1959,7 @@ static int psp_securedisplay_initialize(struct psp_context *psp)
 	}
 
 	ret = psp_ta_load(psp, &psp->securedisplay_context.context);
-	if (!ret) {
+	if (!ret && !psp->securedisplay_context.context.resp_status) {
 		psp->securedisplay_context.context.initialized = true;
 		mutex_init(&psp->securedisplay_context.mutex);
 	} else
-- 
2.51.0

