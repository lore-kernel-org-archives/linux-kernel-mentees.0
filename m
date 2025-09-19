Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A92C308F17
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 19 Sep 2025 10:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758279005; cv=none; b=QtXwKSHZES0/CqzIgtgSjzw3jlPvT5q7E0SjJLbfv3+5G3/j5dM6Zi/Jrx6DZF/RljSCy1qTjEnVaZWSmoIGU1eSLmHjdKntciWoymaWd8BgO6qRqdh52FBFDQw5HmLE+t5XuDbR29Kpfx2bbEMwAsNptiUL4mVFneXEolbFiiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758279005; c=relaxed/simple;
	bh=rKZL/H7ypymzwpKKnbem/RnOpyiC4W0s7l9WUy2A9xA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LsK6BAHkh0lGePJOOmItWmxWcfgB0ajH095ixbwkOMs1a2uY0uCIbBMc2DyBRCuddlwdtB4quTl+pwh+i2x5UQoU+VQmM4gE5mg6Z+mJgMvUyqThVMnwgR+SSykyb8cd/1dwED59Q4TeyxlB1Snp4iGMJE0iIY67ycUjRe4KcUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WDFw2CtL; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDFw2CtL"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23CE581271
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 19 Sep 2025 10:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4audSluIVVCY for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Sep 2025 10:50:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=vnranganath.20@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 72BDA8126D
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72BDA8126D
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WDFw2CtL
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 72BDA8126D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 19 Sep 2025 10:50:03 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-77f0efc935fso21857b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 19 Sep 2025 03:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758279003; x=1758883803; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/nlPaNwJCwFBeS5h6NPn6J7B9IvDaJFfkhCJEhtD3j8=;
        b=WDFw2CtLKhDYgsI77YqCW3JHl5GuZ6/DaWJk2DZdgH+wZ02qkl0iCgiHdu2L0MpMBO
         W6OwqodlVd0Q6ibXXyO3DBRQLctYfTh1FKoa5bk+7KYHV8UoXIBNh0lqwj/5b+IYsMPl
         rJj+Bp2Pfb26VUyyAtT2gDOQITGOFUoNPbxEJy376wLkR4HFCj9ZXTk8jyb7ulikPeBk
         WdUKHLdZZ3pN6A2Vs51UZ0NKdQjrQ9bMBis4rwb7pOe8awpt6AfXbukcGm1oJ1P4ZfwE
         cr29g8SNDocO+VGkxgRfeo2bCua006fO1yUziY1NHvvrxuyXL/2PmqaqiOV/XRbS57Nv
         YBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758279003; x=1758883803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/nlPaNwJCwFBeS5h6NPn6J7B9IvDaJFfkhCJEhtD3j8=;
        b=wp+Av5maNiloXz7jyZMWZybhfXxX4ZjZBnw3Ol4S3/i+S9KI53a1lt33UMTFpGq9BI
         ylKpNlzCrV0fGp42RKoIiFCcaDtuw0CrEFIh296UzwbfVORZAuSz/rNdA//xnaEJOUou
         Ijwftu7TM4Ce/IQ2bHzLk+8vTopjsO2a5xhvKmvwl+taPNlEpTjCWzWhl6NiXJR9d1y/
         1uhwuCbfczWYUDrxd8RjRkdKakwkD7e5qdnAFioBaozG6MG4AUqekDY9mfshTqDJTj39
         UFDZlYkkKeHuDtpAM2Ve9l/kptaIjixK9JpEzjMdljGzUMKQfKiA9JWGAk+74Q1Oxh/f
         /s9g==
X-Gm-Message-State: AOJu0YyKVCHqJiyYp7VZ0fyeqbzhP84654WkB/ip/OPGHO2HyRoY774i
	xpYMoJs3XvjDNhyHzaiDEmyPOos45om4/BFjU4xz3Bt03XkfpvCBkFK/
X-Gm-Gg: ASbGncsVFLpMKeB8FMAfdxd1TvX+wvZVestds1O87Hi1AXWgho+ZtSfPWx9HEHYmZjr
	3E/7DEGhGmbyjlu1Velweu4xE5IYLt3opXIrDBP3HjlBPBctclhY4b7RFWDwIbnL5cyVt7+JoHF
	rtue4CBp0L77w9v3GMqdvJ4IbErKHxXGNlKDwUjmTWcA2FeswG3A+SpCq3gBEL6kcZ/Ac/K8+jp
	96l3cs6D92waQSn0C5f+ct2EJ4DHOlhclFvOuwK1kUJM60xiG4rV15yZvLSq6IL47C+LaOs27Cx
	XfhGetSYaxM1I80yVKIAWAKWo25tb9AxhRL167Zyd4tZP0GeDTV3dq9PF078wlG5CRkx1Xb0TbS
	yXw2p+Tn1MPLoBQ/O/MFlYx/suGD+
X-Google-Smtp-Source: AGHT+IECnXLe86m48/eNbqrv24RB5ihKOoMDR1ROIy0Zofq0xXtoRiDRdz7E8E8BkgGDK3ZZiRM0Fg==
X-Received: by 2002:a05:6a00:14cb:b0:771:f8c3:1d1b with SMTP id d2e1a72fcca58-77e4eaa9a33mr2093467b3a.3.1758279002531;
        Fri, 19 Sep 2025 03:50:02 -0700 (PDT)
Received: from ranganath.. ([2406:7400:98:8a46:5008:3da:1c80:3e37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77e87fb4698sm1408850b3a.96.2025.09.19.03.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 03:50:01 -0700 (PDT)
From: Ranganath V N <vnranganath.20@gmail.com>
To: Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Ranganath V N <vnranganath.20@gmail.com>
Subject: [RESEND PATCH] selftests/filesystems: Fix build warning on anon_inode_test
Date: Fri, 19 Sep 2025 16:19:47 +0530
Message-ID: <20250919104948.67953-1-vnranganath.20@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clang warning null passed where non-null argument is expected.

anon_inode_test.c:45:19: warning: argument 3 null where non-null expected [-Wnonnull]
   45 |         ASSERT_LT(execveat(fd_context, "", NULL, NULL, AT_EMPTY_PATH), 0);
      |                   ^~~~~~~~

Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
---
Adding missed mainters to the patch

 tools/testing/selftests/filesystems/anon_inode_test.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/filesystems/anon_inode_test.c b/tools/testing/selftests/filesystems/anon_inode_test.c
index 73e0a4d4fb2f..f796dad679db 100644
--- a/tools/testing/selftests/filesystems/anon_inode_test.c
+++ b/tools/testing/selftests/filesystems/anon_inode_test.c
@@ -38,11 +38,13 @@ TEST(anon_inode_no_chmod)
 TEST(anon_inode_no_exec)
 {
 	int fd_context;
+	static char *argv[] = { NULL };
+	static char *envp[] = { NULL };
 
 	fd_context = sys_fsopen("tmpfs", 0);
 	ASSERT_GE(fd_context, 0);
 
-	ASSERT_LT(execveat(fd_context, "", NULL, NULL, AT_EMPTY_PATH), 0);
+	ASSERT_LT(execveat(fd_context, "", argv, envp, AT_EMPTY_PATH), 0);
 	ASSERT_EQ(errno, EACCES);
 
 	EXPECT_EQ(close(fd_context), 0);
-- 
2.43.0

