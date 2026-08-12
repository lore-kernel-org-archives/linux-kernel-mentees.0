Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0893E5585
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 12 Aug 2026 11:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786534821; cv=pass; b=HzCLfMc47MkLaQMvLM5ioQKLC7whd3DaP8EyPLJTWd5IvlDynTYOfhatZ9dbL/G+9BILlAi3pdHXUbtUdsc4h0IZTZzsv95WvZxuec5g5FmldHncVxIe0MSGnilEeuS+n+R0CuFMe5mcyL5n7t/Arv4uOOU/JL2SENwRBKTk1QA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786534821; c=relaxed/simple;
	bh=ftXlbDu309QmVeN7pDAevs+3sNd39BPkjEn8GSmSF/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aBZ/GTqAMyahoTTQI3dqHyuinjC34knrcS1m+RiP37Fz9gXV6MG5C36TZZRRhgi9umGnbFEpUjDtxRHiYkpbwn5LYlSFdpwyLstn4RqcuI5CFxClMcwn5z763KAqAoT16/fTlavdCgA0+KE8MDnlJ9X4z4MGEKULntJvAA5pvzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mkpyymfd; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mkpyymfd"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cf49dc28ccso1668765ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 12 Aug 2026 04:40:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786534819; cv=none;
        d=google.com; s=arc-20260327;
        b=pfGzfk1gAZaqsD8VD44FZUGRr8a4fRihjeOEV8UEUEvWnak3cXdEU996KAvLpi9a+N
         gWBkR+ut3vLR76876exfZT/r+sMBShkwCv9vAor5AvVbMw0Otab7XBPgm4jBuyKPaHv1
         725Z3rNR4s4forvRzL5FxBE+r9jK0hG02ECjOlBefnMUx/oVXZpfGQBuC1DYUH/9rWxi
         OdpOwIXLB2NEXGhg6BM2UUuiik7ZDQOa89XGi/h98tiz8LD3Ysy5+WLhb3HObzuM/rSy
         ZBdG5gwWC835j8jIJ0cKKhagjmKdUKaU7SHwbjnOYeiXN70orzEVOkP+p+bzNi1ZeLpm
         nhRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CcrVHQ+LHnpe+MEDWyjgCumfCG5lBDkuaO8drxyGg+c=;
        fh=1vrcXWGvtJRma0vubQ6ko3axUCmFMuxuj+aOKa4PLz4=;
        b=Wks6HwfG5dhqACeSUlubGsV03tO+VciPV2hONHe0+Dc69UDWwhffoIYnd/XNltDz8X
         8YaaCZeJNM8VTtNcIoVCm6dX1H1mvmBjts6WNiAMkgGsua38LuvjLe/7mGusDyMFzLRP
         k/LR9wkd8N+X1c4rPdB6I9j6zqCWUC4GZNSrypBS6UH++OvSjGxD9ByBD5iOZ3HoAvFx
         XUldo2/IvFwKVTeyWM3R+sVH1Fy8MBmrCrNz2d4AV9CAxA5x2nO4aNISdd/QsO8Xg2+r
         BNs1d1hp+fZqDmEsltkcomPBYKmTtVH7sMDxqOKHgM1YkCg/wg++efLjF2e7isq5RQbl
         cSjg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786534819; x=1787139619; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcrVHQ+LHnpe+MEDWyjgCumfCG5lBDkuaO8drxyGg+c=;
        b=MkpyymfdCGFS5SiRgyEo4a/C2XayXQJDfaJNIEKx15IqIZ6H7/CW5Qr6PBnSftae8H
         Ff2CetCOpijekQowti6FZVwisfVaxvtosbnDeUEjQrlBu9nahLNwbkabcw8fQ7ydQ4/T
         KsoQS90RYYnN7nuPMDR5vkfW8xqUfiUhBzh9jXMdHNkiZSaA6TDtiFxPJoYJmZrU03gj
         NQB/kwT8r9Locq2iHIk0AakOOSgzyS2AF8AczDBHjZmorSkzNz8uGZ94/HdtFXrUScJB
         QCMz7rqoB01RNTGdn+a6RXq9Ond8LgPB7B+qbIoj1lCePj+nlJstFZFEfNnQK75zNH0b
         6nRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786534819; x=1787139619;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CcrVHQ+LHnpe+MEDWyjgCumfCG5lBDkuaO8drxyGg+c=;
        b=ZWarZNBvIlIlbHDIPONu0T5cC1QuzaoNWmKF1Bnd0/nVACUcY/fASY6UP1S3viqw9H
         aODNc38++O/uH/nDOJiqHuMywm7wQpuFLnJS4k7aCROTVVvZaL8+y4Pixo3JUEzPbMCX
         DR3570V8tUUe2xj9OIUtbsyEn29NUhvyqm/9qD8l7+0lG8r2X8l7ifzjKOtlHfkKbvu3
         CI36wr0TAIP3+MPqTbcH65PABMpHi8lhuostB65QoI985flO+hgjZwJvRH1PAWo20OaP
         GYkB/2pLBZorALj2p48XwirHEZSuWxV8kM3PlW8G9L/Undg9zQr40FZGAifLUys3eoQ9
         t1Sw==
