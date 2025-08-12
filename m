Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9061262FF1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755030665; cv=none; b=BaPIZoH8HR6PJN5DYK9o3bQ9SLJbeADEwMYd9X8DA1R/cYSip72lXglI8SqpT9jS37wmeonOpNocBKh8FqlHKCx9ZWqRWstwduTS50JkdbYYahGehGM2iA07K60/BBUm63ru9kfBNMAjqI/GOJGMQMaQHW80TVDov+tQAEKZMwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755030665; c=relaxed/simple;
	bh=2IfuNLyi9uipq3MoWaI5s6DoSkNjEJLyA65WKiHlfhU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lpjYCYSOf2HqupkBpRQQW9IqCr9ZUI09YNEk6TbdCYVy8pz3Fb27J7RrXieF0Ob7LIcmBR2UJWKkLz3GhICZF9JR/dMv4kepnkF8RrXs3/fwYTC7cDNAmP9pWGiTzCcDEfU5saQEtHy0+gT3wgUHs9+SbGySUN48kEJi8gtIORw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6EvXUvz; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6EvXUvz"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4329B400C1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DvdGmmJZGrPo for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Aug 2025 20:31:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9412D400D9
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9412D400D9
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=U6EvXUvz
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9412D400D9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:31:03 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-23c8f179e1bso70898075ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 13:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755030663; x=1755635463; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V2D4lQpHgeJtXF/5J8lAW78CcuhxTdiGqHN9IR3ofsk=;
        b=U6EvXUvzZmbMVWnMrOiIf8iQWIzGzm2c3JZTYCrtTWNoGPWWC8XQ8yHIRyAPYPnbnv
         7Aq1mGSnikfCmdKZ/clmZxZkCi1CpVkJwYNO28dsml+9rb9j2NYs4fPnyUepLRwnnFIQ
         v7AI/qzP5GODbru4dvkGf1lbFArAOc+mcZqlSq3YFggmY8SDLtBcqyUqm3XTdI9Z5BEF
         WjPFRZ9EsZQHd5M903vjYGnRR/NwTOci4Iz3io787Id599QWFfstld7RGA7fXNS95gkv
         pyOqosHGL3wK5Vk4Gb+JTIkYqggpkdkBxI9aGFdN3MbuS1WJcbCXeDWMa8SVmvxFR7Bj
         Cz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755030663; x=1755635463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2D4lQpHgeJtXF/5J8lAW78CcuhxTdiGqHN9IR3ofsk=;
        b=VHxzREGt5ci2PVtDXGsMtTsFqT8vz1W5MefKpZFELje/tzF1vxHoB7s5nLmj0gcwSY
         AY45hNYEMha60huOuqkwcPTITfkP+JShjW8OKGYD7xVAMFTYYjuQZrMn3moSPahgiv9h
         2n3och1tMhQzspVU6XI0Odgbk2DbgwBg2CunthqGlfHMokcUfesKThPDFPlg+6x2JTql
         mERvYn5jK7yHXjgWkD0TfGphXhNyXnjuxdOUI1o5HoVw6t4Mu2eP0h3+l6UV8NCrPtsf
         tfFEyXxQ2/Q7ih9qA2jkqX+PAd0sonOTw/y/xSwbmchnlaKa7/IIFgNtJY4cpx1GIfDa
         hGdw==
X-Gm-Message-State: AOJu0Yx8v44YhL8gcH4ASJZxrkh3TUycC+mV02c8pk2YsCRYRlRtuIQJ
	K8zCKY95Q3CPqpo5rZddYIC2UiDne8LZMoGGkjeTq1xoDWSIeL2tUldw
X-Gm-Gg: ASbGncvzJa9xIMljC6oEAFTwc0c/NlJhEbpG9+3WErxxMyKOaJMReB4Ap6xoXfId4Vw
	edsgMprmAeo30krNcq88VkIy1K3Ud921YTD+7qAtOC3TolLBG7joiFcZ5nrTr7nXyFB4OYX80Co
	7loznFKKp2Ai8L7rUoMu05ZKhhrcvNyoiXflEoFiB/P+aHuvn/tDvFrEjJmnerOkA3CoV9LkKdA
	vU1D0zIDtSYnHbpbMo1qVDp/huM30gcCOmhw6xGzEOsn19avdbIZWj5b/zY6JwUCoXTo3hgCDxh
	uwKa9uVe2wFugGtHTSUfXRZ0uJxJyIhvQ1Bew4BIfXyKWT5O40vMwpycUC2zYkhjAbmYbv084t9
	mMv1epaqKzzoWortz6FE0Xtcd60+zPkI=
X-Google-Smtp-Source: AGHT+IG9ie4Yc/kU4PIfXSz9Uma7N+1x9yV3RNNsMPDGOBfLHQeO7dB57CngKREHXy9pRt6j39w6Lw==
X-Received: by 2002:a17:902:e54f:b0:240:2a0:c449 with SMTP id d9443c01a7336-2430d08d164mr7810415ad.8.1755030662579;
        Tue, 12 Aug 2025 13:31:02 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321d1db5cfcsm50361a91.21.2025.08.12.13.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:31:02 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	dlemoal@kernel.org,
	hch@lst.de,
	Soham Metha <sohammetha01@gmail.com>
Subject: [PATCH v2 2/9] docs: zoned_loop: fixed spelling mistakes in documentation
Date: Wed, 13 Aug 2025 01:59:40 +0530
Message-Id: <20250812202940.70560-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found/fixed the following typos

- conventioanl -> conventional
- directoy -> directory

in `Documentation/admin-guide/blockdev/zoned_loop.rst`

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 Documentation/admin-guide/blockdev/zoned_loop.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/blockdev/zoned_loop.rst b/Documentation/admin-guide/blockdev/zoned_loop.rst
index 9c7aa3b482f3..2d50d081592b 100644
--- a/Documentation/admin-guide/blockdev/zoned_loop.rst
+++ b/Documentation/admin-guide/blockdev/zoned_loop.rst
@@ -77,9 +77,9 @@ capacity_mb        Device total capacity in MiB. This is always rounded up to
 zone_size_mb       Device zone size in MiB. Default: 256 MiB.
 zone_capacity_mb   Device zone capacity (must always be equal to or lower than
                    the zone size. Default: zone size.
-conv_zones         Total number of conventioanl zones starting from sector 0.
+conv_zones         Total number of conventional zones starting from sector 0.
                    Default: 8.
-base_dir           Path to the base directoy where to create the directory
+base_dir           Path to the base directory where to create the directory
                    containing the zone files of the device.
                    Default=/var/local/zloop.
                    The device directory containing the zone files is always
-- 
2.34.1

