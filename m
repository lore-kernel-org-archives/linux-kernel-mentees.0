Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7463E2C0294
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  3 Oct 2025 16:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759508826; cv=none; b=aU+s3qEEwQWbe0sjV2CFnUaZZ8bbbvxZ1MV30ee8Bcnw53WiGt2wYJpcwHYw3m885b6Rlx3xsfLWkW/fAYEN7G+IByOiLo152NzhPt52oVroMdhOaZP4KL1l+w00rDM1Jg09a8yM5AsncawIt6PhM68O3H+vEgsM38Zn0nf12VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759508826; c=relaxed/simple;
	bh=0RiStN3RrbvB94Z1yKDlLdZYvlG/Mj3msFqW/hElFc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AdyUxmXuus5Y7zV9mrzzxT0XaseKmaS1kaIBQQnIt7kmIc9gRU1Wb1mYY23sW5iSW5bFapRNgup4LQ27J/A+nqC9behLjOii5JiRPatM68Kje7I699lDVInSumbTEqA0YAKc0iNOd0hbuWlQxf7vup2W79tCf7WlSqOos2gy6LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvGPoGgW; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvGPoGgW"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2698384978dso17881515ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 03 Oct 2025 09:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759508823; x=1760113623; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/2q9wYSU+eDUIzaN6J73+bHEEYdLDRSnT+gWaueKZ3g=;
        b=UvGPoGgWrPriLsHQK6YuEbGHH2/1obgdLGo8WJT0aRLraJ2i29SYqrabJDxSe+wKew
         h5pLwNh4VxaZw8kp6XYoDFTb/DPCCxdP2X9nmtlb68w3J0QYLPdvdPhtz4wCLFgmJO4/
         Mc5w+6fPfItJkWYeHxeerFrvSgXFbI7C44ePJOe1Rot/I91EO01kl+zGPKdL5MCY9OMc
         gLXV/sEqJ7MHuJt/1QaVcpowKDyg79TUXG1plxwfpOVobRXgb+572WN0muMAISEp8Xql
         H5L8CEQjb+IzZuwihTXXF15k8RgoAYmP3AoHuqsyJOTEl9zDWJ049r8DKkDsBuJuI7O/
         bO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759508823; x=1760113623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/2q9wYSU+eDUIzaN6J73+bHEEYdLDRSnT+gWaueKZ3g=;
        b=N0KyT+TeNybMv0LOk/QVu32SDS7H5jer96dws1RTD58fmfT8F5D9a2tJrNypx5K6Kf
         Za8crXBjDpdtl6vpP2puYvHpXm5ZKAwdLudpVofsxUPzgcX7MwttXpWtwBeZ+/8iQVMt
         erHcXXmq4SEcl1X+o/dbgtwOrx4t+bLaBd7sVmhrw8wpaTMrkhQ0cyLGvHcELYc1tTx/
         QpXCbaT9Auff5alsjpGwkkwJXnvVt8L4fPJ4J+SuzWBSkqENEGhh/44MzLyDzYzJrExc
         LrwxhkQgeGvcIVheO0bs/3AqqLS7jVZ52hrgsqFnHEeCn94Tky+hijAAbHgJ+mvbRsnL
         GsEg==
X-Forwarded-Encrypted: i=1; AJvYcCX8bPqIqdVL+8AbiXjpAGMCnvR2+iWBsZXd1GEXcs+ssVG0dqoqqO1UZfWHi8NQQDa4t1AW7q+9ATLT41IprA8hRjgNmw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzRml8EFi0U+vuBdDzxPxc5pDv2t8E0SWzCcRgLyCVWX6b2jLm/
	/Mm78EwJYCJdwaGkFpMcPQtFIohoMEaC9RTtoXHHtFRY2ETzdqPxoum/
X-Gm-Gg: ASbGncsGO28tN6EMkx226jD9EWCCB3mHqz/L0HoweO9QQ/5SA6Q0phKrQ2aMF9ylD2I
	MYAgJ0Rt0DtvmoSIzinmxJgk50OF635eamDWUeoIIn7EncNeclNvYH4EaIEVq6O4PzU546zxw0A
	EQBenGr1P9BcWpSPtAwPYyB1ZkfUX5lhYzjKJNDZym4HDGVVWIaK3IGjeYTset7ba1/NOnsF+pq
	NVU2Ni7C2keq8hi92+BigIwBVEZ0v7j2gltL7tIELwEKhCOmK1enbu9iH2jXgKa/iZ8jf0RDCKZ
	ivd8XXo1nUOcnY4gS29IcKQsjiKUu1oxNaZBZi/EbH/IUBvMdNzPaHh2oh12VbFXvy1fQF1wj1D
	UCqYaIuyyg/TtOfjPgo6pGrSc5kuHCjkpd79oPoQPnvikRX7HaM/oYnQBh2n63fO7jrLr90gsNV
	dd
X-Google-Smtp-Source: AGHT+IG33/LmrD2uJocMd7V5DXyh8BugwNDBXU/jsQ9avtbxXfaUabsRIgvZ5f2Dqev4eNNRS1l/Ew==
X-Received: by 2002:a17:903:41c9:b0:27e:de8a:8654 with SMTP id d9443c01a7336-28e9a674da9mr43290275ad.57.1759508823360;
        Fri, 03 Oct 2025 09:27:03 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6ff0dddsm8416787a91.18.2025.10.03.09.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 09:27:03 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: 2023002089@link.tyut.edu.cn,
	corbet@lwn.net,
	rafael.j.wysocki@intel.com,
	superm1@kernel.org,
	viresh.kumar@linaro.org,
	qyousef@layalina.io,
	zhanjie9@hisilicon.com
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: [PATCH 0/2] docs: fix malformed tables in Chinese translations 
Date: Fri,  3 Oct 2025 21:56:09 +0530
Message-ID: <20251003162626.6737-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes htmldocs build errors due to malformed tables
in the zh_CN and zh_TW translations of cpu-drivers.rst.

Gopi Krishna Menon (2):
  docs/zh_CN: Fix malformed table
  docs/zh_TW: Fix malformed table

 Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst | 2 +-
 Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0

