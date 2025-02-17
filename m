Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF30227BAA
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Feb 2025 18:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739816909; cv=none; b=JGvhvT/+qg880Y4WN58Phl0HpUT32RTF8Z/G5P3c2qS0fMAC2vupXnto9tPQ1aHcXChah8iJQdWfbtjxOJUtEGncEZlK38rXQ/x9ZXyaigv9Bnd6sLI7Uk8n/7hNER2A9TrMdQxwmxwHqw08LTGhrfeCtolfKCvlrgaD9hhX7sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739816909; c=relaxed/simple;
	bh=hCY876bzfHPrz+2xaMfuRfH/o45M88VIOZfakkcRy5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JpdEjv7tqUhKEaclHX4kU4dS/SmotwHBmR4MNjI5ynrz1SelD5eQP6Kwa7HZldl7G7zHDhlBWaghQjjMpA54yrDhId3dWssj6xr3fbAXhR8Dvdnc3yvNHKsJPZl9atZzGQXnXao3XcIan2QPzEOZZpjKKWk3J+iSOFJLf4Vf+r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=URKVo3yj; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="URKVo3yj"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abb7f539c35so440760566b.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Feb 2025 10:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739816906; x=1740421706; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+l+0lQBsKNzTpGm0qORCGiSDs//13l2fOSSxE+r8mw=;
        b=URKVo3yjainM7pNuV4NdseEIDfjp0HD2/kc3lG/QoGqpkXErC2XfKAfga7TZsg0AQn
         a37Z2/Wo7aDl1S7DOML/0v3RimzQfQFuBfJbmOq4lyjGCVabPEQ4zNtsCYfmc6gq8UVI
         8tf3URtpqfmQpN5w575QxY3LL/b/3M9GFcUkiHzJ9T8WvpbJ0zNz4mpsn0ACn4+Jot28
         9NErtRf+x/xqnCsoXv4aA6FrXlw6GP3Hcd4htq0Ellhlp/U/asbfwFuOeLhxSgdZ2akM
         Ia1v/DSiiiywAwLFlnnOfS7+RGNIcmQaUydOZjBQPtU1+L9vGWp3NPNe13t3xd1BMicj
         HmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739816906; x=1740421706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e+l+0lQBsKNzTpGm0qORCGiSDs//13l2fOSSxE+r8mw=;
        b=mj9ZnuxtBQvutpySPtt1FXnn/yinPRDkEslTqEWZXSOBJTGUhI6Y5PaHRyGVmh/cSh
         rU8y16xSY28xjjzXZeWAg0pVhI068z8dNxAKisJ6RK7upqAucsFT82wAvXiyoVqIk1Mc
         DeUwZitvtx94bnoJIjYb2fCc2iJkk0yAQfhoG1YzTfk3imu1NKbGSnvDQokFyhgktmR2
         JhLJZh/N5Nbyw78x2utVYrsXMe/8zpTbOl4/0GUNRS1q2YHKIaWN+aUOk02eifzEj0PN
         aIyPdWf1h0hz8gFeUn5tIhLRoxd+piZ6tXrS30ZNOcV08I8AqudN93YwUAQIC9vBRsKF
         6KnA==
X-Forwarded-Encrypted: i=1; AJvYcCWooUXwXd30SAGHhnSVN7lNWTjXzPbz38rzqnSE6tTnIemGjiGQhqSzmhTlOLXRqJI1BHPAU1NvKBY9lOKoO0ayhbtBqw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyvrmg6msOReN9uFPlBUKlU46dti1zXJOAHOuoD/1KwTKA01kzy
	UydNvPpQMw7f6ir/oyc23RfW7/cc5K2zPIB+m+QkYKjqZ8Ub0kmvffBmnrbfiP/NX2uYQIzuJzq
	B8vdosaLtTPh6ekkqonGhphWrDruQc1mMqAz5
X-Gm-Gg: ASbGncvFkZ8Q8LC6sBDlecrhcJhxN6xb143266VZhL47K0q6jSACIBx6rLds3wBq2KC
	3I09gNUKb41gfcggC2+3mgB6y/FlvOTa+xMwKE2iPZ6IO/cmt1uqfoGK35Rr20tumL70Y9qV7G8
	ktYQWEiPFmDRG8MwmJKOo3+NjUd43q3A==
X-Google-Smtp-Source: AGHT+IFjjgLMTvGHSCRWiwCYLddKG3v8fu3sqA5dCvDVOitjnq/kSTuDzxQRaYiuzB4Hayx3/fyBm1HmRPPrqarBzzI=
X-Received: by 2002:a17:907:7f27:b0:ab7:f096:61d8 with SMTP id
 a640c23a62f3a-abb70bfc808mr1220784666b.29.1739816905780; Mon, 17 Feb 2025
 10:28:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAO9wTFgtDGMxgE0QFu7CjhsMzqOm0ydV548j4ZjYz+SCgcRY3Q@mail.gmail.com>
In-Reply-To: <CAO9wTFgtDGMxgE0QFu7CjhsMzqOm0ydV548j4ZjYz+SCgcRY3Q@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 17 Feb 2025 19:28:14 +0100
X-Gm-Features: AWEUYZl-8xmVnot7cSihwj5mrrH3uVZP9wHKcdzkuxM7ag-b5A1qdgu8u59YhW8
Message-ID: <CANn89iLjxy3+mTvZpS2ZU4Y_NnPHoQizz=PRXbmj7vO7_OGffQ@mail.gmail.com>
Subject: Re: [PATCH] net: dev_addr_list: add address length validation in
 __hw_addr_insert function
To: Suchit K <suchitkarunakaran@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, horms@kernel.org, 
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2025 at 5:54=E2=80=AFPM Suchit K <suchitkarunakaran@gmail.c=
om> wrote:
>
> Add validation checks for hardware address length in
> __hw_addr_insert() to prevent problems with invalid lengths.
>
> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> ---
>  net/core/dev_addr_lists.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
> index 90716bd73..b6b906b2a 100644
> --- a/net/core/dev_addr_lists.c
> +++ b/net/core/dev_addr_lists.c
> @@ -21,6 +21,9 @@
>  static int __hw_addr_insert(struct netdev_hw_addr_list *list,
>       struct netdev_hw_addr *new, int addr_len)
>  {
> + if (!list || !new || addr_len <=3D 0 || addr_len > MAX_ADDR_LEN)
> + return -EINVAL;
> +

We do not put code before variable declarations.

Also, why @list would be NULL, or @new being NULL ?
This does not match the changelog.

>   struct rb_node **ins_point =3D &list->tree.rb_node, *parent =3D NULL;
>   struct netdev_hw_addr *ha;
>

Any syzbot report to share with us ?

Also, a Fixes: tag would be needed.
