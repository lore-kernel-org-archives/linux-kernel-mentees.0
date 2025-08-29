Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13EA2638AF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 29 Aug 2025 17:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756489383; cv=none; b=rgEErMbtWRr8sMUCG0OOAy2i7GCoG0pnrSuNYxMUECUuMJfObxFq96rq/BUfMh/DZEp208LjgYOPYDKStmkvfvdsvpL2xl7aAs4+wM1Ojm3jI3JP1RA9cEE0LI02SYCwCj6dk/YUHEbR3buW288yFJF9B3VcoTPa7rZG1NO/kqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756489383; c=relaxed/simple;
	bh=CVgM7Tyu00zzsMBseHOctXjMN0Os3f8IXfyGMpQmnqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u4ElrvWR2KSS4+Crg1ovmARZUJFCfUh8AQqapja03ptcw3odfcWvGzmYaAyTg0UBaGlRICV2Rs8onCwAjmtpdRTSKBLGjH1bQUJfij4FAy8upNwK5EXo0z/1ynTyggSdZk4/aH9Ja1S8Y1xURmWwYXySSe1HrXf6/LaV1PH3Vvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWA6EqVk; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWA6EqVk"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DE9B614C0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 29 Aug 2025 17:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AN2JRuP1wXvd for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Aug 2025 17:43:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=rakuram.e96@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AD84E6110B
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD84E6110B
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eWA6EqVk
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	by smtp3.osuosl.org (Postfix) with ESMTPS id AD84E6110B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 29 Aug 2025 17:43:01 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b49cf21320aso2589275a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 29 Aug 2025 10:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756489381; x=1757094181; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVgM7Tyu00zzsMBseHOctXjMN0Os3f8IXfyGMpQmnqE=;
        b=eWA6EqVky6mJlkYuPCHoGJDAiK/3nM4VJgJhGPkJRP5lFSiJZ2ZiNIeZBvKR9nwGjv
         Bbtq5cicYlrxpqGtpf9MjF2SYHxVr7JG3u1daKxtWO8KaMP9td2wn+MJVHwAjBiAqf1j
         BCXRVi49iwSbNMoMiR6KLD381rM7LsovYAEkY+DpH6ag7gXPTBnDpA1kd4EAYuaZf3H7
         ddPtM7I3uWPvw83kChnbt+VYp0czjZuRhT6TWYNiWJIfjHwUfQNutAShkwiV/uD9tHS6
         QhW+DTL0iUfxvlbYorJpCRjkv+yBysT15JeZEn/ci0v+5YoUZ1onS9bpOMbNJzV42a5/
         +wpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756489381; x=1757094181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CVgM7Tyu00zzsMBseHOctXjMN0Os3f8IXfyGMpQmnqE=;
        b=nSRbrdZgD9XE5hY2f1f3bCuB4P+3sNQeVrfIgnNfyGqmj0JDfxX3ko+nPJU/XN3eal
         l3ZOI5B0YrTB+sgtwgnS1bxgQ1djY4gZdr8dp3cD0UNc3XuHoRIaxr8k5O6xlanak6Rq
         dPlqZXWWbcfjf8auHMnqHgxUNdUkJFXsmA1ad0u/o1ZR+oXfajy2XL5HEw3xKe2uDfIp
         jbkLMx//Yg6pId8TJAmdR9lEzHLIp33Ni6jVJgPc8VL+sGUbhLH2CPhh7D/ZiGVfrv3X
         Qml43UVSRyFRgijRoYacG+y03DYozdeZYV+wwHtFU8ou7/N8RYwq28898lDHR7lxqhZb
         6UKg==
X-Forwarded-Encrypted: i=1; AJvYcCXZsISD6K76rZ1AeNJ00qZJMG2tS/wDRi0V6NxGA0LONQo6Tf5wmjJuohA4nl6Ez+LuITKShzDGGRvlVyDLEJWHy6x7Tw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwtSxK9v7pMxI+OskY6qXZ4GDqbVL4tBz177myERQAjSI/l6xXq
	ltADdgkA931r+bdHiZbinynOTVtFCmhAg/VA+9Inp/8V9yiH1eixcI6U
X-Gm-Gg: ASbGncvP7m4JgrTJCbp7Ief6dbIu8XIFLuq4ZnL/cLVanxsReghLO1LGvGyWazmcPbl
	/JVuvkFZcC1vce8fhmF0ptNCZZg0Cebb1jbsIYSPZvICaV1rT5Kc89y0K7ssYWj260FcAahF6HZ
	Rq9jeHSpk2BqI0j4dnhbMQ32Ub3NHskCwKmHruugwfafBMGZRFMoaR7iXzrTaeHgaT+HXKf6PzE
	8Oiexvk8k/UU44etxLUcHWD7Mx8UNvrYubRu6J23I9aLQx1ONaOCKsCnX9sPig+Rw4L1ykL5qex
	gi7aUcEWiLX7jUpwopBU3B88zSCoo3Zx39JQ6FKBB+auyfWK8XzbF/CXIRyEWgSPAU+Dz74F2Xt
	m80QFDlPM1d9yIC+Al/D7vhUdl+VOCIcGvt19VOiYXRrybEeP3324zna9FYnVvVB+C9GNQUgGqQ
	==
X-Google-Smtp-Source: AGHT+IE23KRcGDR/kd3c4g0abkgFnf3oFZxhdeRn83CjGT1YO9Cgs7wU0MlSqxAutRWSDpZp8ltIBw==
X-Received: by 2002:a17:903:1205:b0:248:79d4:93b5 with SMTP id d9443c01a7336-24879d497a4mr160522795ad.33.1756489380684;
        Fri, 29 Aug 2025 10:43:00 -0700 (PDT)
Received: from lkmp.. ([157.51.63.166])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd347db1fsm2727833a12.47.2025.08.29.10.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 10:43:00 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: rakuram.e96@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de
Cc: alexander.deucher@amd.com,
	amd-gfx@lists.freedesktop.org,
	christian.koenig@amd.com,
	corbet@lwn.net,
	dri-devel@lists.freedesktop.org,
	harry.wentland@amd.com,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	siqueira@igalia.com,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v2 2/2] docs: gpu: Fix spelling in gpu documentation 
Date: Fri, 29 Aug 2025 23:12:43 +0530
Message-ID: <20250829174244.13864-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250821025957.22546-3-rakuram.e96@gmail.com>
References: <20250821025957.22546-3-rakuram.e96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This is a gentle follow-up on this patch. Please let me know if any further
changes are required.

Regards
