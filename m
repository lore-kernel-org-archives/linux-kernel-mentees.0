Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C705B1DF98B
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 23 Jun 2025 18:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750704462; cv=none; b=RVL2gurwU4lMV7laglWbeqO5diPL6BEtxPOw5oz1DLRnUmxuFb+MMFV6VucYa4zs5hUWkOa+E2+mBx/SClEyb9K8q13AmV0SjoWAXn6TgTGregUvvGqoSQgDEQSN1QsLly3L8gJIYOMdi0LrhXkIl6Ri38DDIfX3m3Xo9A3KYJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750704462; c=relaxed/simple;
	bh=3rshOR7CPuXyaGwHcakcso417Fg4JBCnCi4RyECR8xI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SkLZpchcAMDsTbwSkblG+hqnE9w88fICywrzcGAGV89vDGRZnbw5FCwq1DS0WVUxllItKcYMWwvSrsVAFcnVLLho5mWEoR6MLKjXTAjo6VjzPO/yGkyPN429k+r0blfyXAPJvuxTb2V0dOzvI96YyhP9+UgjpO0wHpYUzrA+tKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqJodWzR; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqJodWzR"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-235f9ea8d08so46236145ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 23 Jun 2025 11:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750704460; x=1751309260; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lX1PV8eCj+w6gmSly9JqA8eydGEbPW07Za33Kr6VYKg=;
        b=QqJodWzRi0+8OIBOm2vvbsCg+DQNvsvDR1TlobRMENgLd3YkokAGtFCauivOhkuBr4
         PWiMZRClaBmMEmEvFi6fMT42q6ZIw0nr0lhfHgHYz2zait8EJnjLFTXMKMr1/COlGdby
         GwGA7lhQP7YbQW4j0Ieb8IOc7WlgWKKKEQ8z28jaPHpg/6TypBbf/tvZdrKubKrHpnUZ
         xxwYba8LllLVI+SGDSTTt+oyicn/5lnNTuLGUtEuBltM/CUpw4jzsqB485S8pO4PsP2L
         +YRdKaQXPfr+LE0IY5+V8z7HDHG0f8YX5a83NVdjc9g7bxORiVX9K1/qj6C8/ZLKo5WI
         6H9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750704460; x=1751309260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lX1PV8eCj+w6gmSly9JqA8eydGEbPW07Za33Kr6VYKg=;
        b=hv3kpGyV8rSMBT3PcU5QGapqq0fGFI67ZGkwE2yOOly6RninwZ1a+1DQWXJ3W5LDNV
         R9q1YLHEEL1rFPuiEasaxq4uUITEqWXpSfMhUaPOoUoK+OvBq1rptfNbj2VupMVb74q8
         LhpSKpFmZb/Y5ucwiK8zGKx0pvV2rQxiN311SC08gBJcbZegYdcM1HHj/fXJu//6oY7+
         tzeLK8MCKxKmTvIWi3kqpmY2HxPinYAKQjIxanrHSiPO2fMo+bb6FVg3CN3B8D8pOPNY
         6RMBlhTcVzgaD96s2J3kAbQhRpVIkQabVZ+3MN/iM0pEWGQ+4w4gDV76e/9pgqJBHyGu
         b18g==
X-Forwarded-Encrypted: i=1; AJvYcCWUj1WR67RcLQgrYmcJjPsZ2WrNhngmGxQFAaASj/EgIfk+njVHIewOlp64aeu/kL30cJarbEBvled/jsIHcJ9sBDr+ow==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5Eh0UQU5D5miwtXwER8qPpaPt0ZZOsUk7TinmxzacvEByZI8b
	qeYqcxqPw+9L5A63Eul+KhUpWWSRtUFtWQ/17tezaQ3un/JN7Z2pztur
X-Gm-Gg: ASbGncvPZH6PBF3CwaXzJIJdS67f3x7PY8JpxFyIpMtL7ckTLuhwjnW5S31iGbpv0uO
	lBG5LKzokqdq6KUvsU9OtMAiwn16y8L8wNUfM9QtpF3BXK6TuZufjM6LSfRTaVPWLpbyGfE4jZd
	pJsICR5NTltagfZZPv56CJKDCmPusTFp+NSWNZy3Mqurp7h4jmoF5yl5VsBOq/nhXWd8SmW+tRz
	EX2tid0ugZStsgeFluVZmRQy701ouEz1nHliEgbmFQoQM5Oa/414zNA22G2l8VpaBz+RMu3rgPl
	pJ6GVbJd91xcVFP+6TNWodq4kqwKzCiLs+u+OD+BNhYcoZ9xl8dXNYq7LMC6WU8JwxuCEbPthKK
	hNAG267ZlpkJCw2EHVRsUL4pkcjs=
X-Google-Smtp-Source: AGHT+IG+q7JDDjJJiD6LIsW+SwYhlGS8aClQvrcI6niGs17mM8MdIZ/h4GRG4ZubHXABG5IObcnk4g==
X-Received: by 2002:a17:902:f64a:b0:235:6e1:3edf with SMTP id d9443c01a7336-237d9878c08mr226699925ad.34.1750704459951;
        Mon, 23 Jun 2025 11:47:39 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:229b:2db5:edc5:d79f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86150d8sm88037745ad.123.2025.06.23.11.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 11:47:39 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: robin.clark@oss.qualcomm.com
Cc: lumag@kernel.org,
	abhinav.kumar@linux.dev,
	jessica.zhang@oss.qualcomm.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [RFC PATCH] drm/msm: Remove dead code in msm_ioctl_gem_submit()
Date: Tue, 24 Jun 2025 02:47:34 +0800
Message-ID: <20250623184734.22947-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the report of Coverity Scan [1], "sync_file" is going to be
NULL when entering the "if" section after "out_post_unlock", so
"fput(sync_file->file)" is never going to be exected in this block.

[1]: https://scan5.scan.coverity.com/#/project-view/10074/10063?selectedIssue=1655089
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index d4f71bb54e84..cba1dc6fe6c6 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -904,8 +904,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 out_post_unlock:
 	if (ret && (out_fence_fd >= 0)) {
 		put_unused_fd(out_fence_fd);
-		if (sync_file)
-			fput(sync_file->file);
 	}
 
 	if (!IS_ERR_OR_NULL(submit)) {
-- 
2.43.0

