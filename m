Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17C11CF7BB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 06:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730961436; cv=none; b=hqLqjCUu6P0gmEWwPF/c/9YKrKW6xPuG1Pf1kqrxziLmKAuTqiGBex8YIck3c4qUonUMvxmQHzT/BqQkbhM1yPnmoXEPigzh2zcW4vlSO+YCX1k1USy7b4VlK0LUMFiNfkBF1B4AjpL2aZUDzeOr/o2I0lgJfUHAp/jxdRTaNZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730961436; c=relaxed/simple;
	bh=AefW8bsaSt3rDRVGJf+8Zsu15+j4HqVp75JUKe9nL44=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BPKNUUj7D5cNNj1sU/YIOPfe3VWj7MAI5sRATwywYeSts+QXBzDwjhcsQB0VgNXKfQh7fe2FZK26VQBn7LksX6kb//PsY5aRSuR4LSWLFC1WOh/NHLjjpFKwi5c1GJ8e0nc3/5eFHMS2+oX4XNEGNamIpwCazukmQ/K4/d/1sLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQt1O1ak; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQt1O1ak"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 979D3405D2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 06:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p9jXQI5qIflI for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Nov 2024 06:37:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com; envelope-from=xandfury@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 98872405C7
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98872405C7
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fQt1O1ak
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 98872405C7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 06:37:13 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3e6010a3bbfso420950b6e.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 06 Nov 2024 22:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730961432; x=1731566232; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VbO6aB5fSbhKrtKv66n/69pu6+mqeAhZ9XD1hcKe/DY=;
        b=fQt1O1akz9DgRkSaAJ/r4k03Pgyec8LuGgT00vDTPKm7A3nxpe0y5ioE76rLW30kSA
         RP7Zc/O0K915LSVXNsR01cgbYAh1QKoI3Ez/vjTqmZSu9b0w9wj765Ql0nSPKRfgCKcD
         bXHf1rnBm3qQzK0TQaPpOn1dIpL3wDlzpTgzpGjpoGReh/IoxUVRATp95NUhtPU3d5FJ
         LfbptKGW6+ldxnMSbXaEtSLJra+78ZTCBN19y6xnX8hLCoGP79dOKhlwajxoSV2n8irP
         4aIhNs+RDuBrQUDu+C7/iF9U6fAiZHA2Y5afgFlHM6SOrYxmfbDiHAgK4CVcnaaNS4g1
         wfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730961432; x=1731566232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VbO6aB5fSbhKrtKv66n/69pu6+mqeAhZ9XD1hcKe/DY=;
        b=qz2RoaHftyj/OJKWTJj4fcm/WsNIubRdm27iQwH6v9/NzCyXcsW5tvhKMKdeMmHh2R
         FxmMshsOFBZ566rSlBjdzhwBD3DtIJCwrl6O2Q3uPKT1ecqkbhQRkpOhMVkGGVMiGPx+
         RywdnP0ncnB0jVtM/en4MJhfjdwb866tWPESPd7UQHze2XxVO6N8M+UDIa5oRlQK0+Ov
         +nDroBg+Qsds+SzodlCJHhdwSnSWiEAUOutd9ztwZ0gHty5eSGwvcO1FkwhhX3ZIY4W5
         P7YvD4h4zXJwcl+cUEEeHwB7afjbxNkzxBc8FFG3Y7SArtEkRVGk/66K69oX4zCmTBlH
         IaVQ==
X-Gm-Message-State: AOJu0Yw2pnWQPjdWDvryptOf87lhkHPbmzfm07My04K6EP2/KPbhwVd2
	evszTr72+DIrDoOvvCGS5T8uywu39jk1JVhf1k4q1f9kQWAKhb3xHcAzFNwG
X-Google-Smtp-Source: AGHT+IGF4lMbiPUR9KrbGhCZDmM8tQUV8/34OZwedmF370vmbPjqFl5VyJ2LhEm1KCCLi5+DOH4kQA==
X-Received: by 2002:a05:6808:1482:b0:3e5:ff0b:e9ec with SMTP id 5614622812f47-3e78d33d090mr1058502b6e.9.1730961431676;
        Wed, 06 Nov 2024 22:37:11 -0800 (PST)
Received: from 1337.tail8aa098.ts.net (ms-studentunix-nat0.cs.ucalgary.ca. [136.159.16.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f48abbdsm616310a12.10.2024.11.06.22.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 22:37:11 -0800 (PST)
From: Abhinav Saxena <xandfury@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Abhinav Saxena <xandfury@gmail.com>
Subject: [PATCH 0/1] BPF verifier documentation cleanup
Date: Wed,  6 Nov 2024 23:37:07 -0700
Message-Id: <20241107063708.106340-1-xandfury@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

I am interested in contributing to the BPF subsystem, starting with
documentation cleanup. The patch removes trailing whitespace from the
verifier documentation to maintain consistent formatting.

I have tested this patch with scripts/checkpatch.pl and it reports no
issues.

Best,
Abhinav


Abhinav Saxena (1):
  docs: bpf: verifier: remove trailing whitespace

 Documentation/bpf/verifier.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1

