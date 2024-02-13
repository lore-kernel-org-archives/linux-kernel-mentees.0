Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D30881E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Feb 2024 01:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707788960; cv=none; b=R4YPJwyJBH38NpblVU2eepCieOirMi5NtBD5scCOwyAiasjbXvIdIWs1kSESwbwrcBLynw7tHFe18yufkwYgYn8uT6ZOBZUzV63O9rsw85KC/E77pEV852o9Co4rk4txgMbwO6dpXbTVDsyC2xyklxX1kMRz81i5kZljrZl/Ijo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707788960; c=relaxed/simple;
	bh=fwi+S6J+pteyq5souUcQ1aE411KhyQboibrZURAETGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ao74RtUI6RLszbQdtWUIsbQVEl8uIdjShuQ9vWm5fauSSIgg4CKfpfHbTpPHx1lyHHoT8rDNbou3x5u4pov3aOkzp6fdxX6nfG9B18hv3siQC39g+Q1g0B+tYxitnlXmnIzvFC5OW+bJm9vYBcIRRw44AcV62wgIxSRs/ggTURE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SB066ddO; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SB066ddO"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A85F81FB2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Feb 2024 01:49:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uWoXZfAnNjrv
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 13 Feb 2024 01:49:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B2D481FAB
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B2D481FAB
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SB066ddO
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4B2D481FAB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Feb 2024 01:49:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E3614611EF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Feb 2024 01:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9123EC433F1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Feb 2024 01:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707788956;
	bh=fwi+S6J+pteyq5souUcQ1aE411KhyQboibrZURAETGM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SB066ddODX74QE0NXa6YM4dNF3B/RHTy/yqZSYALXk8oCKpBrej/OrEdmIAZ8XMve
	 HOxbZl18aKLQf75Lo9ZKmdQL3FvET3tqHo+scfINU44j25ZrAm8u4vfxBXBW4KyMdE
	 1NQzF+/oOD+EjhvMLevfbG3y9abmvL9K9Wzz0G23mfty7L8X+rphG3ZiRSoPTYSxVc
	 S35oupbf/MWD9ZEwN67SVagld7EzUExGyMMbe2gorDngh9eEtEnhLB4zuAMyPTBHQ6
	 afpbhRqEqAM5B4sozXPC4HYEvfENn4dDtXYBqsHX6FR6mIJmHVQJx3n+P7VB4O8Wsf
	 MSK9EuLAJBgyA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51032058f17so4687928e87.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 12 Feb 2024 17:49:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1EO6WGtYLwZWG0IQcoxwR9EAuhC8dYF/IV2HKCgs35SqHx/m7kjLABv/otUW41OwMfyQogPcO/e54yElaOgU0eW9Q8819Ht3tHuszX7AjDf1wEzS5HeT2vlNb8PsH
X-Gm-Message-State: AOJu0YwQmNlgqAkT6JbW26os3vIf489c/zCEh5UcsRJkhf8UiQx9ZXIY
	sKQBOyV8Tme/ChwFRyKCAIJEg7a3UTBrt8o4+WLZz/QelUHeO4kPvErshXJegjD1qJzkn3Vg6NB
	+hXlCbrQncwmhxv0CRbr6FiTaSRU=
X-Google-Smtp-Source: AGHT+IEvAcxySNDK5LFyWfGkXegyxgDeA7TWn8kqRJrtoaDM8U7l6muFRj8GgN0zyqA42UyUG172uMMnBToTM3xhDec=
X-Received: by 2002:ac2:4c0e:0:b0:511:68e9:f698 with SMTP id
 t14-20020ac24c0e000000b0051168e9f698mr5384203lfq.61.1707788955189; Mon, 12
 Feb 2024 17:49:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240213012035.750928-1-andrewjballance@gmail.com>
In-Reply-To: <20240213012035.750928-1-andrewjballance@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 13 Feb 2024 10:48:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNARaW1V5X79BFW5_YTKY+n+OSp+_ACpRxpiw+VOJ+2hf=g@mail.gmail.com>
Message-ID: <CAK7LNARaW1V5X79BFW5_YTKY+n+OSp+_ACpRxpiw+VOJ+2hf=g@mail.gmail.com>
Subject: Re: [PATCH] gen_compile_commands: fix invalid escape sequence
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: linux-kernel@vger.kernel.org, nathan@kernel.org, nicolas@fjasle.eu, 
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 10:21=E2=80=AFAM Andrew Ballance
<andrewjballance@gmail.com> wrote:
>
> this fixes the error, "SyntaxWarning: invalid escape sequence '\#'"
>
> the error can be recreated by running


Not an error.
It is a warning.


>     make CC=3Dclang compile_commands.json



What is more important is to mention the Python version
in the commit description.

Example:

---------------->8----------------
With Python 3.12, '\#' results in this warning:

  SyntaxWarning: invalid escape sequence '\#'
---------------->8----------------



Please update the commit message.




The make command is not so important.

I quickly confirm it in the interactive mode
instead of running the build command.



$ python3.12
Python 3.12.0 (main, Oct  4 2023, 06:27:34) [GCC 13.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> '\#'
<stdin>:1: SyntaxWarning: invalid escape sequence '\#'
'\\#'
>>> '\\#'
'\\#'





>
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
> ---
>  scripts/clang-tools/gen_compile_commands.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-=
tools/gen_compile_commands.py
> index 5dea4479240b..93f64095fda9 100755
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
> +    prefix =3D command_prefix.replace('\\#', '#').replace('$(pound)', '#=
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
