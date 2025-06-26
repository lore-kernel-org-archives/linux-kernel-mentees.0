Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E8613D503
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 26 Jun 2025 02:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750903682; cv=none; b=t0gsE4W17MQVazP13YHaQzObP5BoZZq//vwKWeedvWd5ymGrPgegIK0d8dBFQV9ivIGwVNiQ4i3TnVFLo16yraGNJmRoJy2CIlOpzNdt431oYvqoqBPffcPhrL6mhV+WvXE9po1OdfF5KDnRFRMpl3SAHA/1Qh47a+y3tCJimeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750903682; c=relaxed/simple;
	bh=fGBdLx43ZNKtIbzyx9QYwr/HXAxnuOX+RmyAX3dJ02Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UaQZg0FQk5eE8XNqtyXS0IFwDYLwFkogo2w7EctrvKOdJA72mTd+byX9OdoIxCAcohmG0TSGMqSSfl9skhKWWbsEIHzX+9AOVTTlIdchw/5fQO/4kqvyiy7IVOQuQ8JZTEw83uLIkhcMhb6zxzhWXlKbs7JRidsmOzTKNCv7d5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EbT7trOE; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EbT7trOE"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23633a6ac50so7370915ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 25 Jun 2025 19:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750903680; x=1751508480; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2QqGYjD8NV1Lz9h53E/xb2YOnYvPPC++UyYL3ZPC24Q=;
        b=EbT7trOEHSbQDgFCUCy6j6VSEOIc0NNJmmL4PvpIvAWnW/vC3PpGvCO5EVNnDOKuJX
         1g4WFpSzMVpsNSzY8YpsCBV3st1Tf3zsPiyZ5Cp2xGfst1i43U8xOsA0kjkSzofKC0LT
         PWkAUaJcjmw5yWU7yh7WN4kLGC1m++il9Ilrr1YN0u4KIivAb7HA/Cfn1mzLOz0JKYet
         I0H8DdF8JhC8yfbmlyw5RXGMOG0eGLUSvmlwinmyecsal+ZAK4Bm0qGTZvOhnzKer1XU
         IvapNzw18X3k4dP/m0Od6hAktc05/TVVxpu0cDDOkkjDAid/yxR36W6w+gnDpX6t0t6E
         fqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750903680; x=1751508480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2QqGYjD8NV1Lz9h53E/xb2YOnYvPPC++UyYL3ZPC24Q=;
        b=TVwAydE4320sQnYYw+xb0cQtXuezu5dvFuNNrxdHvR+om0dqOAUy5umweP3AG4KShx
         0FcBs3os6GLJjEJperWxPQ5WpPKLHaNsJi7e+1vpmvH+8PVM320hb5RD/AD9MibBHFvL
         YXZWaPXCo0Nml1iMhjRs/EnpmMK5s8vR38yt8EKtD3YfAGmntuSeGfTbdLy7b2o/VZK4
         NU8Jb/ZWFHpnTnBaBP3w5mcYZ9LB7BLp/yeP+6r+O/H9oNzrdDQhvNu2fVbcQxT35kf3
         soiDeR+honqkfKkRLTfKJp/Qu5IRxkE44/Tcnfd8jvm7omybYGPPZ1TpUrtgScj/Jeq0
         m5dg==
X-Forwarded-Encrypted: i=1; AJvYcCXkFSxjXbtDP0TDs4Odna8etaZCtlDLIHLC3cpjCVXdcCERHKFMmFDsPqwFmPqx/mgAM0KJsNxu2CwbpWTVRtOY9P123Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/UgPyL9Ixvk71WnbZZNxwENcxlg77cm3/DmGmPh5KWNDOjuKP
	SWfHmrCGiJd2xA2tiL96j+9I3NlwXh0O5lTRCSt8gj3c577BWYksNP3I
X-Gm-Gg: ASbGncszz8vg31ORBpZ9HOFO1sqkiKCCPmnPGLJ5O4woYb2i9AXWKI4bE+MoJVmJxW2
	q33tNTRhyc/Ym8u8JCjjNb0h6U3WFH97yt3CbfJ1Lae9dACdsD+gR7k2Ypiw53GPFusFbtQHJuE
	dhNoyE8qSc+YQ4IHJkytkFt7m+hX7aYIwQ5nnQwcQIKdT28T+OVYmPB3xDM4s/++qiGCR20UJRZ
	VAnA7awnFvk+KBpO9fHLBSJMjMtpe6g64ixE7in3c0vCD8ypIK+aqXS1kN7/hKRm6a92AaIX0Zd
	n3ZD9+4mze4TjG7Z5i+n0eFQ4ZwoN0tu5JpOlMIkiEVV0yxkZ2+mFaRTsAEpNKkvoxyib31s48c
	=
X-Google-Smtp-Source: AGHT+IFw3FQlZnA+EvUsNN1IOB3BlWRZTtCRZlRlVSj2VO/QZ0xMVRH5KO8rzFZ0phgpRnx8AufnAQ==
X-Received: by 2002:a17:903:2bcc:b0:235:5a9:976f with SMTP id d9443c01a7336-23824030ccdmr110775315ad.24.1750903680502;
        Wed, 25 Jun 2025 19:08:00 -0700 (PDT)
Received: from p920.. ([2001:569:799a:1600:cc0b:584a:7d31:4a04])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34c4318a27sm388110a12.28.2025.06.25.19.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 19:08:00 -0700 (PDT)
From: Moon Hee Lee <moonhee.lee.ca@gmail.com>
To: akpm@linux-foundation.org,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Moon Hee Lee <moonhee.lee.ca@gmail.com>
Subject: [PATCH] selftests/mm: remove duplicate .gitignore entries
Date: Wed, 25 Jun 2025 19:07:58 -0700
Message-ID: <20250626020758.163243-1-moonhee.lee.ca@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant entries in .gitignore confirmed by:

$ sort tools/testing/selftests/mm/.gitignore | uniq -d
hugetlb_dio
pkey_sighandler_tests_32
pkey_sighandler_tests_64

These entries were originally added by [1], and later duplicated by [2].

[1] https://lore.kernel.org/all/20240924185911.117937-1-lorenzo.stoakes@oracle.com/
[2] https://lore.kernel.org/all/20241125064036.413536-1-lizhijian@fujitsu.com/

Signed-off-by: Moon Hee Lee <moonhee.lee.ca@gmail.com>
---
 tools/testing/selftests/mm/.gitignore | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
index 824266982aa3..f2dafa0b700b 100644
--- a/tools/testing/selftests/mm/.gitignore
+++ b/tools/testing/selftests/mm/.gitignore
@@ -38,9 +38,6 @@ map_fixed_noreplace
 write_to_hugetlbfs
 hmm-tests
 memfd_secret
-hugetlb_dio
-pkey_sighandler_tests_32
-pkey_sighandler_tests_64
 soft-dirty
 split_huge_page_test
 ksm_tests
-- 
2.43.0

