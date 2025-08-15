Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EDF38D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 00:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755216577; cv=none; b=VWuAOJAmc79WtL8yyE5UKnZFamyy3oC0aKzo9poZUhexaXwblhoCh6NtI2zMcXh33uK4huP0Lf/D6qGyQ9BtOO6lEP/7IfJSVSjnG4pg5E97wJVefecvDhMyi0ZB1rPG2wIvaHtHqroBBKd0celxQ6s7D0uEXtdVZLkvgF0/WxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755216577; c=relaxed/simple;
	bh=SXhJb46D02XyYpPG0ZR+hLtc2VGrkDqQzQtP4rIForg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K0FrMGY/cMN40k18vPCDCC/cWRZjzQap9PmZz2h4XWALWgzRl/ZhPbmn4BAd+dw8MSK2ggGaas5weUOeqe8JYpUdnItU98DYwtil/wlgYWutJCpe4S6vRbiyiKrpx0db/wOx8Lzwb6wb9nNtHpzJYESn/h/ZLEDTPOSr7LyTWiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXi4uv6o; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXi4uv6o"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC06F608AA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 00:09:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I-_f7MpWaHUT for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Aug 2025 00:09:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3F783608A5
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F783608A5
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eXi4uv6o
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3F783608A5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 00:09:34 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-76e2e618a98so1222860b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 14 Aug 2025 17:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755216574; x=1755821374; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zxoW0PVifSF+JymiPBLwjWMtoyAZGxm4WlnOuM8c4Dk=;
        b=eXi4uv6oDh+LSoqb5XA9f0v8i8go2K/os7zf6J2ZhsSLQ3dc6J2K7ibMj8VhwP3uJB
         +NXiekHv+EdTvSXTu6CKP34Q0TzkPaueZJkaBHsykbapDQ7JhYgiYB4wwSYwE8ck6uPq
         S8ErPus8xg/XdD/Jm2hGpanxXg+naB/rYP4w8gQ8i8mBFePqB9PLUy3U3HIQcSYIJ4nh
         GVKbvJCd5Mrqkxbykns4YEGd811YtFpF2qmELmKV+fJhskRq4MIXgxyamUMawnDLB8mQ
         Ns40PMY2hvRYvfQJpw5PvYwm32xP4ECBQHLmW/5UZGQivVwJTWpgCimWRayVvqWpoU4W
         EbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755216574; x=1755821374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxoW0PVifSF+JymiPBLwjWMtoyAZGxm4WlnOuM8c4Dk=;
        b=ei3Bl6dGOwkqku8fs5i4ob6PyvDyXCgW1PfOW25JCQtbMZXw3AyDvbNeBEc7tXI7rL
         PpvliMqn9MB6udcNMULj/yIcPVGZlQMODFY9Z8ZKOY5k70Sc1dMCScHCEwKgH0HsJ/7f
         kAUyIpxa6TDyqN6cHJlrPPP7qG8YmPiEv8GFhMstgbwecyqF1nRreqGwtUy7Y9xFL1+C
         BeUW5Ou7qVltzM1Fz4fBg7FABJZ8QMUGjdI4fPPD4nTJANsFw6Fnf5A4BaquUjUTg8A+
         9D5oYgvOqUC+r1j/uK/DeLQgM9oRG/N+o+YSqC+ASJ73c1rERAmFcrql48i8uihmXD5T
         tEMA==
X-Forwarded-Encrypted: i=1; AJvYcCW+oGHsVFi+6CMDknRBm8+Ck3Y7covY6YsJHfO61m5TE+whTolHczG+0mx3m2Z7NVMkMTJftYYdp3uNGUO6HhI4GtQq9Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzzP2HsoHWuEOQIrB2GMk1mvG+SbofDrCMW8yxnd8W/tN50Gr7v
	fIGOvsXakJL8ReL2CzAHQw8QTcJMzSdS6xUQeyt3+fBKBrf/nq/c7De5
X-Gm-Gg: ASbGnctms7wFlbYOfhSBNoKPTeCwl6xAtpGf++8q5xPIHCvjmoYidjFE3g0t682BHe+
	wsfRIsiEEJQF9OTxW16yWSqnZGHXLV6WuxKsiPKG/PyiJnXsDtN7qipjK4h/tEMp1Hqkn9ZUCY0
	3xM0T8DREZLC0TBhK8mL6Ewqw9rl3shnDtfCNSVKHiM2U4bQQmDKoF6A19tobSlbH7/GTIqd4Vw
	nxqICyrhOz7MgjKPni5QxrWEYBb3cQtufKiK+OqwLPdgBdLf5ptBYYY/8i0HBy8bPkTw2RynH7W
	fI23lxqyfdTuvISTdXvZpZoqrH/n1R0FeneCQl1sKIItf4N56YtnjUhWhD1QhdqygzRs0ryv7YY
	93M7g33KhQATkdU3ybZ3s7RZhKrOqS5o=
X-Google-Smtp-Source: AGHT+IFDMdF6+yivvCvqSJWE4UQ35aadp0nC/z5tzMjZ2sph8Sp3/GEi6/LsTjvgkkBK2V+ed8hFgg==
X-Received: by 2002:a05:6a00:b42:b0:736:3979:369e with SMTP id d2e1a72fcca58-76e446ffb04mr30874b3a.9.1755216574174;
        Thu, 14 Aug 2025 17:09:34 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.109])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76c2efd89aesm21367854b3a.106.2025.08.14.17.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 17:09:33 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kselftest@vger.kernel.org
Cc: shuah@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>
Subject: [PATCH 0/6] Kselftests: fix spelling mistakes
Date: Fri, 15 Aug 2025 05:38:58 +0530
Message-Id: <20250815000859.112169-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Used codespell to detect spelling mistakes across multiple tests
and fixed various simple typos found.

---

found/fixed the following typos:

> didnt't -> didn't

in `tools/testing/selftests/filesystems/statmount/statmount_test.c`

> add add -> add
> cannnot -> cannot
> fowarded -> forwarded

in `tools/testing/selftests/net/netfilter/nft_nat.sh`

> faile -> failed

in `tools/testing/selftests/ublk/test_common.sh`

> indicies -> indices
> requrired -> required
> guranteed -> guaranteed

in `tools/testing/selftests/kvm/riscv/sbi_pmu_test.c`

> avaialable -> available

in `tools/testing/selftests/kvm/s390/cpumodel_subfuncs_test.c`

> requries -> requires

in `tools/testing/selftests/safesetid/safesetid-test.c`

Soham Metha (6):
  selftests: filesystems: statmout: fix spelling mistake in output
  setftests: net: netfilter: fix spelling mistakes in output
  selftests: ublk: fixed spelling mistake in output
  selftests: kvm: riscv: fix spelling mistakes in comments
  selftests: kvm: s390: fixed spelling mistake in output
  selftests: net: tcp_ao: fix spelling mistake in comments

 .../filesystems/statmount/statmount_test.c     |  2 +-
 .../testing/selftests/kvm/riscv/sbi_pmu_test.c | 10 +++++-----
 .../kvm/s390/cpumodel_subfuncs_test.c          |  2 +-
 .../testing/selftests/net/netfilter/nft_nat.sh | 18 +++++++++---------
 .../selftests/safesetid/safesetid-test.c       |  2 +-
 tools/testing/selftests/ublk/test_common.sh    |  2 +-
 6 files changed, 18 insertions(+), 18 deletions(-)

-- 
2.34.1

