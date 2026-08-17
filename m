Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AF9439F71
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Aug 2026 14:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786978531; cv=pass; b=mdYYutpq3OWyXZmeWnQDFNhyN+kKRJ3YSxK/fZTmIRfrzgfQQrzo8SyV4CIibXmabIbyFH9pGS8mOfLIASbuVyoXipJ70QjNK7O1O888Ik3PFeZQOHPVj3/FYPMVUklSO901goSk3wzJI11HAYgTmuo0uVR95xzIhQLlDO2DjUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786978531; c=relaxed/simple;
	bh=Mcw2h8jID2KIUdY3ofOtG54evB8hPVgErX+Eqm0tAf8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XrkTM6d4xojNjwE+jWN8gUsUXTL8Ie5mjK+TChBmmlNqItdK4+BRK24370LKQs4F07uA6TgQ+byC5Cm18AZEOCFApueT4dlVOajVzuDKPpmUj/h778Ud6AIbGIl5ZaJ22KlCwVaCAI9YW+EZP1M9QHJfNYfD25yCzFYQWeGJeMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9yKuIKE; arc=pass smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9yKuIKE"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-45ed55cbbaaso544205fac.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Aug 2026 07:55:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786978528; cv=none;
        d=google.com; s=arc-20260327;
        b=ciBYXKDP924UMKGG/UxQBBM7KzZzZ7/T1dOMoxE7dmxtr+BLNJ39rirSFucRSm6xDI
         51W0aRk7xxJISdlLK6pu88bqVJANsfbwvS8xu4gfxdIhjUgL0kn0oDIAREBGgjhCNZnR
         CF+kTTTTX4u6zdrpjRhYRfi6ow/IiQZIoz2RLJvnWoZD2YVdciu/m94BiSkH8Ov6oUtx
         oXauRm+P4PVjVMtl/6ctbR+lYZH36lLJrtpHQf0n/Lbw8Wv95u+xZe/Pegsk35VjfvGX
         2ComHi/zaumdTGenSfb9RbQNdyb7qXBExvmss8DTtFZEIrCjb6+f9wTnBRJ7z0ZfoZZh
         Sj1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Mcw2h8jID2KIUdY3ofOtG54evB8hPVgErX+Eqm0tAf8=;
        fh=K2Gxp5flj/0PTbt0nARgxpSpcfe1dJVUv2G7dk5afSo=;
        b=ekAL/K5FtxBTsLYhRcKG2Es9jmp+eqvS4vSx/shc434Fzdemhu44GwF5rWHFqfa1Pu
         szyJipE1ZTp+vE0lF9LcuW/3F9j7MbX+gBAnEmpQwfHfxi1GTFIntDdGN94ROjaBI6B+
         F6mPtizpsNL07WuzG96FJ41p3unOehkcEZRxiGkm6Xjo/Gi8bqOwEQ7VvWpNlqvZ3tLX
         JfFVzyARC4Ku3zKhIV+7Wr9R0+5Vkn8aNhfzS4K25zq/TmDO+7LcNpbeHnxp59asRQwr
         PxgYY5Yx9Sr61hcgoZPnMiO73wsgeh0BXrh6OHUFYlFN/uwsfBrE88P9p2Hodzf8sZxG
         WqrA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786978528; x=1787583328; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mcw2h8jID2KIUdY3ofOtG54evB8hPVgErX+Eqm0tAf8=;
        b=Q9yKuIKENTgjavPDLRIt24B/0LxDpIAj7fv7xOuXWOqil/WSry1iKWX7An0XrzPFYV
         s1Y906egh6mrAjVSgyHj2xa1AvP1p5yp8klW6gCbApm6gOf8Oc4JzYbhj7cvM2ZkGzJF
         9oM0F6IesceF1omZph296Z5h+cbbb2rIhIqLFY5p4qmI2Pvy8QJphpF29o8dNQhL5kdY
         TANfIRDnx/zWmP7TYr1TYmz0KWRurII003RLA0W+6V7UPDB70nzUQcUjpXcpvXt808W0
         XWz1VeTLVw89gp/l5md9UR783X8RGmancvaj1vCuv2b2PyTkj2AvdMD4enC03pUSVILY
         ridw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786978528; x=1787583328;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mcw2h8jID2KIUdY3ofOtG54evB8hPVgErX+Eqm0tAf8=;
        b=qBNck4Owq5h46PLhoAGNzcvHhsr+QSx1u9f50uhViwFx4q+1tHtwtdygX9FPtRmekH
         TInVaFzETTv/Bv/ze3WgkyOp+j8Uk8RVo4QCApDUbHKNODDBoFD9CxuIs9KKpS8HiPR7
         0bcozXUPAGWoHweYfNP5H1g62goSUfprax3fM73uhWc/EdVA8Yh18mOaSfe1NrZ01Lz5
         lNuoinFdiazHh6ICmr1JQn8Bs6U8DyzOLa7TwPHxt3Fo/AyLJrJVdU/+bZxV49NSR+YA
         1AOJ8L1tyNPgvQ4SU594W7jHgoIYjqJqnzV0epQwA1kPeolROgjeT94ECOidOWEA/UJL
         DS6w==
