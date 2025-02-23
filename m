Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E62205AA1
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 23 Feb 2025 11:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740311103; cv=none; b=telSFZ++/BjMXza5RDKXebXm4UBLE0Q68f6UHpijKwYkmEwh/qPzVBKRxVFOSK91EWEb6Lhp7axN44cLtOSZB7pK6t5O2mo5B6RMKe0+TpxOZp5rLGo+jkHAFyPVVWmV4b/C3x2MPiNbZHTOaZEmv/wW1NjwWZIkOxtHiSgQFac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740311103; c=relaxed/simple;
	bh=WtQLiUtxlY7jOBkqMlKxzFRYp9wU0OtHvKBwlhSt9RE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=pVrqD6uJyBz4/XFh+j0BGKQxehGfcXsHJc6tJ1bUoMUl08Nvf3/3sZ7S7lJ6gPKxfDvqE8zGbyC5T6I9xq279el5ie1RGEF5AF0Z77jOtpU3TJY1JiHtFzW10hh2MzSw3zn3tQOArMtoNLBgsjJBZtanvOYzSi+QA+WsK4qmoOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZMsYute; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZMsYute"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54838cd334cso2501055e87.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 23 Feb 2025 03:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740311100; x=1740915900; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtQLiUtxlY7jOBkqMlKxzFRYp9wU0OtHvKBwlhSt9RE=;
        b=RZMsYute5J1yDuyV3O/uEIB6ULslumrZOC6VrbLybCWqxvYM0rcsdNIrX1oQW4Dpq1
         Z1A/CMaaPdBOH+7qo/iewg7/ZPZximUqvzhSq+4APQw3EYA/r5nuG4gG4OSgYxCV8S1e
         +W+7TSRmt251AOBPm+I+flUi2anAaJJAIMJr8Db0GyLsNLW6P6T1VDMD2eyoL+18ui2Y
         xX8mwOX4vXYZ1sS7uMPP26oZBh+HwTt8WAi8YlR6b9Ekae2pOEnrs6773QS3QTfB/Cc8
         AS0sXdEZtXtgbVtwcnoNph+4FCDaO6vQWRc5NYihQR557tZMmvjxAizdjCf5WdBofkW/
         8gTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740311100; x=1740915900;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WtQLiUtxlY7jOBkqMlKxzFRYp9wU0OtHvKBwlhSt9RE=;
        b=Yg/Z4t5+9QfK3raMJjOjmtjWeIDLKTW8SUPcPvdw8I+J4HkEvoBBElqoN2jtUIRVK0
         DLELcpBGmlCD3rliWWa/N8sk7UUJcw3HIqawnVpO2k/LRg+eFUryXpOyBgd61fFRn31O
         g7UjsDZLbVjNyMLM2e4XdSRFhPOFRv64hbyV1N5qr4IlOPt+quJZ2bpVuostCTVWDsKI
         YLcH42cmQDsp8Nuwui7EZSvMHmrsKyWJL0Vt1B0Hgzu5BPhwghqI9NvK9Bo+8uw8xBqg
         zovR8I3G0vaQDyZ2KmLYA01R6qFF8+HZ4io3F35TmBopLRmtDyfporwC4um1qqfBAb5v
         bB1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUql8oO4w+Ugvvyu3omkkR3TXdC47vDbywqi8p1Z/XTjrS+OsxoHIe95rxDmpOAY/p6ot6/gf9/BewcmqTOKIgvl8Yklg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3ZdWBHvEQ2Xt1Vh3qGTUJklMot2TuxfbKR03nVklTary/MUZF
	UvwvrMM1fUBIH9hxZx+Fwcc89wBcfif889KBDJnaJpvxu4JJhjItm1pjTa0uv5o6Qhl4Y/vOm67
	7BwvTUVE2ezMXepQzRVn31FrPGms=
X-Gm-Gg: ASbGnctGqkkwRlmne+MHbbh94hZL1GcLBYGpqbDwLfTB0ynk6VH/GroYqv8bbYh7VRV
	tRlI6j049JSuI8N2unB/4Qa256r/ymE/6P4/fNeuKKQkKTjW1BmW0agCyyy6MQoyp2IJctQG3Ca
	dwCauhihniQRsBmukrhkhqqpcjepJOZ418cyUgK81e
X-Google-Smtp-Source: AGHT+IFXdyTaLGb71sdwhuFPbKFfl6zs87BcvN+nBv/3PAoR+eNgHv2zos0UpogzeCxvv45FfKaCGezUok3jmbH90U8=
X-Received: by 2002:a05:6512:3f05:b0:542:2e09:639a with SMTP id
 2adb3069b0e04-54838edddd1mr3320418e87.10.1740311099559; Sun, 23 Feb 2025
 03:44:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250207165325.3998-1-pranav.tyagi03@gmail.com>
 <Z6bKR9K16-oYMLFl@archie.me> <CAH4c4jKe7Q-E1LhA0KxOxEjK-gn=JY7e=2GN13X=yutaO8k3Pw@mail.gmail.com>
 <CAH4c4j+kOYMfzO5QOBg+hGe2zt4kN4f7v+mrri-2GMLzYtCPrw@mail.gmail.com>
 <Z7WOym9fl8GNPJiO@archie.me> <Z7XdkAKqlK2KJuq2@phenom.ffwll.local>
In-Reply-To: <Z7XdkAKqlK2KJuq2@phenom.ffwll.local>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Sun, 23 Feb 2025 17:14:48 +0530
X-Gm-Features: AWEUYZlGbGI477Musg_0U1Z8C_cUlMEZdld-9_O8sc0I-75qlnom3khRJkDC8B8
Message-ID: <CAH4c4jKhXn=EhoLJLYhD1jro_KM0TemNnVjokSFRR55oUVuPjA@mail.gmail.com>
Subject: Re: [PATCH] vgaarbiter: documentation grammar correction
To: Bagas Sanjaya <bagasdotme@gmail.com>, Pranav Tyagi <pranav.tyagi03@gmail.com>, 
	Linux Documentation <linux-doc@vger.kernel.org>, 
	Linux DRI Development <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 7:03=E2=80=AFPM Simona Vetter <simona.vetter@ffwll.=
ch> wrote:
>
> On Wed, Feb 19, 2025 at 02:56:58PM +0700, Bagas Sanjaya wrote:
> > On Thu, Feb 13, 2025 at 11:05:39PM +0530, Pranav Tyagi wrote:
> > > Hi,
> > >
> > > Just a gentle follow-up on this patch. It has been reviewed but hasn'=
t
> > > been applied yet.
> >
> > You may need to resend the patch, but with scripts/get_maintainer.pl
> > output Cc'ed so that DRM maintainers can be notified on the patch.
>
> I don't have the patch since it wasn't cc'ed to dri-devel. Can you please
> resend with r-b tag included?
>
> Thanks, Sima
> --
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

Hi,

I have sent the patch again to you with the r-b tag included and cc'ed
it to dri-devel aswell.

Regards
Pranav Tyagi
