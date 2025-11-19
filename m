Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD09341058
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 17:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763572593; cv=none; b=brhcGNu9UBN3PPqZUKHk68AtaBOX8btCMDeQaEyIz/51zlGk3AX1OxTo+yGTpgld4ez0zn48MU/Uaoq1EdN9NFsW3AscVy6Cn+uVHwvq2CXLBbMBENqb3eF9jUAH9tIfzTXIa4aH1TVSJf/MGy6t/4lv7ffHg744ab+EnGbcwnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763572593; c=relaxed/simple;
	bh=/JqEuKhBHMI5iHyyK46XY6A5LLVOk8KrFHw4B06AGpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UCUJbt9BTymHeHZjW+Z0Bgpf/FXbOK3L4ZPJCGXzkBkiraxMcPnmf6VqOy+z4a3JHbN3YK3DAaUO6ynh9ZndmG1GeBQ97ex1sqi+bEmoVC3/DPDFZdspTndt2tCuce2EjUj2JzvRt7/7/4GCJ2RBlTwboqZzSh7pJNSYt80Hmmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JDAFzaZ6; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JDAFzaZ6"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-78802ac22abso69630417b3.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 09:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763572589; x=1764177389; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/JqEuKhBHMI5iHyyK46XY6A5LLVOk8KrFHw4B06AGpA=;
        b=JDAFzaZ6gYdH0Y2Lkrshs164LpcZMZv3raPtpwmqU/OyJUt+c9dWXSUp18laQmfXat
         KgiHjj6YmVG0kBtwb+kpGmGhq3CwjOUr1r4EaYhtnMreVcYJwCQXYfhpxIccHK2wRrYd
         TuPuYZ/Xc7X5X9mpYiBaetysgncwfl11tik/pIHcFL9xygtRuaFl7FCKBFOG4x2rbzUG
         +ioGL+ylmHPURv1jteWxEliq4pkeFpXZaCb2nM7SRFLDr/0n9JYS2eIde98PiIYX80/e
         jR8vw4e6HqEZJzqC94lAYz188C1revIdr26bx8gLVF/xul6/VGSfYB9ygx/omwQzVzC6
         +PHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763572589; x=1764177389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/JqEuKhBHMI5iHyyK46XY6A5LLVOk8KrFHw4B06AGpA=;
        b=JsvMsxqxx3BFIDvelhovajuBXRINOqx7mHOVYfjYEZJyupof1BQjZ7tfXWPSJqPk8U
         iq5BCAvhymELEIkJ388hk7jwHq41649zfOAaZZy8E+u0XkyXesB4See9E1dSzBnfIEvF
         B4B91Hyj5oTbHQkQ2LzDPN4OW1WIdiTzcBprdDHzWJUoiARUOepor59PTGBbnMKA90P0
         EMYljOm9S56aqtJENKdp5+jbZte3a5gCvyzwe84Qx/zkmK77gtyp2mSFutmKIhGBsteQ
         Mh3LvKEra9j8muFIbb7Qxg32t1L7a028nLK/3p27unnKMEVmxulIA2cXzXuCb8E8EcJv
         iqVg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ9ZF/qPD4EJfNKEuufmlK10GkxqzsoQ+4e3SOGbobw8+wMaG+ik4XPVkgXXiFhv5vFrB33rFt9dZOzIHo2zNwAwnDyA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+miDHrLBy6PBDZ7jHoM7ulqfgJr2EcJ9o0mepv9YOIYpuVQG+
	oxkUMJoNdlftDj6EyOBm1HmJc/+yBSEtl4T+blx48VHrupFKQkLsvNPgK3gaM91zV4KpGrxRhgD
	5yI+awFcy8hMHTjQ9xBQ1a4K340ipe8R0XKej95z5MQ==
X-Gm-Gg: ASbGncs56fHxGEbvwuX00GAHwqLZebgh/cr1y3REaUa7HmOXjlUsW0D2U0xl8euEfBv
	+iGT9jPjvhfJ3egFZXJSLR5bBaN7RkUzsBf0suCaujk/R1bnfaOlFqWdOalwp3qdkFHfP7KN/gq
	d4wA+fkQemTrxCQ2HQ4e/ewMp3dQBzkeIsbYuSJcExXuUMkVk5AlCwWqtV28MTNzvtI24hISvuD
	m5GQsZtD/nsQik32RKd7KG4gtlahHnkPtq9AFPwy40qtu0hBDRCb0YJ/lqsRkcMS6NK8Msc
X-Google-Smtp-Source: AGHT+IEpedBv5d2DL2YREVHAUjmFZmdbmdZiGBqyD7+KhezOuMIBtjpTYxHvkHct6URF2wTl+5vKP3L+h2LpToUMJLA=
X-Received: by 2002:a05:690c:a87:b0:786:506c:3cba with SMTP id
 00721157ae682-78a79560985mr1376947b3.13.1763572589257; Wed, 19 Nov 2025
 09:16:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <gp4ju4m3ypaijxnll4e5246e6qu2zk7towstua3exfazdvqj5n@5zorhuwucugk> <20251119162854.6890-1-rakuram.e96@gmail.com>
In-Reply-To: <20251119162854.6890-1-rakuram.e96@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 19 Nov 2025 18:15:52 +0100
X-Gm-Features: AWmQ_bm1rfV7RvTaoV3JBx67K6Dl8wwUM2Xtv6ayXDITCTKNSUd4WWwYUDacXsk
Message-ID: <CAPDyKFq8jSp=JPULtKRV_fVZUh4qCvROh+MniXUhTufBWwRRaQ@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: pxamci: Simplify pxamci_probe() error handling
 using devm APIs
To: Rakuram Eswaran <rakuram.e96@gmail.com>
Cc: u.kleine-koenig@baylibre.com, chenhuacai@kernel.org, 
	dan.carpenter@linaro.org, david.hunter.linux@gmail.com, khalid@kernel.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, lkp@intel.com, skhan@linuxfoundation.org, 
	zhoubinbin@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 19 Nov 2025 at 17:29, Rakuram Eswaran <rakuram.e96@gmail.com> wrote=
:
>
> On Tue, 18 Nov 2025 at 21:44, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@bayl=
ibre.com> wrote:
> >
> > Hello Rakuram,
> >
> > On Tue, Nov 18, 2025 at 07:53:11PM +0530, Rakuram Eswaran wrote:
> > > Shall I start to send the patch to remove the redundant if condition
> > > check from pxamic_remove() function?
> > > [...]
> > > I can pull Uffe fixes branch to send the above patch? Any inputs will=
 be
> > > really helpful to start working on this.
> >
> > It's sensible to build on top of your previous patch, yes. If you do
> > that by using next as development tree once Ulf's commit made it into
> > there, or if you apply it yourself (and then use `git format-patch
> > --base` correctly) doesn't matter much.
> >
>
> Ok, Uwe. Previous patch is already made it to linux-next branch. I will s=
end the
> patch for this on top of next.

If you are working on mmc I strongly recommend to base your patches on top =
of:

git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next

As is described in the MAINTAINERS file.

[...]

Kind regards
Uffe
