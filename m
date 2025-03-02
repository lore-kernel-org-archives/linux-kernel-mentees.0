Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F071E9B1D
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  2 Mar 2025 16:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740933604; cv=none; b=YYkc78dRQIvp1klP4jKbRhUzOhhl/B8MwJ0wb0fqDp0wKv/bdEpMVpSullO9AIfc89Ve5Dt/ziitDfR7mwNvpa//8oTrnAZsz+PHeEg+0BmGvaYkTscJafWlRDpHZ2Rr4o10//sSM63tCSUHRLtPvrl5LPvbHfengMeH9mWRB5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740933604; c=relaxed/simple;
	bh=NEeg3Rzg4iVhgFfkKQDTPV/BcBGgtllUpSTfPO0yAfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ODlcgbnXn64cTL3BBNw/5Wr9U3loK0kjMdcRA/qUN6gOmRdwyoiin5gAmA9ai/3FUsBqqrTFfuZduXf2+YNTBLuJZ9IM+g9R9ZKZHSVOooCmWQJXvBsXfzfpJoNfxJpxz0kWF0vmSXCuf4ukEN8Ba1KLAGET8/0Ui7O5dtButT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hufJx0N4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hufJx0N4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4540C4CEE6
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  2 Mar 2025 16:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740933603;
	bh=NEeg3Rzg4iVhgFfkKQDTPV/BcBGgtllUpSTfPO0yAfY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hufJx0N4c0G84oJQEpXi/WveiqfZbijHQtkmbyWub7mvpTzjKFNWgyGwXqK/WWRWd
	 xgFh4fHprEyIq1JQp/RhIpfFLjoos9b3ejAKXILIlkBivg1KOtWul7Q4nmZlSDLN1n
	 FaVGpXx4/DhInLxFQWQ/ms7kYHyd+pcieIU3yeC6bRg/z9+oYKfTKN2q7L1IOWHoxe
	 xy0If8qlopPvlBicKlIXdrNEhrSg569EDzHSKIXyicJZ+HXPbGis9Z6lAYWhaMBkSm
	 vBP6zBvXlLOcx+NOv2IGjV9M+dmwx36CePkNy/Xuk84T6Xsbj5z8lmc3g/ae6W8cUJ
	 x9aLR3ribmy5g==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30ba5cccc19so12930701fa.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 02 Mar 2025 08:40:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUm8XTBmSr0LBNWRzQvb83mzIa6zKk3K/O02rc12skqn5NgPk8ksIZkfI+pvKadkTPh8oVTNi1i5EkLW6A8yYf6dfK4tQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWLPUSXBueNgq4Q4t8oHUovHJ5GU37WAhDWF1bXzeYh55q5MLC
	trqD7MJ90aqn19OlnF6qm8eac1hAkNQ3A4ZLdQW6WRwQEA+c8rHPj+tEN4T7yqNVhbHJ+1H1f9y
	vlNeCh5uwKuMtyPktzO132f93f8A=
X-Google-Smtp-Source: AGHT+IF15yal6+bEvY5jhnNcanqgWka40b7JrgueD5ZuzAyJAl6y+S6WZMIJKOhOBJUHpF3vniRofuLSOVjy525/zc4=
X-Received: by 2002:a05:651c:505:b0:30b:a187:516e with SMTP id
 38308e7fff4ca-30ba187518dmr25563241fa.13.1740933602612; Sun, 02 Mar 2025
 08:40:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250301222137.18617-1-ImanDevel@gmail.com>
In-Reply-To: <20250301222137.18617-1-ImanDevel@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 3 Mar 2025 01:39:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNASjGwDOmmv9eowHaNXj3YcFSCThVYLGZ-F=v+4gZF1+3Q@mail.gmail.com>
X-Gm-Features: AQ5f1Jo6rb6YIRu-v40v3RfLPZUE09xpzXF5y5MriW7Tpi_eN_Qpp-_2L-QvxsQ
Message-ID: <CAK7LNASjGwDOmmv9eowHaNXj3YcFSCThVYLGZ-F=v+4gZF1+3Q@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: fix argument parsing in scripts/config
To: Seyediman Seyedarab <imandevel@gmail.com>
Cc: nathan@kernel.org, nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 2, 2025 at 7:20=E2=80=AFAM Seyediman Seyedarab <imandevel@gmail=
.com> wrote:
>
> The script previously assumed --file was always the first argument,
> which caused issues when it appeared later. This patch updates the
> parsing logic to scan all arguments to find --file, sets the config
> file correctly, and resets the argument list with the remaining
> commands.
>
> It also fixes --refresh to respect --file by passing KCONFIG_CONFIG=3D$FN
> to make oldconfig.
>
> Signed-off-by: Seyediman Seyedarab <ImanDevel@gmail.com>
> ---

Applied to linux-kbuild.
Thanks.



> Changes in v2:
> Specified the script name in the commit message.
>
>  scripts/config | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/scripts/config b/scripts/config
> index ff88e2faefd3..ea475c07de28 100755
> --- a/scripts/config
> +++ b/scripts/config
> @@ -32,6 +32,7 @@ commands:
>                               Disable option directly after other option
>         --module-after|-M beforeopt option
>                               Turn option into module directly after othe=
r option
> +       --refresh            Refresh the config using old settings
>
>         commands can be repeated multiple times
>
> @@ -124,16 +125,22 @@ undef_var() {
>         txt_delete "^# $name is not set" "$FN"
>  }
>
> -if [ "$1" =3D "--file" ]; then
> -       FN=3D"$2"
> -       if [ "$FN" =3D "" ] ; then
> -               usage
> +FN=3D.config
> +CMDS=3D()
> +while [[ $# -gt 0 ]]; do
> +       if [ "$1" =3D "--file" ]; then
> +               if [ "$2" =3D "" ]; then
> +                       usage
> +               fi
> +               FN=3D"$2"
> +               shift 2
> +       else
> +               CMDS+=3D("$1")
> +               shift
>         fi
> -       shift 2
> -else
> -       FN=3D.config
> -fi
> +done
>
> +set -- "${CMDS[@]}"
>  if [ "$1" =3D "" ] ; then
>         usage
>  fi
> @@ -217,9 +224,8 @@ while [ "$1" !=3D "" ] ; do
>                 set_var "${CONFIG_}$B" "${CONFIG_}$B=3Dm" "${CONFIG_}$A"
>                 ;;
>
> -       # undocumented because it ignores --file (fixme)
>         --refresh)
> -               yes "" | make oldconfig
> +               yes "" | make oldconfig KCONFIG_CONFIG=3D$FN
>                 ;;
>
>         *)
> --
> 2.48.1
>


--
Best Regards
Masahiro Yamada
