Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A4213D276
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 25 Aug 2024 09:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724579684; cv=none; b=hEx+Wrp6KjbhxWwnPPsnHbdBiVKOoLwzlKIPxm2sqfdpamMZZtpeXjCDmRE0OwZcCulOEuyOZS31fWnQgrYEs8lBT/mlWjwUHMKhkayeK4JtQEevxbKlmoKV2QGmFe7My67w1OO9dMovJmFGnLh5oeyWKIdGuYD5JWIhI3lImek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724579684; c=relaxed/simple;
	bh=1mBkGNFlDFxDWfPDkvYSxSHFHU6QkD9OAkyQG8G6pzE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cHBNA414GJlQV1kTc/z9WIJ885wLkYSlMVgRnPchk7f1tAIUvARamVsUAV7xKFrfqEotXMhC1DpmqdqdqMPtyg/M5bmhSIKUYcQyntb/I7vt6UiU80wKYBPyzwRMZg3e1reaMn+P+kDUNs6e1QaKrXx7W6Rx7ITWGmHi+9HNn3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CIfBULox; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIfBULox"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AA1A40313
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 25 Aug 2024 09:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2vmb7czAnM-t for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Aug 2024 09:54:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=0xff07@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7712840312
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7712840312
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CIfBULox
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7712840312
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 25 Aug 2024 09:54:42 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2d3d58d6e08so2564547a91.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 25 Aug 2024 02:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724579681; x=1725184481; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ki9s/U4Sut/kkvy/DZiEXTPLLw1z1KDsCl7bqzPU3h4=;
        b=CIfBULox0bNs2ab25XkfBrXIo7ZA9UmEgmcd41gbnq257lIkmN6Emm1k4AEpSfkfgP
         OK5CzB3eDhR0UmD+O8asZ2O++gStIh97x1hZco2iCYxxgEXL3frBsKJBpLGNRVJ5lttt
         Vuv/IoMJ9kBrJKjz/c5Vv6Ee8C0RI4VST6sUKIrL0eD+S2r9YcuxcM+LiMpUwaKyclmk
         0DCQH7LSoQudKEQHL70IjGHPiHWn/jHomV9HJx1XIEa5+pdJyEsPiD/fRoE9l4cs+fdL
         UAsNXnAAeCq0ZGDYRiDarZOAF8pdkW63VHByYdgvWO5o+55HkbgkaXpFZJ8JSvKBw2KW
         y4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724579681; x=1725184481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ki9s/U4Sut/kkvy/DZiEXTPLLw1z1KDsCl7bqzPU3h4=;
        b=tUWwezbqJl/f3RIKmF/Y4IeJZtEbyd9eAGiN5JI1juOKYoNJQKTvprvvaARJz0QITF
         01/ZF84sfaudRB7m5Wufk14iutInwadKEVvXLTKvuphMODzrEz81fRsFxyjSFzHzxP9O
         ENrORIKssfJSb0/K4pKgNOVfLR+iuDr26i78HyRADekzSGvrFX9nVU0UUpn7rWbM3wJw
         YtwSHuQ9bc10Cfmm4hJ9JPqUHQ1gCZgLrU/hxR/3KSu7vFSdBPSPC/EsL2j0M6fej5hF
         vfV12XI/gMhYeg+AAZ1XRHzGmPWQJbWkC1I0JKXC3OyFCIDHR46tMkP5F4gxq9BsysC8
         t+ug==
X-Gm-Message-State: AOJu0Ywr+Lg4oOzHESpizIuLvLAUSK4dmP5bj1eQLn2ssZEyKL4rM7yG
	mToBaS6Qju7HbLeQprKDp6skzDQUgebMiD1MFkL62WZS7irrVdHgeGAQhv7x
X-Google-Smtp-Source: AGHT+IGKDKyuEjDmKJ2HrlrT1n9OAVS1IkrqVYeL/JSUzQu9Op5OuYi5ifOBX9DZtCv3vpe88REJ7A==
X-Received: by 2002:a17:90a:39c2:b0:2d3:c088:9c54 with SMTP id 98e67ed59e1d1-2d646bcd8a3mr7648841a91.6.1724579681173;
        Sun, 25 Aug 2024 02:54:41 -0700 (PDT)
Received: from 0x7f800001.. (2001-b400-e2db-5f0d-8150-1fac-9fab-d218.emome-ip6.hinet.net. [2001:b400:e2db:5f0d:8150:1fac:9fab:d218])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2d613b1cb38sm7454970a91.50.2024.08.25.02.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 02:54:40 -0700 (PDT)
From: "Yo-Jung (Leo) Lin" <0xff07@gmail.com>
To: 
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	ricardo@marliere.net,
	skhan@linuxfoundation.org,
	0xff07@gmail.com,
	Todd E Brandt <todd.e.brandt@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH] pm-graph: ignore sleepgraph.py artifacts
Date: Sun, 25 Aug 2024 17:53:50 +0800
Message-Id: <20240825095353.7578-1-0xff07@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By default, sleepgraph.py creates suspend-{date}-{time} directories
to store artifacts, or suspend-{date}-{time}-xN if the --multi option
is used. Ignore those directories by adding a .gitignore file.

Signed-off-by: Yo-Jung (Leo) Lin <0xff07@gmail.com>
---
 tools/power/pm-graph/.gitignore | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 tools/power/pm-graph/.gitignore

diff --git a/tools/power/pm-graph/.gitignore b/tools/power/pm-graph/.gitignore
new file mode 100644
index 000000000000..37762a8a06d6
--- /dev/null
+++ b/tools/power/pm-graph/.gitignore
@@ -0,0 +1,3 @@
+# sleepgraph.py artifacts
+suspend-[0-9]*-[0-9]*
+suspend-[0-9]*-[0-9]*-x[0-9]*
-- 
2.34.1

