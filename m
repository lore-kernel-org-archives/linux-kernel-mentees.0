Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B48D186E2E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Jan 2026 19:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769284326; cv=none; b=MZ+9j/rgENIPlBBQ1pgw4K0L7nFoczxeLrEg38cnq6GPG2DLfijsUf7koA0PUBWJuz1MV57dag7kumJ2YBuQCy/Ded0A91ZEDgk8B0aNBKgixBNA6/ltyJW7/R9668WO+m/X9PW4o8pAWU49IJVLtHHtQSet8dRLfYLqrwQ+Hb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769284326; c=relaxed/simple;
	bh=ToXKz1e3D8YTvQIW3+wzPHkMcNqabbLvbovrv42SZIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HF00tTRvZ9FjSK5JrmJT9s4jfJtYTogk+M/x4kSwkRQFe75b5uh+/7oa2nhPYrB682LloOLkVMFnSi+X70hGBRPTh2BpStQbnVO/EGF1vuCvx0xemEIn/D3RPtGtHG7rSI8sMrsTUF1NOHSTxX4gZoMtRGHQAfVFxi6ry/2qpek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJ7gRIk7; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJ7gRIk7"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A880401EA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Jan 2026 19:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ePWh59jb70tE for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jan 2026 19:52:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=eshwarsajja20@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5633940188
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5633940188
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kJ7gRIk7
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5633940188
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Jan 2026 19:52:04 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a09757004cso31850545ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Jan 2026 11:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769284323; x=1769889123; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tEkyZOAF4IGkz57aWFm6zH4thJFfrrvcd8nwhk6IoO8=;
        b=kJ7gRIk7gNT9O79nTL7Sl98PWKvX2CCH+z1RkE4GV1flL13VatUQ74bQzYciFXitoN
         21u2o47qWeNxCPnqb59f8e8SDRO5TvhSXZ6WBfBd/KH4uxuJh2WkFyb45Hhcsr45KUu1
         j7yn0TE5bB5hwA68Awb9cB09r0D38koS/tISXxg1O2bczOFDgcVDaAHJMaCICdwHzg3T
         w1cjJwpagUx2qE9uXpCeU/9dGrP51PABIqDlzVVkE906B4auoL03O2/FlCMkKSb4eOGb
         RH09e1Sfeav7cDSZlZ2zDjug3+qBf0NjEZAp0O04KWCur7W9ZyRFD5CBp/lYQA+YlfWf
         ZsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769284323; x=1769889123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEkyZOAF4IGkz57aWFm6zH4thJFfrrvcd8nwhk6IoO8=;
        b=LrLaajPA5cHIGb8NYr8E/6xt7LVi+JHv9zNlEArIJkNRwqLwB5foIha/c8yUDpz6nl
         W/lS3s1EisElUEUKCOyibhelsmm7r3scBRIAQ7OR3QJoC7EgRK9FkReLwJGdPfAQvFC1
         1PwTJpFTOzuSgKJeb5HXppaxpvE5968M9TgvCGYxgcvZD/1oit07CI8SX1jthu4Bei9b
         0xWG14nYj9d64XodMe+LrTXaxhC6yBXj4xIRzthwp5L/3Vu8R5GMrh7zztNeKtpwGmY8
         DcDzotFigmwz/unqAL+H83Ab6F7GUZtOzSmkFFXN1pyXoWJwDlIfg6UGm47etkFuqoJ5
         n8JQ==
X-Gm-Message-State: AOJu0YyLcreEfsZRYQq4umRd1HBFgXATQpvVwaJ67l0bGWxs8Ryy2Ezt
	8vJvqYn2XlxZFSnaglzaaDIJLXiSs4zUgYiLGjaNPapg71wjeIiQopmf
X-Gm-Gg: AZuq6aJViD3sL0Wb6L4CqoPyggzsde+e6A4aD0JbwKb8RoX3kVWZL0MeCRNQdaFFomJ
	XqYRdVPve4IDdtXUhad70L5l3WxYsu81xXYa85vXzV/EeeR9s4ZLPFdNzjNzVAxeYbTpQe7uvqH
	pxoJ8rA0dmwYSi3G/qtLFI9ML2gUI/49q09lQFQGZtLklNHFJAZIe1a+pkhvdKDtqU+9itcOca0
	BjASb2m41XuskoUAYuL2qWv3+/n2COpQRp+HGdI3NJqS/snXyghUa2kSWcg2svL/5DNZzBpYp2C
	gyJnccisB1lJVo33/fLmBXQAwvCza7b1JmhrRPD+ZLC1Tt4K0k5NYfwPZ+XBaLRqBr48Qv+PTKu
	740EA3CVwJ3OTFvRhYndbBnNI7YFSrrWzqAqN4TA/8asj8o8+ITnMNkDSoz5s3fOeTHMDOKIGTK
	EHDkyoSEWuxwA91ng=
X-Received: by 2002:a17:903:3b8c:b0:2a0:b44e:9ab6 with SMTP id d9443c01a7336-2a7fe4421f1mr69069275ad.7.1769284323464;
        Sat, 24 Jan 2026 11:52:03 -0800 (PST)
Received: from HPVictus15 ([2401:4900:1cb2:985:c74a:1de6:142:8ff2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802de5cd4sm50860725ad.40.2026.01.24.11.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 11:52:02 -0800 (PST)
From: SAJJA EASWAR <eshwarsajja20@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	eshwarsajja20@gmail.com
Subject: [PATCH v2] Makefile: add custom EXTRAVERSION for mentorship task
Date: Sun, 25 Jan 2026 01:10:20 +0530
Message-ID: <20260124194020.735309-1-eshwarsajja20@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds a custom EXTRAVERSION string to the kernel Makefile
as part of the LFX Mentorship 'Basic Kernel Skills' task.
This allows the compiled kernel to be uniquely identified during boot.
Signed-off-by: SAJJA EASWAR <eshwarsajja20@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1465f715786d..b7ca09338fd4 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 6
 PATCHLEVEL = 19
 SUBLEVEL = 0
-EXTRAVERSION = -rc6
+EXTRAVERSION = -sajja_easwar
 NAME = Baby Opossum Posse
 
 # *DOCUMENTATION*
-- 
2.52.0

