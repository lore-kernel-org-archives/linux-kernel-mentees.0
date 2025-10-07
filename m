Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE652E973A
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Oct 2025 18:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759863325; cv=none; b=LB1jXxkdRzqOOGKIIppKwJoBPcdjekuD0QNctQpgB+WhwNXWkNCjs0p7lSCkvAoHR0rHviWSaWQI1CHHE4XJo67Fo5qdeZr6ubJur0ExIZ142VEKkra6WbZDKt4siqn9myxnR0RBUVVcvERuXVEFlhm1icaops+8GV4xDrwwkwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759863325; c=relaxed/simple;
	bh=KYaaNQMzTyncgQyqSCq4P2yL0PsSWqFZF+5bbRW1HLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZTpVXs5IcLgVUI8lN+IlNpM1uajsG8BzHtgXkVMdOaBbWiYFPi3VDLWPQJTSpiJazOBvNT+yoeKLrp+2BOCaDClwZ8yVr5uXUzH9ZL/c4L3fxDGpEBYgerr04Uin+bMQSGD4rbO1/aeKDbTCIxqy/SDjFOqhRRHoZZZaAY0gApY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BolWd44f; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BolWd44f"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b5515eaefceso6196976a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Oct 2025 11:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759863322; x=1760468122; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEWpi/vkQDymkY4TZuKIEKhri9YrajHYIJ3EVRMXvNM=;
        b=BolWd44f+fw9eQy7N8QuvlMRYCfL7sNPqYSTFHnRTxpNyqu/wp6YByN4XdpOssXPit
         4zYeu2NcGgi8HeZJPHxvWbhGguOTv/kwgdnRgK5/vM37kOaz7crHn6DUPXwDtjiN+cSt
         jzyNiSgsQb/MjCegcadGFVemqJEd6QusSMXXtWFM57anzqpZjb8EaKBcgpjk+Ga3wuzj
         sBC7cLWWPxawbwEngJITefnqfV2r+WnAxWz+aEydjIogtn7YzIHztzfMdA2F0DDqalJN
         GReZBf3wF5I4RMWKepsKUW+D6IG9GIQvZkec3z04PMxRsY5QyVlLMdC/8M3tpaK6eYrC
         J7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759863322; x=1760468122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gEWpi/vkQDymkY4TZuKIEKhri9YrajHYIJ3EVRMXvNM=;
        b=mj7rE3tP7RG4HY3PfhKXMH/BCCuc9Cd+iNLs+M1TUQBtcPywQkMxqfPTLsCrMG5JaO
         Ugg4C3Q8/7yfZHcMwb/bBOj3dF1txoJC4hHgnay7MMBe8ov+4x+J7sWRvR8zirDD/URX
         UyK36ec5rQOlreD7UxHlfGxvp+jooeoLEmTH8OpciLO9LwAxOnlyCQO18Yvsu0t0xB/u
         +d1QsBEoGECO++T0zD2pk9Kv5p+ed0FbXp7Y/ta3F3uR+q88tTC17poDsllpA4F59GrV
         Jy5255FApZwe6jUMyf9MJibVfQefybqRcvw8W/h82z5laQsLtgHEP8Ugq9QkGF2mq1+S
         EwYg==
X-Forwarded-Encrypted: i=1; AJvYcCWGVE0N/cJzWufDY4jWsesnHm+RpN2aHqrDNCCSJxS8tluZG+YIkRxnL8IzdMfwXwOZdAkX4zFiUJbjMHgdI8Or83bKYA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxgy0IwPcG5EIMC/rli5FsARaAowk9H78lagu589V/6h2g11jkH
	75PSURrdJKaBHe5uj/rYcG/Rhcq98ZXghK+M6Pav/AzDs1vr41lzHPtP
X-Gm-Gg: ASbGncuJoj+TjQ754hyd/EOdwdI4oI5YmY30s/HiCxyDp/fIWA6UdTSmoLEHSLP7nai
	7Z3z5IkC2nuthAXJw+lsojiCq9wnqZoHgLn97IVVDIUVXFEPIJvJSczqF1XU2yPEXvDDYY57DuC
	XbXczbfcyJjTWpn9kGGEaYWII5AIcCACFaphbsUmzj0E2ZpzsyDIk5py9dJf7jnnWfC9coBkf2k
	7A2CUnRfXE1MSS8k5fgCFjYpUqcA/WWA/w6EIEAIPkSazm6OR6snZ8gXLnA537dMgkWeYBh2drI
	L1PFkWXsoDwFxPUrXGMQ53LRQCsiS14AVhcecGTLcJAf9DI1/c4sEulX1eKF8M7rfOKSK2Wnher
	QUzuGrWV6niHIj6V1g54+ZcqpKr0MjfxtHvbDCJkTXjf5tKcqx7RbG/V3h4pZzSYEKw==
