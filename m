Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093B38C11
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 00:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747959217; cv=none; b=bTwMClOZ/H/agxDO3d9FxFJvKWN8GtOwKRT8UASYJDfhRDSuAS30jutuXEClV43cblzXa/osOT6QU+RmRKM4ZYfiAvvRyliLP5OB2Hk5VDfxmijRKvKr/ZWG5zYIb9hb8aSG8oi+g2neAzbz2WQz1G3KCZCDwQ6YYdJO0SB9vGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747959217; c=relaxed/simple;
	bh=muJaRWHLNAqEyREyDsVWtWk1D+Gg65Bd35PEgmxwyjU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mMf08VEefB1HYJPTkujTIrfZnfChJMGFY0xjVlijpIZg6uyZ0QEvdSzDgxcytFDjhC7KKzPieksTeNbGT5LdHN+qGkpPxjei/ziRGhMJDdSCQbg62sX9iak1oGm5yRliHLyTcqQtQMMx7L9JEMeu1nGI0QBn6EQv/PKhRbNkluk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=fail (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=cqQpscw2 reason="key not found in DNS"; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="cqQpscw2"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3dc7c19a4c6so12235685ab.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 17:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1747959215; x=1748564015; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NtaCyH1WfJUArzSfLQLt408RcB4GdI59nwfsGjUrhJE=;
        b=cqQpscw2IZWsZoxGa4YUxQdAUtHZFS3ExAw26oQCFJ4xBoA7T21Uf/+rdguSyI44gj
         dWz+x1i+b3pPgf36XCRP+nb2/KkNZbRi2D0M/o1ehnPKwqblF1LxdhX80Kbd02v5cpH4
         KfT82PeaG7a7877rJ/I0jM1qP634eDY0BukVIWmC4uJlPq8ec99mWWfezdYt0CqTx4L4
         FXJgZDYUX4ngPBYQP//XYWqARPRoQXqO6aSOgD0b+9ky8SfcnBK1TmhHDCHKTW63sq0y
         +VNGzx7loNtcC0H9BFBKQ2wHzFejHgXxIvAPjX9SytvOIWJXaXtd64ARQ09Z5Myh5Du8
         +KtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747959215; x=1748564015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NtaCyH1WfJUArzSfLQLt408RcB4GdI59nwfsGjUrhJE=;
        b=DQHeiLCAEMnbYW4/q6Jdbua7WfxIxGm8hym8hxV4tAVAi+FrsSL1oX+aCinY5TkECE
         P+AfrRRhKYCRkGITnnk7H86uA6FkrejV3b7jHmNlhXR1BHRK8sU9xnlOYtSUgGX5CZsZ
         /p9zE7a85t3T5H+I9p7Uhew9BtAC86lLjdO9b+wUS+PHP1pZ5swk0SSTai548aCfNCXJ
         60X+xBZ7eYkphTdZTwLkdvTnC5CSisJAij84AdBfYT+u+rU3mbcEDWeDbnSMjdH+xsVg
         p9IoEGRCbD30r2xSK5BonlgkSWgapyxj2OhFS1VRj4ti9tOo1xGuLY0vSLhVJt8mB9Sw
         8lmA==
X-Forwarded-Encrypted: i=1; AJvYcCUmVKd9Vt0+TubYNRlXtqfWfs+Z7Fefr0PjBM6UmSqnhsky79mn4veY8fRD3OXRZQOVllP+2Jw3oaO/zpWlaMt+AoHmJg==@lists.linux.dev
X-Gm-Message-State: AOJu0YysrVWsKf/KPqaqOwQms+hVaR2h0yxdmGks4vsem4QaOlRN5MbB
	1kq/A/XlfU9HRYHQzGRpF9+T6Vl2vHEEPrhbCfyqLN7bJuKXIlzggs5FD+jqi80WA/o=
X-Gm-Gg: ASbGncuZ0M2vW5b7L3ZiyE+h5tNf8DDj3YP+3HiN5xuZy6bHbqm0jRdx7QYy8sQ5ejt
	uEFe1Arj6QRddNnFMIUuSf2QoHcbnqymKrJTaJ9dsc5kU377uUKmP5bJa/kUVt1HqJ+5PwbbCRL
	I6ENGGGAHwXKwE0p5SICh56CZXayKhBKJr85RuEb05iq6l6S3TbZwL3VwgTS/G4690o5X7x/IM1
	STjDRtSBeOf11DPFmshAjtsu2bWmAgKtOm0ZCMu93Pga1Jd7ReCH0+27lJ1VTMkGqpdmlGuKNNb
	Z1avPkP9JRdPKRrpxFePWML+mLAroA/Dk79bRYpEfaD4hNTQXcWo+NtceU5HHIfqu90baqT+Z4a
	pbXHvz2w=
X-Google-Smtp-Source: AGHT+IFKmxDugOdIs6vFYcotQEFU7a9JdAs53jaauyO4yjTbDeTgs1+LUU9JZAtgqiOFD9DNicpN9Q==
X-Received: by 2002:a05:6e02:3c04:b0:3d9:65b6:d4db with SMTP id e9e14a558f8ab-3dc93276652mr13178285ab.12.1747959214980;
        Thu, 22 May 2025 17:13:34 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbd17aa848sm3183450173.67.2025.05.22.17.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 17:13:32 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jonathan Corbet <corbet@lwn.net>,
	Athira Rajeev <atrajeev@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Brigham Campbell <me@brighamcampbell.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2] docs: powerpc: Add htm.rst to table of contents
Date: Thu, 22 May 2025 18:11:14 -0600
Message-ID: <20250523001112.102087-3-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These changes fix the following error, which was introduced by commit
ab1456c5 when Documentation/arch/powerpc/htm.rst was added to the
repository without any reference to the document.

Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in any toctree [toc.not_included]

There are no changes in v2. I'm resending this patch because I addressed
it to the wrong email for Shuah.

Fixes: ab1456c5aa7a63d5 ("powerpc/pseries/htmdump: Add documentation for H_HTM debugfs interface")
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
Link: https://lore.kernel.org/all/20250517210757.1076554-3-me@brighamcampbell.com
---
 Documentation/arch/powerpc/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/arch/powerpc/index.rst b/Documentation/arch/powerpc/index.rst
index 0560cbae5fa1..53fc9f89f3e4 100644
--- a/Documentation/arch/powerpc/index.rst
+++ b/Documentation/arch/powerpc/index.rst
@@ -19,6 +19,7 @@ powerpc
     elf_hwcaps
     elfnote
     firmware-assisted-dump
+    htm
     hvcs
     imc
     isa-versions
--
2.49.0

