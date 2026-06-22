Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10C13537E0
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Jun 2026 22:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782168259; cv=none; b=A+QFP7ynU9HKH3Zrvdfsj8I90vw8O4+Iz3/cEd2NnHOQEGyF0nc3VWFrHs70Xop313o9J/kG7KPW2phWbC9wd302+ASFnJZ3SZ+r1if4Rab5Cp0/y1I1/HjuOqEgOL/CaCBDtKFktZmwFAn85EfkYBUdvE5cMw+J43HntvBheYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782168259; c=relaxed/simple;
	bh=W5lWlahgJwGGtGLW0ih66TpOa9zremeMUWH0zXFLfPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ioMi/17Ill+T+vohy+sFJYQo8SvHd8db6inI9CNmdAWqsewrucufvQXDnLh6JgLaCJEKF4ojSRaTX7yRaE65wal7G4OGUrEMG5P+JCNGaUg7paMq5umWuAZcyjZyVLNT39gOO7JkuGDVpSV3aqpTT/Xx6TclnNpkQKvuhpV1K8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhfghThs; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhfghThs"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30c52f96f60so1215690eec.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Jun 2026 15:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782168257; x=1782773057; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Js5zTXLWCpFXjeLRJmY47TLMJHvqvUtd9vW4J/ry+I=;
        b=KhfghThsPaR+Q99IZ3OnYUGntVEvQwuegeKLE3cjzCJjjWPTWBcxUOlwq91J7I9K3C
         LikN8BM+HDtBZo8Q3nWCb82Bk3U+AirsWgDTX44hBqT7S0nKwx0m3eITAjaU8Ad8S5OV
         PZfIyoZaCKK/Z2rs0J9M7D1tGnJc8+3DxQD59QZzTAT7slG11rPl+5SzeC9dRserK/ho
         um3pmqf09iiSrlTHODFtnMrZwe3gspdh3ASb2F9nac992nHw1lrcickEzvbMZpshErH7
         nqlo0eetW1DSBiBD125a8lnFLSKHcvbfImfA96gWpWXu7518pmjG+SUutQtRtZWUQFV1
         +zLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782168257; x=1782773057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Js5zTXLWCpFXjeLRJmY47TLMJHvqvUtd9vW4J/ry+I=;
        b=HXFC5tqnt/ikiivPQuAgGPgU+ec5WPZFPcdaygAXyH5K1jljunGMitZpnybNSZc4nk
         TZJofSCwTrwJiL5fUmCFITS+uXUB/jWbOb0adNQcRpUaN9x3CZijAxF4ng2TsdrYEhm4
         RHShRdv3ED4FNqynY6HfqNqghj4/hCF8IStHQAMrv9fKVBmJP6FdMhDYmN3LJLSqF29F
         o9EFr4NHZ8pSSH6GPP6+0KEB4BLS11qCd2rH9qDUWr9v478fvxFm+BG1OfC4ZymdHoNx
         +MWuRCS4YHiwU9YqoMulTDqictnBzeUv1HpZYmQG4IWiRW5Fy0+38MsT6LkMrcsQkwRf
         06IQ==
X-Forwarded-Encrypted: i=1; AHgh+RphkSSwvxb/U9lTkdWldQXC/4vFQCpJ3AsH1EhJfrjfSKAb1Tl1l/dRWoDdiRMuWuWa2uEhGL/aONRXtYsxDGbfPo09dQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxxu8w+DNiJPKqjoFg0nIGCeyGzgU+DclqOoV/cbNTmgwR89FPk
	W6o9BlZaIjlPZpMOTG+5nmL2t0RdbSLtOAeNuIUDCXd+1hYbONv83ngj
