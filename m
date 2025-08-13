Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E7D2D7381
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 18:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755109485; cv=none; b=r3IxpwWm04QSss0DrWIPMoXdlcvBaPHA63RybQJIu6NEK+y5Rf431TGLvs30Mw//RRHSRY91/xiQzkrf/xIGN/e+s3ngHcLeIRgGuw6NqU8EVodlElkfFR7ZO3UeCauP4R4Cx8TYdXdR0KJtXgXkhn47yfKG2LJUuCij6dLLm4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755109485; c=relaxed/simple;
	bh=WSElgLPdc06rADzbVIRWp6BMTdAE29ykCLN9NzSyDVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a3BWx9OB6fM5FfAMBJKgIsosCe/uQobQX66i9DqMmvMAMa2sxlcX4gwrzAOHwgbKr4Tjuo0ef8AdspwHiUwmAOB4StovRuZDSn9dpRmRz9xGuk0t445KOGb2+ExMomiZsHcM3nSDbEAJubt8ACk75X99bTx+GvgAIcPtV9qjHhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mc9z9bbL; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mc9z9bbL"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5D7442999
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 18:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aHOKnDOeSoRC for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Aug 2025 18:24:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=rakuram.e96@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1437642996
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1437642996
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mc9z9bbL
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1437642996
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 18:24:41 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-76e2e8e6e9fso186437b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 11:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755109481; x=1755714281; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSElgLPdc06rADzbVIRWp6BMTdAE29ykCLN9NzSyDVI=;
        b=mc9z9bbLd3O9MNwXtpW6I78fDIWjAlT5DfdyZ/tUW1SamMzXsE8uMLcA7RopxAnI3y
         2gV6x1Z3Sx+cKh3lfEGqC8sFOeXD+20aOx1ccnpUmd75OAxOnhay2FBRK4vrqlfE0cxs
         JZt/2p32SIvMV3DErjc4j+OUVulmCOHMlptudhJqrVFAIpMkyaQwAQTnyICLkfOzpRqg
         xEdqzPqfx50gh29D7jQ2YSH4/driikQUiupmy8QSEj/VffSw6znCiu2M+orZ8emWowja
         UEkYtF4Gz+JokF/pYdCs3sKbyDp8BfRH0k9OxW7rrk5kphf+eS+HDHmKb1kkQlKwObru
         EtDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755109481; x=1755714281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSElgLPdc06rADzbVIRWp6BMTdAE29ykCLN9NzSyDVI=;
        b=MPHewC3r7UPNhFQmEjM/EL6GLx4C4c64Ug4jkTr8XNGb+i31SATiDn1Oq5/xceeK7P
         ksj+bKUrILVaqy0HjZQS+aZ174wzY0ZZ6GMWxOkB9H4fekpabkiaF/kdkkgjLW2sG0jM
         6Gh5MyKDjrui1fYk0N8YW5modY+Bib8HfGYAK4zRz8yfVzitdt51AYJyLIxeLn/7eMjo
         vb0KVE1+1XYPRtegfkxVL6D3PNiNIOC62xklGUweg0zRAvuwW3WM2jGq6rtD0z+l53ME
         P2XwnWMOURmdPevoscRsbqQF/V6mJj7oRV8RWBAhSXLli5M+pUrvEZLTkI+FO3/64/uz
         mNMw==
X-Forwarded-Encrypted: i=1; AJvYcCVmIAQcVO5unGFte4WPnMKR582Q3VLY2TSQPAJaqci1jscKf0PcAHMV5lQEki4CLXIt1bn+Ime73cz/+XtzVGFi1xWkMw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw1FGrBLiFMF7da2HG0nK0yl9GEGk30af5BEgdKXQaOT8Exn9r8
	KfrW7MrSHjr/19+qZ5VEaJBy/NCxhqDSGh/Up/Xh/0uR+s//RtMDLCZr
X-Gm-Gg: ASbGncum0aeprPSXC+zJMwDKZkTBq73MtcG68LrEXC3poJc0CxO3GHLMq317+bj1X2s
	eV69HWC4+3V6W56EIDxxZb4vsB7z38IgBS7fjRR1zNeMrtzMjEQg8uvJ4wieRyXMpzjZ+6Cyvkg
	Un/EUgkF0bqJZQLREqw2SZ63nifHDz/o+qUDrkWTeaTEILQb9b5J/qrppPpG6nWtp/n5v4k/JZO
	8uX5tlwjzuAHhjXgi3uyQveHDH753WfMFmSWH5Hn2LDZklg2WDzxj1iRHHFgsvy8lfLu+LwovHA
	OCn5tdT/jYyVFYT8lKH3PhlYge01KL/ddSZdsK1fg01JXUGg8MZdJHa+6UfytmUiy6cExJHMECo
	Nm17JyrJS4IZYrZxpgcgwYdT8eNE=
X-Google-Smtp-Source: AGHT+IHNn8cM24C2wvCi/hf6+sq5m38hsN5v8/L3Ik19O+AqVou0LCoGzMMaD/LKrQHUHWi0mTx1hg==
X-Received: by 2002:a05:6a20:2446:b0:23d:ae11:e1e1 with SMTP id adf61e73a8af0-240a8a83ed2mr6253991637.12.1755109481144;
        Wed, 13 Aug 2025 11:24:41 -0700 (PDT)
Received: from lkmp.. ([49.43.242.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e2591b169sm1947859b3a.91.2025.08.13.11.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 11:24:40 -0700 (PDT)
From: rakuram <rakuram.e96@gmail.com>
To: rdunlap@infradead.org
Cc: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	rakuram.e96@gmail.com,
	skhan@linuxfoundation.org,
	ukleinek@kernel.org
Subject: Re: [PATCH] Documentation/kernel_hacking: Fix minor typo in hacking.rst
Date: Wed, 13 Aug 2025 23:54:33 +0530
Message-ID: <20250813182434.7189-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <970be4df-e010-4ba2-b2e9-c2c24b8742ef@infradead.org>
References: <970be4df-e010-4ba2-b2e9-c2c24b8742ef@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the clarification, and I apologise for the oversight in my submission.
Could you please suggest the best way to check whether a similar patch has already been attempted before sending one?

Thanks,
Rakuram
