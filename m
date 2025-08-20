Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCD2281376
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 19:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755716405; cv=none; b=WWOj21h1UUboOOf5dXtyCRa85+9WXSshDtbvUCB4NSWdbRuIlA2Fyeq+HrlHPoYk494/pwFciLL8OJmyqtQQFwSBdyI/b2xsMSRKVUAfbhe7NxsOkYlaacoUKYM5ZHJ0AVkz1ROTiv8TgBXuqQVaUMA1Nw1FSgketceQCEBChRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755716405; c=relaxed/simple;
	bh=CrznjweAHSf23akRjxTFtNg5TyltX7+f+/5p5bUoEow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MQHELEcZljhX31FvBdEcLclxwSlpFq4a5ZRDea3Qym1j6fzCb1lTj8ki6SIejLvKK/LI/om1Uycg98hUNrBT3oAnC0Y8qF+yDKiW8Cw6im90xf6uvDIXlp71vl7AgWR/HUbKpd5h+Zu5RgM3nSaJdwnWK7hTNRpd7fbI2aTDzd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJwx933O; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJwx933O"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30C9440AA4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 19:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y4OZqwRqObFT for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Aug 2025 19:00:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=rakuram.e96@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 947F840E54
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 947F840E54
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RJwx933O
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 947F840E54
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 19:00:03 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-32326e71c31so235217a91.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 12:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755716403; x=1756321203; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CrznjweAHSf23akRjxTFtNg5TyltX7+f+/5p5bUoEow=;
        b=RJwx933OXOfUEdt5qSbR4Q/9LbnKVGC9uo9gdBeMBsQqHHXmYGlUfSkGOnImTGMci3
         9PT94RhE/XcWK43yDT1NfSsn1jHeCUnjpn2ycFs/fKHBhEm851JvqS8pgNvwkapqSdbf
         X7/+UR4IxV9VLF7lsVPBskUn41fLxtS9uHG8CuyVMUDPtXV/bWgmbIGqzx7oUAMEKkZx
         vkKtwNTI7csMckgVxY9nJLCjp4gVDJgi30waJTodBb9FFfORSCM2SLw4q46lEYySn7NX
         4/bA6BRuAJQwHIGAkNo6Et+kerWaJATTwo1XQogjh9pWloqGo/HnLVWsRhYGrUnyJqzj
         4E+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755716403; x=1756321203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CrznjweAHSf23akRjxTFtNg5TyltX7+f+/5p5bUoEow=;
        b=cLgUGIFAKQOlHlH+ffgpfYWJ3PnNcaKcgWyw/l5R8fMh3d4cMaoHylPfKDgzYvgwXQ
         ue23E+j2VxlBiweR9j8XGwxeKgzO8U6YrEaPegjq+VbnXE/LGobuBbM4JB2SGrGxe0xC
         VzHe5I3ohOMhd91/OiVBKHACnP3CyID/mfvFuISCzUGwQlK1PxlgMmESwxx2npEhyA+F
         RcCKCsDi7jdwvv4kZYCsoh6ulP626ls5Yk/6xNvvlA1DSZKKUT0EE9v0tcbvCTYpVELs
         b+NqQqFXpcSQfRgX6FPQppa7C7zFBClsOmgLbsE652ZpFWJHCXvT/I8YbXT/QEJWz4qv
         UUlA==
X-Forwarded-Encrypted: i=1; AJvYcCV6o/rHqnm3Z3K8NJobMwHf892u4RPcykYwJVhPm+gQY20A895zC4VUEljdb/Om2nn2JWZKC1uULQHIEYoEsq6cBsHLzg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw4ygMJ3I6AhLOq/evnLlRCKWbTvsj0x7W0nrY8f4CbR7VCjrUA
	PIwt6g71bkMnofN+Db18jBIotVkDsl3e8jKtlsTSyXVcKKCXsydGnu7L
X-Gm-Gg: ASbGncsNr3o3rIlq8f4crfOo6CNujTq0HlU8eJtlGBWTiBHs84Hb2hhejd3nQPEgSmE
	WcsX2pTSm+mNNjRwgM9VR+vX83UTpKWEvfqoE3H0oSAI7yTGSlid5qOoE8D5H+byMc738SU4Rb8
	pcAX6MRme0ma4fKZI30Xmp9UdBA3bhSkABdKRsivStDPH73VEwH2jZSNLdhJLElw0mrTtsDckCM
	2UaufatSYuKyQI3f8BrfecXXEKJMVgu2+zpJ+WjE7kkrLgw7OsRBI8pLxTtM/uDENHW0AQQod+S
	IuXnMQiSBzPlJqkWHARcwoxx2niluGwXkcIX/tkWCACh+7dahml+6TfQD+p0MzPFbivGiykHO5B
	6VOOroVOAa6ibBJRroVqfhkvkQTA=
X-Google-Smtp-Source: AGHT+IHIKPBZDKT7w7IpWopx5uH4BHntATqlKUcI2/L3Cr9WY9dhlh8vnxgsPvJdCqu2ZnTQWYHb9Q==
X-Received: by 2002:a17:90b:3b48:b0:323:264f:bc42 with SMTP id 98e67ed59e1d1-324e128ea93mr4998711a91.3.1755716402534;
        Wed, 20 Aug 2025 12:00:02 -0700 (PDT)
Received: from lkmp.. ([49.37.163.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d4f780bsm6089677b3a.71.2025.08.20.11.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 12:00:02 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: rdunlap@infradead.org
Cc: airlied@gmail.com,
	alexander.deucher@amd.com,
	amd-gfx@lists.freedesktop.org,
	christian.koenig@amd.com,
	corbet@lwn.net,
	dri-devel@lists.freedesktop.org,
	harry.wentland@amd.com,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	rakuram.e96@gmail.com,
	simona@ffwll.ch,
	siqueira@igalia.com,
	skhan@linuxfoundation.org,
	tzimmermann@suse.de
Subject: Re: [PATCH] docs: gpu: Fix spelling mistakes
Date: Thu, 21 Aug 2025 00:29:01 +0530
Message-ID: <20250820185948.18805-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1fc93d62-eb77-46a6-964f-c0bc7348d482@infradead.org>
References: <1fc93d62-eb77-46a6-964f-c0bc7348d482@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks for catching that. I’ll send a v2 with this fix,
including "fourth" -> "third" as suggested.

Thanks,
Rakuram
