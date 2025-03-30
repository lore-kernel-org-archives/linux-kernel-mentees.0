Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A4F145348
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 30 Mar 2025 05:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743314035; cv=none; b=fl+DDHqRV/PZc7yO1MQJHywGspX01PStvEPOefZe3fkQV556x1+2+QTdiESYDHG3nOFil7tiPPUKUlP6CBjoJw32fYF84LuvRx+7k2q9c1lF+5Ydk/SDqXNzFsgroZe+0xf6r/S8hT25zYdEY5nt4Dq4GCzoQFjHV+AA/NO9484=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743314035; c=relaxed/simple;
	bh=2Fhv9qnvd8RNjpQuGaYtULwR1+y1/6h6SMgBrXpH98g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GJz+xXvqs8YzW376J3J9P3WB5u8FnAW8kDC52y+nyWUg4jEnTYO3FABVgXtCgTHXZSf6ohOy2tZITCktN81upecNj3CBbX0+NtheIfnWZ4hz9NghsfWVd2cjqhjYcDPnfDyEo684f6It6H4R+oK553xbC71IMiyAW4w+B1ccEWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUdXN2W6; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUdXN2W6"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1296040919
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 30 Mar 2025 05:53:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5raOpbC0k2Av for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Mar 2025 05:53:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=x0rw3ll@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3347D40900
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3347D40900
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KUdXN2W6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3347D40900
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 30 Mar 2025 05:53:52 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ac2c663a3daso687597366b.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 29 Mar 2025 22:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743314030; x=1743918830; darn=lists.linuxfoundation.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f7+opnZnWv2RK4udQA4OVRLQ8DCRiE3lR+tMnaFWVmg=;
        b=KUdXN2W6I6m7tE8Bz7VYKbDEmZEdQwEXLEpJZ7wXKKZq45VOzWJXzITfYvoR6sdYt+
         v0/lw+1uHta9g17w+xz7CkKispDuKzHyql/N8C0pnQshHi9KoZu48Pfk29HHTzF/Tj/k
         73jygeGMM0fwcNpdxwLNMprPkvRgjJv6bkWpul/Y4tL+GtzrEkjWcZjcebCKl1hqRXWs
         GbEmabZ4+M4lyS4txlLzh77dUmqJS71fWRfNiHrPxyaCetwRSWxCz59ULBueD+3+u0Ms
         BYfgtzZd9v1dQwStOGD8ISajtOhXx9/XFcwu3tDydIo0R2QfTp5XiONQe3uf0dhIFtva
         FDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743314030; x=1743918830;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f7+opnZnWv2RK4udQA4OVRLQ8DCRiE3lR+tMnaFWVmg=;
        b=MHzuYAyqGq40PJHc3QIerBhGENdnZidkmeycBVdHq0xcNteV//1YsVp9YYMofqFt6z
         9c2w23ErSy4GO5vmqXXF0ChbInUuB/Aj+zN8UCW6RNOdkMNSjpQGPGu9WZ5j6Qb30DQV
         NltXUnmGoUkaeCmfUK8kDL9eCwnNEO8k+mDT91zm9c3KiZwDVPQRmobyXZYEjGx6G8fU
         RDhs3SIqOSFdVsy9JCpgVI+Vj+A+LPIHfDu+ZQgtogqiLvgH/vv+ZMMbhrnxInRGM2AA
         Rigfqc5EKfBJatzAPf6rgMgCtEiHRTwDRdIaXvWyRldPckVur1thuQq2WSqfimRThnXJ
         5iIw==
X-Forwarded-Encrypted: i=1; AJvYcCUfWzaJTY9lyCPdw15CSqgluCwNrKbQFydrtMpluVy+5vb189C6N78X6/e1Mn47YXB4c8EnFQk2U6Tb4pQcODTZoqpG9A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzAj1w3YaOJ/qoeC7Bh0cYh1EO96yz8ei3K3nnKFfQ5wcl1U6v3
	m/n8M3ICmO5703wx9UAVStCSN3EeWQ1qh8DoGIoqEYrTH+00fhoSfGDfYF+pwgEXeOAT
X-Gm-Gg: ASbGncv2TZbFuSELH3VkYtG5gi2yAFbHYDQsMvEknRYEwPVrKaZBhJ20YDZyJNZQ8OB
	SO/1zRE+NSCO/61BILfzp/q7Sqfw4JfC8kRlH4LLdek8wjCx0GgK/W7xDswTAzbt3URX80ztWML
	HFDoi0yuk7+f7NhQImNAhv9NrYfs2EV95cyhqexNpLp1zAsIv2Iq2kST1qsdhxVNv88atvOMek0
	c7Zxj5BXXmbgT1PhNKFwUW61zCa+EILKcuogyT5kFVNl7BxYkcrutSOCQTsGuFWug04J4oZzvIn
	Abi/BxltGmRtHK9V1BIFoOAZZ7MclezPD/3GA3GJAF89UlT9lO/y7z5ZMVDFFxVkg3M=
X-Google-Smtp-Source: AGHT+IFt1IoPQ+hdWHf9zq0XxxQYclb2T0wJwu5XUmcSUTJ7OgzLLs+YQy9bosZqvphuRf4Q85XUYQ==
X-Received: by 2002:a17:907:9629:b0:ac3:c020:25e9 with SMTP id a640c23a62f3a-ac738a96fc7mr372842066b.34.1743314029858;
        Sat, 29 Mar 2025 22:53:49 -0700 (PDT)
Received: from localhost (44.tor-exit.nothingtohide.nl. [192.42.116.218])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac71927b12dsm441296566b.59.2025.03.29.22.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 22:53:49 -0700 (PDT)
Date: Sun, 30 Mar 2025 07:53:40 +0200
From: Ahmed Salem <x0rw3ll@gmail.com>
To: robert.moore@intel.com, rafael.j.wysocki@intel.com, lenb@kernel.org
Cc: skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] ACPI: replace deprecated strncpy()
Message-ID: <cover.1743313252.git.x0rw3ll@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

strncpy() is deprecated. This patch series is split over two patches,
the first of which annotates destinations with __nonstring, and the
second replaces strncpy() with strtomem() in the ACPI_COPY_NAMESEG
macro. Additionally, two replacements in drivers/acpi/acpica/tbfind.c:60
with memcpy().

This is an effort to avoid using deprecated interfaces, and potential
compiler warnings in the future.

Link: https://github.com/KSPP/linux/issues/90

Ahmed Salem (2):
  ACPI: mark ACPI_COPY_NAMESEG destinations with __nonstring attribute
  ACPI: replace deprecated strncpy() with strtomem()

 drivers/acpi/acpica/acdebug.h                            | 2 +-
 drivers/acpi/acpica/tbfind.c                             | 4 ++--
 drivers/acpi/prmt.c                                      | 2 +-
 drivers/acpi/sysfs.c                                     | 4 ++--
 include/acpi/actbl.h                                     | 6 +++---
 include/acpi/actypes.h                                   | 2 +-
 tools/power/acpi/os_specific/service_layers/oslinuxtbl.c | 2 +-
 tools/power/acpi/tools/acpidump/apfiles.c                | 2 +-
 8 files changed, 12 insertions(+), 12 deletions(-)


base-commit: b3c623b9a94f7f798715c87e7a75ceeecf15292f
-- 
2.47.2