X-Gm-Gg: AfdE7cnHPnOXnvy94kKv3YS4GYWpJVdQlvb/3GuBrUN0yHjZJ0e8ENX9r72oC4oOU+4
	Tcs0YTbWHM0JhD7IKoKxm4bKqt25oif7FdkM80eLrfpFN4+vlTvvmRgRYD0ceDOwfDPXPvMQGIU
	YA8ltutY+bwRzlwa0ZywAHCgkA7d2y2TKSZGn1rb6Wo0+kTS2bIAWQj+fzhdLqtFDl60jm7mtcq
	pqrYNa4RsiSDJP0qW0qXYAMMvwpusUP+MeZuWBbKRCfVnRAqG+LmJHiS3jc2OXrlX8G7O0uQEQK
	EakeP3BDAnektoLvVxQ76jus7kIybHCkFGVyG+/j0LQrNoAqh9fo833U5i4+ywZVL0rE9Cca0K1
	RrXpRh3ZNDfzOno0qPoMZYDnM5UF2ZNtWi7Gi8Q+GSvY7m5q+cCbHN9ZVH+BcD0SC4YHl4UMCre
	rXPkzbPCI72eAtFbnWeKOaKnTeM6YmXEIKFKQ3JTC6JFm/N7fPDMDCDMqxp25OJJKHjbA=
X-Received: by 2002:a05:7300:ac8a:b0:304:6d18:3646 with SMTP id 5a478bee46e88-30c1d5955c6mr8674408eec.0.1782168256832;
        Mon, 22 Jun 2026 15:44:16 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:691c:629b:eda4:7c2e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba1c376sm13087954eec.3.2026.06.22.15.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 15:44:16 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 0/3] staging: media: atomisp: use kvmalloc_objs() and drop redundant OOM messages
Date: Mon, 22 Jun 2026 19:42:41 -0300
Message-ID: <20260622224402.34001-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several allocations in the atomisp driver still size their buffers with
open-coded multiplication, e.g. width * height * sizeof(*p). When the
dimensions are large the product can silently wrap, causing kvmalloc()
to allocate an undersized buffer.

Convert the remaining sites to kvmalloc_objs() with array_size(), which
saturate to SIZE_MAX on overflow so kvmalloc() returns NULL instead of
allocating too few bytes.

This continues the work started in commit [2], and picks up the stalled
sites from [1], unifying with [3].

While here, drop the redundant IA_CSS_ERROR("out of memory") messages on
the touched allocation paths: the memory management core already emits a
far more detailed warning on allocation failure as raised at [1].

[1] https://lore.kernel.org/all/20260413112904.98864-1-feng@innora.ai/
[2] https://github.com/torvalds/linux/commit/d178c7ca8fefc28115d35b94c3b1f4d653e34182
[3] https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/
---
Hi, all,
Regarding a comment from Andy at [3]:
> From: Andy Shevchenko <andriy.shevchenko@intel.com>
> On Tue, Jun 09, 2026 at 06:46:31PM -0300, Rodrigo Gobbi wrote:
> Replace kvmalloc() with multiply with kvmalloc_objs(), which handles
> the size multiplication internally with overflow checking, silenting
> checkpatch warn.
> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> ---
> Hi, all,
> There is a ongoing effort like this for other files from atomisp
> at [1], yet, it is not covering the same file.
> Tks and regards.
> 
> [1] https://lore.kernel.org/all/20260413112904.98864-1-feng@innora.ai/

> Yeah, the problem is that the activity seems stale. Can you pickup all
> the patches from the mailing list that have not been yet applied (regarding
> k*alloc() uses) and combine them into series or so and update regarding to
> Sakari's comments?
The only patches that I found from stale threads were added in this series,
hope that is fine now.
Tks and regards.

Changelog:
v2: convert to a series with additional stale patches;
v1: https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/
---
Rodrigo Gobbi (3):
  staging: media: atomisp: use kvmalloc_objs() in make_histogram()
  staging: media: atomisp: use kvmalloc_objs() for overflow-safe
    allocation
  staging: media: atomisp: drop redundant out-of-memory messages

 .../media/atomisp/pci/sh_css_metrics.c        |  11 +-
 .../media/atomisp/pci/sh_css_param_dvs.c      |   5 -
 .../staging/media/atomisp/pci/sh_css_params.c | 101 +++++++-----------
 3 files changed, 41 insertions(+), 76 deletions(-)

-- 
2.48.1

