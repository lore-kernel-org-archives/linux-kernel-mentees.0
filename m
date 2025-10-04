Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D475A224234
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  4 Oct 2025 06:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759558814; cv=none; b=IQbDlG5k91b36rV01AUozmYYKx+/a+h0Nz7swiZ/ftucZf4VTOIZUur8kw6C+9ZgHHC3AxWB0JmM88oyOE720wG9ym2oIi6xvHX6CCtQBjd8FIcna0ywohn/QCnuXF0TI2Fj9Rc7OVo94Y/VGnuDfEd3sFSBn6JnufagRThvDLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759558814; c=relaxed/simple;
	bh=cwvKQypMKJEPIzEUZe5Z66F8rm5W3HyDor7r3ulkwlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=txfXrPr9W8E97IMR+jPkYD0hXOLthzNSas9CAla/iBknW/nZIyaggnydIa4ec17Du7AFBg0s5JlThbocHaiEIgOYglb9nO9gcQ1I9u5k6c7QdbKYEbpT6VgFROzIrdBI8415k035ulJzDIco6BeE29wbL2J+/MHeI7JD1f9sGYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPnq8xZc; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPnq8xZc"
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-631787faf35so5835565a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 03 Oct 2025 23:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759558811; x=1760163611; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwvKQypMKJEPIzEUZe5Z66F8rm5W3HyDor7r3ulkwlk=;
        b=QPnq8xZcBAdKpq60Ocs5nBoBhfNx9f/o28GMZuhZAGc1oWPJsMg5O6cJOCHSlHzUxb
         zKTbwHTVg2MPVbz8MDICxUyNOPdA7uctVO5vBhUKYvMz5xyKnZbrfkU8dJZ+gTjfo1Zs
         DsYMpgq3ykGVW8tIawV9u0Hzh+ohfM2d7zazU/uGCyaOgeRdDPDPMtTmSU/0SD9UE5Vk
         4ZfOklRKaMR6dJjrOT+AhqM2hxsSZFedneAs0cVGd5sggbkCNRF2n7CctbuBQzlhNrDf
         U6kUUekm5SmldXQoWihvFv8RNeFFsS/I+hvuoHNoikMlpFLq80gXlHDRm6he1dm9WVqD
         cQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759558811; x=1760163611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cwvKQypMKJEPIzEUZe5Z66F8rm5W3HyDor7r3ulkwlk=;
        b=fXBZNKPunZbUXEqfSTtvn0N3kFLuyPRdWNfteP3bhyubh+350SCSnvmjTfaunJndxl
         DpG5tUBRR9Jyzm0mo5qxVaj7J+AFxWIl/uFzhV/0cRuULcpQLgcVgPzKzpzqbX8ZwxnY
         Fx5CFomB5pMaIQU7lEwpqzuRSwwjXb73mMczlA6lEat/RcqgxpRbSvMAWJeNZUeyJrVw
         WFDSZ06qkQKWGiid/6xNrDJWu/2ABMOPB4y/VCmMSyeGIUHyKI7DqnqBQ9CHAovxsjRR
         EokzF+diAWIJ8daxprC9gaD4gLGMiAO38myE80G0tHTVyf4e2p4uCxP6QzBQZWD5e7UQ
         GAFw==
X-Forwarded-Encrypted: i=1; AJvYcCUWFHyZNYWkfoG4cfhnwj19XWL/cL+jgRm0ztOvS7V2XX8IvQOS5ZlEeKDDjVMF0ot71o4Z9p1c2ciEuL/bticPnuDS+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAOHR9WivPKb31Vde8yimv95Jws029rn8nYDz0HlvPSFdVcGsa
	aBnQCa7LA03NXOdEeMKbk7fbXJqY1aPP0u1UU/W6Xshc7NSEVySbOJx1JBvQBpYzk5Z5aLCY/FG
	n2ByhlPLI8efYnJZIG2DXJ90VRJhSWC8=
X-Gm-Gg: ASbGnctanaQItFQ62xBq0fLwtc0Rml766IbLXJyl7335nDENjvy1te1RIUKY9GC6K/L
	/5z0NS79+UCMFcWepxWJnVjIubahQIJwDwbnmKW4HzFLaM0KKyVASO/xbrSkG7JxYYyqcgobmAg
	L3KWR8iRvg8sZxv+uDrCFcsMr1jDHUaOjODe0Fl0ehNqxP9HQ2yxd6qiDYGx/JkaNLleTdNAU+0
	tEwoT1XzWduGCmY3mRlsZg+IsGxaYKaxDVOgjSEIA==
X-Google-Smtp-Source: AGHT+IHvC6Z7Roar6Te7hGz1HgNqfK/9bJzycQ+JL4engfzt5VbPcx2Bzy1MDjmUK9nyex0/tG8Inr/iSP65hfRQ6uc=
X-Received: by 2002:a17:906:c14c:b0:b47:de64:df1d with SMTP id
 a640c23a62f3a-b49c1a76234mr684527466b.13.1759558810901; Fri, 03 Oct 2025
 23:20:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251004015623.7019-1-raskar.shree97@gmail.com>
 <20251004015623.7019-2-raskar.shree97@gmail.com> <21b1dc10-acad-43b9-a9c6-24abb2886856@gmail.com>
In-Reply-To: <21b1dc10-acad-43b9-a9c6-24abb2886856@gmail.com>
From: Shrikant <raskar.shree97@gmail.com>
Date: Sat, 4 Oct 2025 11:49:59 +0530
X-Gm-Features: AS18NWDFYveno3GXr5tGCM5q0b7CRS7Tq77mFhLV_Q5_pds9PsSNUL9CCHseVRU
Message-ID: <CAHc1_P67arWxOeBJZGGREQvBwVG6VaJkRu6_RawWDqRunBdzow@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: iio: max30100: Add pulse-width property
To: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, matt@ranostay.sg, 
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 4, 2025 at 8:52=E2=80=AFAM Bhanu Seshu Kumar Valluri
<bhanuseshukumar@gmail.com> wrote:
>
> On 04/10/25 07:26, Shrikant Raskar wrote:
> > The MAX30100 sensor supports multiple LED pulse widths (200us, 400us,
> > 800us, 1600us). These settings affect measurement resolution and power
> > consumption. Until now, the driver always defaulted to 1600us.
> >
> > Introduce a new device tree property `maxim,pulse-width` that allows
> > users to select the desired pulse width in microseconds from device
> > tree.
> >
> > Valid values are: 200, 400, 800, 1600.
> >
> > This prepares for driver changes that read this property and configure
> > the SPO2 register accordingly.
> >
> > Signed-off-by: Shrikant Raskar <raskar.shree97@gmail.com>
>
> The subject prefix [PATCH 1/2] says it's a two part patch series. But I t=
hink
> you send all changes in a single patch. If single patch use [PATCH] inste=
ad
> of [PATCH 1/2].
>
>
Thanks for your feedback.
I have shared 2 patches, one for device tree property update and
respective driver update in
MAX30100 driver. Can you please check the patch with subject ' iio:
health: max30100: Add pulse-width configuration via DT' ?
