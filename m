Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF1441B8E6
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Jul 2026 22:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784069565; cv=none; b=Q2+OHWj0cXUGglTx9aVkLMa/EfGJTfZK0or6me2BXaytvfzejJWywikYP7MzefM+2QhDbW19IFSxYPqfeNpiKrPC9p1zhyDYxdD0iraKMTaBsWuBBxrMQhATZ6Lb2gfNV5IHymeTVumGrC0gaCfibiUuhwYAF4awYxnlPy3Ob2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784069565; c=relaxed/simple;
	bh=hII1+EpO76dP+zuiHl33FQnNw3xAMPFb+8sWj3r6nIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FMBSL7QHCTy8vFbZO8mewJT0F+3c06aLWELLA2uEfn2G9RSeLm6F8VPBa5AJgGBZqNYHYvTH9kMpCmMZVWcTDzaK0H+H+yGMQZX7B3NLUFxt26Sr7WtciWjd/PSduJ3QdyGenrtdvjhsIabMJx1Yoysbz5VZZnPlwlisE04OJh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+wm13jV; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+wm13jV"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81e6f2ee60bso856307b3.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Jul 2026 15:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784069562; x=1784674362; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XaVrA3HODxV67MqxZaxfvdN/jDJhMYGWIyIOq2g23Ic=;
        b=m+wm13jVBOvuDCtmVtminfWwVAf0nKFAdHV8Y1PuJYsBgsDwPy/bG8rJRcqU1Jk8XQ
         zSITtcVjVFnvPvH7BMwjlXo85YJlxfcPyn1H0Z10ghzwm9cPV0J0igeRfwvJJGUKjxJ+
         V161ytCesyaOhs+Mc4+eSrEFBS5xiBL8husp1WVErFatE/BFCU+KBCQacjPkelAbb08A
         DfrBcY6tloE2aypZqOXW3kbfHGK5KS5GGoQ1c1u+kvWlIKuPNl/nftKlnyae3lWhvB0o
         vRCad15mmchM4cwIodOE15nqRJ1bJzVIHJ7tuq/52vBugBMHmjepDn2yaF5cTtmpz0S3
         PjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784069562; x=1784674362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XaVrA3HODxV67MqxZaxfvdN/jDJhMYGWIyIOq2g23Ic=;
        b=tLkV34ZM4GSnY1vIFI9Tez0skkSvD00OWc3hm28HRPAgbbUbl7B2hTFtt9ujOc8lwi
         KcqNblFFPvnmhzdB3TMknGfhj8DE5DbdOSV9Hpo+2sb9VIU4azHCJdrn76/saj+sm7na
         gOpftNw8cONvXyuO3wm6wrTJRrnVfvDmf3a7Bhukr84cn/mi+V+Iy1EYXLEO84ntOtNA
         1O/pvp8L9mnWu7otFUh06t+82QcwX2kbsx+A+n3wGdQOC1QlFGGI87zW45YbgUsgq2LR
         bVlPJ4RTk4B8ttWarqQ8TaD3oadccrB7yvnUGzwAYV7XE5mGA72yfDvpa59yFPKX0XHO
         b9WQ==
X-Forwarded-Encrypted: i=1; AHgh+RqevJcQ/cRK4x1OF2rHVOjwm9TPDF6eU7zvGfrvIuczbwNTS9rkcJfAHGX8eKafeAcE0kp48N7h0SJa3cyEcabyXSI8yw==@lists.linux.dev
X-Gm-Message-State: AOJu0YykWCNPPEjSOhwL4aFMcz6x4+akIi3tvMTdhtq4j77TVkHTPdDG
	IKfxAG6ErnxJxhS0RK5YbT7NkWqar1hYiTzMVtoxLhwCpiJL1jton7sC
X-Gm-Gg: AfdE7cljPdQn3w1WrxyGpfipIbTUGaGVsVijdXezlz8AXAgYi2gTJuZiDOCyCGZhbQG
	CnqbHDakFJyQRXgXnrl+FcNyccT/pk8PbXU6SHJi5h8M9V9KAyfAvaGQr47h6V1eKBoB26wzSDm
	dNWxVUev0gCw4ki9Drq/EefNkr3Oc8t6Pt7cobyyYMs10Cu6WB/9EkNUNWbmJ2zI//sq/Q3nfvw
	DTAdirKPOQDHVkR5L4zhoGe5javl3fi6nZHh7PY0feJMw4C10koV2w+Swd5909bcQ2JNw75JoS4
	DtG4y/tjJRO1gJ0WYJUCkthcvoW80tvd3MZbNaWMamM9KJFXtanY5ftaE/xrOiVN9BPoVV44hAs
	BYE8YImbeImjpLT95qfMAorkgNR8rWrDsFq/4CstBLKdHDaxKjgprY5EJZaPJRyde6b81zSkn7Z
	5shMY6rY4CEd5dxgW/+cKe/FN9kuEsG+3WWyhxFeazpEiC96gTzKSEdvB1pbMK87ZrKg==
X-Received: by 2002:a05:690c:399:b0:7ef:e7ec:b6e7 with SMTP id 00721157ae682-81e7bc9497cmr150082747b3.27.1784069562556;
        Tue, 14 Jul 2026 15:52:42 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:a510:f4e7:1a8:cf71])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c249b87sm153446897b3.49.2026.07.14.15.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:52:42 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	feng@innora.ai
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 0/3] staging: media: atomisp: use kvmalloc_objs() and drop redundant OOM messages
Date: Tue, 14 Jul 2026 19:48:59 -0300
Message-ID: <20260714225235.47134-1-rodrigo.gobbi.7@gmail.com>
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
[2] d178c7ca8fef ("staging: media: atomisp: use array3_size() for overflow-safe allocation")
[3] https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/
---
Changelog:
v4: 0002: use the full commit reference form for d178c7ca8fef (Media CI checkpatch); collect Andy's Reviewed-by;
v3: https://lore.kernel.org/all/20260623221028.40238-1-rodrigo.gobbi.7@gmail.com/#t
v2: https://lore.kernel.org/all/20260622224402.34001-1-rodrigo.gobbi.7@gmail.com/
v1: https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/


Feng Ning (1):
  staging: media: atomisp: use kvmalloc_objs() for overflow-safe
    allocation

Rodrigo Gobbi (2):
  staging: media: atomisp: use kvmalloc_objs() in make_histogram()
  staging: media: atomisp: drop redundant out-of-memory messages

 .../media/atomisp/pci/sh_css_metrics.c        |  11 +-
 .../media/atomisp/pci/sh_css_param_dvs.c      |   5 -
 .../staging/media/atomisp/pci/sh_css_params.c | 101 +++++++-----------
 3 files changed, 41 insertions(+), 76 deletions(-)

-- 
2.48.1

