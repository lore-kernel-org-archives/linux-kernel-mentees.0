Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25EC2A1BB
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 24 Aug 2025 18:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756061429; cv=none; b=T03bYrOuOg9RUvU/tK5VrMjC1/HxURs171oNb2TpOkNjRSvSS86FOOhMTEpeaFxtDmdT8Fnu2HQ1w9DNMPy3lRgkv42E7Q3Que1Zq9L882ZbOSbf9opPgSecBlgDfBdw+ZMO4zetellktBuwLVk81EClWdXvX+1IcYa7jPAV9fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756061429; c=relaxed/simple;
	bh=oYpP+l0GELDk8EqZlQHXsfhR+LdmE+vBQmoVZbqoVkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KRUAskZUzMIh6JbsEJPOY6P9kuViQ9PXxtxu6tKlJyV0rX+21lerJWk5hO0gdobH2D12zPO67vfIOMAeVTps6CybOjKnUOqTPCcJY/997y6xqi4qfFORA6z96DD0K8U1cMF5uGDiPhp8M+LnyLmDzV5d1lkZ3za00IHiDgBxRCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ga7Dvp/V; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ga7Dvp/V"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b4c1fc383eeso31163a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 24 Aug 2025 11:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756061427; x=1756666227; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e/I637rsQSBPccqVsWEHcQxSAsaIwGXkuxeMNEVZ+Gw=;
        b=ga7Dvp/V8Ucy8nJk24XcTYnvfqFipEUW40P9cnw8YKrr+Zey4Qz2/cEbLjMCseP9xa
         uYDm+qsO2rX7vOm9YpuEDuCFnEMAciFOTvmkTQQknHadyx3k9enXJpUCQfnkl20txOMl
         LHm1oqCmOwapHdq7GfnQbKV0eKcMzj5YzvBM8efhm7YvrY+1f+sLyI+GJLvyrGXDKwNK
         D/4Fy6KYpmSNbLy+lhMcwtzOx91tMEc5mt2JvUNk8bNBaFoW4y/QYuzdMdcfmmTU35/f
         s9ayPdNkq1Hp5VZhT6YJsYS5QwPciVzONQuGYOnqzHig155a61ktLvTdqdJypf7QOC+m
         jbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756061427; x=1756666227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/I637rsQSBPccqVsWEHcQxSAsaIwGXkuxeMNEVZ+Gw=;
        b=uOYfUmtHeooRAzoETokpDpl4bUjXCfuiDzEySiyPdmSytCJgFC6/4dy6bcF5iwCu8b
         MzKjL8Yx0gkcZrEk2MRAp7JaBX2AASca0/5U5r7YiXQcm8aVl9aGTjd/65D5oemsUhcd
         8PHt1TvRD8S7w71/ESYW4bLGc6wypxX7PFRRGu4THGceV+5dn5riXu//gxRBzdQhFgSj
         LZdsI1U8R/bcM58f5UDc0c15TqQvOc92qM2GfGcaI+HpnOdG765s0PJImfIHeDpNUquc
         6ZiAUlHw14AVUBu9jpMlHMztRgKEzMkH3yJ/mCb5jRF5U0iYseQP8P0NIx2x7ihY0+Pc
         ki6g==
X-Forwarded-Encrypted: i=1; AJvYcCXuacTTHZpbKYRYif7fb6U2ggjekVRV1v9/kE3rbZKaDgPLCtzIVUNFdLpMrd5oA2hqLmbBNrGfiTyl3AV3JCCYENJYHQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwHp41kxLJ+f9RpTL3YINmKOoSm4Coi256YOn1orQgm43t+sVxU
	e3l04V4OzCcoRbbU0Lut46A2X6sH6zjEbgZUUWPbSWaUZZtdU1iABWPT
X-Gm-Gg: ASbGncutHNwhI5ftHqaODgUkBetZwcw5LCwinPkC7lyXpZi4QabrP3h0CfM/dGvM0pJ
	Smog6xTLjLTgLoW543UdEDzlro6psHbXOZsYDWRR/4Mu2n6A4ITj025MmGVT3+U9JCYx/kkm/wM
	v7DoMqHG4QGFPd17da3IbejePdlWedG+7tLfG81C62aR9dOT3Uwz2qV2cj+smer/vBwRXxFNcK4
	W1oJ9CJd+QJRAYdziNMCx+3ueY/rjdM6fJCOT9MiXdOBW/FZAT/zenj4zn36LjG0SZmR3zlFksy
	sagXnR2ZABei+nnGAW3empUhK772VKYo49fGAk5HHuCudc5rkHm83szDTH+/2QzBVrvHgxX4140
	7zdLZ4NC15kMLZ/bnvmfPE5OR
X-Google-Smtp-Source: AGHT+IGygt7laEFN/zkAEpiLSDJ12LGPr49Rm+OrPOVFA30XtGNiFMrm/fruchKcsOcw2xI/4rdRGw==
X-Received: by 2002:a17:903:1249:b0:240:7247:f738 with SMTP id d9443c01a7336-2462edee76fmr127598065ad.1.1756061426906;
        Sun, 24 Aug 2025 11:50:26 -0700 (PDT)
Received: from linux ([223.181.107.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466889f202sm48097855ad.151.2025.08.24.11.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 11:50:26 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH] Documentation: process: Fix grammar errors in management-style.rst
Date: Mon, 25 Aug 2025 00:20:15 +0530
Message-ID: <20250824185015.6312-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix various grammatical errors in management-style.rst

Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
 Documentation/process/management-style.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/process/management-style.rst b/Documentation/process/management-style.rst
index dfbc69bf49d4..4ae05a89950a 100644
--- a/Documentation/process/management-style.rst
+++ b/Documentation/process/management-style.rst
@@ -15,8 +15,8 @@ to do with reality.  It started as a lark, but that doesn't mean that it
 might not actually be true. You'll have to decide for yourself.
 
 Btw, when talking about "kernel manager", it's all about the technical
-lead persons, not the people who do traditional management inside
-companies.  If you sign purchase orders or you have any clue about the
+leads, not those who do traditional management inside
+companies.  If you sign purchase orders or have any clue about the
 budget of your group, you're almost certainly not a kernel manager.
 These suggestions may or may not apply to you.
 
@@ -42,9 +42,9 @@ actually true.
 The name of the game is to **avoid** having to make a decision.  In
 particular, if somebody tells you "choose (a) or (b), we really need you
 to decide on this", you're in trouble as a manager.  The people you
-manage had better know the details better than you, so if they come to
+manage better know the details better than you; if they come to
 you for a technical decision, you're screwed.  You're clearly not
-competent to make that decision for them.
+competent enough to make that decision for them.
 
 (Corollary:if the people you manage don't know the details better than
 you, you're also screwed, although for a totally different reason.
-- 
2.50.1

