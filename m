Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5FB19B5B1
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 13:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753796504; cv=none; b=CN9xSa55b32XmvmO4KG8RFOccM5cjUO9MJMYHuA+mXleL1WgyU4namQmlsNh17/Nv2wof8Iiyet7miyeEFUkYt15WpLh6ESe1kwX8ZKflkvRPgKLHEkwuNo3SAxQ4Qy3lzJ/FyaOxZU8XxNb76Zd7aZpFQWgbglsKPSnbhUgbss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753796504; c=relaxed/simple;
	bh=mAmes/zYyoBatBwuEfLsqP7Lrt5HONR4RHITd4MMcjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EtFvXquJl8NRbnhBgU1kOtIRxrqQKWQkz8vq+SK4fkCaHVwdsMBNgjNOEEY/KmZnTsJ4xpcKlfHB+a3msQcFjrw5coxpYw544lmzNucq3wtFbuw/o5Oo3xfsoxeQ+QXKEu5P/r5GMyFZEvCfMmSktjog54htIl/cVTfARg7qGBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABu6Na5/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABu6Na5/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4CA2C4CEF5
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 13:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753796503;
	bh=mAmes/zYyoBatBwuEfLsqP7Lrt5HONR4RHITd4MMcjQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ABu6Na5/eI3ieZ8dnqTkLjgP4Un8Pmz+6NJ1LPPl0dyBksTr9OCP/vD8hBA5aCDE9
	 KXpLd+c1FNCxiA7Awx53/CAZxCOzwOBgVdT80+JD/SqOKeqKKry9xRWI1gHmZQZrLb
	 gx5c1IjvhqxM3DSk5X33hnCaacyCsct0Dprn4OI9OAR3AGZKcFI1vU1mA2Kkem039f
	 J4/inhxCoAVDs6bu+1X3jsuFRNA6Iko32717R72ANjkf3EWQmRDQ9iEj/lYy508INX
	 bNsUxr5qH5rqMy51BZG8tG/CCdm1H03RiIZbP9AMslKFfPqiISSa22VyWmaeS0Y/eo
	 iMlfr6keMmGjA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553dceb342fso4522142e87.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 06:41:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWS2MLZQ+9MyHDteXMNwZk361hqcBETmQ0YXqVQH8i6YC/5dF3ylAWaG0iu3bpmlmKRSsJgE8LzCttC6d5c/MaE8+yIQg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxploSpciyzuY91RJYF3tQg5k0uLF7AOyQ8zkGa9JmYv5+yu1UH
	AX7ni2jc6tzLOghCSKafwBvKcNxL/MOqgooc6lj4Ych+EE0DQqh5tcxlOCiVt7INphjIncmpN3Z
	RI5aT/o20FsIt87FTlo4eB7zm6uPw+hw=
X-Google-Smtp-Source: AGHT+IEwSunG1YMGday32yllpM1VGfMg+K9R6KuPv4lYOqip2dD0AuzRB11gez/iBHLrz79Iy/jkmeXYwT3x4TnoidI=
X-Received: by 2002:a05:6512:2393:b0:55a:3358:a7c1 with SMTP id
 2adb3069b0e04-55b5f4c8ad6mr3891519e87.53.1753796502230; Tue, 29 Jul 2025
 06:41:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250727164433.203775-1-suchitkarunakaran@gmail.com>
In-Reply-To: <20250727164433.203775-1-suchitkarunakaran@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 29 Jul 2025 22:41:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNATPeS-cHtNGj_cfNypMkpgMYLa_Tc88Ce_3gUTEKqNkBQ@mail.gmail.com>
X-Gm-Features: Ac12FXyjXDzDCvc5P_pSBpHIy9btM9FBBrF_uzyQJ4XI2bBRPEXffRsTgXyT7n0
Message-ID: <CAK7LNATPeS-cHtNGj_cfNypMkpgMYLa_Tc88Ce_3gUTEKqNkBQ@mail.gmail.com>
Subject: Re: [PATCH v3] kconfig/lxdialog: replace strcpy() with strncpy() in inputbox.c
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Cc: nicolas.schier@linux.dev, linux-kbuild@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2025 at 1:44=E2=80=AFAM Suchit Karunakaran
<suchitkarunakaran@gmail.com> wrote:
>
> strcpy() performs no bounds checking and can lead to buffer overflows if
> the input string exceeds the destination buffer size. This patch replaces
> it with strncpy(), and null terminates the input string.
>
> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> ---
>  scripts/kconfig/lxdialog/inputbox.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdial=
og/inputbox.c
> index 3c6e24b20f5b..5e4a131724f2 100644
> --- a/scripts/kconfig/lxdialog/inputbox.c
> +++ b/scripts/kconfig/lxdialog/inputbox.c
> @@ -39,8 +39,10 @@ int dialog_inputbox(const char *title, const char *pro=
mpt, int height, int width
>
>         if (!init)
>                 instr[0] =3D '\0';
> -       else
> -               strcpy(instr, init);
> +       else {
> +               strncpy(instr, init, sizeof(dialog_input_result) - 1);
> +               instr[sizeof(dialog_input_result) - 1] =3D '\0';
> +       }


Applied to linux-kbuild. Thanks.



--=20
Best Regards
Masahiro Yamada
