Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE0927A451
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  8 Aug 2025 12:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754657646; cv=none; b=guXLuTVauzM1vWdCV4TaPvTPut8gaqPe5KX6oAAz9SOTFInJDgekUqtdEotwI+2HACPDvRTEEvGfveus8fz240Z8Gd88PA4lGfopsO7stnSf/CXsGtOsTSzLpukVHy9hzoKBJaWXimO+TCZywpXAT2erVDq3rnOCaxEtwYojkGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754657646; c=relaxed/simple;
	bh=14s83wKNHo4jb1NouuEHVhfJVywI1yO9i9LxcjEyolE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VrG3m7CNW9O7rOWAq20CAjqIkxuC4Yv7FaMZhUalB0cSm7yVffrndGNW88JXDEXABm1j8D/2kpUFGwk5B2SWNMFnPLUMhv/OTm7nxE/Gxv4KhG1fiymSQv/GWUK+X/CeoJwM2Sf/880rcKkoz8jUndZ8gxytVBsT2bd3GQftfOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXmazuej; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXmazuej"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32ce1b2188dso23535741fa.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 08 Aug 2025 05:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754657643; x=1755262443; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14s83wKNHo4jb1NouuEHVhfJVywI1yO9i9LxcjEyolE=;
        b=EXmazuej8rAjwx+hXi2N6Al29j6VDHdEmcKYwXiijy5xEDRAbmVgg67lt0NouL70XM
         EZpESgDs8AVJLK2/W/4KSnQwmz5JQaLffO3UxBmtOR9FydKymMN3fdi6tPlqTlo3YWB9
         cB22d2Rce1VkFVml2TJsj7RPtWBolUTPQwaopWVxQloU5MGKRhhILelZejJ9zCGfGXhm
         jh8oIE6onaJ50Wcd9C49nW0CNnqHewxNu1ADJWVo67DjiuRdIsCaOb7QxDFC6cdUZNEd
         kYqh6SZFM3lJQUeMWD6k3mC0V9pa+tf1j9m+tuFdj3mBHmcsI82T/Bz9MP6UhzMeLslh
         Mb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754657643; x=1755262443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14s83wKNHo4jb1NouuEHVhfJVywI1yO9i9LxcjEyolE=;
        b=lwq0nP6qRmKC0vdS3LMeb6nnPEukjpm+AKJN2XP8Czizit8IuY2oRDotWArjdNknXH
         lm3wzHIDagPoWYUuciGzxTRWiZXGBtXiSeJsyp6WZwOhmrTPA5q+DwjFX5SHXQPHLLMd
         u7nhQKej8Kz9MjorPjnwL9GD2meKdaZeQVDjdVs/zLtnEmsrue39wYDFu79MlReloK2d
         DVCsG+heBH8ztsqJJ9TIPBk4jHPmxOI90Pi47ivpG/yE/LJerUw2vemPvDQQ9iN5OBEx
         w/1mHi1cwL1hSR5isHXsPpEPC2A0uufjSzTRSWJkbFi1pz5D6iLYA+vZnSfZxcuqmX0O
         WStQ==
X-Gm-Message-State: AOJu0YyzYHqh8ygGRl1OWDNc/ASo+pNMbZmaycSn44JeVtwedgW/h0I2
	4iJbjNtOJT65reWp6iBN0a/rUkWzJNmph7bs/BpfHv11tQCuvyI81PIaJAIX/iCrEkE0Bw==
X-Gm-Gg: ASbGncsKPfPPQPgW0VrM5WjFNzH4yjZVIh/i+5GP19J1DTfxFQ5e2T3HDGgoiuUDPbw
	KF/DbxLqhN0x4Y2/9aMyLefC3s9m+ZJTamUV2uaOVDyafse4oPVF9CaKOnkG1xZIUx3xMPyMN0M
	6H+PeXCDSvn3NIaRiZmVIjA05W47hIIvDL2/M9+pJgj3Daip4ioZTMzodoeEQIKY13yfkfAIYNs
	ZDAM9GL9NZUtlVfEunlBfznovZVYlvB7EZQMaNpcoqmUiZsCBzxGvwOKGIDBSM9AZuLQWuf0jCA
	GkbJZhGJaxKEw1zj7AIwH8+GOenpKe2YB5XvCDcuzFAOot6cupfqKWC/cWL4jYSXXf6pMSh+JBW
	2PJYR7AHMaquP3Zqto6zxI+pmGRO5QbDCjVvBrARs2lvmaQ==
X-Google-Smtp-Source: AGHT+IHDGlUSzaIaARn4tMG7S/MPyveO9lKV8pZC0Bn4v67bzbtDnybxrQBPwzLTlDp7RLRWfVdPgQ==
X-Received: by 2002:a05:651c:502:b0:330:8de6:de71 with SMTP id 38308e7fff4ca-333a1f4e90bmr7578711fa.0.1754657642229;
        Fri, 08 Aug 2025 05:54:02 -0700 (PDT)
Received: from aper-960qha.jay-rigel.ts.net ([46.160.226.222])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-333a6ff9789sm1593561fa.50.2025.08.08.05.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 05:54:01 -0700 (PDT)
From: apepenkov <apepenkov@gmail.com>
To: seokwoo.chung130@gmail.com
Cc: linux-kernel-mentees@lists.linux.dev,
	linux-sound@vger.linux.org
Subject: [BUG] No Sound on Samsung GBP 5 on Linux 6.16
Date: Fri,  8 Aug 2025 14:53:54 +0200
Message-ID: <20250808125354.12763-1-apepenkov@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <CAB1jyqxWnmpu7mn65jNRkb3NuirayxWHO7TLnkvR5WqcOJPNOg@mail.gmail.com>
References: <CAB1jyqxWnmpu7mn65jNRkb3NuirayxWHO7TLnkvR5WqcOJPNOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello! I am facing similar issues on the same laptop. I tried using kernel 6.16, 6.15, installing latest (2025.05) SOF. Did you manage to find a solution?
