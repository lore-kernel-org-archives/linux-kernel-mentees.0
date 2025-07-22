Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7137319309C
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 16:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753202737; cv=none; b=BTp/QburIb1sNrPfCDFyKKwfzkJrch2M7VvElxKnoW2huJelKGxt/XzYnfZlY3rkRF8QWvuMqdqbgJZIzytTkLwB4+0D5VnN8fB8i0xARVwKITcWz2SVTjFQCd2IeAYc3wGwFr8ahxYblqUz6Ag4at13jEpRc1lkDqluQA6qQ/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753202737; c=relaxed/simple;
	bh=PHTcopnvoUUPICM9yN+/r0sMQFYJuZdnPPfIUrcHjqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S9nx6QBxe27yNQ+Je0cAZ4GrScC7PuayDeK3DUpNCQOexLW0AXjc40FCZ02OJvSJpfu2Lpu9QZpU4SYE1U8fZKMWwc39tb02kAzh0uADyevTcDKeMeSxToEPFmZGfRfFZl6OO0h81G4SEJbhNolJzvI4f27Wecm3Sd3v42JO/yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxA8m9o5; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxA8m9o5"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-615a80bb75cso1742367eaf.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 09:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753202734; x=1753807534; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrrhnQ3SPCtHnglawQ3hAL35cOq58qAmmuM+Az+YVko=;
        b=YxA8m9o5ijunobt2QmDGiWFXa5drgbKeHIIMm6FyS05eAIrYqGAlQxltH2phqFFBnT
         pQqY3FmZMCqpMswbDt9LyO4CWY5OC6517H3HQxm5XOBh5EnKo1OfsM81jWQ0ZQf5C0HX
         7FELAb7KD+tEH6+IF6tYovDi+GJvPWoSn6/M0YUX9EVLxmwI/P8Q819KHaOPVSBoymYD
         OLIH6nvpo7zb8vWQ/HPr9b1pjBD+7dHSabyyruKQgeZdjxzAZW1javfmWif30DY226e5
         fV6OSuFRZNBJhydHYxxTUOS0M9XNeMAz3hpkNAxsPe4BkQzdyl3X8TXLtHu1I3lC0p/x
         RLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753202734; x=1753807534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jrrhnQ3SPCtHnglawQ3hAL35cOq58qAmmuM+Az+YVko=;
        b=ZShKzMdfanxH3r4VkoFa1xNOfFYGoIXCx31Rx3bDxTemeEzp5qxfEu9WpVQ5HAb0v2
         W3Xg7bs6v35FBGXTackWwuO9hBP65ohbsMfS4cW1udREQdQnTQ2yy5+UdSDoC4BFF/ky
         +rUWH8f0nh/Wg7aYqZoQh+18anP8tQsj9B2yTtnCzXW30jwgYfR37/JwvtgqHIhppUMo
         TDGHgH6lHSomZk+v9MMaHIPhTW1wsJAp5OwMMrUpuT6CSZ3O/VipBQcrWhOxeoZ2LODx
         EgG+O+UC19HxBfgPDqSmfgTMYXe2aNpM+8pv2jfT/OUYH8ZQSkdMg1aDCGHfJo9+BuUk
         tHpw==
X-Forwarded-Encrypted: i=1; AJvYcCXKtNCcUHGiCaK6Q2Rd1g8WyfLatrnW0i7cSpDKPBHS+/K0J0vP/5J2yAUh0A8AE7mWnWDB1EGkKSwp3h1JhU+srfG8yA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1WW/Wmd1qFcnH5o/UMDG59WzQiShpl5ryahB2xwzgVe83BU3w
	V6kR2qDzECOYbliPKEE3tFOfOhZbXbFzP2v+XlDdx8s6TxzhthhRDi/UhsnxOwQZaGRK103pXKF
	PqlGqByyO1p9fW0lp2+5GjE0IM/7Tb0M=
