Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798882DAFA8
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  3 Oct 2025 17:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759513187; cv=none; b=gp9bPMkUtHLaxvQO2UaU42yxdeTLUdAR5ZjjcstyK42riKBh0hX1qn2gnzE27amTNK2DcfafeqtDLuBnxCDA5eOePF9e/+06apbwFi/Q7ecUTgFxM3IEolxy17aXQeRtOU+M1UXnlwTngvZ7KMQOcxRzVTuqw3tsCKBinvoRGd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759513187; c=relaxed/simple;
	bh=ZaUhRL9uYRgp3STBiIrntA/xJ/L78oxvSHtu/809KNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EMlRfDUVPoP4fYYqLDn0hJ1flWtQ+4ncqpOGRtYcuB23ARYndZMCoJM+bmxDh018NGhQ9KNgZQtaWhsNlLKSx5mXY9jsYGqVFe0PZ7ITGUJ9ZQUK+fgdfkV9RLkg2PqMWAHZqjS5PyKUkodI0Z1EFSGSo/3d2o18tpB6SHiyG8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fse9gFtU; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fse9gFtU"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b5516ee0b0bso1843042a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 03 Oct 2025 10:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759513186; x=1760117986; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwVgppgL3hOntHtqfj1wQPCPEzCZhCKf11suJZJq538=;
        b=fse9gFtUQfEYjcFZ46MnMfl6bP7vZoq1Io4T6VV5Y3BvQUU1yuZPxHbVPAKobTsed9
         4EKii/wQlKMgC4xkjdcHiUg6Iw1Eny5fRHnSkzWAjLoB/NlD+NAiXXYJqB7lVNTZQv/7
         LCdTW4GPbLkACk0exi6GSwo+pmefXzDU51noMnTNbTU4QSqA+yNeQAc2GUrhtvUV2ZPp
         J5pp0AYXx/KnguCOMeKSTUru6/Eq5gwbeWqP6TQJN9+TRvvB+1e6wEv7k84Ppp/Q2U4p
         MAmGiL9qGNi9PYV7AHeSqaKM/azbB5O2+yszAR2p57RIbYzZKlNN20nXvc/IXHOBnyez
         WbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759513186; x=1760117986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwVgppgL3hOntHtqfj1wQPCPEzCZhCKf11suJZJq538=;
        b=SFCE+7HY4V0xOalAuX/sTFDyUU1CbYpw4akBGxFDMP1LO4oZiT0eYPsg/4W8ccTC+S
         E3/709qfBwmIPEsxIClfL2g6MLUMs0+YQ9dXpS0k1IT9ZyLLCD8PiHhUSfXM9VaA2S5M
         NmyUUbSaaYt2WUIWCZIyzOLYU/xesAXsSyTltCEn9tYup6jZkY4QaH9w8c7ULij3hrt2
         1OcNbljRYUVVe0eyfYS3uK25xwtf3XuI/FCycCs6KUO2acQjBi9vQCqwCmUQS0jRbf6Q
         qSJ+lIXNvPyq6yZXlOER7cBhSdscC8UZf/AoWYBsimkgN5KjuMxuIouCcHmHJBBjKGRv
         ajCg==
X-Forwarded-Encrypted: i=1; AJvYcCWw/bgn6O0IJeDOXbV7Ur01GvFqZrvKu+g1GHTl19Ek/ki0Efn3rOunm666K9cIt8m2uEkyIQFeq6USUcbbFpWOhbn7sg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyezpD4pKDtyO4QgRKMxFkfeG5VittvJe9mHIOBLDZOFkdB2Miv
	ZVqXugxc89j1CuIpobVb8HIhCjP8HU5lYKlQcwdfkoovv/ryXxkbjqIA
X-Gm-Gg: ASbGncu8BJxiR03VnzNzCZ/wQcJkZwrbkrcIJkNijrRgO8Ooh6QcQih51OWpRdFnPoX
	m0dfW/5aR3bXCwMhjnIxUIPgMSmHxRgsIE4/orxu4RjtWswpV9WLv3c/JwZqDMTnhAo1Q+jjap6
	gBFp7EIWpVG7nsKTJE5tAN27qxumxwjtwbCUIv+ghwlHpHaMj+iluhNrN20SXWr3Omb9zXGnt17
	k4u7Q1I8UEMAtxuv7EJARLccUUrskEbBwIYKfoYk3B3yGzVJkqnbBl+7+ZcY49rGJmnY2k9d9TF
	vKqeEmYB3zxmv3Mmd7qRD+4+MdGAl/d6q3irqU4l5NvOl2aCR+VPQIF87HkoxWYHmLbQUdN561I
	BPXO0qwlRo3EhazGvQ2cuXcG1r+vhbbhmtkkoE70IMMnlmw6X/1X+lbaAz4ge8a6sHYTfbziXXT
	eA
X-Google-Smtp-Source: AGHT+IG6pd8ft2Gfzz8OtvTYc1aPctUPueNw+N8ygaqoazUFNcD1dF0JrQ4yow/VID/T1AeeLSKoZQ==
X-Received: by 2002:a17:903:2f0b:b0:264:befb:829c with SMTP id d9443c01a7336-28e9a5463aemr42367135ad.9.1759513185641;
        Fri, 03 Oct 2025 10:39:45 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1261edsm56267635ad.34.2025.10.03.10.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 10:39:45 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	zhanjie9@hisilicon.com,
	viresh.kumar@linaro.org,
	rafael.j.wysocki@intel.com,
	superm1@kernel.org,
	2023002089@link.tyut.edu.cn,
	qyousef@layalina.io
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: [PATCH v2 0/2] docs: fix malformed tables in Chinese translations
Date: Fri,  3 Oct 2025 23:05:58 +0530
Message-ID: <20251003173926.10048-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003162626.6737-3-krishnagopi487@gmail.com>
References: <20251003162626.6737-3-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes htmldocs build errors due to malformed tables
in the zh_CN and zh_TW translations of cpu-drivers.rst.

Changelog:
- Adding missing TOs to the relevant maintainers.

Gopi Krishna Menon (2):
  docs/zh_CN: Fix malformed table
  docs/zh_TW: Fix malformed table

 Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst | 2 +-
 Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0

