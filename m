Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54EC27B500
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 18 Jun 2025 21:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750283934; cv=none; b=vFE34PmUpbTmp9BkJFQ9IfCO9LQCqAO4I7G2hgia+NjRh93Nwt7n1/0mODn3fYJnD9HquMBHpPkQIDz3qCizP2lMsYxJHDzQUWyMq9xPy0Hdy2x1yQAYw3loLzRZONJeEXhWIbLtRmOVVNP07I+EOHpod/BCcArKV9FHmo5ziOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750283934; c=relaxed/simple;
	bh=emxcW+J3k7PRwUe3FJjTkLwIkxieiTo6Is+dsiB/uDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ey6CXxYS5d+HDNUjQ6Yi/XOtvPXoQ7U5ahEs0T8bTe6cng2hO0cieyvJkhUFrHr7ecRHMTMBZOGSw3qxOs5JnqKQcpz1d3ejZ3PRTRMZd12iBTNM/EJzHePD+1VXwjA5zPTCbsQhNGZb++m55kLrrmufV9Rf4vpTN6tdZO8r6p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0dPtt8f; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0dPtt8f"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a589d99963so157766f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 18 Jun 2025 14:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750283931; x=1750888731; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fzsYxTqs35Shcp//MxplQjWLBOX/EFlETm5Fov2W324=;
        b=G0dPtt8f+d0XMnc1LL40oQxmlXTB+hpBEwpph0YVzcceeAjMfzO0yx5po8PXwPUk9F
         M072h6Hn333aVhoILiudJFfMqRahfUIc7dMzgkd0bNZ8o0kbhIRUiKA0nT0oHSQTSDhK
         dW/X2ANE+4SXsx35n6O/3WpE35RGGG8RmpstSixj4yGWRs/ecKOR8WQtcxlFuSSysv8I
         VXfQn0KVLP/h8MrW9N6OuGRfJCJkCmxwTPs0ugJQFhiw2Wimb42fRR7A4FG6Kec0rq7R
         dtFuchHkyQZOEy5DG+d0I8ljix2F7s4iwSiQCbdQgroW1saBnVQQX4WRYtrn6+jG3+eN
         U2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750283931; x=1750888731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fzsYxTqs35Shcp//MxplQjWLBOX/EFlETm5Fov2W324=;
        b=X00znC0jRLe+HVQoUG4kxSgdUw4Oft/kkNH6Gs8rg7r29rL82t8FBBbwZkBG1R6qRo
         iT4hoDOZuplxgZTwXiEyu8LaF6l2NKtNhNQiFNoGAATKVoIToWLTbSo1pxsoKtU5vCi9
         WZvnkKM6BhxBWHkl9Z+HwG+To6Ss4RiZ7IJIuBsihnGb7yxDcNBiJLfCLjJshOWoqo2V
         3lBJ69dF5rw8Mvj9vEqexX3Ocy6ltKz2Ok3jHfzYlyCPJ3GT5RmtU5g6nOUK8y4443xV
         n3u4JA0Go3U04t+pbsZg9f3y1o1WayVkJbWFL3FH1H+XJelFmUxbCIZo9EiZ4Hr4Zk9b
         5hVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbWiL8elqTBG7/o1fs2UqPiru46RKgn2usD4Vap5SBN8H2Ap8HVykCk9dDw7PYA0Db+8ker6KbzBsvKIqaa7fnO972+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzryjKFGfXeeFfUX+vBIuJ4Jvmhh8ggcuZSLdirPPSB2s/KqTqT
	cZh6CnUQtkUqk28ZRQFmtUsL4xeaUnZuR7i41I/ruX+iPMOzZZassf15
X-Gm-Gg: ASbGncs9wi8H/NHNLczCEtWfy/mhNoOCbzf8KCtw9cqUYfg1pxxX/Bk7YRUUTDW2DFt
	q7sB/wTydGnB/1bEcmW5fTm2StKW/2rXrR7cYVTqWEN1ZyP7vlI+9MWzRqUSShZs7Un8RifjmND
	IHphrhZPEKfgoAbFVNRbb9dfCYYCoHr/jeHDBQ/qrkh+OtISfUeru8f6gTyBixtqsz+dfKc084k
	ERLV4AQfJuHudQFHJTwJr0kTDbccTnHGHJsqbmj5W0gdTLQzsaXJIlUbkQ+DqNw1d/F8i0B9CSE
	FmPPo+i1yvEFjus4j8/ncjDr2OyJKrqrhMaBq6y756KB30CTN4CQfSuS2JfBhug6t7g=
X-Google-Smtp-Source: AGHT+IFh630CQwG00UQgU8iORz2lPAw4P3TWRdrp+AbuHSeVvsA9KtSNfKQv2p2Fpkzdqnc/nk0CvQ==
X-Received: by 2002:a05:6000:310d:b0:3a4:e7b7:3851 with SMTP id ffacd0b85a97d-3a572e69d13mr16541947f8f.58.1750283930755;
        Wed, 18 Jun 2025 14:58:50 -0700 (PDT)
Received: from archlinux ([102.89.69.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e97a8f2sm8817765e9.5.2025.06.18.14.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 14:58:50 -0700 (PDT)
From: Usman Akinyemi <usmanakinyemi202@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org
Cc: mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com,
	james.clark@linaro.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] perf/x86: Replace strncpy() with memcpy() for vendor string
Date: Thu, 19 Jun 2025 03:28:43 +0530
Message-ID: <20250618215843.109941-1-usmanakinyemi202@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strncpy() is unsafe for fixed-size binary data as
it may not NUL-terminate and is deprecated for such
usage. Since we're copying raw CPUID register values,
memcpy() is the correct and safe choice.

Signed-off-by: Usman Akinyemi <usmanakinyemi202@gmail.com>
---
 tools/perf/arch/x86/util/header.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/arch/x86/util/header.c b/tools/perf/arch/x86/util/header.c
index 412977f8aa83..43ba55627817 100644
--- a/tools/perf/arch/x86/util/header.c
+++ b/tools/perf/arch/x86/util/header.c
@@ -16,9 +16,9 @@ void get_cpuid_0(char *vendor, unsigned int *lvl)
 	unsigned int b, c, d;
 
 	cpuid(0, 0, lvl, &b, &c, &d);
-	strncpy(&vendor[0], (char *)(&b), 4);
-	strncpy(&vendor[4], (char *)(&d), 4);
-	strncpy(&vendor[8], (char *)(&c), 4);
+	memcpy(&vendor[0], (char *)(&b), 4);
+	memcpy(&vendor[4], (char *)(&d), 4);
+	memcpy(&vendor[8], (char *)(&c), 4);
 	vendor[12] = '\0';
 }
 
-- 
2.49.0