X-Google-Smtp-Source: AGHT+IFkC90TrbmYWdFb8+Squ/yvNSbuyPw/2N1C/NN0bhPNNPcOuqO79tcCivw9Cvz+HmCkqLSG/w==
X-Received: by 2002:a17:902:d607:b0:269:8f2e:e38 with SMTP id d9443c01a7336-29027356528mr10234435ad.6.1759863322179;
        Tue, 07 Oct 2025 11:55:22 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d110cdfsm173529655ad.13.2025.10.07.11.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:55:21 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rostedt@goodmis.org,
	corbet@lwn.net
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	crwood@redhat.com,
	tglozar@redhat.com,
	costa.shul@redhat.com,
	jkacur@redhat.com
Subject: [PATCH 0/8] Documentation/rtla: rename common_xxx.rst files to common_xxx.txt 
Date: Wed,  8 Oct 2025 00:24:49 +0530
Message-ID: <20251007185508.40908-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aOUMyGvkibvOV0IS@archie.me>
References: <aOUMyGvkibvOV0IS@archie.me>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is a continuation of previous patch available at:
https://lore.kernel.org/linux-kernel-mentees/20251007083228.17319-1-krishnagopi487@gmail.com/

As suggested by Bagas Sanjaya, this series renames all common_*.rst
files under Documentation/tools/rtla to common_*.txt to maintain
consistency with common_options.txt and to avoid building them as
standalone documents, as they are intended to be included by other rtla
documents only.

Each patch renames one file and updates the corrosponding include
references.

Testing was done by running "make htmldocs" before and after the changes
to verify that no build errors were produced and that the rendered
output remained identical.

Gopi Krishna Menon (8):
  Documentation/rtla: rename common_appendix.rst to common_appendix.txt
  Documentation/rtla: rename common_hist_options.rst
  Documentation/rtla: rename common_osnoise_description.rst
  Documentation/rtla: rename common_timerlat_aa.rst
  Documentation/rtla: rename common_timerlat_description.rst
  Documentation/rtla: rename common_timerlat_options.rst
  Documentation/rtla: rename common_top_options.rst
  Documentation/rtla: rename common_osnoise_options.rst

 .../rtla/{common_appendix.rst => common_appendix.txt}  |  0
 ...common_hist_options.rst => common_hist_options.txt} |  0
 ..._description.rst => common_osnoise_description.txt} |  0
 ..._osnoise_options.rst => common_osnoise_options.txt} |  0
 .../{common_timerlat_aa.rst => common_timerlat_aa.txt} |  0
 ...description.rst => common_timerlat_description.txt} |  0
 ...imerlat_options.rst => common_timerlat_options.txt} |  0
 .../{common_top_options.rst => common_top_options.txt} |  0
 Documentation/tools/rtla/rtla-hwnoise.rst              |  6 +++---
 Documentation/tools/rtla/rtla-osnoise-hist.rst         |  8 ++++----
 Documentation/tools/rtla/rtla-osnoise-top.rst          |  8 ++++----
 Documentation/tools/rtla/rtla-osnoise.rst              |  4 ++--
 Documentation/tools/rtla/rtla-timerlat-hist.rst        | 10 +++++-----
 Documentation/tools/rtla/rtla-timerlat-top.rst         | 10 +++++-----
 Documentation/tools/rtla/rtla-timerlat.rst             |  4 ++--
 Documentation/tools/rtla/rtla.rst                      |  2 +-
 16 files changed, 26 insertions(+), 26 deletions(-)
 rename Documentation/tools/rtla/{common_appendix.rst => common_appendix.txt} (100%)
 rename Documentation/tools/rtla/{common_hist_options.rst => common_hist_options.txt} (100%)
 rename Documentation/tools/rtla/{common_osnoise_description.rst => common_osnoise_description.txt} (100%)
 rename Documentation/tools/rtla/{common_osnoise_options.rst => common_osnoise_options.txt} (100%)
 rename Documentation/tools/rtla/{common_timerlat_aa.rst => common_timerlat_aa.txt} (100%)
 rename Documentation/tools/rtla/{common_timerlat_description.rst => common_timerlat_description.txt} (100%)
 rename Documentation/tools/rtla/{common_timerlat_options.rst => common_timerlat_options.txt} (100%)
 rename Documentation/tools/rtla/{common_top_options.rst => common_top_options.txt} (100%)

-- 
2.43.0

