Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71733191F74
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 14 Jun 2025 22:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749941641; cv=none; b=Bo8vAe0MnxKi33pbK8sAVWdYMorPEL2udnB10lg94vfegIMpmQCGbOsIca4v2cRfzHSsO1Vo07d8LUHKuUaaW25O+Mzn3TgaNfe9p/Z8efhZADrBZF7e0ZQH3NXBcGOLlPab1KH3OFQFZD7bcw4jlveCoLa/KviXbsp9UIIgfU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749941641; c=relaxed/simple;
	bh=zT5Bt88XG2yoLSSBLBbXp2kHahf3mi2Wx2aE+1pfqV0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H+D35r4NJtSpffjPEcZ5VqU+POSZimatMyQ57b4ao4xgdTdsrqDvmhpe7KUBeSIzQxQo4dSJ9NjTo/hAT3JzDOwrlb4C6Vr565e6SC8pTnq2YqxKRxn82/X2YOVMqRdGcLYjxcR2UEJQgbW/EzF7AG0qizc++aMBIm7BqQ853Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKorBNCc; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKorBNCc"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4533fbbd21bso421765e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 14 Jun 2025 15:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749941639; x=1750546439; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dZAQB5AlBoL07khNC9vbJww4NhXkobEbHOnm0PUs/iQ=;
        b=SKorBNCcndhL2mAJmL3agw6McVpAsGz8VbFaR1iVZa/beaQn+g3v13ggVbDFaGc28Z
         BKbgeWFeoWeoKfpuURD0YkfmN6DCmH7P9TsiwC0C7O+GQjhGYEpTnKY+4qRd8qYYNNRn
         Cvsivni8lPAaRbDubdo7LRWYE8ffchWb8Gt5bQTcIWBTGL2tgwLZugvojdGOSiyl2KWa
         mj30Ap6xxz7S9U2yT72p0wprcG0WFENjBFXJGuje2UOXbpuxu0EN0uW2WqWwpjzhgrI5
         W3BYLEd7I069O6JbZ8z0XugQwhsT4LQwaApzx3+zBXA5PMEAs9O2gO81VuALJhV9OBZH
         sdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749941639; x=1750546439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZAQB5AlBoL07khNC9vbJww4NhXkobEbHOnm0PUs/iQ=;
        b=qem4JEy8HPlMwdHLJGy6QIWxW0B55xQ2PyQO5jIl/uNCMSByDX+R+0d8DmnBsrg+gC
         cxm5MLI+JLqqgeCYAx6D/D6hjaNmO5TxkWAbOa5KV3Mc6VrwRbCyo+NaHVp9SNzfCFrV
         4sUYShEnSCCJnFl9ZCY0GKlEaYPfD5OOo6U59tIEPxIGYXd8qFC5wyHUh5YNIQHTalQi
         bAGFtZFNUQiVOk4J/zzcsLpfWkps33uLycgsgETx4Uk1L/fgQet2m/Ovtqe3ydrJJLyM
         zHAPCJykV8JRYvFyY5fF9dYAsbYSwKDVPiTgysRRDnt+NRAmtK98bHiM00H4QHQlrrz+
         GTfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXooT1ZzaDyYGS1/2glapUSu8VjOsuVtlmbWcBE4G37ZbUtIdxrl0QzywBuY+dBF5a1SI0dhue/kbIXNqBS+bOedjik8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTGTgSA4kc/X3XZgEs4c+r7pEJ0aygjZzxlXX2itIKmuQYqsWk
	jnyeBEo94GVd3Zz989ME3ior5XmNelBjvPfoMpjwcTAX64NYkkyzkrtjWpwV2ry9
X-Gm-Gg: ASbGnctOn9Ph9BNgdhTiDI+wd525K2SQ1g8Hn6qZqp3KBJAE0tW+b9YrrkAj0wuEdyD
	qlASbY0PsbZ3qU5jiPFNj3mTLdyW8P+0GSHNJnn9A2J+R3xqOlGceNg2oAqCRR5v5Pmi0JXHpsf
	gwbDIjojydGxErZ3R20/r8iSaFVeJ5Bsqo4Nx5GNybhCTsN2Ol1NIUUiQnyeRer/Tos6udV3Bnp
	eJ3g7NNdPfKHtdk6Ot74kwTkrOcCpDbvUcnF9kZxIl9yJm3nZsEq9sUdIVA5Q5AyKdaPPqkPUcR
	0nM0+Gg1XsspdVI1sLtIP1E+QEtmnz/2d+/eXEmkxPkhZgzV8iKIAafkZp7UIc/2H5Nf1ZbZicE
	NY7BUp9JZI5xqKGGXyEFKBgs=
X-Google-Smtp-Source: AGHT+IERaf2KZh+GM+zOFbKtCwqYrbRWYEK7uzMmHXxZBDqX0TAJ4g7pG5vidf55uXrTDNBtsHDGlw==
X-Received: by 2002:a05:600c:3494:b0:442:fac9:5e2f with SMTP id 5b1f17b1804b1-4533ca4b453mr15175775e9.2.1749941638558;
        Sat, 14 Jun 2025 15:53:58 -0700 (PDT)
Received: from localhost.localdomain ([154.182.223.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2449f1sm94897025e9.23.2025.06.14.15.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 15:53:57 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: corbet@lwn.net,
	davem@davemloft.net,
	edumazet@google.com,
	horms@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	skhan@linuxfoundation.com,
	jacob.e.keller@intel.com,
	alok.a.tiwari@oracle.com,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH v2 0/2] docs: net: sysctl documentation improvements
Date: Sun, 15 Jun 2025 01:53:22 +0300
Message-Id: <20250614225324.82810-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up and clarifies networking sysctl documentation,
specially the boolean parameters:

Patch 1: Fixes typos, adds missing defaults, and standardizes 
	boolean representation.
         
Patch 2: Adds value constraint clarifications for parameters with u8
	implementation details , fixes typos.
	
In this version 2 , Modifications were made to be more consistent 
and more boolean representations are fixed.

---
v2:
- Standarize more boolean representation.
- Removed inconsistent white spaces.

v1: https://lore.kernel.org/all/20250612162954.55843-1-abdelrahmanfekry375@gmail.com/
- Fix typos
- Add missing defaults
- standarize boolean representation.
Abdelrahman Fekry (2):
  docs: net: sysctl documentation cleanup
  docs: net: clarify sysctl value constraints

 Documentation/networking/ip-sysctl.rst | 117 +++++++++++++++++++------
 1 file changed, 92 insertions(+), 25 deletions(-)

-- 
2.25.1

