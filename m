Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C064E1DF256
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 26 Oct 2025 10:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761472878; cv=none; b=pCQUCzKTdlSQwulfMfp6PKmD+pzgGnx7++6XIAqcLJ6q24JGL5eZxwo79uXRQnfxqyhALxfw5BEXzFDsmtP76bKIlI5JDQi1T1JYEAdtyUshYj02ranKKg1pCZ7gDsja6ANC63bG6suxplvQSHKjX48/QUKeHAyHOHKaCz3IoGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761472878; c=relaxed/simple;
	bh=7KD5dGgax9bTmRFpWBp6doF76wbbIxJPMbGDcdBfxus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mq4xRI8dgTpg7rFPMRUcjJvOVfHbTanw8zK89X7owCFRbjft/5A4JYIMncaczp1Skcf86z+9APkonJ8hW9bKHqg36DFCQtaAKkzgw1iCaLjgQM+yiX763br5fm0pnzD53KMYfNesTcckMoakuZ9UFXE6L+jsLqOyhLcINsZdAkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/j53bs5; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/j53bs5"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29476dc9860so26830995ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 26 Oct 2025 03:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761472875; x=1762077675; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RfGStvJcl4TjNSGKHIZE9j5tm2qV6cEHrkxmBAThP0=;
        b=i/j53bs53tVb7QKktu8IjJGMGEKESNLBnpsilvD1S2UGUMFArFNd4UyVmaR23y6iJV
         voLSd14ChwGxwwSoZ3vhOpkcXmM4//w8/8qs9wQsmuNKgIhtTMV5pYHDRox5D5yuOHg8
         2ADDMrEGxVA8WZAMLzaqqY6uLOx3gHWGYvf6yMpKKVU5vEF+dVydC1/G21hbWEPjoOzb
         bg4pHTMrvzxlJecv4+FMCQJTSD3X/ePGcIJR502/e1rOYZoC0Tm9lHny2c4Ew25zd4LG
         /Jzh5gFAyHfANhjNdgB9q1PB9SjuQzmkczQjfUQLiN1SZC6MLRp3FMxsBZuTw7OJSdd/
         32DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761472875; x=1762077675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RfGStvJcl4TjNSGKHIZE9j5tm2qV6cEHrkxmBAThP0=;
        b=WKnhkV5uTdoCNZur7CWmIrXEr7cIuw4agkmPuVLg3bP+vfCN9D1qwQQp2EizvVhlA3
         jbqW969aO1b3P29+rs+IpZgV5mRK3UxaAQGECtVUGJIW2++wz+/EXAWupJgjHlLgJ//M
         HQ72sc6bu6HHVmLv1z1vDJ46IRAEwCx69KBB98sGWx3gk94psL5RQflwaOCghEwY2XLP
         5iZINL6M2JOyQ1UOGJyljOwivsvTXaLTn2M2YHnU69XMR4vlewFyxJbkpcm4MitgpA0L
         eJRkyBmOJ6HyjZXMMzz18QCcu69oNKf7nKP9/3O9JRp9vuC9xdjvTVBo06lo746t5yPe
         0Yvw==
X-Forwarded-Encrypted: i=1; AJvYcCX48fzeyX9eVO42SrCPP4twwAu0+lQTuGksWwvUaZDbqm/ngyX/ngchM5MV5NNmruk2RJn5JBNLOayz33jA/5JkOmhL2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YweoYAWrsyeTvruaybT/CTPWse5a+yc5maMVWKWr4lgWRDTYi+0
	QQA8MW2DkIFSEkxl2FgCoIw1vJ7t7pOrRBPc2fumswOd+vSps5uI4ejG
X-Gm-Gg: ASbGncsdB8uJXHgT0aSvlYVCB1WZbeoOtFRHDgpJQ0aY7sunPlFs2t/KPJ1UrkxUrcC
	EKTPAhE5o6iTNDu7ku7zU9fe0F1z1+mAd3fOcG2T8/gasUHovfMmqluIKpSY1Ofu2rCM0icSlFW
	nzE2sRe25rkAprep2Z2h5PtTgYRUAYVNZ4fWXO0yvi0YNgw4GWwOvsr1UYzgBKLtPMl4B5yC2Hj
	lotrxl0Kf3EYTHhnqGcXXYVhaCydslI5NBlfnZIhMcni8G9/c48C3juYLrTB7oGvu2Gjeq1HrBr
	9DImWxyu0XMbi9/fbBKe8VP2uM3QoUn/btK+OMKGGvPuAdbS3e063W+RjBJG11wb1GGnC3grr6d
	v+de4OKWI+TMekZZoU89PmHF3nYEb/5LBSnPiJyG94oLY/CuMqZDmzbQFjQlB8XWGc+MZH7rcQM
	QwWlLmjAo/XRj7TTejWSg=
X-Google-Smtp-Source: AGHT+IFKNOKTau/QQRGqY0zzzctIn/ja6Be2Y4OB0k/nayMvBEyR1iUbx77eiYu6XXPZj9O6THlOLQ==
X-Received: by 2002:a17:903:2f05:b0:275:f156:965c with SMTP id d9443c01a7336-2948ba5ae75mr89132875ad.52.1761472874942;
        Sun, 26 Oct 2025 03:01:14 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d099b6sm45719905ad.33.2025.10.26.03.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 03:01:14 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	david.hunter.linux@gmail.com,
	xandfury@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	khalid@kernel.org
Subject: [PATCH v3] selftests: tty: add tty_tiocsti_test to .gitignore
Date: Sun, 26 Oct 2025 15:30:25 +0530
Message-ID: <20251026100104.3354-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2025102634-relive-glutinous-df0c@gregkh>
References: <2025102634-relive-glutinous-df0c@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building the tty selftests generates the tty_tiocsti_test binary, which
appears as untracked file in git. As mentioned in the kselftest
documentation, all the generated objects must be placed inside
.gitignore. This prevents the generated objects from accidentally
getting staged and keeps the working tree clean.

Add the tty_tiocsti_test binary to .gitignore to avoid accidentally
staging the build artifact and maintain a clean working tree.

Link: https://docs.kernel.org/dev-tools/kselftest.html#contributing-new-tests-details

Fixes: 7553f5173ec3 ("selftests/tty: add TIOCSTI test suite")
Suggested-by: Greg KH <gregkh@linuxfoundation.org>
Suggested-by: David Hunter <david.hunter.linux@gmail.com>
Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Changelog:
v3:
- Add fixes tag as suggested by Greg KH.
v2:
- Improve the commit wording and explain clearly why this change is needed.

 tools/testing/selftests/tty/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/tty/.gitignore b/tools/testing/selftests/tty/.gitignore
index fe70462a4aad..2453685d2493 100644
--- a/tools/testing/selftests/tty/.gitignore
+++ b/tools/testing/selftests/tty/.gitignore
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
+tty_tiocsti_test
 tty_tstamp_update
-- 
2.43.0