X-Forwarded-Encrypted: i=1; AHgh+RrSWUIZxaZPADdz7VyrpIJVOVOtob/8VSCVaI/RmMtowp7CpLAecHBKIMtVgU37x2ojU+GrUBseE4skaL9uiwTO4TsLBw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwwfotPcHiSx7/EQCeCSZDsVwFbarFEsvTxn1Y/zUI//48H5UU0
	llZD6mJcqUUfZw1mVTol1qyvaRJ4B4D7GNhGBXFt924E+KqkW6s1MSuPcUrbkvV8/quL73Y0tiy
	KiDYWupYNie/bUifgjbjGVs3zzg7HhHc=
X-Gm-Gg: AR+sD12WOCS9Ou+ZOx2AhTXjoHBV0D88MQvyyI9iJDEQg4dIWT7tDFo1s5ZddWAc8fg
	f/qpx7S2RRbT4hF9/7gDfjoO2yiGZQy5TlBtp1xdgXbhQ5LBz0a1b7IKJ2LLnjlZ/QX8FFwg7K+
	obljMS/YVB9tk9RxfpubpNhJSMy56s9dF6CzIUAxR1tM2LU/EPmspFbmpDOk1sroTpD2zwpXL4H
	mGJYo3lqPfaxahqvatneYT83vFhh2hxUC8P8gXfh3VVVbOfyUl1f0Hsf9ZUDzEbxWZIJFMJERJi
	TFgMXQixB0FlqRq/7sqsgskEFEB+tsN4pPQi2WBvQELfAhHm7WKo0ncQUstncYI+AjuC5S9S1eU
	a8/ngbXhzYX+JFffbEAR/RZHFFIZx
X-Received: by 2002:a05:6870:1e8c:b0:43d:d0c:ac30 with SMTP id
 586e51a60fabf-45e918368fdmr23866784fac.0.1786978528513; Mon, 17 Aug 2026
 07:55:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260813153129.12423-1-adinata.softwareengineer@gmail.com> <aoK25pW-4Sxr2yh5@ashevche-desk.local>
In-Reply-To: <aoK25pW-4Sxr2yh5@ashevche-desk.local>
From: Adi <adinata.softwareengineer@gmail.com>
Date: Mon, 17 Aug 2026 22:55:17 +0800
X-Gm-Features: AcwNN1Ue9l-bXG1exTOIxFazPrWQUBG3yRYjj1B2-3z2HklJWD1XMeq1zPkrhQQ
Message-ID: <CABZ6vuAye2aO1BvhXjBAdAJFOmDGkQcXrPN3Bn-VhpEiQGXQog@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] iio: humidity: hts221: update probe and logging implementations
To: Andy Shevchenko <andriy.shevchenko@intel.com>, Jonathan Cameron <jic23@kernel.org>
Cc: lorenzo@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> Looks like you've fixed up the stuff Andy pointed out in v1 and all looked
> reasonable to me, so applied to the testing branch of iio.git.
>
> Note that branch will be rebased on 7.3-rc1 once available and only
> then pushed out for linux-next to pick up.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Thank you for the advice and help.

Regards,
Adi Nata
