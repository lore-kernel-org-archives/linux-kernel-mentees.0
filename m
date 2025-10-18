Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EE81FDA92
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Oct 2025 16:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760806719; cv=none; b=aPvvLkQEwgNDZZqtV/js15nWM7RQds3/EOf11n4DgkYkfFjoZuAsVjeNwgpoofF850fq8AoOmad8cHGYhko4k7Vsgg30qha3/hwNfcquyuEWDJeCcaIYdI//6yraF402lcYV95FvvCltGrsjrqz8MXOkyI/yElkWkjxLiL532jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760806719; c=relaxed/simple;
	bh=gL9tcVKOxeXgCuidv9aJaGiXfxgPIHPCk+ZE6JBKV20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O5nViehsfJ2ImZBhyfH/IVVjvrZwvjew88Xh4EBfd4kKR4R5DLny3vHCKTM9u8SU1CUyZoFz/DdTWayVkxhitXhmKn1oaNacg3TJan4oKvcKy4dHBKjJXxECsRguXb7aLdtTYqv6XUXRDATVSnlkcsX/z9ILtb/oRJ8fncknoRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMPELJfH; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMPELJfH"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-430b621ec08so25838735ab.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Oct 2025 09:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760806717; x=1761411517; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbSrfLmeKcMiAn9HXZUM+zX/zHb68gILBq3d9ts68KE=;
        b=QMPELJfHy7Qh7Gu7OpxE6QxDhwQjqdfwhoesqT6GfEmBB3gNUZYeu/60IlyatfCEVT
         a2Md/2lNRKsPjvecGVSjUvzymyZVAJGmIcOzGfW6O394Fs9HMP/bPQ3rh9kxdBBXRIST
         rXyvKH58uZJtbSMojTFFjhZ06h7RAbwF6RP/XZpyunbNT10CzdcL2JG91FWcKHRQABIV
         WZE0MT61F2D5suLhCnas7az3uuPjDzZEnUS3qpinGHo9D/MYDeNiAIgiadwRcByRAz17
         xWmMtsKbDtDjGGpG2XvvVf+pJPESvq1OlO9nAoZy2hoR9MDw11G57dNAvADD7Gpk8rer
         oqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760806717; x=1761411517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TbSrfLmeKcMiAn9HXZUM+zX/zHb68gILBq3d9ts68KE=;
        b=WhIYFNVWPtH1O7iMnh2tMg5cR4l7LiG6VMgcAw8F8bp9fWZBaMo9WLjaEIdaxC7Tw2
         Ja0nrPCecLvaendpxLlHx9woIyB+Ae6XyLzMwuCE01XnqzPDQyiUL0GnqhYgaDZWxf/w
         aGASzktgIY45jmFRyW0A13iKxdc7XEON0bstYFDcdZoiIAyggv4nC/FJIw8AElVx3+V1
         Ou+HcNoz8sJuqQYPzuS694MxXICYGO3BjPwjmeaAD8PZq0pqOufs8to6OJ2nrYw1vM1d
         QHxSH+4zK/y4TOciBCJHoUTk+l4tNIMNUzFbMzb1Itrb4Fd23yIkDjVSJ3jCH1bp4Wb7
         bfOw==
X-Forwarded-Encrypted: i=1; AJvYcCUa9AveBkNGPAsgvD5CSkyfxsaNxWJBNDkYrKuNZiC+qSCOfNV0s4+dhi/tm4+IaGp9Ss7xeJo8y56qHyFPgHIv5KKZAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxALIVW6yQYsR0ADpkygri3hIQPF7m8HxfaL0EHQ09AGLH+IfW4
	NeiLskFtvXjCtIsOHlm0up+pnwnOA9y29/GA4xlYjlwIgTe572ECsTy2
X-Gm-Gg: ASbGncsll3t7mdC75f7UsxqgYaAMjcgFRybVZtnBu4Zft+B40RBhvYsRswW5GHKveH2
	oO2IvMSMu/s+KYTuOlBMJ/7+KCP704K+35EJQzB9or789RQlPDCgG2LVchNhZmmscTbkw2KPpTH
	4VBPe5a8uootdqFmdJ3hvHZHRkvxu9BBhJI5cuGr+1/1S8Wih9qfvdseit769DqnH+m4DOo4hli
	qYaIFbvAhArEEbcDkOSv1XQ1A8HFSqqEvIv5s/d++ZFvXcFXM9UFs3lShz18bh9rv1PRqORYzxS
	+l6SzTUTOq5UctbXOBUgEpj2mhfakRA65kQV459YSp3JpZDugmvPaYN+dwga4/xmRBLWwKLESva
	9DGTPSuMqY7+YzygdOKsuxSZIFuUGAEzVT+q9ACEvsxN5S5vqYdyBij2aK0LmzhHmwBMw2R4e2J
	TRHA1fvqs4ks9/uIRi+aYvqfywaq5MrsyQ2ju7c1JTIcZKKjhF
X-Google-Smtp-Source: AGHT+IGCPrlS5P1TWVELOp/T5kfwz95pTEDtxgcUCwy5VZQzXvfWE0A/oqrGl48WeOnrTW9OQciO+Q==
X-Received: by 2002:a05:6e02:b2b:b0:430:bcef:e0a8 with SMTP id e9e14a558f8ab-430c529fb9amr119407455ab.28.1760806717551;
        Sat, 18 Oct 2025 09:58:37 -0700 (PDT)
Received: from nairdora (108-75-189-46.lightspeed.wchtks.sbcglobal.net. [108.75.189.46])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-430d07b4614sm11927545ab.33.2025.10.18.09.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 09:58:37 -0700 (PDT)
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
Subject: [PATCH 3/4 6.6.y] drm/amd: Check whether secure display TA loaded successfully
Date: Sat, 18 Oct 2025 11:56:43 -0500
Message-ID: <20251018165653.1939869-4-adrian.ytw@gmail.com>
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

There were no code conflict when applying to 6.6.y.
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
index c83445c2e37f..d358a08b5e00 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -2012,7 +2012,7 @@ static int psp_securedisplay_initialize(struct psp_context *psp)
 	}
 
 	ret = psp_ta_load(psp, &psp->securedisplay_context.context);
-	if (!ret) {
+	if (!ret && !psp->securedisplay_context.context.resp_status) {
 		psp->securedisplay_context.context.initialized = true;
 		mutex_init(&psp->securedisplay_context.mutex);
 	} else
-- 
2.51.0

