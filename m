Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF56C1DE887
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  6 Oct 2025 17:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759773334; cv=none; b=VorhFEZhddwQZSidw0kO+KdhdiCVc4R0uRci6sFsD0fxiFFOdMFeu0eQTibctbD/INY//b8OF53zEMEImu2mzcBXZ7MAklp44rKcTg0qX+lr2xKBdlI864bKeDTamwYQPfy6/zAE1shUgHVgW555EE4Gkj389ErVgYFMTpRxlrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759773334; c=relaxed/simple;
	bh=GHjC0ZDFv6Yr8oyAI/yfkHsqZVcSi60mbO6eviVgQuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzN1JDGAxwFNhA0mqkvExlp5F3KmZsGkfPUmxUurjh2ksi8pT9VOdHcbsEeSOhMGThCzM2W9vH6MZaZowGkQtxZnfZVSTUkYWTEvz4BYmgvTRzs+eOGyhR8LvhHf9yEUcO3MUhabV0ER3j/dtyoE5EdCISDrBYxjMv2PljJMZ7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljWTEZmV; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljWTEZmV"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b4539dddd99so723680366b.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 06 Oct 2025 10:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759773331; x=1760378131; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHjC0ZDFv6Yr8oyAI/yfkHsqZVcSi60mbO6eviVgQuc=;
        b=ljWTEZmVqQ8zNeGNU/bDzsxaLYXGORBzwQok71/3sTjPGLFtGTTEKiF6xcp1xstO5U
         cOLm9Ea6CdOzMkgXubz+YhRVoG68wY7VM2Czv8U+S5jhlkM6Pe4I4hsmOW7wISkCLu6y
         lMefQdPIN7PrziBWStwZHiQscxzLd2gSqD0RlKWkmVsnAtiC0CGo9H3E3Hz9+y2tZruc
         /t6a57Dr3BXQcg0Xj1JQdcTygF7gPrAYhUgMiHiP0lZP2JPGg7AvmSAcog6nhoMLuBwW
         /lrwvFpfJ1kuEurTzv3NZSzDByXZIIMrNJWYQIkQTQ2r2NJn6i/SEeHUDV7LSB/J+5OC
         DJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759773331; x=1760378131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GHjC0ZDFv6Yr8oyAI/yfkHsqZVcSi60mbO6eviVgQuc=;
        b=oH9HDJlOH0ULh9vcErCNdUYVAkoEEU6Z0gI7njvY3z6jx+l47ih9iaqpTwKubL1276
         IWLdY8/BU3FzoY3hKBoXRWTiPwngaTpl66/7k6/Oc1p/S1MPJ+fJvp6FuDWI2728nadS
         XULrztVkf4xb50u4pEGTQh/WaxuvH5qDQY6/D5Hsu3Xdk1HnC7jT4GQqQvnJUtKBnkup
         pl8JYB6mqx7u/1+aCO6KqjJzgS72ZNxTLc2lkBT6rYz6q8i+ULnI+XG9TNOMxbzUn1Uc
         MpWG2lUI8yqL3UoWtsQsNu+B6AqBgGIkum6DbpKwV62eTHiaIERd5sXAqArmcpi+WlvQ
         zqjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNclt1hjuC/BVQSrv2VMP0w5TCCqYRr1gh4xbYEQlpnVf/4kl+yrA8Mg0Rv+n0hFUXrYTx8tQq9oBU16wYoBQ9AOrTnQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2wupwWInu2Sr1yayMDsyep+r7DeUV2eRx2p7SRYPzOJW2M5uY
	4wBXDV0CJkQri9vHXKIcBBUWfmmim2sSbM+aQESywUX9QjjbZEMp/Leog8jDXpWyt2iEDa1Osbd
	98oTIZlckAhoDf/LtQSD4Ho4+hmP6m14=
X-Gm-Gg: ASbGncvbfiGT0YE73/xBhy/Zn3S0IlBygHa3O/JrEBM2tcL2oz9gvcHDhofxY6opdJS
	uCIHAq40Y92r/qLwPROacypbUbb+btIC7FuvNIICYyrE0stwYlTp2E2Godweaz8GjjVqZbduN0n
	Qbb/5ympfFRuwRVerWRCQUoiP3nj1fcvyDEEHaKvKEJUwP/zq3KrUsW+cX2L3wqF4wX3RJ26eV2
	nzG2US1LdrstNBs/43GUXAVATRJsnuf8YqUEMAlAV4OCwKS7LiT8TnMm41atebt
X-Google-Smtp-Source: AGHT+IF6Lji4cfL4NWxn3OG8grf7sXZzXO96Xa1ApY9O9MXdGCSzyo+0gGxA9MRKx5Bp/KFgOH15DtuzKOh+kShvfYQ=
X-Received: by 2002:a17:907:3f9d:b0:b2b:3481:93c8 with SMTP id
 a640c23a62f3a-b49c08981c4mr1708644866b.19.1759773331112; Mon, 06 Oct 2025
 10:55:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251004080123.98285-1-vivekyadav1207731111@gmail.com> <aOOyTtruyDVrzuCe@hovoldconsulting.com>
In-Reply-To: <aOOyTtruyDVrzuCe@hovoldconsulting.com>
From: vivek yadav <vivekyadav1207731111@gmail.com>
Date: Mon, 6 Oct 2025 23:25:19 +0530
X-Gm-Features: AS18NWAG5RtFmRVVuhL6BMEzmjYiCX_hw7o3O3M15qlv2CpXbiPWh2lU4nJxUoY
Message-ID: <CABPSWR7s3o+36gvXb5QQyHYn3LJiDP3vLoVXijU2r9Qi6fA4uw@mail.gmail.com>
Subject: Re: [PATCH] usb: serial: fix: trainling statements `break` should be
 on next line
To: Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johan,
Thanks for giving time for the review of my patch.
I understand your point and will avoid such kind of practice.


~~Vivek

On Mon, Oct 6, 2025 at 5:43=E2=80=AFPM Johan Hovold <johan@kernel.org> wrot=
e:
>
> On Sat, Oct 04, 2025 at 01:31:23PM +0530, vivekyadav1207731111@gmail.com =
wrote:
> > From: Vivek Yadav <vivekyadav1207731111@gmail.com>
> >
> > Run `checkpatch.pl` script on path `drivers/usb/serial/*`
>
> Same here, don't do that.
>
> Johan
