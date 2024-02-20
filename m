Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438D56A00F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Feb 2024 13:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708435219; cv=none; b=n2fckhzeosALmLD3CtSlm+3na9ZfhblgJleiJ78e+WVT4zDxw09pBk13juT2G++wjfqpSRQLv+tQDMllzPJDwwQueHppV945hhMHPznWCSEHMomkRZmxHwdOCVwLL92tQibm2Mmm2RuUxSoRlzwgbmAhFG1rPbxL1193c8+/Q/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708435219; c=relaxed/simple;
	bh=Fv9dyTtBP1/Lsb3Vbk1dXhdsNHDyoT8aBphxxfwrw5g=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=rtU2nInd1nwaJx5/TrTspCrD1872H5e7x4pMW1ZJjWwezc6sNridcZZFK5UF/sHckEx5FFuskylTcMik6hDzUyfowPV2to8SDXtISZpJzgK38KD50aT1+ef4HWCtkkhhCmYi8vetrD2I7vksOpjk3j3eCObot5oS5BLUCh/OOAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPI8jUv2; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPI8jUv2"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1F3B41560
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Feb 2024 13:20:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gV7RfpK5fEPF
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 20 Feb 2024 13:20:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=shresthprasad7@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 54CA1407A1
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54CA1407A1
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nPI8jUv2
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 54CA1407A1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Feb 2024 13:20:17 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6e332bc65b3so1436713b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Feb 2024 05:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708435216; x=1709040016; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fv9dyTtBP1/Lsb3Vbk1dXhdsNHDyoT8aBphxxfwrw5g=;
        b=nPI8jUv2aVa8daE6tHsiqtgBYl9WURink/8BLe+VW2ApcYZtVpTFQ+AaihnKIsyhbu
         moYQWfuC7UJR5JIwigq2qNiunOTcCV/7Mvc6oCA8W5Ff/s1PNRNx3Pp9qypyTVWJqxz3
         ASMy7HMXE3MEM8HL0cwyZNUog88VcLD8k5Hxq1tAO+M8a3bC+AsZGLEnJuiwVLirmtDp
         eiEEMP3lAU9rBlH20NdbeOQ+Q9W/FK4O79BpUMzs6aRBS0wY9QRM23mop9RmGnA2+Ecs
         +7pxzF9QZzXHxNKQTAPfpoVLaxi8pAGPpKa37z0g/DaLvpSB2K9l4oluIq2OJbKo8fdv
         Ssyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708435216; x=1709040016;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Fv9dyTtBP1/Lsb3Vbk1dXhdsNHDyoT8aBphxxfwrw5g=;
        b=KIGhGsZ1d7NI+RYfrtLjFwOPtl1Z5fU22dfCKc3vsL7M5XOYms/LNz7EUlVr2aec1A
         cEFAh0PIbOHQMnDxlr9OJFHO/CQfswF5Yz1XSr5EkVs7jGSOec3mv8p6elvk3eIYQf/j
         SINcYKHKLjUr/+XyJHJXdgPMHo/pfWMPF9iVR3lXaSJxOrRg22EbdN2ffCLRKA0E/VEw
         7XQeLvHzl3lKvezjnbKQOXhWJHhZoCFa8KQBMci+SPkKyLdMUP1yTNM0EkgAR2EDHLwu
         GCXd4MetdGwVp4BzUiLtHT5PDGkkZL9eHTnAhhB1XCPhdKrvsctlHxjJJ+Nwv5rOubRH
         NwQw==
X-Forwarded-Encrypted: i=1; AJvYcCWYzfRFgVE9pTaOfOTvjGuqd0uojejkp/Hl+LCgBkr7KEc4Vu7ZcusNfzlk/uY0jvT1RtAsFC0VGPTTCMpf2LwGS5FviMOdCrz4+vSqj0TXTMaXFA9pYdGgL9GpxCP0
X-Gm-Message-State: AOJu0Yx6awbi2maye4h5bjvlDqUgRqc/mh2keWBxbSVIDh1+IgXlBaC3
	u42JYPl9ufGeff1X6y/DoUV1LXvu3PBcsjXQHck8v+u1nuGLjjhb
X-Google-Smtp-Source: AGHT+IEttk5iim0fojrJRidnAlSwPBQzCi5OkRgaS40jpL4zi8P4DwPAw/dTd8vJAIb7P1GvllVmgQ==
X-Received: by 2002:a05:6a00:1b42:b0:6e4:5a01:1b4 with SMTP id o2-20020a056a001b4200b006e45a0101b4mr5402527pfv.8.1708435216508;
        Tue, 20 Feb 2024 05:20:16 -0800 (PST)
Received: from [127.0.0.1] ([106.221.238.187])
        by smtp.gmail.com with ESMTPSA id n12-20020a63ee4c000000b005dc4b562f6csm6515293pgk.3.2024.02.20.05.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 05:20:15 -0800 (PST)
Date: Tue, 20 Feb 2024 18:50:09 +0530 (GMT+05:30)
From: Shresth Prasad <shresthprasad7@gmail.com>
To: mpdesouza@suse.com
Cc: jikos@kernel.org, joe.lawrence@redhat.com, jpoimboe@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	live-patching@vger.kernel.org, mbenes@suse.cz, pmladek@suse.com,
	shresthprasad7@gmail.com, shuah@kernel.org,
	skhan@linuxfoundation.org, zhangwarden@gmail.com
Message-ID: <6fcd7da4-f7c1-4f2c-9214-70ec77443572@gmail.com>
In-Reply-To: <20240220120024.28694-1-mpdesouza@suse.com>
Subject: Re: [PATCH]     Fix implicit cast warning in test_klp_state.c
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <6fcd7da4-f7c1-4f2c-9214-70ec77443572@gmail.com>

>What compiler version and architecture? Are you >compiling using flags like W=1?
>I would advise you to always add more information >about how the problem
>manifests, and what you are executing. This can >help to nail down the issue quicker.

I'll keep that in mind. I'm on an x86_64 system with gcc version 13.2.1 20230801.

I'm using the command `make -j15 -C tools/testing/selftests` with no additional flags.

Regards,
Shresth