X-Forwarded-Encrypted: i=1; AHgh+RqMO6obAlJbZKeIPCeYqvTmt5uEhoTdGvsbng7FJ5WlaEmn39a0F+jLPowJQiqVqtxhMzysDLB6nInSohD44P3arVRkfA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGRJNqTyas+ErhRDGpg/gGvxrr09w/EQuQRmt4Q4xTFROECD0c
	/hdOkvdCJ7vofMwDfvqCzEoKtc2/39WqpTjoNiyz3i7rarMpBHP4X9/rA6wqRK8YjAOrefvu8B5
	HCFe75EolXoMgZQOxT0ILX8hfDcQ7mog=
X-Gm-Gg: AR+sD13/uiQWIBqjMGffmpU3n7y+tc5IVn437CF+5utFmD/bWyiXaACGjnsiT3wnTm3
	v9B1rA/KzHuSwID3XJhdxXQUe3FvXtjGRWixrz4+1ynEt130O3rVGy9V5qEBhbzb/mdNGRtLhqn
	1r+Gt4wMGx8njWl6uYT8IySLsXF3c0ogDJVDEPDJ77Jk76csI604HzWUboeg9LUvxUVtmEEToYY
	uaaHyOyIxJ7OIGTe1VQ/Ax4xu3WD/mCe5kalBgrZgW56f73n13fHNjqbSEiOGqqbnMvPUjPXAGe
	qWauR+ok+aKeEfZL51itZwo9h2Xu2qIX83DKZqqSB2I=
X-Received: by 2002:a17:903:144f:b0:2ca:de3:15eb with SMTP id
 d9443c01a7336-2d3450cc3dfmr41499755ad.0.1786534819286; Wed, 12 Aug 2026
 04:40:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260808090026.34187-1-adinata.softwareengineer@gmail.com>
 <20260808090026.34187-2-adinata.softwareengineer@gmail.com>
 <20260810010943.014d8db1@jic23-huawei> <CAG442=sRDMfdVZB5GY+f6Wud7Vx8xR3ORN0GWVRVV8NKLVX29Q@mail.gmail.com>
 <20260812060414.427f7616@jic23-huawei>
In-Reply-To: <20260812060414.427f7616@jic23-huawei>
From: Adinata Tan <adinatatan99@gmail.com>
Date: Wed, 12 Aug 2026 19:40:05 +0800
X-Gm-Features: AUfX_mwG3enKJGDzl_Xy8u7pCaWHXuNDuSePxAeXbnQrdn91TqUXsI2XjDgFjtA
Message-ID: <CAG442=sn1YnDGdVvfnj6ZaeLknN46EqhAdkYBBp-6AnrrnDGCg@mail.gmail.com>
Subject: Re: [PATCH 1/5] iio: humidity: hts221: report available values via read_avail()
To: Jonathan Cameron <jic23@kernel.org>
Cc: lorenzo@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, adinata.softwareengineer@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,
Thanks for the input. In this case, we can proceed with the current
implementation?

> > For this humidity case in particular, would it be better to keep the legacy
> > implementation while adding the new read_avail()?
>
> To me it seems vanishingly unlikely there is any code out there jumping
> through the hoops to read the wrong ABI element to figure out a possible
> value to write to in_humidityrelative_oversampling_ratio
>
> So I think this is in the category of ABI that we can change as long
> as no one notices.  For IIO I will also generally take ABI fixes on
> basis we actually want to know if anyone is using the broken ABI
> (and they very rarely are!)
