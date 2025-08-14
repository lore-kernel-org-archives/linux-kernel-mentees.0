Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E531E2877C1
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 14 Aug 2025 23:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755213053; cv=none; b=a3TGtXZyvxmhdnIBFqzJrs9Pt0xBszqOhJAtOekQ7Wi++PTnKXjvHg4aMxwi8BUmCaHei4d/512lo7EqbZXrYbNQSmjVBMVgwLoKBqHW9qHwUAYoSvQI0ENMQxbVSRL/r0va8ZX972D2exkPW+Wbt/ts3jh6M6XPzjEegA4sGjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755213053; c=relaxed/simple;
	bh=pfH/iOggbGrqSeQ8kTed0p2KPGpZKgg81d7pIa3+X7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tIcagstP53/KhA7bEbJnRdV6MGeU8Fovt3+3xYe+z5uiyAUcCpEzBhZupvjjZ4wCeQ6yQgVbYFXjG4vYE+yt72fpd4D0vL+vfJQxYJSDzcBRlufl1I655S98jfsfgVF5YzJfruy0U2psSwblOwo910WX22NF6SwI2jBlexFz9QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SOIpe14L; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SOIpe14L"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b4716fbc443so1064004a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 14 Aug 2025 16:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755213046; x=1755817846; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60PL/oxrejEGqmONPWLHGxzqkl5vemphiufOxPK6tJg=;
        b=SOIpe14LYvXOMNNcsf1lybzNt6rKP+helH4LLcyfT9WB5JXEMb6AjLxmKE/u8HIKJx
         W4mtKljWFsO+0FlN2LwzdmSljNBAASUiSl0eYD4TngustrQtWWx+nQY034ykXUd6kT21
         drwII/OYTYECDQOxC/VSxbAEKCEn6WBufMI18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755213046; x=1755817846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60PL/oxrejEGqmONPWLHGxzqkl5vemphiufOxPK6tJg=;
        b=XqItDh0r+vPXZT44RYww1WqDrfrOvj8SJG2wafjDDgiKhvuBXobsPc/nuL6fy+FDYL
         bxDhP3DcJsjnLRr5gA8+7GY4VzUtApTXmvG7XcNlaQB0nGNNwRXLxAvjSp5NXFGMvrC0
         ddJ3ul/SI6G1a+r24gaZ/oyZygUlgDHQrrD+C7Rvr+p5opP3jljktCRFDnIZuymUESpY
         e/Y5hyiBlJdsHexW6Br9i5pRGZSbijpFR2lSt+TCCiyv34AOrZtMnJoZsJyx3n+yDQ0/
         XKLgLFaAX2HGL0z5xA7KNgVl6+ravO1F7nO7ogv41dno68K+VSJtqmtheQfHs/eya/Lc
         CmLA==
X-Forwarded-Encrypted: i=1; AJvYcCVXFB36Ulmz/grcdLMeLZ6sATopoBEDdJk+PLecQGO/Myh6mR4m8goLfjngSNlRI8XVuddgHqAPzkSsTFYqRUOAMTwNvw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1BMmaXX4ThkEToN0EC6HElAAE0C+A4kMG4AhfKRBpQtQP7IUZ
	DsoRqXncVmcLWeE5hqtVMfsf7ugzPseElI1iJdx0bf/jz0lrtvIsHIquHF3H/6OHHgCso/ccstQ
	Svtw=
X-Gm-Gg: ASbGnctgOQGJYQF9X8/rhiofQILvW2HwKw/kmZY+tTA0uGHQ9m+DqQiTtta2ug+Z9/7
	JpIMFMU597dQ29+OjPztk2pMSo19Ga/2mfL8EomwwZZE1FPe6HnDtrwEQh126oi9AfNkP6fHBjL
	k7GjCyr4Z+oiOuAth/u69JlY/ZbCPNL+znP33Co1uvZC5MjCrOfm+ugNU8v7XcOq9GYdvrhDcdw
	kvZ1CStlyS6hw8i/NP8bxqimTxnv8Z9/wo9i4bMfhV0OF4eiogM1FwUvYQ5r/Z9to4uEd/2bUgW
	AY2JwrYJukR2/+fwOm5JvYmZP5WDRT/gVZPc1vO7AdDdhgQlHil2DPxUTbxg7dMY/b3jnDqbxlS
	mG7l+CDndjFS3bIb36stZWToD8Pypu7C+VE80yp4UhyyDnB2i9PFBDtIrohx4mT4WKw==
X-Google-Smtp-Source: AGHT+IGhjkO/1ek7IH7mAk1iCUt3SJ/6TW12cZQG5RmuTSebIMw0r8vKN+zbgodZKcN99eu/lQP3Gw==
X-Received: by 2002:a17:902:f548:b0:23f:f983:5ca1 with SMTP id d9443c01a7336-244584af3f9mr74689925ad.12.1755213046583;
        Thu, 14 Aug 2025 16:10:46 -0700 (PDT)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com. [209.85.215.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-323311913b3sm2910235a91.31.2025.08.14.16.10.36
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 16:10:43 -0700 (PDT)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b47174c3817so1063658a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 14 Aug 2025 16:10:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXl3jOBpY9YhfQuIQbkZD4f4ujjEIid9kK1q8DnbEPHizEPeflQS6Ubn+OrGLo03nkqsgghJ4QFDhc1t6dfyjAfpkF5Q==@lists.linux.dev
X-Received: by 2002:a17:902:f78d:b0:21f:4649:fd49 with SMTP id
 d9443c01a7336-244586d8e16mr79147325ad.49.1755213036298; Thu, 14 Aug 2025
 16:10:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250731032343.1258366-1-me@brighamcampbell.com> <20250731032343.1258366-4-me@brighamcampbell.com>
In-Reply-To: <20250731032343.1258366-4-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Aug 2025 16:10:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XiOspYS2TdDy6Ww2EgxTUVKgC9Bx56WU1y6a2wQVXmUQ@mail.gmail.com>
X-Gm-Features: Ac12FXxi9RkgHR4pMbyFh3pFNLJh60xWsgOW_dQYqmDelZcW1Vg0aa7a75_0dco
Message-ID: <CAD=FV=XiOspYS2TdDy6Ww2EgxTUVKgC9Bx56WU1y6a2wQVXmUQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/panel: novatek-nt35560: Clean up driver
To: Brigham Campbell <me@brighamcampbell.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org, 
	neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 30, 2025 at 8:23=E2=80=AFPM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> Update driver to use the "multi" variants of MIPI functions which
> facilitate improved error handling and cleaner driver code.
>
> Remove information from a comment which was made obsolete by commit
> 994ea402c767 ("drm/panel: Rename Sony ACX424 to Novatek NT35560"), which
> determined that this driver supports the Novatek NT35560 panel
> controller.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  drivers/gpu/drm/panel/panel-novatek-nt35560.c | 198 ++++++------------
>  1 file changed, 60 insertions(+), 138 deletions(-)

Pushed to drm-misc-next:

[3/3] drm/panel: novatek-nt35560: Clean up driver
      commit: 5fbc0dbb92d639d10a5386ad0ae87a54680a04be
