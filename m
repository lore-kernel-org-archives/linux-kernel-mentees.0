Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9022D5A1C
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 Aug 2025 09:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754992140; cv=none; b=X15/Ywt1Eix0yschXWln+Na4PNlaqrfOmCcpWHfWE0Dx0Dn2/tK3yrjBsmBWEadACk8nYDpZiplEYeTT2Racjy6pB1cX02RIzemm/kfAw+70/u8LYDxFBWRgommYNP6lbYakaJYnImX4MxdnpmJwkpm+YhXUPVUtyv7L27n6lY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754992140; c=relaxed/simple;
	bh=IqM9Egqj60sPQY75Jbo8X/0aXh7vHx4YyPcX1CkbW1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AxRU2Mi7lDgYcursUQcwoJqyKochWQEiXPfVtSWpAccNv8h2xUuCesUBCRtl1UU70iRfBTaMG1n9l1rsBovwU3T+rSE1Fm+8VA3thy2BA+t6U8292FBO4PcZhg5WnoL3k9i6/zxbXHOLw5b7tVYoyqmGDPZYldUiAL9IsDjn/gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKHMJoEt; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKHMJoEt"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b427094abdeso4870320a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 Aug 2025 02:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754992139; x=1755596939; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DoiwOB73jcXX9IhnQQ+H5JUTDd+HhYY1cCM/SuflF/E=;
        b=kKHMJoEtXsg2fpPuAz3POtE06No1CnRjheeEP2yZ+RRW3m4J6FDfVAJCgLXfhB3g+5
         xwrMTI2PqwOvW5Uu8KDGuDKjLsfQ3lPAVO0c4PFJUNNkjWlilWOrjhy29DyPiuof65rL
         6hfkVjVt2zFF+CFGQMcR8QrdW+GCAfWhH+4HUZ+VmGR2ngBcw99tkzENWfLP57tPfVHw
         pBzZxHdpouHF0aoJ339xgYOFdOLoG4dWMcxFjH2JPRoXuLWWU0gb6HMoZmeuposgqWJO
         1+ULzRIa+QHLBGODLzY3ygD3oJAtFyGqm748UCzvmYfnfAiDraJwesLmHMG8hq9t1Ms9
         uDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992139; x=1755596939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DoiwOB73jcXX9IhnQQ+H5JUTDd+HhYY1cCM/SuflF/E=;
        b=s1WgMPT1efsjYK2r7VC42d3bZKQtlhEtbXZDu6sBb3KZBju4xyqEwOi2e6LINu/hcs
         P9uFZO3KBmBck1kGAf80NroUVKfCBIJdGKHBXcnaUAI3qmUiWJthDVSM2r/KkNRWcrcP
         6o7+RA8nFJ2OwhyBcC06pt1tejteJGq3M2RHCElaIoXKXcAbr+07H53irN/b11BZn8zR
         iqBt9nDYaHgGR3zwrYbDIScgorv1wa0u/yk5ttWt4kECVC9Lq2/6b/9aYDxwbFdL+dhb
         Be7v8dBv0v3DadW9GX2XqQugeF6oJDhyEhx++rbbR8yCMJyH1WMGoXZJpqTV/FW3i1mh
         tsXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBwu9berhdNVUdtJDiKllq1e1Jn0CME387GM/0ynaGwGIljFaY3gA+YHdKkSaIX/97XEx161yfrmeT5K//SPZyd0R1RQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCa/77NgG/aNu4XYfmgEpCXQ/383qbJvllIfuGfw6VxEYgONkX
	otT0dvGpxn8NCSIijThqL2AO4ghMY8L6U8yGwE48XGuSWs6VHn/LDaI=
X-Gm-Gg: ASbGncshi7Pa2JUauM0sQ5lw9xSB/jiwv9Wp/vDrsna3d6rq7A6qoqPzN0LGguLrKwg
	MCN0Bagrh9C1U6dbJ6lESO8HtDmSNKUTx9uxT8WT12/Ym00mLJXZGbbhfOAEqVhuXPK0bHia3q/
	EFK5TN1jOZiF6rfB6ycsKJa2gi+iS6IssU9U6b9bItxo/NY696k/VLjM8diy7lgna3FFm/eyU9y
	CX06iDOEv2oMGowjRwnF229r4viTRv1ZKE6VH907aFg9dg68wNYk9SnBNkbO4qw08almNbQKtU6
	+OoOTUPGsRsx+uT7SK4wFHhNsPtUf8LfyC/Zo46UtLpwTKcoz5Y3BtwXEA/wqT3tLDwkjCo4rp6
	42TQGVgwNvJyJkMSbxgHpr/7hid3/118DJT5U3+exVA==
X-Google-Smtp-Source: AGHT+IFk5gkRYuZgrPrI7adUC3TaYSMJYP9VlEaIs890Cz2OO0izXYMskNXCFzGuexyVyMXyp2sHyw==
X-Received: by 2002:a05:6a20:3d8a:b0:220:aea6:2154 with SMTP id adf61e73a8af0-2409a8920f5mr4985976637.17.1754992138519;
        Tue, 12 Aug 2025 02:48:58 -0700 (PDT)
Received: from kerneldocs.. ([157.51.103.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4371980668sm7029833a12.30.2025.08.12.02.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:48:58 -0700 (PDT)
From: Nikil Paul S <snikilpaul@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	snikilpaul@gmail.com
Subject: [PATCH 2/2] docs: rcu: Update dead OLS link in RTFP.txt
Date: Tue, 12 Aug 2025 09:48:24 +0000
Message-ID: <20250812094851.3770-1-snikilpaul@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nikil <snikilpaul@gmail.com>

Replace a dead link to the OLS 2001 Proceedings with a working
version hosted on kernel.org.
v2: Added missing blank line before Signed-off-by: as suggested. 

Signed-off-by: Nikil Paul S <snikilpaul@gmail.com>
---
 Documentation/RCU/RTFP.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/RCU/RTFP.txt b/Documentation/RCU/RTFP.txt
index db8f16b392aa..87b1c97c3ec3 100644
--- a/Documentation/RCU/RTFP.txt
+++ b/Documentation/RCU/RTFP.txt
@@ -641,7 +641,7 @@ Orran Krieger and Rusty Russell and Dipankar Sarma and Maneesh Soni"
 ,Month="July"
 ,Year="2001"
 ,note="Available:
-\url{http://www.linuxsymposium.org/2001/abstracts/readcopy.php}
+\url{https://www.kernel.org/doc/ols/2001/read-copy.pdf}
 \url{http://www.rdrop.com/users/paulmck/RCU/rclock_OLS.2001.05.01c.pdf}
 [Viewed June 23, 2004]"
 ,annotation={
-- 
2.43.0

