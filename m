Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E77A22FAC3
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 10 Aug 2025 23:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754870036; cv=none; b=JINXYfdJScuIVVjmOhf3aqGfoQkjkGTUbTusfHskpC0wcVlJYbFN+WrgIILLGB/V/yeopaaN7Irj2W2rb0ZtP84rvzCaF15C6Hrkw//25ir80CuIPQqIZ48bQZWVS1jba2nnajqkuOm3GzpRDXXHVFUshEEE4eC0GnpwBdXPZvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754870036; c=relaxed/simple;
	bh=YqmHMucSU2DlswN5+QJUfNE73hCMbH/3S1oPKLv7ipw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T+6FuN7duoswWEgWGgefwfr4Lz1PW/hBi2qUEIviKp8KLJtiSU11i6fW3FP//6dpVZ5uCQQIlYBJZryozgWmPFRoOc+/9RXoyhvUMQhmhB4SSRCpiS9lcwiC7yK1biNoC6JSM57MqIYg2ch3lFSaao7+a1t4f5f99FeUAa1Sphc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YNb1NF01; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNb1NF01"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-76bd6e84eddso4606005b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 10 Aug 2025 16:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754870034; x=1755474834; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7knVGaGsoWjApLEqvHDjmolbJK36ccHbDacWKxbNqHk=;
        b=YNb1NF01iknc6sF9TxAxNyPdvySc+Aj22SAjacZlU5op4v5DHKI7wmHVDLElZhKEL9
         9V0u8UCtED12n14+U9oEBiBv8T1OBgcppeR7WyzUuAhnsMeeMn+X47jlz+o+uWMj7Okv
         ZZbbxEnjCjfk1Qc5s+9ue3YFHkwEqangCQPmRX0Tu+jOKL0IoLBJMic1G2oUpBzb6vLo
         wAXoHkjo3YN5OQkG7HAgC61fXlU+/dqt3WftOX+0ypyfiwGZ0T6UzT2KaWhYDcdGXbgc
         PsyOOU5N6ZXfu9MZhrn1BNT3V77wM4xbInzpnEQjbnK4oa4Lf4i7JvHpKwHxF0zKY2AD
         jDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754870034; x=1755474834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7knVGaGsoWjApLEqvHDjmolbJK36ccHbDacWKxbNqHk=;
        b=fyG/KeX0MxTMV/rtEsmKpu3pNl9/OSyxoYOO3lcev5NdQX0wJ0BOcjCDwwvuuQbw95
         +53v22j7uw5e6J1A0BA3NbRaL+GZQsf9S4xmuhJJiODPAOaoILqy1C+dRtWLKoawLD+E
         v7Yyo2seu1dEcxbXkbXaQVIpVhEoiQ9s9aqS3HJ9MMnhGLsv5oXbu6MFG+zWSMN/aYEI
         3DdEuVjhcQHWyYWoJ5Mq2QagG4ftKbWUwg25MVkcIVBtMv4DnzJOuun5YZITGDdhccS4
         ZynotMvV5YRnLmXY5fmXsFqRZUUDr4Viun59CPxcjX8q0+yn5QWKCv3qYWrKtGV3KJvA
         EaRw==
X-Forwarded-Encrypted: i=1; AJvYcCU7H9oSCD084dWbmXG9EWDi4YcJO2Fo3w27lUZfsKPGasz3OGZc6cYMKdtGqOr2BV3aFweJQWo3KlPD9Wjq9TIwoRm2sA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwrFUV/47IfRholevOnSXsGkTcwzvpbEdz1Jpye9bUXCVmhF41c
	SCFna5IrOJk8DCVH4/kuoedcvvW3GIJ+FFJ/nJMAoTclOAKtWAt/446D
X-Gm-Gg: ASbGnctAcsr3IOn6gdYyWJa+nh3cBPFF+DC/eeXVW/dyUpMFyW/ze+3TeB6yCdJYdrC
	XzdLyHvTDCYUwt2DVzzKQYlxPyxHij9Mvlf7m0v/ttPcm/xnycs8kA18DDSZ7bG49rVBtH8ibjn
	qKTj1x1GH6+rnoa0fXcZCFKW7ZXte+JYfYm2xYNk6V6C44618m4/FF7It1hX1rl1ISs84HTGwSx
	SMkVrOW53eswy1cDrURS6YMF3SOrZRWG6e+BpUG0K5IC33koYIBfuBkHQBCntwF+8BeAcgJEIkY
	Rop1RRPCcIooWK+Finu+rU1YtpePrnY0pZ5cRR0BV3sIyag/y1zU64ZFTVsKph0Rmh1eRAqBKLj
	mZBzMSXWh1Lio+AdaNHSkjA580piO6TXAYegqJ1xGw4w=
X-Google-Smtp-Source: AGHT+IGhK/OXz3cPQAKcMSk1OwiUpZ9lZPXMvKVLVmgTZXjh3inToIYTH0u80Hutih/F0cszD2duJw==
X-Received: by 2002:aa7:8887:0:b0:748:e1e4:71d9 with SMTP id d2e1a72fcca58-76c461bdf62mr13304121b3a.22.1754870034249;
        Sun, 10 Aug 2025 16:53:54 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfc0a2asm25281389b3a.70.2025.08.10.16.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 16:53:53 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: corbet@lwn.net
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	dhowells@redhat.com,
	brauner@kernel.org,
	max.kellermann@ionos.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] docs: folio_queue: Fix minor typo in folio_queue page
Date: Mon, 11 Aug 2025 05:23:44 +0530
Message-ID: <20250810235346.4153-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Specifically, fix typo 'hese'-> 'these'

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 Documentation/core-api/folio_queue.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/folio_queue.rst b/Documentation/core-api/folio_queue.rst
index 83cfbc157e49..b7628896d2b6 100644
--- a/Documentation/core-api/folio_queue.rst
+++ b/Documentation/core-api/folio_queue.rst
@@ -44,7 +44,7 @@ Each segment in the list also stores:
  * the size of each folio and
  * three 1-bit marks per folio,
 
-but hese should not be accessed directly as the underlying data structure may
+but these should not be accessed directly as the underlying data structure may
 change, but rather the access functions outlined below should be used.
 
 The facility can be made accessible by::
-- 
2.43.0

