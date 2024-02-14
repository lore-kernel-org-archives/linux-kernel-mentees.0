Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09254134740
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 21:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707946090; cv=none; b=Uqo2/pGIrQzWsjhknCuo+17l9D6QNn7jrz7jrEaDCTKN67o9NPEOXTGSGAJZuHSEgPYGeNyCaCoY+gYlU5OGWikt+mTJAsSYqKmmVnEfK7j0IJqro9gYfpnoSC83eVpB+af0VBntnu/z0E07TFQ42om0M+bzyLz7VZW1soxe8A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707946090; c=relaxed/simple;
	bh=sMR/EU43ymYV3sXSFsO3a+GSbk9xup663bB8N2u3J6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HqOy7mfGQ5R/gArU3QJpD4GGri3x/z2Pgfk1W1P93t88T0nqKSGJ9VxMvqqJ3+vUKsrMFtUDO2x+z/fR6dNSjLsG/Hjv7m1GiDV7ajewok44YprDQA58CRhoPufRPgyqHqfcyRvQR3VWnvgCIEFcELsEbvsnRxWOPHCv5pyrHCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nkNE3/Ha; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nkNE3/Ha"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F0BE81C21
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 21:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.902
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SppQrBiCx9Sf
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 14 Feb 2024 21:28:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 95A7C81BFA
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95A7C81BFA
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nkNE3/Ha
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 95A7C81BFA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 21:28:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0B301CE23B4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 21:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C3EC43399
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 21:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707946082;
	bh=sMR/EU43ymYV3sXSFsO3a+GSbk9xup663bB8N2u3J6Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nkNE3/HaVyI7fvPMPdsAn7MA1j+tRn8JsplaOB4Il+ryCZ5ZooXAsGkHAFtiAZx/B
	 7Pb15ykYHeOtP9CwwV9B7m6KJu69QTYuDfYrQkafXG/EVaCXE1kKGpT5U2f59NxSXE
	 u9GrvVBbt3eNiZCh/vVctoT7OT6NPAKrHZW6cvSM3Xp31yLTETZwW2wli0PxmDjsbZ
	 hdh9ND/DJwai0vvjT6breNH4BZuB640Ct+N3sJWhUxNTUXk525Swcjf7w+i2bnsMKW
	 jYdNcrXF3SJWAGbbiDX6oeDXXfN3Wg/Jj/cy8FmiXFVM82XIBYwYLaiGgaOL/cRyHI
	 JB1NTwv2/muBQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51182ece606so258860e87.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 13:28:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXS7iplDpafmeb/K3zd3tjbjfHPyqBP1m7io+S8SjP3xcfcIdtc2iS2JzmweTCxcv7sCJFRGVkZx2UThb5OgkvtflR6NimN+hruB2u1WSUKR0i4Cx//VKupe5pV73YM
X-Gm-Message-State: AOJu0YwaOKrepdhg1xCeCC2NsgJEhF23WdLBuE+2YjdhD4DEhyWgx4Ap
	TjvUDQ37zJpEpo8I7b6Xg8WfacKVWz2tSHMBdxIWhDgP52E5K8TKJNivHk+I1rzGGbRSaG38G/n
	0ey25dZiP93K5tZJUqYwdaLwxHAc=
X-Google-Smtp-Source: AGHT+IG/W9lqyeivaxRbePZdzCB0jHVgx1oFHIkcNxKQfTN250PE70uEZ83QpRnCOgahYuK3HBhlFT9SwgKvB2qiUXM=
X-Received: by 2002:ac2:5635:0:b0:511:550f:5300 with SMTP id
 b21-20020ac25635000000b00511550f5300mr1041746lff.14.1707946080774; Wed, 14
 Feb 2024 13:28:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFhGd8pvhzehMGh1XEHBct7CGEQuF0CZeneMH3D6cKSRj5UdHQ@mail.gmail.com>
 <20240214012439.879134-1-andrewjballance@gmail.com> <20240214012439.879134-2-andrewjballance@gmail.com>
In-Reply-To: <20240214012439.879134-2-andrewjballance@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 15 Feb 2024 06:27:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNASspq7uYYPx6QLOad_WUeXsyRmtbq9qibXJP_Fbo3Fs0g@mail.gmail.com>
Message-ID: <CAK7LNASspq7uYYPx6QLOad_WUeXsyRmtbq9qibXJP_Fbo3Fs0g@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] gen_compile_commands: fix invalid escape sequence warning
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: justinstitt@google.com, linux-kbuild@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, nicolas@fjasle.eu, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 10:25=E2=80=AFAM Andrew Ballance
<andrewjballance@gmail.com> wrote:
>
> with python 3.12.1 '\#' results in this warning
>     SyntaxWarning: invalid escape sequence '\#'


I changed "3.12.1" to "3.12" when I applied it
because this occurs for Python 3.12.0


Thanks.



>
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
> ---
>  scripts/clang-tools/gen_compile_commands.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-=
tools/gen_compile_commands.py
> index 5dea4479240b..e4fb686dfaa9 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -170,7 +170,7 @@ def process_line(root_directory, command_prefix, file=
_path):
>      # escape the pound sign '#', either as '\#' or '$(pound)' (depending=
 on the
>      # kernel version). The compile_commands.json file is not intereprete=
d
>      # by Make, so this code replaces the escaped version with '#'.
> -    prefix =3D command_prefix.replace('\#', '#').replace('$(pound)', '#'=
)
> +    prefix =3D command_prefix.replace(r'\#', '#').replace('$(pound)', '#=
')
>
>      # Return the canonical path, eliminating any symbolic links encounte=
red in the path.
>      abs_path =3D os.path.realpath(os.path.join(root_directory, file_path=
))
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada
