Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16491325730
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  6 Jan 2026 12:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767702639; cv=none; b=oJorMGtF7Bdwansj10xF6INjywE3Uz3XWnQMWXyzSyWhzjOu0BnfwJJlZUyEMjRR4X0R1FdYPPRSr5q3QYDnYrAZH04C3ajrBJMe4/RQee8lCvoTGpoVYXWhfuHIsmD1syLaJHNQmh5GadzPI/2Zasis4ZuMEdC18/kz/5pS/cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767702639; c=relaxed/simple;
	bh=gB36QsoXU0TpS239Nema2PzGFrocJoq6IaXrZ2FkwNs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Xqiicv3vcSnkws62V+bkqi/XJHuLLR2RYwhlL1k85bO/tXmzr5r8YRdPKHGf8ZeybjNC1efxzc9cR2VHz4YoxkA0wG032I+bmWf6TmaG89VbWMJPASfHzkO/HxjDpbjfQnyBOZ1mztDl8XRTYfrZnWTmvlokgwCC4Oxh29uwGDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=buodNzYk; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="buodNzYk"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7c7545310b8so459873a34.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 06 Jan 2026 04:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1767702636; x=1768307436; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRD6jeYRVssN659Sw64j7XEIC4cPwxx4Q1nuaQx4yCI=;
        b=buodNzYkaFzHLnIRj9IcDau7ctHKtK09cW3dgCsIxL2oasIjrK7rAL5iqX3iuxmjbL
         IJFL1951ZzgWbEOGSz/yYYn7zm3dp97dgmY3QQiBvy9GxrBmfia7cq+LL0YGf0ub+tuY
         /eE33K0arke3dWW0wNI7UkLhuCORdAyzF52pDhhk1IO/ZvCByvaP4zV4rbweyeEk56hf
         mHHU0uhXtc5e8TKjFKlk6vzIREXQjCExmZ3vaZMP8IA5uFHPEdlNxle5jwrTDfZXR4pX
         jgqXkF+FDphqpG/E/vdIbeijjf/PF4IeKOUgxZyl5v18XoM0TPTC4JPDj2Lfnp00K0b/
         IqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767702636; x=1768307436;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eRD6jeYRVssN659Sw64j7XEIC4cPwxx4Q1nuaQx4yCI=;
        b=pa1A81B9q6OIEQfT3Sjw6CDUngqQKMHNXQEVnQ2LBVON/8RsKouDRlKioEAKvMPX07
         MYWG7qEWNDW7Lm+8koaeI6rOQljE5vBhUQ1ncT1FWZuIWiAWDP4PJUUgzS0qMOIJAgp6
         YVNk+aGbK3h9SLmGlN8a7f5n53h+BVeVNLtNPxsN5M1m4rH7ZaKzizi0ZYcXIoLpOu33
         7ruxPLfwmDiwpbIsX1Brv/KnvFPlWdknPrZ1+ns6cygdN2IB2sbuSTrjnKxba1G8lTaW
         B99VNqQW4dNn8+J9HOBzqpUOEYDcrvHP3UeaAjj5g6LI0pdw3FbnrC++XoN217GTC9jn
         oEyw==
X-Forwarded-Encrypted: i=1; AJvYcCWB9VIqCH6MUdH/U++6Yyju/GYFseIUx5SRXLgaHBxSoSfMcNSFxUIA/OKrHnevI67jtnkLc657FUuyE8Mx+JPTay38yA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDdF3T8P1zS/DJmc1JlWU4DAcUtxXw4Rrc8Yp50sMHYNQ8iLif
	f7edklUzU3mcGTWj0N6XRRH7TtpduzUh99g6YV4pkNXx2XlkbMYQw7jFJpgWPaPaMpM=
X-Gm-Gg: AY/fxX6t+LcSf5zvNgA8+zVT4gZEKNChxFAp6aqSUC0404fnZv6/nuyRHem2bqxHxOM
	YF3q2ImZNlp5Tsly55OSRME7w+L9gcXMUWyZhatzdcdKOfN8y4TzrxFQFfqPM/t0cDxrwvz9WTc
	mLgTc2VrA6346PDyMFQJ2EW9hUjystdiNp0y/OYgGssYAVDhdV5FDCo3+u2FmLsvkkcFjQn9Dbu
	pWuIFY2vRLGsY20PaaGjuSqc6KqQ7eFFRyYXDrXpt3jUELTjYMZe9q/wsaMiorBzybide6V/Bxl
	53x3LWvInOnMwjbhLpp5enbiHJVAU+tNsV6dHprMlb06zNTaw3X2zXrJOex6MiHCUvu2bKw7Xg+
	kT5NgcyF/FxiK2W+11bS/D8Ei53QaWH5niyB1XeY6D+kn2DVNDQsUJPfuNcrLWGa5qM/dKo/6QH
	zDp9s=
X-Google-Smtp-Source: AGHT+IEtZa9I+uCqm09OkXqO3MU9uobkzq6ZOZ/pse7UNNQlUp3JEKnyhaX9omCuNpUegRYFCc62Hg==
X-Received: by 2002:a05:6830:618a:b0:7c5:3afb:79db with SMTP id 46e09a7af769-7ce4676e4cbmr1304877a34.35.1767702635955;
        Tue, 06 Jan 2026 04:30:35 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478af6efsm1328600a34.18.2026.01.06.04.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 04:30:35 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
Cc: jack@suse.cz, syzbot+3ee481e21fd75e14c397@syzkaller.appspotmail.com, 
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linux.dev, 
 Yongpeng Yang <yangyongpeng@xiaomi.com>
In-Reply-To: <20251217190040.490204-2-rpthibeault@gmail.com>
References: <2crvwmytxw5splvtauxdq6o3dt4rnnzuy22vcub45rjk354alr@6m66k3ucoics>
 <20251217190040.490204-2-rpthibeault@gmail.com>
Subject: Re: [PATCH v2] loop: don't change loop device under exclusive
 opener in loop_set_status
Message-Id: <176770263471.676302.4742936561051912973.b4-ty@kernel.dk>
Date: Tue, 06 Jan 2026 05:30:34 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 17 Dec 2025 14:00:40 -0500, Raphael Pinsonneault-Thibeault wrote:
> loop_set_status() is allowed to change the loop device while there
> are other openers of the device, even exclusive ones.
> 
> In this case, it causes a KASAN: slab-out-of-bounds Read in
> ext4_search_dir(), since when looking for an entry in an inlined
> directory, e_value_offs is changed underneath the filesystem by
> loop_set_status().
> 
> [...]

Applied, thanks!

[1/1] loop: don't change loop device under exclusive opener in loop_set_status
      commit: 08e136ebd193eae7d5eff4c66d576c4a2dabdc3f

Best regards,
-- 
Jens Axboe



