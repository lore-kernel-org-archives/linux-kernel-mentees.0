Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627BE1607AB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755029734; cv=none; b=F39d+akOOlucJWTOsn/woToKHd5ItvyMUu41ozZFVjFalQU5bCYwlCluFlYfpasYQib7EVKMRU0NAp95kPGCAsklAZKn++DvvEY8vIwufkOyJyz8c+7xUGyH7Yz0HiiWchpByRG3V/vxp2gzrIm8IbIPxgnXkzaBCm5J+23KQaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755029734; c=relaxed/simple;
	bh=/6wrBiHZoDySXBiNZWAnkDSHetXLjHa1RjPY4LPJ7gs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P/HaBOjfBk4ZEFQY9XX+QKUCfxbLsvmw5YlA4MTyyCZDRDQpJVI6GBxamw5WPC+D8cGGTfrDS8PQoecN6MPPPyQa4HP5S+ArIa/FjjrhcjsJ3YQe6GwvZs+MyERdobawPflTPtqDv2Fpc5nSHFrERTdXaSpWFZsU6ZMhKxM87mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=emj3iBWU; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emj3iBWU"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E261E606D7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:15:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YZqD0fYTVNVm for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Aug 2025 20:15:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4E4A1606DA
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E4A1606DA
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=emj3iBWU
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4E4A1606DA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:15:32 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-76bd2b11f80so5449939b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 13:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755029731; x=1755634531; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+8fxYZ+iI4vioxjOd5nfalSbq4oqADYhi86soSGuwZU=;
        b=emj3iBWUYhE286QKLdXNyFKPfObd7icyvic/NduN5e4lpzYkrM4vMl2bvIgcsIkubz
         e16iEMKD8/4zbcouXboiTL4MGfavPLOKQACkJvIdirdT7Mdtwo64alistpSUboXU0/1X
         kCMCn2fy/CM1CmBhml9gXPYTU2m99YrlTFdrKTBLCxX2k5XZOekwvl7LAlL+GZ1IG0HS
         65YSlvUzPovfJ+LWBgisrVFZU8rgW8u7laN6YXHV5E6sOx/Yb9vIsmWomoGT+bZ0wjwJ
         8/r+J6J5TmviZWsloZLR3PZ68+xGAFNJ03xUmTLkCufTjj3xx/znqpJPCpv6Z1hW4IRT
         n/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755029731; x=1755634531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8fxYZ+iI4vioxjOd5nfalSbq4oqADYhi86soSGuwZU=;
        b=erlWi28xf19cnbOUwUVGnMAq217dTPsPtNHh5lNTehhW5JmhhqcWFtxqFhENllviZJ
         j5ihzL642xSEmQfcWLpcKWRRVvGa9eXsX/JW3ROqc+uIWf8vRtq7VNgirBPLKcU272/A
         67bu+WJwBuQ/FS7YHr/oFoECsplR6+XXMbbz1/RCkEBO6nps6BkjadGaG9ImDKRCpQcE
         9X+9iJHZX/lwFS2u9cgUG8Z6tyl4YGpiiLTCKqY0Rt66Rx9m1Zncc+8WzvqFkhQgBk8S
         HH8X2TAW6p/juVofkVe6Qf/4BSU2pZVaOkzBcq8xnLJtSF0FMZ4y5WGNorGs0pzsitLy
         lGaw==
X-Gm-Message-State: AOJu0Yz4aIbSu5Tudhb8aArHms7ipIh6ajZf9V/Ho5Z28EkPfpQ10fxQ
	87DYlAd4MIv6lg5fOB3FP97issKd9MSqNjebAH98oKYRtiNlgZ9V3+LQ
X-Gm-Gg: ASbGncsozSzdDZghU6vD9iTTP5oLkA3xgWP6JfxJ2g7UgM8pox/+qKkla+/zZujXHgO
	exU5xMNi6Qq47WLhsThVOCd5lmU/hnPHrRYLPPobHJ+XX4JMkqvyGaM4H0nVRge0Sk4iOJzVpdP
	2ViYOHHt8lcAK2XJME2dDf+snEjoaeF8AK03weSd0rNYeVViQZvRuog1nvRP4mcQKo65jhaXmDI
	HSz5DTJVYoSCQWPEZ4B07JL10GfFw3/2q4upUb/C+BJ0xOld7dGAPaXJi7BkfFSifHyCiIM8IVQ
	3SP/ew7KU4QHVPCPJrdrE6QsGq5stt08Z8lzCb2wnv3tJo6gDGl02pYThg402Tri44rMa+vMX9E
	7mhCLoOJrlk481Aq3Rj3vztb6hh2oiJs=
