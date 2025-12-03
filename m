Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8554335581E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 16:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764778654; cv=none; b=tP+ewN+1l4cG0x0kGuVCO2d9nl7o7HrxXFAypw8Btlr0ZA2UiBzPIKdZTf39AkIyEv11F5Mc8uwXeN2Zfda8ODaIa4cKcrmEcaS17YP/kqZpPBdf7QH3mKRP7JQBUIEdbqKU++biNEzWG19XNBlx6I1dzsSEs7gWK71wgmJVKZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764778654; c=relaxed/simple;
	bh=m7wvzK8n8mmykCuV2D/oT25NmE4Ik+3Vyjk+3fY7zpE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tLBzLbbsn/C4EoddFDK6xl2ucbGwWyrpnn+jPsGe/qQXODAXU7V5MAzReXcjQ5gp6C6vbWi7Nqf/JDzpLpkMP9XxNp0ub5Zaqvs2Ro60Qaprb5iUbETHPSrHUQm1LyjW+RvsgaMAIbgfqm0WKA6o8hRge3vn1F8mFE30iegx//I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmQZXnzn; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmQZXnzn"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 150764115E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 16:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xrub9rBFWyWJ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Dec 2025 16:17:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6154341153
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6154341153
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hmQZXnzn
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6154341153
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 16:17:31 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b9f1d0126e6so482880a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 03 Dec 2025 08:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764778650; x=1765383450; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f4FWWbLf21dMPxikVgw/00BlP8I6uMMKHQua6OrQ6Ro=;
        b=hmQZXnzn56fCQqwFdMu8uWLxi2xuDHUawzUCfiE9q34QClkFuNVO7/Ljzng15u17GX
         tSPjqr4/5kUvkS6akOhe7hePZD9xhZmxAp4Cbg7fqzK8jKa0IXDxdyEs/KD9MwTCfk3M
         YKiaabdgF1GQvLwha3W8nXxxGPWFjZVRGjUe8mpCpHe1c7FEz17Wp3j8T2RqY32qLWd9
         YFNNWLIt+mLtyU05LMZC0eVquDFMk/V1ZLZUvHd1+sLflZnOK5TF69a3/rEins32byX+
         Dj438BHhWQYhFekXGgUdhCzZmCRu5h7KF+B0pF/OH7o1vk188VS0HzQX+vE3qsbdB2lX
         9RpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764778650; x=1765383450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4FWWbLf21dMPxikVgw/00BlP8I6uMMKHQua6OrQ6Ro=;
        b=MLAiS76Sw+lTp4hqv3pcz2zv4Xj0wWAB8lgVzywyyMmkCjbOG0r6PBbgsrgFvWddTZ
         3rlitY6JwEV1bIAtTw0XXHuqv3iXRfZIQBBF9JNTWnDv/Tj9yo6q7Ex2zvHvMJ2x3sYe
         DaZ0eOAkcgCN5kkYwfrANowk5gtIJkwqlgiaI0ZLm0IPVJPK5Q5959ALcpI0a1IdrX4I
         wjieezla+RoQ0u0+AvVjkxS+fsGixSbRn81WY/KGn/qSR8PcClPu64h0zTI+1mBQIKeL
         1SA8+cXo+Tpzxak1KcagEUvQKd9nNgY/fZ8IUnuezBW+3qEWGHIotGAwXo76RVTR6CeR
         mP5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNqcHhl8sbNcpdt40S1hBLqc2SY2JR+SNW+0+emaFAzkjrmqz0oEuLIRJWLUo5AIxE8gvf1adfrBGYhYwtri2DKg5/qw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwxCZbp0PaxK8pNk0H9Y/qNIJksb5cS4XifxcRUsoMuuXcNKfiN
	bqhxWEwnzUlpMNW1af9QWHDvLSrZ98AfPMtkqkfljefAr+wW17Yxfrzk
X-Gm-Gg: ASbGnct3xhJAb43jQUtZIlOYC10Wr+1i2+MVNFpivmK3TgsX5W/65CrfSSlqdfyYukg
	UgAVzS4fkSdFO26atkK+UKwR/mZC8vgklt9+FO+fiPF+glshJHHDYUjYpm8M9R5Nb7ZCAKDNBka
	KaDt37Jqn5vChSB/zm/n3IMa+zkwJzwi9E+a8eTo1a2K1twfp+tG5QxXo/b9+HMvnDQPqbc+SMS
	49GDGEZJYxlHWylgqK07QNdBuXHMPFsWwaiWCv4ZLUH3a9FuZRi4KRELtYCkgVBS7pmu89ysQzZ
	bnaF30O/Pvf2EXbPkkidgvF8/xl01OJ7fiKXE8ft4+2EQMX1fJr5myp8/KSRf15vS0eHz7FQloc
	WY4sa2Zcn+iFye8pq51VKa3HEqEI1ei5OOsNjeuj2V9V+4J1NsK+NpsJhumOeHQEBX5UUHYkufz
	s19WAI8goMqSzyoC0rqko=
X-Google-Smtp-Source: AGHT+IG0wf1CCleit4IgAC/R6vQH2LL9zvgHeUegQMPxsBffDavDd2CxDbNg/AX41E+TrhXK6iC8Ww==
X-Received: by 2002:a17:90b:4fc3:b0:32e:2fa7:fe6b with SMTP id 98e67ed59e1d1-349127fdf70mr3304990a91.14.1764778650381;
        Wed, 03 Dec 2025 08:17:30 -0800 (PST)
Received: from soham-laptop.. ([103.182.158.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34912d1765fsm1117975a91.9.2025.12.03.08.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 08:17:29 -0800 (PST)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kselftest@vger.kernel.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: arm: keystone: fix deadlink
Date: Wed,  3 Dec 2025 21:45:32 +0530
Message-Id: <20251203161534.37414-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The binding file 'keystone.txt' has been converted to a DT schema.
The current binding is located at:

    Documentation/devicetree/bindings/arm/ti/ti,keystone.yaml

This change was made in https://lore.kernel.org/all/20250806212824.1635084-1-robh@kernel.org/
and merged in commit '20b3c9a403ee23e57a7e6bf5370ca438c3cd2e99'

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 Documentation/arch/arm/keystone/overview.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm/keystone/overview.rst b/Documentation/arch/arm/keystone/overview.rst
index cd90298c493c..bf791b2fc43f 100644
--- a/Documentation/arch/arm/keystone/overview.rst
+++ b/Documentation/arch/arm/keystone/overview.rst
@@ -65,7 +65,7 @@ specified through DTS. Following are the DTS used:
 
 The device tree documentation for the keystone machines are located at
 
-        Documentation/devicetree/bindings/arm/keystone/keystone.txt
+        Documentation/devicetree/bindings/arm/ti/ti,keystone.yaml
 
 Document Author
 ---------------
-- 
2.34.1

