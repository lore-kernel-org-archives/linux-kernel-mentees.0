Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC78F23C505
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Oct 2025 16:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760806705; cv=none; b=LZeS+IfwAv4v4b0ntP1GRNJ9Ko30sdqy9Y7FgFnstalbfbI3xlPDcBu9W47PZdL1DPf0PbjVpebCzMVOh4IIkl8PUr8zWnW2pn4e4vfyIgwxgxhBXRsliBU1Erb6J49r+IMzrJKjmNqfBjMqOwoVg9PUfV29HkgLD05n80q4p0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760806705; c=relaxed/simple;
	bh=4SufFCPXmxpkslZ+FDy02vXkO1ooFHOQKGFISivorpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dQMli7oc0Sg5jRtZ5+Zef3m+ENztUl8/NV6iqFO3rXwMc3Fir1HJa14LcHlFIqMZYSqgwo4+ICrtnZGUrlZKUIgJEmAggZp/Qy7zvB2Oo9ORkJ8o3Lz3qL4P3ydJxCZOYzqPqui1lZw56teP34cafWiShfUwooAKRh6bwK6eFd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CE8AjBdQ; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CE8AjBdQ"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-430c97cbe0eso13831515ab.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Oct 2025 09:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760806703; x=1761411503; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UU0Vaz702n4jmmJNBsbiEKHEOlTcHaJiSdld/th41J4=;
        b=CE8AjBdQqVTsWMJw4052RLBJc9AxmQyj47BRt6SCszu6o7jJMs4Igbi0OIOFvgRUDt
         9oZbkDASXIBuVbzLf3/bc03DjWJyq+SQcwt1AIABiKWHYrb+D8k+l1UtHp03l135vjev
         pVdmRI6k2pJmBhIewR/pBgxYFobBh9rk/M+DVnv9tvneFoQ8x1uSOCYpbElG5u5ZFZ18
         Y2uArmSDaQN9cKPquiYoZwggrGx9VUNoCpbGDfoie+UZGwVrDw4gq/C17ZSfuWDXP/oW
         1DqtfkXKf/x16cH/RpgMw4YJgm9xNz6oGWG6g3s5BFe898R+B/vVRxOhaGX2jVMjyChS
         uLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760806703; x=1761411503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UU0Vaz702n4jmmJNBsbiEKHEOlTcHaJiSdld/th41J4=;
        b=WVHFFW4BdimXbeQvOfbFFuSSHi3OWgPXdeYpKqw8nC+C3z2Dpv74I7JKf/tgO+6BSn
         EqmzKAemntBrJh1GoK9DWXKOi6Szhf+QTczXjW5V0oMS0roaUjdD0unhcrgDZX5a5Z7M
         aLydkILoY5mALh6t1NpFP1uWLAyIRHZQgCOk6ZchzW0v21xdyRtvp/DE80GN7Gch9jun
         yWpX66hI79o0pODIbUtMHTJT21LKnJ52qrRnKzC0TAWmsFC0061OWwMoKvFBiEP72zVD
         p+QcD4/A2o16pTXE6l1Oa8zkeuoIdhcT4tjWK0/5/IMjjJ1AtWkbvarL9j16W6VyrySG
         M+UQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5BHpLARNsDrlHcWCvVGa8cAX+n82HFBjCnT/IYguOR/+w01VJLA2fAR4+j8HDeFAH2BS5XVfEYrLKuk3fpIkEV/+2Lg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAmJzddhdUtKttUHe/JPdhhUYLFV0crClYR8qCBpQEQ33HScT2
	GfA1EXh7jOBjqZ6wEVnx+RuRk4v0xQL1hy1Wjt3d8Vo+XIVCYPl19GjX
X-Gm-Gg: ASbGncuK2OwX17nVlpS2AxLc6+BJpwEAdKr5C5ipU0a7lV0TdkPO7/JL4j/c0nMVmgp
	lDMiIiXLWw+B0NRNHTUyulK6KTLDdRXKR1fkEHq8AErnEWQ35rOSKpCM4nvSxEjBy9EzAMo8s1b
	3/itGMbQO8RrXMbEaacotZdJd+SeFP8+OLFXQColIkD47rv17Sj6t83AB2s6yb+ly2fgzgGQpHN
	uBaP3fvoIvZHx+wggw77VNZlAhrQa3YQHI89PRkv/tpFZF/xtJmYvTSGzyvPaPwkAgPSihaC9x1
	WX5nXIQQm8b5V9Y4WjIS/fSkEsjtV8I6cPVcxJDirqCTFTZoLZCai3nZRrWlsSK/Q6arhWW55eH
	INmTCHb40+qKc/S+G4fzc/OCJRcCD+ABPvbe+bp6QNsoSGwDK0N/WGd5OF/unztqq8gDcwY5byh
	ZZxLSfBCA8fm0b8cuiDyuQSJOY238Fe9PTxIjmQ/LV8uCfAfDJ+KGHuROKBuw=
X-Google-Smtp-Source: AGHT+IHKaSv3O3IeWubXsR/NlCaA17Q7Uvpw8Ni/C5X6m8p/2C/Y03YluZFi07O36GktyEubOFY4zQ==
X-Received: by 2002:a05:6e02:1d9d:b0:430:ab98:7b1f with SMTP id e9e14a558f8ab-430c52beddbmr124046415ab.18.1760806702718;
        Sat, 18 Oct 2025 09:58:22 -0700 (PDT)
Received: from nairdora (108-75-189-46.lightspeed.wchtks.sbcglobal.net. [108.75.189.46])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-430d07b4614sm11927545ab.33.2025.10.18.09.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 09:58:22 -0700 (PDT)
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
Subject: [PATCH 1/4 6.17.y] drm/amd: Check whether secure display TA loaded successfully
Date: Sat, 18 Oct 2025 11:56:41 -0500
Message-ID: <20251018165653.1939869-2-adrian.ytw@gmail.com>
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

There were no code conflict when applying to 6.17.y.
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
index 693357caa9a8..d9d7fc4c33cb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -2350,7 +2350,7 @@ static int psp_securedisplay_initialize(struct psp_context *psp)
 	}
 
 	ret = psp_ta_load(psp, &psp->securedisplay_context.context);
-	if (!ret) {
+	if (!ret && !psp->securedisplay_context.context.resp_status) {
 		psp->securedisplay_context.context.initialized = true;
 		mutex_init(&psp->securedisplay_context.mutex);
 	} else
-- 
2.51.0

