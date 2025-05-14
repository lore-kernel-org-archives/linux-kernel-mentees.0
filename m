Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3F81F418F
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 14 May 2025 21:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747258582; cv=none; b=kW56L9sG5ZmepDxeBTwn+oqjgIW3XqgEFSZ8+4+CQl29VzyPYuEwHjlyKvKANoXHLehUzfX7vlCJmHW/PNUvJ7dZH/7ive4hGYwLjGnfqsr1LjO8NDZXJ04imCbwSAMP59uJNEHAIjthRVLT6Ic6qhTNPEh60egAagQvfypZA5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747258582; c=relaxed/simple;
	bh=FIQf+pI+HA3ZvOhS2Ssnr8uj7ZeK3pm+nL4eDCGxlqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XrWagEi28vB6EKo0MqjwZ2fl7Y4dy/yeqFZWWoVY/8PHl7Tibv4RhOzTfuY6kjnTRsSA9NkiX+a6QDvgv/vx3G09a9hfCKnG8fkmcwK2rzCjv1+1yROlyB92S2ix4NCma28sH9Njs+C3EJqQkgT1MmsidGul7vByDpNXL5vIDQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+KxbTsw; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+KxbTsw"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-30a8cbddca4so355220a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 14 May 2025 14:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747258578; x=1747863378; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v5+DNS9xaFvD08mwIBHjANTPXx95oyivENI1zztffOE=;
        b=g+KxbTswg49RevtOtey9y/E3GhUjEpvTrV7BOu0kQUtLGtw7w1PPPhDTTmFm7BognO
         M3irs8KKcl+kQO40OT3mhb23MPAz4kond+qMb6RDJOYrGKF6wpx5iE+4s3ZeZJNJt9hk
         b0sXNhFfOQjIUJQrFNNw+gFxhqKuRysSd+pJ55w0Wq5CDmttgEd0OoDucbG2FzZHPkXE
         FWcDhNYF7c6LRtZOawwXwJep8PJJQC5lCexEzmCaKSwkDYjst2fbHQKm7gwjFD+SLQSG
         i3pPQE68ckol1moYkbbBTUxny7DwhYqnpCTMHGFEOUF7PFghQl6mKkY5nT3QKP711SIg
         hPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747258578; x=1747863378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v5+DNS9xaFvD08mwIBHjANTPXx95oyivENI1zztffOE=;
        b=V0UKbODGlfu75fcoeukyeBTjrdU6BS3STFnrjrU3/TvRTbWdwu+pkLpWPuG7dH+znI
         qLl4Y1zeNdMzProGTb1xZ7NOGwA3mWPk9ITnz5Lt02Jqx4ISn1tx7jYjxHDE4GvorZrn
         9FDs2IxPASSXBHA0RDw3H+H+ZP1ebnEYxoCgEGSAVU4hyzAaCGECqNVQWijKkOvZmP81
         UrX/zRmsnhD8SmoK9+E2nroUfAUMTU6IdPtMzy9Bots5F37fk9bdsGVdBHO98baDhwUs
         wQLbnTcbuvBesWeCDzLmIScAdtYugZ0NIuMKZoNyWJ7ybubh/mZX6ReLclbToGhLSKPg
         1E/w==
X-Forwarded-Encrypted: i=1; AJvYcCX+aDe4axBDnQiJj3sCmJ/lyJouKiCLRVEYl8UjrZAZH+H2pL0AVhn84TwzMSb7690lfkv/igywL4W2bJIJlZdK1ZEyzQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwvUD69canfwUveLymxb80BVwf3tm2p6krr8aOt9hHrGu0J+K1r
	MyQD3jAGSaUj+HuqY88ZjtM60YaKpJXmcKKMg/8+Lw3+v8SjvBHd6fwvMyFJyjoyiA==
X-Gm-Gg: ASbGncsw4RcU9bXUP8zao53FnBJbPpWwQ1j1/fFVu0lfcVEpSQ1MaD1AGOy6KnEmusX
	KXhE80Y/BnEH67SlQ+OhsKOtAE16mHPTCB/EENmeu92w2tTYLtsO+L1d2R3srer+xQMyKn+ypSh
	tzESRCEY2zdioWQpKZkiC8VP3WRA8y8btW+zHM3Zz9DZe8e7SuqNKMAz42EJsuxLCinVQYWWpRB
	oijHWq9FPOdPhoVrE3POl4s1IubYED0+YLFrpge58jLUEWa/Ug9XPZS3LaWDCraklWVrbQkS4RL
	JllRWAh6Sv1WJfRN1edAzTIhdRckqqpbdNmKdvy4PhBVkfivkXXJjdyH++t2sglmqA==
X-Google-Smtp-Source: AGHT+IHOlcKTEqpmbbwYa6fymXr66iLa7UzzLeEx4mTbWzk9LmvInpwWaQApBbo8ZP8SyJLL2+etOQ==
X-Received: by 2002:a17:90b:1c09:b0:30c:540b:99e with SMTP id 98e67ed59e1d1-30e2e5b678cmr7925932a91.13.1747258578130;
        Wed, 14 May 2025 14:36:18 -0700 (PDT)
Received: from rahul-mintos.ban-spse ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33425194sm2026770a91.14.2025.05.14.14.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:36:17 -0700 (PDT)
From: Rahul Kumar <rk0006818@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	skhan@linuxfoundation.org
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	rk0006818@gmail.com
Subject: [PATCH] docs: fix doc warning for DC_HDCP_LC_ENABLE_SW_FALLBACK in amd_shared.h
Date: Thu, 15 May 2025 03:05:11 +0530
Message-ID: <20250514213511.380890-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a kernel-doc warning by correctly documenting the enum value
`DC_HDCP_LC_ENABLE_SW_FALLBACK` in the DC_DEBUG_MASK enum.

The previous documentation was incorrectly formatted and incomplete.
Updated to follow proper kernel-doc syntax with a full description.

Verified fix using `make htmldocs`, and the warning is no longer present.

Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
 drivers/gpu/drm/amd/include/amd_shared.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 4c95b885d1d0..ebe0caf1fda4 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -366,7 +366,7 @@ enum DC_DEBUG_MASK {
 	DC_HDCP_LC_FORCE_FW_ENABLE = 0x80000,
 
 	/**
-	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW
+	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK: Enables software fallback for HDCP locality check if the firmware fails.
 	 * path failure, retry using legacy SW path.
 	 */
 	DC_HDCP_LC_ENABLE_SW_FALLBACK = 0x100000,
-- 
2.43.0

