Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D2E32695C
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 Jan 2026 14:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769177927; cv=none; b=q7nHcEaT4ysihTp4IrkInvpPOZryUp3FuMfHY78Rc2wDCUg1eOW8e0X2vgcPOIXhOczXC3akq90jzNkuiFCQ+XbGeipfnOL2+aIR58mJzFhNZz7Gg9Bj/fkmJnQznkKBgXfry4mVJGnCD2tFsIYnI6VKWBLbIlPJdSAyKhkeLQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769177927; c=relaxed/simple;
	bh=KslprPYUXSKBuSjeMUhkPqKC+dCwth4lVYoios9kx1Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RahdTzXskT+ojdQmRlGAWNbZFD5niWYWDpFAieZDB1x7aaWjfHrCrbQlrnOay46l8jp2eIjn6gdKtCagSB+pBp6bxcnnCbVUOKTsZ5kIujb5KhWUCjBDzlMLRcS5/2+qYxMwnZwJIPZGHIVq9yCmO12XmOBDd020n7Iu7z6T+m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlkA2p2c; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlkA2p2c"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a79998d35aso14726065ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 Jan 2026 06:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769177923; x=1769782723; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kMtwdyytgwo+G3KKp5qb0jbB7Rt9+j72hBBkZ2b/faU=;
        b=SlkA2p2cfuGRHfbKFLQr0Tw+5NGvbtuWTQCnoxSv3tSb0VP3ZdMdeSuUN3/Gl0StXA
         97qH/HUOP1ARm01iI5qZ1GPJ/PkN4yNj+fejA6grydlgSJwHRKpMVJ7nxioHAwN60gJm
         pMW66UHMI4SjXE0Xw2WqvNsg33dwUzvt5GBjmViJXtjEBXvmzn9bwYe8NJl3TImwCB4i
         m2kYw2yjrn6kGyf4u0j/Vcey2WDI3vJlRnhaFVMjjfYZrJej0kae7SmnMnSsKBVM+F55
         zgiigmSsDrKOlhOKGcdylC9NDYF3K505iMOmB1p/diyitp9vIQSFgkaloS444QVlfcmR
         hxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769177923; x=1769782723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMtwdyytgwo+G3KKp5qb0jbB7Rt9+j72hBBkZ2b/faU=;
        b=ueHBKGI+UkpxBE7hxcEKk574SVULezGLtshETz2rX/HGTxaLoKT7OaHNDqxM6BrCgo
         fAmbb4tEUQpFHXFDbB5Q8T52ZQ0ma+AKYYzjosnWGkl1TjzTFC7F/0cnbgP+d4TC7i+d
         jEKczu+SAigUR09+SRe64nqKSvJz/r3bztgCg4IL6vkNRJVBeT5+6nfJ+2mgVvKDsg0b
         AheLtAm/ZGAeZOeR8Fxbtyr6hC/0qRLLmw2+X6VazG4iKTNu0n/BGagtpmbgpdkzAW1t
         mLI9cm//gB6t0FFJlGfJmp8c4ljIOkqBPbzCyUENIktxhgf8DH76TYtpkakccs+xD6v7
         cS0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWdcMyhXPCnsBYkc1E2smpp7Cdu7U1suzsGttlgQn3WppNcQ3dDRsc6staS5ugjRiiH72Uf1pbHv8qH4cU75Q2YBfRSLg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPlY3t4DUHEZByNeLpCkJjgq630Yyiu7vHbeGzj1FcZ1I/kbmZ
	lPtGBo5G4ZlGUNWfCoJOLoBI7V/UwFImHbW9fm9VVUALcohLUHomjp2u
X-Gm-Gg: AZuq6aI48DlCfkCKYtEqZ10Nt/dJpbfV86KK10JOoU3yhDTavZMvnj1DUG0hxu7wMMB
	BozmpmJXuXEa/SXXhIsJqun7lW4UhzZ6CkyWNOrCyFytOnAukhoKjAB42weEIvxAFo9vJCHvgi7
	hnkkDw1OxPWlTmtciH9PsArFPENjQFR0q7hsCJ79FzVLiU1qxdlKtm9BGORtxn4R1driOTOWoQ6
	p1HycsOYS8XECfaOyrFZJfqsVMCrVPZ9LQheqba9DH+zuKrN2INLuktKx91zWni5E3L2Gdh45cA
	NQpty6qpPqb7Lzy3f5OGDxyf5L817TvD/ab/TW7X3aJ2qGxTn4phAwmEg2p4Zt1VWHot1KCVFeE
	APahrB77H0ng2L4MLWSjo4N2kww0B1EkGtddWTe5/I3H779pu/j+x86RexyOYwh+zhQaXRXSfa3
	wfgXf/3Q3lJ01eD5JkNvPzrVQdM2ETAoSC30rpkYRQ/RAbPjRewhpF
X-Received: by 2002:a17:903:1a2f:b0:2a7:5171:9223 with SMTP id d9443c01a7336-2a80ec7f894mr13754285ad.56.1769177923131;
        Fri, 23 Jan 2026 06:18:43 -0800 (PST)
Received: from lkmpvb.iitm.ac.in ([103.158.43.22])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fdb38esm22055995ad.91.2026.01.23.06.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 06:18:42 -0800 (PST)
From: Nikhil Shinde <nvshinde.oss@gmail.com>
To: skhan@linuxfoundation.org
Cc: Nikhil Shinde <nvshinde.oss@gmail.com>,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] Update EXTRAVERSION field for LKMP
Date: Fri, 23 Jan 2026 19:48:27 +0530
Message-Id: <20260123141827.3445-1-nvshinde.oss@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated the EXTRAVERSION field in Makefile for Linux Kernel
Mentorship Program

Signed-off-by: Nikhil Shinde <nvshinde.oss@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1465f715786d..80e2fb2b9bf2 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 6
 PATCHLEVEL = 19
 SUBLEVEL = 0
-EXTRAVERSION = -rc6
+EXTRAVERSION = -rc6-nvshinde-lkmp
 NAME = Baby Opossum Posse
 
 # *DOCUMENTATION*
-- 
2.34.1

