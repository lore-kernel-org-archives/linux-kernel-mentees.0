Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407F32D97A1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 03:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755745267; cv=none; b=oPI9G4/mgKDxm4KyqU/qlPHsucreIdWR8D2vq/4KlfhgdSJnQmF0JLwsOD/0RsViCauDf159WaAhp7JnFgHSdUaUQJ7Aik8yod/jnmqM/TLuiSu1K+NKD/28K6W+d92Up7E1hNQchwYBdTzTLBI3Qvf2FLDsUS6wUsZ9wfvl0F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755745267; c=relaxed/simple;
	bh=Wnj4zpvupDfJwbDnmrVHBhHb2H+f2JtBrQtLkPCOY9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T90P2kvpHzk3KR9vaqoXDsOdYTek9L7FsCftvCg1+b/5KalrEimx3W/umtE/QjZeMxbYPs0gUZY3bmjnmos2xDSHjXjsPIG6RmMcg0pJ6gvPOPHsNocra26IJnL31h6yUcL+nDR0GW+betP614ytYgkyUmBt+QxDVoVqHHd0A/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITMcaZQf; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITMcaZQf"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBDE761489
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 03:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eN5EGwobQGDS for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Aug 2025 03:01:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=rakuram.e96@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1561861488
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1561861488
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ITMcaZQf
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1561861488
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 03:01:01 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b472fd93b4aso406029a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 20:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755745261; x=1756350061; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uLIq0IXj0ljbI/uh1YhQvF3IAqw8jhRLNek2lIEpThg=;
        b=ITMcaZQf0823b241NrykupmdJzIOJQwtd0un1510XLsc0OkIcLBRinPuXUtkRDqOvz
         JhPDbXgQ6PpuDyzDmlDNL61azzj7H3D33l0uRaGloMr2eQ/j+vwNuuuD7+WF2RKx/WI/
         AuwW7BQMSfju2VYrUt5tXs2dA+mi4vULa+nnU6QG4wF6jlRkKMnkOQrjyZR5K4RwzuoR
         +FGRfKiu4sHczfXf+RxPYtm2bOpvKkLRdjPDXj3ADeluiUDyB2lLmxhlLavbPLkXXgeJ
         RJ0Scttbv+SZAXFptYfYux8XbTRstTB+WfKGGQgfD0EuMzRXYJ/yfZ5xJY5SkcyBRcgS
         gDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755745261; x=1756350061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLIq0IXj0ljbI/uh1YhQvF3IAqw8jhRLNek2lIEpThg=;
        b=p+8P2A7nXnBYhpqN8r7cR5aszJ7KJZD9UIpyvM3Q7+74hd6DemuIxGZlKkSQEy0yk+
         GGWV7rIM0FrcyUDaWpY4r12B9lfoPkcJaW5FkucclAKoURX83aP5iMHPK55BUr52Ru6Q
         +qrsfL4GGbKy5BlTX2WTa3rzt0hs1WenKwv5PNxLvGISdF/Jq2n9Bq1QLePgRebR2ea6
         hZsBv+uzGtgvoiNerIBxPjNGVgapQf+nefHyMi7ErwSCbDGgS+yAWsmpDoRIsQc2rLJK
         JriO5c+RvurhgHej/twit2ckuloaPDIZ5gbWe0AIW9hqL7vhmFdWqZ1GjL0d9qJWuRDA
         s7eg==
X-Forwarded-Encrypted: i=1; AJvYcCWXGSx5Dw9+wEh0JGDQodROwdoX2K6M7yn6THQK4Agt9eK/fp/u71rRw8BpANYZ11In106c/qiTMLbkpAIaWUaMR6X55w==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxrFNY99+Q0t7IbdPdFOURVS3MT1OD9cUoVI8PdTgwNsWMKpfOH
	yahTTEQLpUPXqOd3W5HmxMiYmMr+l9TpK8u3U0w5S1zjp9NcI1HZvc+f
X-Gm-Gg: ASbGnctuqzvcKXv3x/gTDWayTFgvUFYUu439cMExe0nRv9IOJg2EglT+VH2nF+IEDki
	gp+h0o5c4w70t/pst0Tr/eSEDh556ui6kUzkxxc7Mk7cIwuuTuy+tdBCsVv25K4NEocFk7NLfX1
	mqii+eEY7OnjQ7fpcE8B+zt/7hzpqNZpWwd9VQRFtzGo6ZcVfUzqfF4CkOHYptfxX86Czltccv9
	FiQO+h4iWJb1eZ+hwT3JI7kqTVBJy1HrS+TC2Lmpp4LU+wOViS/yzcgncdbzUB2J4PiM2BNwW+V
	BQKVb9E6oE1KIRlg57j69+lgbbgWgUGsmPjfN5qa3LsOv5ebcgsBWKDnbpGZ5dTSzi9duQ5XKCp
	JSIlPxmESYMBSwtCyA2UJd7dVQFiHUnD8PLc+zw==
X-Google-Smtp-Source: AGHT+IFvneYPfHw10OoTjF7DG4R4kNeVCtXde9LOb10gF9Bf3fn+/lBg5GgGDr671XjIvWiL9/bblQ==
X-Received: by 2002:a17:902:f706:b0:240:1953:f9a with SMTP id d9443c01a7336-245febe9311mr14910865ad.2.1755745260921;
        Wed, 20 Aug 2025 20:01:00 -0700 (PDT)
Received: from lkmp.. ([49.37.161.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4c73f2sm40160695ad.94.2025.08.20.20.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 20:01:00 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: linux-doc@vger.kernel.org,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	corbet@lwn.net
Cc: tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	simona@ffwll.ch,
	siqueira@igalia.com,
	harry.wentland@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	rakuram.e96@gmail.com
Subject: [PATCH v2 0/2] docs: gpu: fix typo
Date: Thu, 21 Aug 2025 08:29:54 +0530
Message-ID: <20250821025957.22546-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed multiple typos in GPU documentation reported by Codespell.

This series touches both amdgpu- and drm-related files.

Changelog:

Changes since v1:
- Dropped fix for drm-mm.rst (was included in v1)
- Split into a patch series targeting both amdgpu and drm

Rakuram Eswaran (2):
  docs: gpu: amdgpu: Fix spelling in amdgpu documentation
  docs: gpu: Fix spelling in gpu documentation

 Documentation/gpu/amdgpu/debugfs.rst                       | 4 ++--
 Documentation/gpu/amdgpu/display/programming-model-dcn.rst | 2 +-
 Documentation/gpu/amdgpu/process-isolation.rst             | 2 +-
 Documentation/gpu/drm-uapi.rst                             | 2 +-
 Documentation/gpu/todo.rst                                 | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.43.0

