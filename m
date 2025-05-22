Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEAC2C17A9
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 23:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955516; cv=none; b=vAwuMTXn9UnmXKgfam5v41g0WExNj3eG91A+8QF0GKaxoDy7CnQLsy+DqxIEYXbpuscgpp0VRcqMvzfKxb3QJPIGRlBt0tfVJUGK8LW+DF9W6GGVghDPYSyptofTBOF5h0akMSAcOIC+HGtIN6Bba0IlYvInbL9laOG7gB+/XPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955516; c=relaxed/simple;
	bh=GdgwDP/G2YbRSycSz415s/ivN3fJsMLeSCALtGmBj4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PWDXhx/Q36/SGMGfQo21I8m7l2lSe5K8rNrMecAMJc2RkY4vZ3d/2t+9ihPBHBAaEMXvU3Vj6mleEJwpXs/jRxUJZTNOG9rrqEb//VoPV93HISstKO0NP+2IkAwa2cshTISi//FMp713vObXZxOZk8kCxE2Zj4Xb2sE+SeT/kgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4srZFFz; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4srZFFz"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2322dc5c989so35820145ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 16:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747955514; x=1748560314; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YBuEoZux2UjBM1AWnVLvCpSSM8NTgAGMcC8oduqU5XA=;
        b=R4srZFFzDLzNr7fMwTqRuenNef71WU9CrJcPEEA9jMSrnr3OtywCxkBOFdzXIeZSeJ
         YLV0d/VlR+g1dRQ71aPggZDeP8OjRpk4wYKK5EMVpVEjK8UTSOyblJwpNRf/x2lUHTyY
         Gq7HMeXXlkI8upyRzLQzcS/D2upbmlcckPG+c6pcxJ9FWbiNi4aPiGzze6+py13vcueL
         sUD+XCe4UFKTTiQpGZl6zR2HGAJMXfUfLmU22HxjdDZ34FQdHHcKp0cMuv3vlqvRwO2N
         7zStbyUV4b3vDn5jJUXlZcynY/2trWAfk5PHoD1LcpgYfujL8Y81S/gpWu7vhDznJBdo
         bZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747955514; x=1748560314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBuEoZux2UjBM1AWnVLvCpSSM8NTgAGMcC8oduqU5XA=;
        b=qtUKU53vhzePXZG7CYBrCkU2bel8B47R5L56TNQa25UMARH8YYfiF387Fyq/GU1ZnX
         fWlZPY4sdlaFJHl7Ta67oNdnejrYbAQDZrOBl42VZLiRBr8jrbKPFTebLgta65elX0NV
         dZK6V165kqA+lAh8vQXsg07DHEKplBTfmiIeM/3KLxRr8dqJsy5zGvOA1Jtzlni0c845
         0dx8zIu9AgW+h0dOBQosXPBefoMyMtJ90PlHxqHf4i4XY+9HXtkzCuFfLbFsjChfxuTV
         Rzf1Rk4Zs3UABSkiGGUImhiqo3ZQDpUT+OaF42vmiuoBO/yF60KyZizLBRvZ24FCldnv
         C9zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJEvjzynyDcQn4z5DVJ8gCLKpNMp9eYtyjs9KkzIeKkkifN/W7i2zWoYYOBX3uPXLkV7NvHUK6DivdzNG7I3/gz3R7IQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzgfq+uzIjf2Iyt66Jzgy8mn+hR4/3YOJhrE6TiHRDBkd7a2BNh
	9iSpBcHVVkKZa9zHjR4gRPzhSMwdGH6cXsPuhaPeCrePiD31nfIxiJes
X-Gm-Gg: ASbGnctTr1LmwzV1lk5yj3+SDBNSmS+3nqFixPJrq6F2wVpnIx0mi4bfcBTqBeereba
	s2+oYziSSAIusjgltuefypZOHyJ9vJ1fNkkuvnBk28sqsreO9CJYpWE71BDjUB/1fLCWNkXY2N6
	Lfc7bDIYRNGv3HkHPeGelMsgT0DJwzPkzwjYhH0+zWRpbr48sW3kAJANpRVOCB6yo+lc0c3JPra
	cuStHBTYpo2aZ+j1Mdd/cXsCfsgHVxHjH/wjmT9S1eguqahbF6ZqwD1avI2MbOCxQJDreN/Wdxp
	T1e8+q7+FKMEkzUQV6W+3otKUiCKyCzATJmZWyBHLhgfeATIRhU=
X-Google-Smtp-Source: AGHT+IHN2IHNLfIyDfm43matCU/9U2DrcurgLiHntbJ7BKX4MZIQqns7rwRLTJsFuyHbEtct9cWmaA==
X-Received: by 2002:a17:903:41c7:b0:224:1221:1ab4 with SMTP id d9443c01a7336-231de317b43mr401656225ad.22.1747955513690;
        Thu, 22 May 2025 16:11:53 -0700 (PDT)
Received: from fedora.. ([103.91.123.150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm113511815ad.149.2025.05.22.16.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 16:11:53 -0700 (PDT)
From: Nidhish Chauhan <solemnsquire@gmail.com>
To: skhan@linuxfoundation.org,
	corbet@lwn.net
Cc: Nidhish Chauhan <solemnsquire@gmail.com>,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: filesystems: removed repeated word
Date: Fri, 23 May 2025 04:41:43 +0530
Message-ID: <20250522231145.3698-1-solemnsquire@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed a repeated word 'at' from journalling.rst at line no. 96 in
filesystems directory.

Signed-off-by: Nidhish Chauhan <solemnsquire@gmail.com>
---
 Documentation/filesystems/journalling.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/journalling.rst b/Documentation/filesystems/journalling.rst
index 863e93e623f7..2825f6c030c2 100644
--- a/Documentation/filesystems/journalling.rst
+++ b/Documentation/filesystems/journalling.rst
@@ -93,7 +93,7 @@ easily as on jbd2_journal_start().
 
 Try to reserve the right number of blocks the first time. ;-). This will
 be the maximum number of blocks you are going to touch in this
-transaction. I advise having a look at at least ext4_jbd.h to see the
+transaction. I advise having a look at least ext4_jbd.h to see the
 basis on which ext4 uses to make these decisions.
 
 Another wriggle to watch out for is your on-disk block allocation
-- 
2.49.0

