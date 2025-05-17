Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041671C1ADB
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 May 2025 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747483519; cv=none; b=BkinyYj4z8LwMPdt6zAGo8ZFGfsXZ7Tns8JP4X/4JmOb7gznUpZ6gIVy4DRfci4fDuuqKoXFMhqHQg3f6i/F3RxGbAZlN2goMfcTcrSf1TPs7aOzJJ2Ag+pytcyzkAE48+W7bZNexBZ+uhG1OhSyYlGz90wxd/N6lHIWCXve/hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747483519; c=relaxed/simple;
	bh=lAtnCfMZOKs9Cll0kaKJqrK4KbGBELtukF3hLliN84M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dDGxhuO8vYMHa6tCFVOcwtWD3eYd7EesTR8hYRYejrIRyO12tnyrnp7nr61LJgiePgdcUM84SwCbFulVbOWii2ma1nDwI/7jvIK7r4GEMqv/ol7k2xUYBNGRxfj14XsYs0G68gxMIlKgcafhxcXXi5JjHHYsy3zHUnhUiY6ABWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkM03JJW; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkM03JJW"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3081fe5987eso2574133a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 May 2025 05:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747483516; x=1748088316; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trS5Tf45Q4Q8voIZQsRn1URle1hcyp3FyQgBJHTcYHE=;
        b=hkM03JJW6ek5ICnmJS8P7NJQEqVro3ZtBKe7MS6NdE459sewnybEpf+zuRSfnxRRYb
         d0HHhAKwz7/Zq44qypn9nl8+BaE6FzWkYe5QCxizwCTOtKCBeud++MdfonMDDBy4/gtB
         AjzOSJl+81vkfBcOTkVp525iq662rlfsG3YCORIXAnUlM+zufbzZl5KBNDcl9HsuJIeN
         m0AScSQg3dIhwurZjQhG/jcFLcdtHiPBXQjWvnNKLi7XvnGe7rb2Ur4Fhu7OUlHC9ZvD
         i3fS55uKz5mVrXpS1XJrUuYlfnyDlyqouK20Ce4jP7SmA1y6KdWPTZLF3F0fnEOGVofp
         LZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747483516; x=1748088316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=trS5Tf45Q4Q8voIZQsRn1URle1hcyp3FyQgBJHTcYHE=;
        b=KHvfqU/OIuoiMsykAEG6I/8DlqQh4E8A0FnOA09eWKzu4Ci5cnOwWGPn+YNjb5cFjX
         nF7poJYBiGFZAF9wzhEUNbC3cwnXGcEd3kqdwrrGQvKJG7RHYsNTYQWsMRZAm62HwITL
         wyoCJiqeaFCIXKfGmXW1J7cUtwlyL9DINeUR4cUzZzwTeLFcl8rSGHZTIRKvUgTaUs/t
         dg2J9UPSMjjxfABx1KupGT8AfwJB2wjFTZlcSRjp9+ngpz9pKStSrg2JQ13omsyil9Hu
         prs/goEatkD8Z8dBS5puuS2WenbOTApaBsVPqtmKCTahSVih5Cngiqblz+TriHoDn4yX
         nklg==
X-Forwarded-Encrypted: i=1; AJvYcCXxM+w0Wb+HAU+5mfDUMKOpC+aXuaQ3yJsINL4jjMxmjXzJ9vY6oC5Xu+YJjuhoJsolMo3Y6/sXAecve2+qYtAPWVkfbw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3s1ZdYtk/cL4oFiRyC1Hf4Lq3HuLkQnw7f3ALowCw9AR7KpOf
	X+irupG8jpN0QeZA4uxolaHwxeAMWSdy8RxrUCpTwV0ZfZzSRuMYr4VG+pO53Q7u/ME/7NWUu60
	KhrkRGiZLGYb1UtFKr/sG2YpIxQri0cUdlGc=
X-Gm-Gg: ASbGncvydahu+MusQVTImAr7JZ/Ucee95HeaBfWPlOhoP6VNP0igbc4wfTfOABexkAi
	rGywi/3oawroaNnk7EjwX8UEVrsglX2oG5s8A4hrofiSvej45sEakQx0QB6zQBRumtQi0htys+Y
	+bD6J/ryUjrBYt+mcB+6rHfAJljwd8lrIVBbtHHhJNpgrt3VN8ijI=
X-Google-Smtp-Source: AGHT+IFI8t5oUuYfe512sN4hbdlkBf4YUWLXrADSfeEF5vKKfDDHKRQpVIRW80AfaLm76cL3FeIf/kIdhg0r0WB9ivI=
X-Received: by 2002:a17:90a:c883:b0:305:5f25:fd30 with SMTP id
 98e67ed59e1d1-30e830c515amr9459443a91.4.1747483516125; Sat, 17 May 2025
 05:05:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250517020552.737932-1-jihed.chaibi.dev@gmail.com> <62bd6757-c4d0-42c1-a76d-abea18a8a55e@kernel.org>
In-Reply-To: <62bd6757-c4d0-42c1-a76d-abea18a8a55e@kernel.org>
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Date: Sat, 17 May 2025 14:05:03 +0200
X-Gm-Features: AX0GCFuNFekTg5gca9fpp_VxfmBAQaFo3x-lUPk2J9pqCLWIQ9UGAmDnzGo-2_o
Message-ID: <CANBuOYpRQNx+n6BjpAF0LufpUqRA3wU-GzSNygeWurohXYNF6A@mail.gmail.com>
Subject: Re: [PATCH 1/1] Fixing a minor typo in YAML document
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: heiko@sntech.de, briannorris@chromium.org, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback, this fix being kind of "trivial" I didn't
initially want to include everyone and thought it would end up to the
main maintainer after being reviewed by the reviewers/authors of the
file, sorry for that, I will make sure every maintainer is included in
future patches.

On the other hand, I can confirm that I'm using the last kernel version.

Best regards,


On Sat, May 17, 2025 at 1:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 17/05/2025 04:05, Jihed Chaibi wrote:
> > A small typo in the rockchip,rk3399 YAML document ;
> > "less then" should become: "less than"
> >
> > Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
> > ---
> >  .../bindings/memory-controllers/rockchip,rk3399-dmc.yaml    | 6 +++---
>
> You not only skipped me as DT maintainer for this file but also skipped
> me as the actual subsystem maintainer.
>
> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument, so you will
> not CC people just because they made one commit years ago). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.
>
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> </form letter>
>
> Best regards,
> Krzysztof
