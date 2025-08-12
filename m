Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888D22D7396
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755032255; cv=none; b=RecDSR4iHGHIS7JYYmvJLOAuIQmW526eaeso7et4xkA8ONyoyHaaWIu+jrgMc/ca7k7KlnEaYXt7iAtmFtFNf0xD71P4wIv/05pNQaUSDNn1BxQWWE/borAS3soRAWWwQ/mpRv95pHHQZpHyFwE6Jl5oFgYC4PymwsR4/1XVM64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755032255; c=relaxed/simple;
	bh=JnOZqfn79GC53E9zM39GFlcenYz3qv5SpG5ZpKA/NzU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OvK7wapfJUTZIbGGRe/NDwmsDgjlz1qpZCEO89p8aXKezs+Dzc7nxeecttKbS6JThCk4nVdt0Mi2hIJPtSo0/NLOlsYc/nr2J6iQE42wTBlLdOL5XsUzqzS0MQ0c0uElw6SgIJbtxJYyXSM8Woxju//26DyCKBW9d48+kh+4vDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwRC2oLY; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwRC2oLY"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3199C82882
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_311jWgk4n7 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Aug 2025 20:57:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ACBD380EAA
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACBD380EAA
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AwRC2oLY
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id ACBD380EAA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:57:33 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-23ffa7b3b30so56378985ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 13:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755032253; x=1755637053; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmZthDskyxW8xzonHUEwtNNf/Dt5g4RPoLwfFwhwy9Q=;
        b=AwRC2oLYId0SGiY1ZDDYMYRd3RddICVoRm4efFwjjv7w2r/8DUdulvNnzd5y8qLIf7
         Py34ThJQdZnWx1zkQYi0KgpN3ab6L+6tltGU4yR37Hx+VqGdgyDQT+fb4SJe5sSDzaWo
         B409vqA3vzmLq89NsfLm9cgeRauWP3INz0o9wJBC/tZ4msuzxQFvN8CQgxciT1Kcb5C+
         LRPJ+4i+rrL8EDz6x/1BArXu+JdFpy9GNuZMR42bDkTnvHzEXwXyZdMEKrUSIoH0lze/
         ZrDiHyot+MkWQMMDU3DQz3IOjuRyiDGwW6ntAa9uzWZZA/f0+enIY8/4xDmere/t/WBC
         BdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755032253; x=1755637053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kmZthDskyxW8xzonHUEwtNNf/Dt5g4RPoLwfFwhwy9Q=;
        b=sbYeiepX1ptx1Hx2+v7l19J8GViqxeFVHs1SZbbumCqe10j9aeuCebi9lhKq90plPE
         v0K9DwXz4BsA4u27H/NCzMVUV2zDV+ht4WPGyQx/6uJBiswLWcWAYHc/JyM+VyFALads
         sqfwcVJV8gGP/xiiJtZVeR8qgP2hNsBd/ZyOVbpq2ulqnNub1nhr/hbAcyYNCxa/h8le
         U7bMbxXvKPSYb8pIie9c8Hm09vFKMPTgaHRNpAPvdyf5dQsYo+VSfEeyMferWOdKoYQr
         FUOPZ/zGC7N32yI1NahizzOHwp2c4kfgn9vTpuAjET9mRyDLsX7priWRjyfVO0D7P2Lm
         cvHw==
X-Gm-Message-State: AOJu0YyU5O4lcyPt6l+7vJfa0ZxDpugPSqcYl2D3BJYxtZzf4oNlaiVQ
	Hd2m1YvNAJcxciRMY94GtulNPxSO97Yd+rieaUfj7GJHFVmyDOSI1a3w
X-Gm-Gg: ASbGncs1Tm6CE327MOeqeC9nn+ZaWXJLt0Xck9vMSSmGH5mqAWVMHb+GEK3te/eaQ2b
	jiRUfuIUAEpxnLsrhFnmIhMkbtGMlQ4EdJo527BbZ4MRe5h7ed92peECTHz5wrUhjd1/66O5Mad
	V5Vt8mCPSwcc88OhaNjzd8dGcE5ANsBbS9LRXWeCUmqLygGW25N+AYZ/deqgPyyW78EPgi5h6UY
	qGBfx9dQ1creamaiCancaPpexPF2ngAX/Bem6ISLCwb/6oNREDpvgdOMeJMHvdTWnETIHkpi/4q
	TaRJtE/QFfAiQBDx2qwpCZ+Kt3btMNMsYxnHhYNassMlYaXM+PXD0xE9fK4AqebNkBqoguYN+V3
	7+3Ms5hd0si9eMDbTlIOEzLo0tBZIZTI=
X-Google-Smtp-Source: AGHT+IGM8HIEu1Us+IhduzFnSKT/JHu5SzuX1gQ8aLIHirIgj5NNt0Xh4sirRZhZrb11MwpstkGpoA==
X-Received: by 2002:a17:902:fc50:b0:242:ff89:d724 with SMTP id d9443c01a7336-2430d2271a2mr9643995ad.47.1755032252911;
        Tue, 12 Aug 2025 13:57:32 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321d1db5cccsm76048a91.18.2025.08.12.13.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:57:32 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Soham Metha <sohammetha01@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 7/9] docs: loongarch: fixed spelling mistake in documentation
Date: Wed, 13 Aug 2025 02:19:50 +0530
Message-Id: <20250812204952.73136-5-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812204952.73136-1-sohammetha01@gmail.com>
References: <20250812201523.69221-1-sohammetha01@gmail.com>
 <20250812204952.73136-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found/fixed the following typo

- entension -> extension

in `Documentation/arch/loongarch/irq-chip-model.rst`

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 Documentation/arch/loongarch/irq-chip-model.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/loongarch/irq-chip-model.rst b/Documentation/arch/loongarch/irq-chip-model.rst
index a7ecce11e445..94ed2858a570 100644
--- a/Documentation/arch/loongarch/irq-chip-model.rst
+++ b/Documentation/arch/loongarch/irq-chip-model.rst
@@ -139,7 +139,7 @@ Feature EXTIOI_HAS_INT_ENCODE is part of standard EIOINTC. If it is 1, it
 indicates that CPU Interrupt Pin selection can be normal method rather than
 bitmap method, so interrupt can be routed to IP0 - IP15.
 
-Feature EXTIOI_HAS_CPU_ENCODE is entension of V-EIOINTC. If it is 1, it
+Feature EXTIOI_HAS_CPU_ENCODE is extension of V-EIOINTC. If it is 1, it
 indicates that CPU selection can be normal method rather than bitmap method,
 so interrupt can be routed to CPU0 - CPU255.
 
-- 
2.34.1

