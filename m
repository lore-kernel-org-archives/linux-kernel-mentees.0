Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359842040B7
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 13 Feb 2025 17:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739468157; cv=none; b=AYjmwYzgj7TgD3h8thwGeJso0mh139iJxpzLCbrRtNhKLD2Tt43HIUMfjIeXuvkmH8LybHt30CUeabDo8vdnh0EHyZTkoRQfxHGF4Q3rERG1xfbCvRIZUZ9HCJbtiAde5jQZpxpAXZW+hN3K4zcKmW43qoabNiKwtZ6hhoThZIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739468157; c=relaxed/simple;
	bh=YQq0NVsq8jz1OjuxiXdAWFkTr+laei83KpjusFxQA8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j+8SsulrtxSNoO5GFrD5Caf0r9JrJRCjjqrvaYLwyPHctbUQo+G2QK21he/f5r0qZoJh1dcpLJvBw47vmMNEo7P2pARN9AmQEeDPld/tnIL+kZQei8hdgdksXmp+SVDuZhZmTPn+k7c8f/dMHHF42Sd2tO+gBfM08PtgNiv2CZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4pg9UIj; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4pg9UIj"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30613802a6bso12663411fa.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 13 Feb 2025 09:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739468152; x=1740072952; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qAMpVDOhtGjLWY8rXJglFjJtR265JZ5195CB8+cKFo=;
        b=P4pg9UIjVB4l1mp6ELyVmBWKGW0tVPrlGG+XeUJ2wJIQoI+5ZyR33MmAlvW25U4A/3
         2W1KwLsg+QWJ/BeRPI8ImZPA/sDKuhGrYM9ihq0hTDsWKw/pTRXHczQvV6aIEXY34FK2
         3HfA858sBI4+Zlqi8GySODSRi1pU9ALABYckqSGm92sTR/jnXIdbpXz1Po5bfM4unpK/
         mpOVXFBuCjS6wm81qTNjl3QgihuaRQEO1XLJBtaO8AxOJLoZNC9uxtb/t6ax+xgC6C8f
         ItQ0Qz7m2+JsIOcPq9lxuTr2QlGcXxcwKGXV3KMthw6s0TTexyEGqpT39CzA6HTkgA2p
         D6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739468152; x=1740072952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qAMpVDOhtGjLWY8rXJglFjJtR265JZ5195CB8+cKFo=;
        b=qIqX76kbM7ydsQcFWnuLfb50sAhPBRUFfibckTjBGsg7BDjPtFQ9VSVic6BngesZUz
         TozltWsEN7Jfm/72uQeSGxtC6roqvOIGmJ70knnLgnRIVT2v/2iLbM4J3bOpxYmDt+Gy
         Fq951+V5QWA6V2453HaBxJ/Sc7rAG74IvRbI5as0O+FQ14S7tYp/0rLLIzh/oz9ofMPa
         sZPqlDI50mzf2ThxpDEgOr5XUulmUAahxmdgjtdjJlrv2ywJcfCkzGfa4exDyWxrxh9K
         SBpX3fMLlhVyQHQ2Ak08zoJggQdewK48Da8Vw7xWdT258iP2fYYmUc91/21MbWU8LP4G
         u4DA==
X-Forwarded-Encrypted: i=1; AJvYcCWyfNcVKzPN6JaRpBsrkJY6vGSCXSlV/ddzUrWlfmyxwPuQ7uQ8Nwv6x0xe7CASDKYBR+IRPNt8PupzowYi96qrZ9apZg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyDJqLVtFCuM3Shc0APXIUboAiV+ZuI1byc92eYsgBKAC/fJrcG
	COMHRe00hjnC/yxtEQAqv1Hnyf7J1X/NVvO0xZBwh/yupILjkPR9zkWr3h+SB7ItCTicAcxFnFp
	Bg4jVCKmGc7p0gO+xK6UTGMQ9uGI=
X-Gm-Gg: ASbGncvgM0Ea0+1Lxo9gW1HoR8KW/PjKxtfAIEFPVlpr+5dPmShh4qaZI1uYZqtA0Kc
	+JMtN72dEfRe0VtiYSPdJl/IBni5o6m3PcG6yH/9QwV2DN/Iq5GpsjSqAKpvC6cxUGINqUnAw8G
	5fdP9mQ8fdf5EtBej9g1SOv5pE4OP7Og==
