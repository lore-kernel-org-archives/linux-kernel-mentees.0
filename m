Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BE5155A52
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 28 Oct 2024 18:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730139137; cv=none; b=gXQaptNhw+PQr7bZiE97p8vn/CF1sZqCoaqjwfeedZR0NE9mEVacXjmJUZxeH5hbRAGcSbZltNxNLQAZx8zmuEXH1j8Uy+YhaTmnGn40e6rLonsPM5u2SLauuiyFEIDwf+2XqGn71wFTybPlsN10Ft6BX1TelaW9WK+pQd5XhPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730139137; c=relaxed/simple;
	bh=mDrRQj1Mrib9/EgojunqyD42XEGRcvIiFq/4nXqWp9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HSeUkXdsEINOYUoLL7VX2aCU6ZXZDmIbmg7Q7eE7cE39VjwxX355Rr4o3zJersxCArqT0JbRQwDMg51LAis3s7T1OmpEm1tvY8biTpySB7vvYjAM5qbJ8nPudCEX9Da3Ip4SzFehj+jH8YGT3H/dffh1/dUBaR3XwS5YmG/HV+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hud9Jhq2; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hud9Jhq2"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2D5F60647
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 28 Oct 2024 18:12:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mP9s-Q2Mi7Y6 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Oct 2024 18:12:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DED66605E7
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=chromium.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DED66605E7
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hud9Jhq2
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DED66605E7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 28 Oct 2024 18:12:14 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so44433031fa.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 28 Oct 2024 11:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730139131; x=1730743931; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5Mp+oG6fw51RJspX3eEPAbfvpSkKVhKdPlkTR9F3Y8=;
        b=hud9Jhq2q6063lRM9O5Agk08rUSTEPYu5QtVm6wVP8Ay/KTlY1rQcXzHwROfOSEVfY
         iCzGboTCz7rszNpMunFDCeR91KjweIPHQe6TRfoYsPA/b1SQQ5AUXwD3nWmM1sxXB5lz
         ElF8B7wBl2sPrc0j+wzhOE2I7tSukCN7gEwEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730139131; x=1730743931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5Mp+oG6fw51RJspX3eEPAbfvpSkKVhKdPlkTR9F3Y8=;
        b=UZ6agWRfjUqs0qssiqkQ0ct3AKhMMW8ae3ntEA/9SRLiWKF7Ni+yZcKgtCZdWOvrV6
         8V7Xrt8vhLZXJm2bv2k+WGpvPlBBy6WyFhW3UZRDAEgraPGd6ypEsLWcK2pnXjUnlW/H
         D4LXFhEKh0Rn0b1d7ehoclYkUeyvCHaKL2wgwUnY1cwLnOM1OT8ZGRuHBCEcCVR+z8X8
         70HAoipc2FaV1wbFGUzuPxRys9M8Oo+N7CHBdy4zkmrfkJ10UYk2UCdBqCDMCetGJKst
         wmrrT9lSCxuYTHJ5PGHzHI/5cTLW5NoPEteKLkG8wv96pRQrFyR8onkjnxRPLelFd4Dm
         Bgmw==
X-Forwarded-Encrypted: i=1; AJvYcCXPMELlMOvW3BSFsqS8iagsgTBbsAdmZQlZ0BgIPI+jgHq4eqzsDz9l/p2ulMvApuYP6gYYwGdgvATBydMWPVr5CnbzsA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz91hOnbRD2G75fwYEHfcPLA7FD3pw4w9mE1+cwgGs3DPzERYUa
	im5L0HUCdCrkcVsxyUmcpW/3kMIvOGFuFj955V7fg7KSvHjB2tkV7k9qymtPO3MUGg5iKt6tlEX
	vNg==
X-Google-Smtp-Source: AGHT+IGcNkBQ+0aS/ChRoGpo0Cu4t/vMQhbDrgzRhMGhYK7nEyxOqxnRnUouV0w1WGFTv3OTV6xphw==
X-Received: by 2002:a2e:f0a:0:b0:2fb:cc0:2a05 with SMTP id 38308e7fff4ca-2fcd08bc0ccmr15048601fa.37.1730139130591;
        Mon, 28 Oct 2024 11:12:10 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb451a2adsm12168861fa.49.2024.10.28.11.12.09
        for <linux-kernel-mentees@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 11:12:10 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb5014e2daso43655331fa.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 28 Oct 2024 11:12:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWW33kBFRLG6iR3q5X2umt147t/CgAGTgXZ17hNhEnT4g2zPbyc5bV/kE1e6rF25htJU5Kx0/uBIL0Mfy0udNzeL7+KTA==@lists.linuxfoundation.org
X-Received: by 2002:a2e:4619:0:b0:2fb:5504:794d with SMTP id
 38308e7fff4ca-2fcbe0bddb9mr33372431fa.44.1730139128714; Mon, 28 Oct 2024
 11:12:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241026144724.GA892311@lichtman.org> <20241026145417.GA892629@lichtman.org>
In-Reply-To: <20241026145417.GA892629@lichtman.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Oct 2024 11:11:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+YLXs8GugQUhqK9aQM_eRzoJwLc0Yb_OwW9baqHkPKw@mail.gmail.com>
Message-ID: <CAD=FV=X+YLXs8GugQUhqK9aQM_eRzoJwLc0Yb_OwW9baqHkPKw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] kdb: Replace the use of simple_strto with safer
 kstrto in kdb_main
To: Nir Lichtman <nir@lichtman.org>
Cc: kgdb-bugreport@lists.sourceforge.net, linux-trace-kernel@vger.kernel.org, 
	yuran.pereira@hotmail.com, jason.wessel@windriver.com, 
	daniel.thompson@linaro.org, rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Oct 26, 2024 at 7:54=E2=80=AFAM Nir Lichtman <nir@lichtman.org> wro=
te:
>
> @@ -2083,15 +2064,10 @@ static int kdb_dmesg(int argc, const char **argv)
>         if (argc > 2)
>                 return KDB_ARGCOUNT;
>         if (argc) {
> -               char *cp;
> -               lines =3D simple_strtol(argv[1], &cp, 0);
> -               if (*cp)
> +               if (kstrtoint(argv[1], 0, &lines))
>                         lines =3D 0;
> -               if (argc > 1) {
> -                       adjust =3D simple_strtoul(argv[2], &cp, 0);
> -                       if (*cp || adjust < 0)
> -                               adjust =3D 0;
> -               }
> +               if (argc > 1 && (kstrtouint(argv[2], 0, &adjust) || adjus=
t < 0))

Between v2 and v3 you regressed. The kstrtouint() was supposed to be
changed to kstrtoint() here.

-Doug
