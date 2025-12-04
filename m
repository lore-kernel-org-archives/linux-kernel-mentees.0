Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5462DA768
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  4 Dec 2025 18:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764872441; cv=none; b=WdH4dfcvLd89ye7j7dFUbIYwsvq2x+qtkvwGFr46dlgnNGNIETH4HPjkzMf6hFGKrx9p1ldaqDa28bsvGa/U8+b9pNoSVuEUpGy09VrTf/hOAdgqa3Z5qJonD8pEMeJYqRsmoqhwx/lo9uvp97N0JU53SGjs7gbAT7scoU8HS74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764872441; c=relaxed/simple;
	bh=E4iaRlftraDlwmQqHLKR3EzuMkbythAKaPWIWuwk/3s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GjzOsUbY7rHWX4gpVYShU3UKWzHb4v9KoORnLk2NCnNrmVYz9wYPw9JI5/z+zfPUd84G4wWNqISD/Y4JX95Cy+VLgzfT6EyxpNmEaDgxnBXEQqqist3Do/rPMF68KIADplOj+1toK7N2dbDQHSAD4jfCK5EaFzpLqmNP7V/cAhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=oodi9xw5; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="oodi9xw5"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4507605e19aso710431b6e.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 04 Dec 2025 10:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1764872439; x=1765477239; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7l4Bvsh5Fm7h+h3RAFW2TekuY5Wvnkm4pZdsrpvY+08=;
        b=oodi9xw5UKDThSYgGqcBnsiypCPNW9JuMbICy1fB6tyl7RR/aw8y92UQ+ld7IG6lb6
         rUtSrz1Rfq4e145asGrfREI8y7cUgDlwDHofvq52LpDSxgp39C2/wSdyqCYTMqSv01wp
         fup+QbqxZZ2mA7xdrTCNhIlFrBoD+G5cLsLtsXWv+fn/vVmflfmLyUcDwtekg2Sk48Be
         PmjNfmgRUR8OBxb2PHYDW+dcK2U1meQ+bBI8JliJyFzFaxzo8qHY9MMgMiatLwmozr/E
         /xyUfI9ILpPMH34/sE5sle2Bqp5bK9w/kgn0gwjSmlx9lhlvlsrMrfZR1vzO0z1OgatT
         4now==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764872439; x=1765477239;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7l4Bvsh5Fm7h+h3RAFW2TekuY5Wvnkm4pZdsrpvY+08=;
        b=K55sUGnxbvRMkfyzLmjP+BeP8N8Bbc18G30HSVWqYagaPJsF5C7m7ux243u4fFls0Z
         w15hyued/0oHyQd8aaNTUhf1+qP1z2tR7LertgYlPXj1ccyxCo5GNrytUa8zyoxCbhdQ
         Es1KS76cScCJeoYnieJYrylTwj41rv8TZhqdT5bBDI4uvXRyAL4BEr7Pkvbu5m2zg1VB
         1mySQk5SOAzewfH2Bmpg7hxZpvn4q7O1Tk3Z7F92br6A4PPaPwMiGLg1Z07sUBtaAzQ7
         9ZmouGM5ovegm6L+sulKnA0ZKLFCkHv6+JDBPUR4p82NhpHC3qhg421Q8MrtcrQuH99p
         vCAA==
X-Forwarded-Encrypted: i=1; AJvYcCXpqKWAlENO0Ag8tqdf1tHlq+T4zTuDx1HLlKV2aNg0P0Ml8D6d3AGF7BIvazZQZFwCrygjiLiyVEbxap+jx64Fw3EohQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwHMBLNgn09BKfKM10KW2SgZ+d/zu1JbrInaPlxlTCv6kWa3iLf
	gza0WdVBp8opB6IEfHBaxYLK289niAZqTWoyCwduhaxn77VX3xf10L5LAaVXmUljgIk=
X-Gm-Gg: ASbGncsRvaYmgU7gL/uv1VSb5iQk2MVabXVLXfRZKJYiPgukNyriFGgygSnA53h0wmL
	QTEVflKxuKzLAxwp3facS8391NZCD7ygslTYPX0o7WKbPGbzj4GJTVnGGDlaOcbBv0trenftXUH
	wGHYks0S5EN4GdCfR6ug578tUyrn0hJp4OKV6h3dC11HZ4FYLdgXEHUdMwbTyrlKGlALedUXFnT
	FhkkagdS8e+VDGxbPwvox5ZhICyPwb2QNWH0FVFY8B5VspjKu/jqA7xr9MDcK4UY6c3JAeC+6/6
	xfkZZBg1L9547m+8SY/Q9S+glAJlXMDy6gxej0S6K+in9FUUt2gtVqrNRqrJNkTUkGpI+Xkdkxs
	IJqAQ7/+5KvZ2vxoHjRAfpa5hrfmfdqQrwmJPoUK8vOrgHl0FO9vtL8n5NrZIDTY0I3HWYlwrs0
	8CKQ==
X-Google-Smtp-Source: AGHT+IFXxmNxHx1/RwmCgScmOCKtrUl6+EjSkjYkHMQhz5CWSvRh2Fg8NSX5nfMZGX4uxn4SYwvcwg==
X-Received: by 2002:a05:6808:d48:b0:444:4086:4524 with SMTP id 5614622812f47-4536e4f420cmr4009135b6e.31.1764872438741;
        Thu, 04 Dec 2025 10:20:38 -0800 (PST)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4537f8a02b6sm992180b6e.4.2025.12.04.10.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 10:20:38 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: martin.petersen@oracle.com, Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
 david.hunter.linux@gmail.com, khalid@kernel.org, 
 syzbot+527a7e48a3d3d315d862@syzkaller.appspotmail.com, 
 Keith Busch <kbusch@kernel.org>
In-Reply-To: <20251204181259.23864-1-ssrane_b23@ee.vjti.ac.in>
References: <20251204181259.23864-1-ssrane_b23@ee.vjti.ac.in>
Subject: Re: [PATCH] block: fix memory leak in __blkdev_issue_zero_pages
Message-Id: <176487243751.985814.383120227280182840.b4-ty@kernel.dk>
Date: Thu, 04 Dec 2025 11:20:37 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 04 Dec 2025 23:42:59 +0530, Shaurya Rane wrote:
> Move the fatal signal check before bio_alloc() to prevent a memory
> leak when BLKDEV_ZERO_KILLABLE is set and a fatal signal is pending.
> 
> Previously, the bio was allocated before checking for a fatal signal.
> If a signal was pending, the code would break out of the loop without
> freeing or chaining the just-allocated bio, causing a memory leak.
> 
> [...]

Applied, thanks!

[1/1] block: fix memory leak in __blkdev_issue_zero_pages
      commit: 220d82ee063a38fcdc658b8d4274f59de4398dd0

Best regards,
-- 
Jens Axboe



