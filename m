Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A925322B8A9
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  9 Oct 2025 16:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760029059; cv=none; b=BoyoLmB7q/EgwPFx4FM/4qmqWhTf/UEU1BHh7OAI0zhe6Mi034AfsV11it79GCRXzrCKZlV43XVCMf56VF1GUoi74RmtxbJOkAxWCw8hq+UUo7QWf+z6J2aFzk0VAr2TP/IqfcCBe/nh39GvyYpjudEszJeT38zzfPVOktBzO9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760029059; c=relaxed/simple;
	bh=RF9ZSJQioRunccbOJ8PBKnVv5gI2HqZYf6M8L8RhwBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FEuV/XWhEm6qzDhI+OOpJM1betocRTTZqCAgEsY6fKk/QDV3TkPnSYMMUKcfbj/kGBfISqTBD8AIK5C9gZuSmRNB2OvlpeKhIGnGBiK2GVLn+l3L0fmigt+ytdcoI0sRcIep3Oh46uxXlL61RjbzLCr4QLQf2neRK4mvl2Cp3rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NrGSzDr2; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrGSzDr2"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-636de696e18so2395321a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 09 Oct 2025 09:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760029056; x=1760633856; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RF9ZSJQioRunccbOJ8PBKnVv5gI2HqZYf6M8L8RhwBc=;
        b=NrGSzDr2YzbU6AvBBENmFX2XxwdG42hAPpMG6ziasdKSwzHuWbOjefewCb4o5MNDLd
         dU/ileWQzlsrejw/9F8hN953IdySK+TEfkNLmlbn8oAZYJv3eqLA+7kKKRelV+j8t6PZ
         wFWwBsJrrQawVmHss7rtvLSY6qqlKydXreASnQEamQLeS30/h2Z2JHwQUnpDsHTHREQ/
         Uu1RoOq0ErXl18y6zYQbavllg5WrKdNHIao+lvOj3MIxvLaWU/P0/p0gWqdn89bWQ7ca
         1TMsiK/jXZ9tj4R8DCwUHVDE0l3wu4wpbeCrOpTT+NWb+5tj41srk9EtG6g54WO9VnZg
         YxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760029056; x=1760633856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RF9ZSJQioRunccbOJ8PBKnVv5gI2HqZYf6M8L8RhwBc=;
        b=D2lga0yNUbdteQwDKtqVb6N+hT8UN3Yf4uRgi/h3EnV9qIFtPWGeKYLpLsjRczJ+tr
         yZU6bOG6BVVEa+mnaOMoBUrwbJOdHwvEUEet5t2j+tSBOOCuQ0hyWoQPjY5+HS3GEcfO
         DzrAV+cirn73PeMpF9nyXzKXFEcWelMhSsCvVHBLtnSPcX4GTZ40cYifI9I4uOB1/OEL
         qPF4hVWKzBW51zqRS6A5ALl30Hu+c+7u3rd8NIW/S2wAP//fMPn05HbNvys9Z1RbHtnV
         P9fmusLOHN0A5n0fDoRJwLV11d/mAKg/yq+PA/qDFLN2hM5XIxoQwdDRCzNwtlxSqFE/
         Jv+A==
X-Forwarded-Encrypted: i=1; AJvYcCUfXHZxTh5yVybv/1uLV4qwwWz8QdYkaWdq9GCw2Bn2g2ulktpj/CuW2XWRmBY/umi+zbjJ/8FNEwzeZEw01CZOU7u1tQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzi1RHx4fhA7zFB6mhzPoXx+yXvjxt+Smia/j1c27fyUllKbxeV
	Rbhj8qfxHlA3SNuNyzIrtNvKHDBeAk13fcJyT27heMyu5YnFRZ6mBecokfqP1HfVwGCDuM7PEwN
	K8CULthtFVyj9wE8nPRJtKC3uC0h22D4=
X-Gm-Gg: ASbGncva6QkyKO6hIEnpIBahC3GH8yolDBTKW6o26ddd1okmFYxXbH0I/tOgyu6/EoC
	rgR7bjJOaoZ5U8IW1Nh46MDlpQyofqajRc+87nOrMelausFoxTc5t8ZfH9pVjxFT1CNXQu0hX6U
	6JrM9+qN3zpsxsq1DvamWFF/Ss4nRRN9Zlx/LtP2YJoEZVgE9QbBmCmo1MALg968UP+wzLE/UCU
	MPO/mA54zQQlo0/wCxIie7b3cZNjok4Fc5i6muDvGLeiBXyNhlb7FNJWM0kYb8zYvfaG5qz5s+w
	B3TK
X-Google-Smtp-Source: AGHT+IHgAXC/qDv6DJSl3IbBYDZyNsei3ooyIM9aY+vI8wPwiiUSx8OQ+G2ng29IMa/tU47rvIJShBZrKGpVq0btB9o=
X-Received: by 2002:a05:6402:42c2:b0:615:6a10:f048 with SMTP id
 4fb4d7f45d1cf-639d5c6f3admr7423302a12.33.1760029055749; Thu, 09 Oct 2025
 09:57:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251001131409.155650-1-viswanathiyyappan@gmail.com> <20251006111211.28f018bc@kernel.org>
In-Reply-To: <20251006111211.28f018bc@kernel.org>
From: I Viswanath <viswanathiyyappan@gmail.com>
Date: Thu, 9 Oct 2025 22:27:23 +0530
X-Gm-Features: AS18NWCKulaivvxFZjI1XomTCbqny61jfhLMROFJeOwz26mAdFKX8RsAFt2auhg
Message-ID: <CAPrAcgMW=BLZkxhLq0ubRVvHQ7pNKGCCuGLSyoK_xh7XUUXv+Q@mail.gmail.com>
Subject: Re: [PATCH net] net: usb: lan78xx: fix use of improperly initialized
 dev->chipid in lan78xx_reset
To: Jakub Kicinski <kuba@kernel.org>
Cc: Thangaraj.S@microchip.com, Rengarajan.S@microchip.com, 
	UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	david.hunter.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Oct 2025 at 23:42, Jakub Kicinski <kuba@kernel.org> wrote:

> We need a Fixes tag

a0db7d10b76e ("lan78xx: Add to handle mux control per chip id") seems
to be most suitable commit: It added dev->devid comparisons to
lan78xx_read_raw_eeprom but did not move the dev->devid read before
the call (devid is the precursor to chipid and chiprev)

I feel like the patch title sounds a bit awkward so should I change it to

"Initialize dev->chipid before use in lan78xx_read_raw_eeprom"

since that sounds more standard

in v2

Thanks
I Viswanath