X-Google-Smtp-Source: AGHT+IGY0srE7wji4W9bLp26kLxH0QGCdWUi5EwnHnmRRB8roSRmEHIwTufI5RAZRQ0k86nA9jKtQdN81/gcY/A+yK8=
X-Received: by 2002:a2e:a913:0:b0:308:f6cf:3611 with SMTP id
 38308e7fff4ca-3090dd06b8cmr17279501fa.10.1739468151884; Thu, 13 Feb 2025
 09:35:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250207165325.3998-1-pranav.tyagi03@gmail.com>
 <Z6bKR9K16-oYMLFl@archie.me> <CAH4c4jKe7Q-E1LhA0KxOxEjK-gn=JY7e=2GN13X=yutaO8k3Pw@mail.gmail.com>
In-Reply-To: <CAH4c4jKe7Q-E1LhA0KxOxEjK-gn=JY7e=2GN13X=yutaO8k3Pw@mail.gmail.com>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Thu, 13 Feb 2025 23:05:39 +0530
X-Gm-Features: AWEUYZn6qEdgw-FWu9wGm9trUEcco7CIRDetR6lShyMK3GR9NJoIyLrnadYOLAI
Message-ID: <CAH4c4j+kOYMfzO5QOBg+hGe2zt4kN4f7v+mrri-2GMLzYtCPrw@mail.gmail.com>
Subject: Re: [PATCH] vgaarbiter: documentation grammar correction
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Documentation <linux-doc@vger.kernel.org>, 
	Linux DRI Development <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Just a gentle follow-up on this patch. It has been reviewed but hasn't
been applied yet.

Regards
Pranav Tyagi


On Thu, Feb 13, 2025 at 10:54=E2=80=AFPM Pranav Tyagi <pranav.tyagi03@gmail=
.com> wrote:
>
> Hi,
>
> Just a gentle follow-up on this patch. It has been reviewed by Bagas Sanj=
aya but hasn't been applied yet.
>
> Regards,
>
> Pranav Tyagi
>
>
> On Sat, Feb 8, 2025 at 8:36=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.co=
m> wrote:
>>
>> On Fri, Feb 07, 2025 at 10:23:25PM +0530, Pranav Tyagi wrote:
>> > Corrects the following grammatical issues in the VGA Arbiter documenta=
tion:
>> > - Fixes subject-verb agreement by changing "co-exists" to "co-exist"
>> > - Corrects pluralization by changing "server" to "servers"
>> > - Improves sentence structure for clarity
>> >
>>
>> +Cc: DRM folks.
>>
>> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
>> > ---
>> >  Documentation/gpu/vgaarbiter.rst | 6 +++---
>> >  1 file changed, 3 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/Documentation/gpu/vgaarbiter.rst b/Documentation/gpu/vgaa=
rbiter.rst
>> > index bde3c0afb059..d1e953712cc2 100644
>> > --- a/Documentation/gpu/vgaarbiter.rst
>> > +++ b/Documentation/gpu/vgaarbiter.rst
>> > @@ -11,9 +11,9 @@ Section 7, Legacy Devices.
>> >
>> >  The Resource Access Control (RAC) module inside the X server [0] exis=
ted for
>> >  the legacy VGA arbitration task (besides other bus management tasks) =
when more
>> > -than one legacy device co-exists on the same machine. But the problem=
 happens
>> > +than one legacy device co-exist on the same machine. But the problem =
happens
>> >  when these devices are trying to be accessed by different userspace c=
lients
>> > -(e.g. two server in parallel). Their address assignments conflict. Mo=
reover,
>> > +(e.g. two servers in parallel). Their address assignments conflict. M=
oreover,
>> >  ideally, being a userspace application, it is not the role of the X s=
erver to
>> >  control bus resources. Therefore an arbitration scheme outside of the=
 X server
>> >  is needed to control the sharing of these resources. This document in=
troduces
>> > @@ -106,7 +106,7 @@ In-kernel interface
>> >  libpciaccess
>> >  ------------
>> >
>> > -To use the vga arbiter char device it was implemented an API inside t=
he
>> > +To use the vga arbiter char device, an API was implemented inside the
>> >  libpciaccess library. One field was added to struct pci_device (each =
device
>> >  on the system)::
>> >
>>
>> The diff looks OK.
>>
>> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
>>
>> --
>> An old man doll... just what I always wanted! - Clara
