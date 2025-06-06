Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A82527E7CF
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  6 Jun 2025 15:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222308; cv=none; b=id458oXsbP8ECiJqUj8WPEKBuZWB3FFLxxyMaRvf7URErRygcUv4ADiouWG6loh9xe4nfLvzoi5ykl2Mgjd0b8YxK2ZLbAsNvtUBOAhCXKjnWMecfNoYegFoC4ussMj+yYcsmb2CfsjrGcWm/tFukXqn4PPxRmQwIXt+M32DOOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222308; c=relaxed/simple;
	bh=gJtT0Tn2PpQSNzJ2Th229/jPzi9ZJ2Ls6N/5fNjLzI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fTNgYx+txIroCpexfUksHWVl4GNyw9jXKD/kn7cxkUiXQQBu0CZXvX0ku0HSnkLKp/D52lctkDn0XUMDGs+kPlWVel+2viV1AE3/9MXBdJ49uF7zp35C5916+/heOZP9NyEFWMuK5oBf7RJF4522XXrN3gz9aFkcKGOLNB+iRQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+GpT8SV; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+GpT8SV"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32aabfd3813so18729501fa.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 06 Jun 2025 08:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749222305; x=1749827105; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NhdrlgztzgpE1Xk+Zp4kkuAyeJA1EIIswOLXPfRZyk=;
        b=N+GpT8SVYw8vWd7zD2NMbP0NQRCVaqY9yEp0u3XhX3+pNP4N8knh6VLuAiqZZs6Hwj
         zOl8ggMG/Zvujppoh6ZdP1NkmmQ4IpFAhcSN01mhBNoUqUD+7YWHQO5d0bH01lGDoRxY
         qadr2mENvQXw6G8LjhSbsbLe4HMbRUUz5/+vJBJih6SkvcV0xUdf4tVAHkKhro/CZjg2
         q7NFEu3fjlYUTB24RRmGwfnn3u+R50egilPUkPbH+72/6DWYGaQVzsadX5swb+cCKGCH
         +XNNmI4zqHIVani4t36HVLk/bPEvOnDEuQ8vN9N5wcZkkA3uJg2XgCtKTHA5fQQ8LUGH
         Gs7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222305; x=1749827105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5NhdrlgztzgpE1Xk+Zp4kkuAyeJA1EIIswOLXPfRZyk=;
        b=JfEDOnjIajN/wdiN3phzQf14ADc7ewXP6J6DAcbn4qt15aoPmly6HzbYxVKpKGn2AX
         ZhXT8IBFHoouQD1BZrP2U7gL75jVetwJ7uBliIswaaeeLOEtzXIjwi2+TShLBFi9P08T
         m8AdpvK2MUQto15DCoTJkl0JPoYWetIBgjFZ1LXw0r2VfB6yKzzlPxWbh40YI7WbyYeK
         26WCyVQLrmK26vy1CjP+cg9SIAaMAYYQCrrV2efWr4y0skGAbDt3XGAWY21LCVgfVwq2
         Jt7hiOcMnbHXQmQTxHt6l+1wPI/MSa+jCS4ta/jIvaXZEw5tOQNCcUb4A5G1+t8mXzSm
         MG3g==
X-Forwarded-Encrypted: i=1; AJvYcCWPpw6szMH/lQqQmNPHe6brn9MHuGc7FU6Nk3k//vKVex2NZTOZeb9wkXLK08LjV47mo0tnqSjW92AS0eC3tgfC7vsoyg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUYTbG/Z2OgrV3QwapJNuCbn+6+r/BukFKUkvbLXvBqoPIw4ff
	o95iAjAz+DShCMKLuuyycYlFF4KtHOE1i2CfOlMaqHDWUm/gFZ9nSM2mELh68m1T3hBcMv+I1CA
	3WwIpbEmU+04doSoLlZuHeoz5/EP7GEw=
X-Gm-Gg: ASbGncu6mNixfYsN2yQjsJ7Uycwi2BIOFzHlOnaZPIrk337WeKK4n0ngQnEggtM1AWK
	DsleKv2p3g39xrSFjQJvEVWHnyi5RMClDQ1DHdDD6SEXJSQ257A4vWl/fbeyLqSuOU/Pz49obNB
	0vNvU5wnk4NhhN18ZsujGwMi1ueDDCceZ1l6sWDsXr3JjAnPsFVW1oye6bBfe23Erg123AtoBQ0
	fQdWw==
X-Google-Smtp-Source: AGHT+IH78G8M0elhu6vNm3wt3JuGbGuw0AvHq4vu10oYAIAXshUAr7D1SoCJMauU898LZIj0vl45j514wQ0JYhgZ68o=
X-Received: by 2002:a2e:a7ca:0:b0:32a:88b5:7b3e with SMTP id
 38308e7fff4ca-32adfeec0bemr8720921fa.41.1749222305096; Fri, 06 Jun 2025
 08:05:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250602135932.464194-1-pranav.tyagi03@gmail.com> <2025060239-delirium-nephew-e37c@gregkh>
In-Reply-To: <2025060239-delirium-nephew-e37c@gregkh>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Fri, 6 Jun 2025 20:34:53 +0530
X-Gm-Features: AX0GCFvdMphOgp8NP2z6BCJwn33AWaLDf2vr9-l3CqvYDu4QUg76FhA0esJXBe4
Message-ID: <CAH4c4jKrYsyVi_g=bem2bGmH1Y95mRkKPApqbQbWZXkQuVWtDQ@mail.gmail.com>
Subject: Re: [PATCH] net: randomize layout of struct net_device
To: Greg KH <gregkh@linuxfoundation.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, keescook@chromium.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 8:50=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Mon, Jun 02, 2025 at 07:29:32PM +0530, Pranav Tyagi wrote:
> > Add __randomize_layout to struct net_device to support structure layout
> > randomization if CONFIG_RANDSTRUCT is enabled else the macro expands to
> > do nothing. This enhances kernel protection by making it harder to
> > predict the memory layout of this structure.
> >
> > Link: https://github.com/KSPP/linux/issues/188
> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> > ---
> >  include/linux/netdevice.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> > index 7ea022750e4e..0caff664ef3a 100644
> > --- a/include/linux/netdevice.h
> > +++ b/include/linux/netdevice.h
> > @@ -2077,7 +2077,11 @@ enum netdev_reg_state {
> >   *   moves out.
> >   */
> >
> > +#ifdef CONFIG_RANDSTRUCT
> > +struct __randomize_layout net_device {
> > +#else
> >  struct net_device {
> > +#endif
>
> Are you sure the #ifdef is needed?
>
> thanks,
>
> greg k-h

Hi Greg,

No, the #ifdef is not required since __randomize_layout is defined
as a no-op when CONFIG_RANDSTRUCT is disabled.
I rechecked the documentation to confirm this.
Thanks for pointing it out!
I will remove the #ifdef and update the patch before resending.

Regards
Pranav Tyagi