X-Google-Smtp-Source: AGHT+IHAJYrDKGOQS863t+gW8IOB7hcD3SOjRzQ59UOorndQDXfv6kC7FAgnpDEdtxjzwqxFQ0i7TA==
X-Received: by 2002:a05:6a00:3cc7:b0:76c:3751:dfbe with SMTP id d2e1a72fcca58-76e20fc51a5mr770241b3a.24.1755029731367;
        Tue, 12 Aug 2025 13:15:31 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f48fsm30198046b3a.40.2025.08.12.13.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:15:30 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Soham Metha <sohammetha01@gmail.com>
Subject: [PATCH v2 0/9] docs: fix spelling mistakes across multiple directories
Date: Wed, 13 Aug 2025 01:45:14 +0530
Message-Id: <20250812201523.69221-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Used codespell to detect spelling mistakes across multiple directories
and fixed various simple typos found after manually filtering out the
abbreviations, names, and non-english words.

These changes were split by subsystem as requested during review of v1.

---

Specific changes:

> deivces -> devices
> substracting -> subtracting

in `Documentation/ABI/testing/sysfs-fs-f2fs`

> conventioanl -> conventional
> directoy -> directory

in `Documentation/admin-guide/blockdev/zoned_loop.rst`

> Availablity -> Availability

in `Documentation/admin-guide/cgroup-v2.rst`

> flushs -> flushes
> explicitely -> explicitly

in `Documentation/admin-guide/device-mapper/delay.rst`

> approriate -> appropriate

in `Documentation/admin-guide/device-mapper/vdo-design.rst`

> aproximate -> approximate

in `Documentation/admin-guide/laptops/alienware-wmi.rst`

> directores -> directories

in `Documentation/admin-guide/mm/damon/usage.rst`

> multipled -> multiplied

in `Documentation/mm/damon/design.rst`.

> entension -> extension

in `Documentation/arch/loongarch/irq-chip-model.rst`

> userpace -> userspace

in `Documentation/admin-guide/tainted-kernels.rst`

> whoes -> whose

in `Documentation/core-api/symbol-namespaces.rst`

---

Changes since v1:
 - Split into multiple patches per subsystem
 - Adjusted heading underline lengths where necessary to avoid build warnings

---

Soham Metha (9):
  docs: f2fs: fixed spelling mistakes in documentation
  docs: zoned_loop: fixed spelling mistakes in documentation
  docs: cgroup: fixed spelling mistakes in documentation
  docs: device-mapper: fixed spelling mistakes in documentation
  docs: alienware-wmi: fixed spelling mistake in admin guide
  docs: damon: fixed spelling mistakes in documentation
  docs: loongarch: fixed spelling mistake in documentation
  docs: admin-guide: tainted-kernels: fixed spelling mistake in
    documentation
  docs: symbol-namespaces: fixed spelling mistake in documentation

 Documentation/ABI/testing/sysfs-fs-f2fs                | 6 +++---
 Documentation/admin-guide/blockdev/zoned_loop.rst      | 4 ++--
 Documentation/admin-guide/cgroup-v2.rst                | 4 ++--
 Documentation/admin-guide/device-mapper/delay.rst      | 8 ++++----
 Documentation/admin-guide/device-mapper/vdo-design.rst | 2 +-
 Documentation/admin-guide/laptops/alienware-wmi.rst    | 2 +-
 Documentation/admin-guide/mm/damon/usage.rst           | 2 +-
 Documentation/admin-guide/tainted-kernels.rst          | 2 +-
 Documentation/arch/loongarch/irq-chip-model.rst        | 2 +-
 Documentation/core-api/symbol-namespaces.rst           | 2 +-
 Documentation/mm/damon/design.rst                      | 2 +-
 11 files changed, 18 insertions(+), 18 deletions(-)

-- 
2.34.1

