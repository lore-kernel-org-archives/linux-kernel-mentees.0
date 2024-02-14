Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FF779E0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 00:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707871235; cv=none; b=lkDgTSsOFUsjAqfktZgDOAny177Mzqz7BeQe8avcv/CYyzxvwZTB21lJu1IgYQVHXwZoMhvMEoQFzcreOxdJDrAPfSjOoMwyYAi5cQNBg5ieoI0qREmrMenOnqJLfKfUtNeg45SBcTc1WvzROUGAb0y9/w1mJ/PQqW+26KO0x30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707871235; c=relaxed/simple;
	bh=732+Z96bjl+fssXUyJzSLJfOmRgK7uvzPvL/AgukfWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dbsosuddHS9v9p7lUuYRqao9wlH2bFYEQjKuLw2FpsPwXCAu1L2F0A8xs694hCERWG50Z66cYJJhSpeHqRtKLcZxyU0udEhkE0/rn4VRUoEKkSCE5BK8b8NQK3UDBYRh3is/EgZghcekmInSUCJkBWT08mIJDg9RS+xVaAmRMYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L/HqfmYv; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L/HqfmYv"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC0B8409B3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 00:40:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 463qfUnTmYtL
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 14 Feb 2024 00:40:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com; envelope-from=justinstitt@google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 98E8E40836
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98E8E40836
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=L/HqfmYv
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 98E8E40836
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 00:40:32 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2d0cdbd67f0so70335871fa.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Feb 2024 16:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707871230; x=1708476030; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odl7g7SmrflKYLXiwuyOjEG83lRHDsTab35r8GfTGWQ=;
        b=L/HqfmYvMvs83YRt6zyZco8IAg2H2WzeFNZQQduBpT/26zCUVk2PhBpNDDY5GIwpmO
         l+4FKUkydgxO37r1CMcXWcDLsZPLPlqb87Sud2QKDkhvsr3YghU7QEt6uO92wNmnkpoD
         nhJqiXvH7BTsOXnCrQWNOgousvJQ9et5qahN2Vb7F8zMrHMwF9xzW2jRRHzIRcdhX9I3
         JXhvx4ze4d6PkfySk8T/WOq5aNYZIM+nuVhJ/SpvBfUNQvtmed60EKRGJc8ge7MLb0Pc
         Gra56Uxr0twmeDekUrJcCg5QsxZEz6RyDnj2xvCur7U13fZl4JocMGA+oUjqU0VbaFZg
         nO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707871230; x=1708476030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=odl7g7SmrflKYLXiwuyOjEG83lRHDsTab35r8GfTGWQ=;
        b=ICPw16R4k/yNVRPsaxmjrThaZhhyJV0fSz/I1rLgU7HmMtHc9HHEJVD2ZXwqeV4B7s
         VvIfLmgW0euFx0qJfPbegISNF66XVIMuW2sFRbmBhUkX/LASZ0JM+gwSjRyOBk4+ruXy
         1C3KFm77n3rbemnHbnmMjoPvvvm+ZyuRH7OWVAORMck9bJ8N2HNLazgdxYjoEtjgoGgn
         fGBfcq1zlErQ2BBFKF6Jt0OaZkwaNba/x/Swp0TNXSIrqBFWaRfk/o6mU8Wh7MOCWee3
         +k9vo9OqG9uopX1rchu2Sy34vaBmENe1rO8zhmZPJTPXyzgVRJ1G9Mz1tWyXgKIzowIx
         EPGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdEVLidSSlYRTpa81y+VmRoUnSWXcUpYNSnMEoWgyuHG34EG3zQRdoyjezCu6NtVn8E6UOw1DG//rOEgsqWSe998DsXAUumGUGLCyIE9VdTQcwuYayhwj5Negr5r+N
X-Gm-Message-State: AOJu0YwPjkWw6jxuiIj8HPqHFK0emUmt4AfDEWx1O10oTVF2yILe+EmW
	rKXlZuJrZQIESyuoPCnImciWSNTAYpJ2Whg+CbjB8q/jzBaSVD/gUcd1eEScEXy5G8kravdOKs6
	Z3X7J0SttL8k3XWxIMBeOIsosHpFqPp98rD4m
X-Google-Smtp-Source: AGHT+IHaUEkMIsoH9jlZggCVr/lZg/wX9gXvgpogBKJNvdQOntkz1p+0QQQ+q3X5bOtAgqrr5xeujEeC8XfnyLaucL8=
X-Received: by 2002:a2e:7c06:0:b0:2d0:e36a:6424 with SMTP id
 x6-20020a2e7c06000000b002d0e36a6424mr956016ljc.35.1707871230071; Tue, 13 Feb
 2024 16:40:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK7LNARaW1V5X79BFW5_YTKY+n+OSp+_ACpRxpiw+VOJ+2hf=g@mail.gmail.com>
 <20240213022552.754830-1-andrewjballance@gmail.com>
In-Reply-To: <20240213022552.754830-1-andrewjballance@gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 13 Feb 2024 16:40:17 -0800
Message-ID: <CAFhGd8o10KWEX=H56kUN0hjY=fowijov0bn+j_kOmv6BPwJ-yw@mail.gmail.com>
Subject: Re: [PATCH v2] gen_compile_commands: fix invalid escape sequence warning
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: masahiroy@kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, nicolas@fjasle.eu, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 12, 2024 at 6:28=E2=80=AFPM Andrew Ballance
<andrewjballance@gmail.com> wrote:
>
> with python 12.1 '\#' results in this warning
>     SyntaxWarning: invalid escape sequence '\#'

Yes, since Python 3.12 escaping invalid characters will result in a
SyntaxWarning.

The complete table of supported escape codes is available here [1].

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

I'd personally prefer using a raw string:
-    prefix =3D command_prefix.replace('\#', '#').replace('$(pound)', '#')
+    prefix =3D command_prefix.replace(r'\#', '#').replace('$(pound)', '#')

This makes it clear that a literal backslash followed by a literal
pound sign will be replaced.

>
>      # Return the canonical path, eliminating any symbolic links encounte=
red in the path.
>      abs_path =3D os.path.realpath(os.path.join(root_directory, file_path=
))
> --
> 2.43.0
>

[1]: https://docs.python.org/3/reference/lexical_analysis.html#index-23

Thanks
Justin
