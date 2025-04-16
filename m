Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB681F585C
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 16 Apr 2025 15:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744815688; cv=none; b=pSSVZbPBYoInkzwdUCwnl/+W+V6IcCS97nrwNLIAdkBG2V9AiRJ0r3UtVIsAzcQ65D2wKqZ9+tGx3o1hdmLxHEZ56JNmj+ULTLC0wcLmetK69d2fzViaI1eTfgLXDJ/Yyz+zid43RTEbqTwrtVoQj1hyeI9bQQfqoLYVzENT4IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744815688; c=relaxed/simple;
	bh=vl7iPlZCQbv2e58LMMtyYnM2QEyrQoMAueg8Yzr1VwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BsbJ3UO6qM1fMVJYrrzFdb+pvaE9yr4H0NmqMN//8vjqUIVhoq60E6CTRjLUDqmrPtqSoHWqVJpsG+IoRHfvhEWgWuW7QlGaEieyyl8zSAy6obCLx28BNQAHzv9uUBJWG2wv+7bCwbM3T65dSqMVvwu5e6krBQ5c3MIy2mjL+OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYmG+pEj; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYmG+pEj"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30effbfaf4aso67859911fa.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 16 Apr 2025 08:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744815684; x=1745420484; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XEA4bMgoWkNAjdVq+sKhszOqmVBDfX3d4YkLfqOPUFo=;
        b=KYmG+pEjy6f/m+pIpucAYAhKcvQK0a7AXuiM4LW98A8d1oDe09EoOCXlYar6cd8I+I
         /4/7iPV39X/UHi60ySbYFWRCNxt1GdIdH5Gb9cH6vVsybCDAqRaJU2BQAUFB8QXkLsnh
         hLPx6MtKG9CKgVzuJmqq7qk6Ku5l4n5Wq+TmkwwyIrf3E6TZSs5WWSrslHdkV1LiuEtx
         VOV7C12ITS99Z/Wy8o0i0K4g0lpP6GnRqjjGKQafkEsAom/ZKCsvLlc9laV0J2S5rF5X
         sHQ11i69lf3MeXYZRktw+9BEN9AxcYkKy/gLBucsg7Fj3W8GuygrHkluGT/Kgp071Inh
         r2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744815684; x=1745420484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XEA4bMgoWkNAjdVq+sKhszOqmVBDfX3d4YkLfqOPUFo=;
        b=edFWTo+U0rKDZVwca5UuMMEOTDS1JTyj8NfYWaBsXsH5wXOsqXIZ7AOqLd78CRO2dw
         I4wwXwB+EMTu8vRU5E/KXRkgWnkXw1cAdwZpvL58BXSA1lNaAYDU4YC08hmWnk14wBNY
         NbDMto5QIKFq172avYBcCmIPNP1wou0ENgKeck6PYUnWVOP5XBO/M7nSGkW5ZfuZ/1hA
         d3q03GQAPKY3ImYphEaTb5/RgpAyUpD2whL55tl1uqCINopXBLl8WAxsYgM19QB6xOm2
         cz1Xc+POM7xWBzBFXuG9BEHCZbGNaApVFmyWvOJM486UeJRi9Vq4Qia0B3D1Vwu78lx3
         7+gg==
X-Forwarded-Encrypted: i=1; AJvYcCU5DcWq2YKSYs0Fgj1ySEp4GiS5I81woNn8Mix994ax+sNnV1kyZVAxfjOpPJpDrUls7+yO9aWvl+WqysI94/2Uzxl6YA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyF+8OPFjnXUgySgWT7ZMf50q5M4O37rRWgeV9CBZnRSbehs9zd
	Bp43586leZA9g1tuyOny6982AHjdqp61/l2/paFgi+UKugeCxCKBSiCioVGEX2W3s5pDIu+2AhU
	3uIKcy0KELpE/R+05KCIlykuyNFs=
X-Gm-Gg: ASbGncvlxLPbRcvlGD7xQMonpqdiVlN5XAkANoTXAmog1uiMB6vjPqJLNa2qKOsLihe
	NaYF+mDmavGcnXY+no463L/nT5gHK+S0Du4GqGObXaLBWHiHiyPoAL7/1TcmqIn27isGyIxFILS
	keSn4AP18O1/xLfDYLmOiOk/P8pau5rj0WmqVC/QYbZ/NNYZp/StcF7XaTqnxpyQYY2w==
X-Google-Smtp-Source: AGHT+IHxPF/SyvfM4nKlYbpB7R3CCIgdNgXKO8k/2PeWF2tVp39aX1c6NsGRhUXtrCeIRNYx4l7pgCDsOTfa+nDbWbE=
X-Received: by 2002:a2e:9a0b:0:b0:30b:cceb:1e71 with SMTP id
 38308e7fff4ca-3107f6bf07bmr10316081fa.9.1744815683949; Wed, 16 Apr 2025
 08:01:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250412160623.9625-1-pranav.tyagi03@gmail.com>
 <20250415163536.GA395307@horms.kernel.org> <20250415171927.5108d252@kernel.org>
 <20250416111727.GO395307@horms.kernel.org>
In-Reply-To: <20250416111727.GO395307@horms.kernel.org>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Wed, 16 Apr 2025 20:31:18 +0530
X-Gm-Features: ATxdqUEJHVF7jhvx1Yuewr4b-DfNrQF96QOpK1ztbrFqXIqR6UoHQf3WrImSbOA
Message-ID: <CAH4c4jJpfztu9mEBv_p8ACOa=h-WSTa+vJ45U0GUZ_nf0WsiRA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: ipconfig: replace strncpy with strscpy
To: Simon Horman <horms@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net, dsahern@kernel.org, 
	edumazet@google.com, pabeni@redhat.com, skhan@linuxfoundation.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 4:47=E2=80=AFPM Simon Horman <horms@kernel.org> wro=
te:
>
> On Tue, Apr 15, 2025 at 05:19:27PM -0700, Jakub Kicinski wrote:
> > On Tue, 15 Apr 2025 17:35:36 +0100 Simon Horman wrote:
> > > > @@ -1690,7 +1690,7 @@ static int __init ic_proto_name(char *name)
> > > >                   *v =3D 0;
> > > >                   if (kstrtou8(client_id, 0, dhcp_client_identifier=
))
> > > >                           pr_debug("DHCP: Invalid client identifier=
 type\n");
> > > > -                 strncpy(dhcp_client_identifier + 1, v + 1, 251);
> > > > +                 strscpy(dhcp_client_identifier + 1, v + 1, 251);
> > >
> > > As an aside, I'm curious to know why the length is 251
> > > rather than 252 (sizeof(dhcp_client_identifier) -1).
> > > But that isn't strictly related to this patch.
> >
> > Isn't this because strncpy() doesn't nul-terminate, and since this is a
> > static variable if we use len - 1 we guarantee that there will be a nul=
l
> > byte at the end? If we switch to strscpy we'll make the max string len
> > 1 char shorter.
>
> Yes, that makes sense to me.
> And so I think the patch should also increase 251 to 252.

Thanks for pointing that out. I appreciate the feedback
and will send an updated version with the suggested change.
Regards