X-Gm-Gg: ASbGncsKqzUOMyECO0YCrrv1w3PeH/Bp6L8yk85b3bV3s4+e4u9qqsClB3eWVw2dc+k
	OmVROMCO6D3vst6Qm8oZdSvu+eLS3jonWwpaM3nglGzuWXUoM1LYUj34JtpCUACbBlhcT3R1bAd
	4JNgeHiFmuxe/unJU2AtUGEvy1R92gkB+z2C5V0Q269Hdsaa/HvK9mu6aefnfymkLAPtIrMd/Nt
	9iC7ATK
X-Google-Smtp-Source: AGHT+IGujhh+TbcurHZKA27S4y43iuhUTCYpSn+qbOkt4C52QbJ8LuGP672Oxj7Kn+OQIp+QBBMom2C1Kfhm6mASIxo=
X-Received: by 2002:a05:6871:3685:b0:2ff:a814:dfdf with SMTP id
 586e51a60fabf-300e9dcc04dmr15297143fac.20.1753202734115; Tue, 22 Jul 2025
 09:45:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250722071508.12497-1-suchitkarunakaran@gmail.com>
 <CANn89iJgG3yRQv+a04wzUtgqorSOM3DOFvGV2mgFV8QTVFjYxg@mail.gmail.com>
 <CAO9wTFgzNfPKBOY5XanjnUeE9FfAGovg02ZU6Q1TH-EnA52LAA@mail.gmail.com> <CANn89i+dif2qjKM6oO1o=BKutXoO6w9kWnnPfc50BDBJ7VpAeQ@mail.gmail.com>
In-Reply-To: <CANn89i+dif2qjKM6oO1o=BKutXoO6w9kWnnPfc50BDBJ7VpAeQ@mail.gmail.com>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Tue, 22 Jul 2025 22:15:22 +0530
X-Gm-Features: Ac12FXxPP_X2GzzSAxaYHWL1BgGFTF8gKQEBJ5k-jWzRXfsqbB-cYKlnKc5mw8o
Message-ID: <CAO9wTFgYMfDzmL_PfpX4jRKaG2mEZmNq+rLRyprGLN6r23udkQ@mail.gmail.com>
Subject: Re: [PATCH] net: Revert tx queue length on partial failure in dev_qdisc_change_tx_queue_len()
To: Eric Dumazet <edumazet@google.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	jhs@mojatatu.com, xiyou.wangcong@gmail.com, jiri@resnulli.us, sdf@fomichev.me, 
	kuniyu@google.com, aleksander.lobakin@intel.com, netdev@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Jul 2025 at 21:58, Eric Dumazet <edumazet@google.com> wrote:
>
> On Tue, Jul 22, 2025 at 9:22=E2=80=AFAM Suchit K <suchitkarunakaran@gmail=
.com> wrote:
> >
> > >
> > > WRITE_ONCE() is missing.
> >
> > Oops, I'm sorry about that.
> >
> > >
> > > > +               while (i >=3D 0) {
> > > > +                       qdisc_change_tx_queue_len(dev, &dev->_tx[i]=
);
> > >
> > > What happens if one of these calls fails ?
> > >
> > > I think a fix will be more complicated...
> >
> > I did consider that, but since I didn=E2=80=99t have a solution, I assu=
med it
> > wouldn=E2=80=99t fail.
>
> But this definitely could fail. Exactly the same way than the first time.
>

Yeah, it makes sense.

> I also have a question. In the Qdisc_ops structure,
> > there=E2=80=99s a function pointer for change_tx_queue_len, but I was o=
nly
> > able to find a single implementation which is
> > pfifo_fast_change_tx_queue_len. Is that the only one? Apologies if
> > this isn=E2=80=99t the right place to ask such questions. I=E2=80=99d r=
eally
> > appreciate any feedback. Thank you!
>
> I think only pfifo_fast has to re-allocate its data structures.
>
> Other qdiscs eventually dynamically read dev->tx_queue_len (thus the
> WRITE_ONCE() I mentioned to you)

Yup got it. Thank you so much.
