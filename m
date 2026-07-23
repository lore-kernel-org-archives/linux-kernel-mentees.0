Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C55353A8B
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Jul 2026 21:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784843748; cv=none; b=DIAGzE72i5tavAk6V2xXLTpfJDwvGwZMblZxrNWcWh+8PKOkTEd8AabKbON8zDZv2q+UnwYWickB9myXA8B/FZrSW48pmHM53eWii6Y17giMcNKSiRK453Nz9BYsaHgRyLsqHdOY7elC3iwQOqsOk1SiEx3TSJajyKEB6+37Kp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784843748; c=relaxed/simple;
	bh=VPg6rAtVJsb91gbWoQSIflkk23XesfyA3CglwAbx3B4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e6dN6omIp0Ui0AGdhdsj1ySg44wFjKIoWXuokEpVylgMoJ/qNDqLllUlXCmF4PJXvKM90JkmtiMMeqaVFTKlMK5LFw03todlaVilVuxUKCx5QixJ91aK1fEBy5vB58vuT3kSet79x614PPdnYxu5OPiNCi4kd6LmruMfy741ck8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWw4J9ds; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWw4J9ds"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4956242332dso9308245e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Jul 2026 14:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784843745; x=1785448545; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GI+1TZTSHVUv7hNRHiRGiiEfjlN56a7Ttsg18X440BQ=;
        b=PWw4J9dsCPTxdKRbINP47PuaxfyH5hx1kKM0X0rhhEQnG00iT8uWYYjMz4+dqjwRHU
         2Tm7fT+N65cUcvzU66YfMIgdHkqGeMZshOtSiWKGSI3nXRrSrWkm/INHyvjIEeC/wmHp
         G4pP973N2lJXm89TC0q7Z4fKjzhgTvYDv7e8g9x6TcCPv0s8aoo6R1NYBmtqoliYJcGE
         XJ1w7lflSV07RO+sMHe4QQETrk7EaRl4kxSFu2mxe6UCWYfZO1ZvLwFo/+4SoDenLyPe
         D6fdYL2niknFmDT2D3ronkFK6aRQ+OufaAAM3GozucCK4gDzDPkjHBvzoxtKpRQUz1Zn
         pCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784843745; x=1785448545;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GI+1TZTSHVUv7hNRHiRGiiEfjlN56a7Ttsg18X440BQ=;
        b=Iob+PL0ZA4QsI395hI+yRXu3LGuMUlbzrCdmoG7hojOPkDnq9mcXk9oEBjusqr/WeU
         hh5q2fZ7g+TBo6GgHV2ebTWi8/CJBng9ixwZtMuTv7zD0X9WuKSE6bz5bRi6o1ucYzjp
         kBR5z5vB0T7a9Wks7ZGN9wlx9bgm9yoe2AR8IWEdlejuzfz2+jKIK8ZDcTpiuQtk9dh1
         QHzB0H96BbC+J8JASCFQjGaaL/KlukT+CaMkJ2BStsy2U0xol/7hpkXShsC3I+qt3rCa
         MFsJ5FDoufRRabNjUm1OKAPcgYad4+D32gCjxLCTTcuuEAllqkLOb2ijea8VdjoJMVUF
         AU3w==
X-Forwarded-Encrypted: i=1; AHgh+RoaDuw8Wl6CG+t83eeW9+ImkwipUVwqrd0LyPg8c9wx8Wfw4mthm65pcpOqb2tjQR7CuaK5kutSQJz4IqCnk5E/VgyTsQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGQZO40wYKB7lktjED52609KwPyVIBBkuu8SpVBb7w6AL+xZzV
	RbXx52Y2GqebEG0Z7hNOvb7o57zXFA7eIdVbdkOEHzxpHt2x3YIk8HXX
X-Gm-Gg: AR+sD10kAlAKiMigBGHd+/FumLodr8WpBdkKN2X3i/mCzWiGmfA7M75raEsqc3PqVeU
	CJK+zgTO0aI18EGxVEbCVX5QFdhvNKgRRSJELB6mQsUNA3ekZ1EUboA1q//rCayDF52LHZWTtnw
	Sixc+fmged6NPMfaTkduXWdLC7BzxK4ZTjWJY+FK+ZmSrdGxxCJ62LZGW6ZwYRjlvKZJJWiGWu7
	cvtrOQC22crPoxr1q4ntI5/c/tyOHwCuahcHu+7v9F3ft0JER7EjxI6ACfdyuFPkerD70DpCy61
	prTxrXO3bGYLCYMcZffbj8akEFKFEk5MJmxRP8OhWOaIh8UPIfp1cqBJZQp2GcqFmKDcBi9gTLa
	0oyLrBNzu/Wl8VYrM3zuKmAViEa8bwSUaMO0o09og4G8dFZyIMiMgVGQEe3Y4ERu4OQQ1P31LFS
	DDq8r5uUg8Lx/fxikvQPg+fgh2iC+9xbkmEDmwsS7u45S6J5/pSF4L8xWIojWqmLw1V1MHcY6QI
	boDvrfESRjthHxiGayIrvYaiQGZ5fmIW6uGZXfQ02pnT/kwwGBwJKY4iMafMBkekOQatbciOzVa
	Ek5gMGTzW0C4xBXbE+N6zDXppjmdI7V4QWJOWcsYpojOoNhZ+pEAXutsDqPGcbmLmEHsrGTQQwy
	a3sBhRUGIOK4=
X-Received: by 2002:a05:600c:5718:b0:495:4e89:3f30 with SMTP id 5b1f17b1804b1-49573cd069bmr40619145e9.15.1784843744599;
        Thu, 23 Jul 2026 14:55:44 -0700 (PDT)
Received: from systembl0wer (ip-86-49-244-181.bb.vodafone.cz. [86.49.244.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfac3casm10195525e9.0.2026.07.23.14.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 14:55:44 -0700 (PDT)
Date: Thu, 23 Jul 2026 23:55:42 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Adi Nata <adinata.softwareengineer@gmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, u.kleine-koenig@baylibre.com, email@sirat.me,
 krzysztof.kozlowski@oss.qualcomm.com, mazziesaccount@gmail.com,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] [PATCH] iio: chemical: sgp30: cleanup codestyle warning
Message-ID: <20260723235542.152a6a25@systembl0wer>
In-Reply-To: <20260723161851.21722-1-adinata.softwareengineer@gmail.com>
References: <20260723161851.21722-1-adinata.softwareengineer@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 24 Jul 2026 00:18:49 +0800
Adi Nata <adinata.softwareengineer@gmail.com> wrote:

> Reported by checkpatch:
> FILE: drivers/iio/chemical/sgp30.c
> WARNING: Prefer __packed over __attribute__((__packed__))
> +} __attribute__((__packed__));
> 
> Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>
> ---

Same issues as with your previous patch. Additionally, the
subject contains two [PATCH] tags, perhaps you've used git
format-patch or git send-email incorrectly?

After fixing:

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
