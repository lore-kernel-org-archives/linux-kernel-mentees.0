Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53B7128367
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 18:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707935313; cv=none; b=e+Ouh55R5VdBX1CTz8XT+4KhQYixqoK3sEyknTivVEhJr1wusb3Ecltx5YCcB0cThMqvtXeKctu1hxlqh0ZpkwMy9TtA0kdZ7BqjXxdcHh0dD1owmO8+/kWeK7TRJqa7dLkm5ykpVYGWnXcxxKc7oy99ram6+1cj+xcmVMW3dB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707935313; c=relaxed/simple;
	bh=L1cQy5vPjEPPvGhy+Pjr6Faj2fP17lsqUJrqsKN8S9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jciRoVQhFBxruvtzI6bvRqxCcaYLmbSupAR0DjJhzDKH0gk9RYYH/d1/GMOn0XvjfL3aUxbZ2rtQPsE8JQIsGoc2bWkUwHD24VpXpEmye58V43VOhqyHzuyL3t3hpUI+bdhjesjzfdemqABxDiypFskfjvg7Gb9QoUgfKcpkg+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jWf28Xvp; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jWf28Xvp"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4591F82011
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 18:28:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -15.102
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u4TnMLc-GEyA
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 14 Feb 2024 18:28:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com; envelope-from=justinstitt@google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A3CB48200D
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3CB48200D
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=jWf28Xvp
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A3CB48200D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 18:28:31 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-7beda6a274bso214650439f.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 10:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707935310; x=1708540110; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UXG7T3GS6T6xydEvB7aK25Z8yMzmDQXeLDbtiaZDxqs=;
        b=jWf28XvpTi+UVEJ/2gpExhcFlrQmjGjzVg85rW5S9u8yIy+mrLZDVzFi9TY4eutFGo
         hEatrbu3rIlmisVD6MKz/cYMyiEr4Z8TwHIarX+/FDpB18nkXf/cyIUU9yCX1d0uqRIt
         XxUjNQQjtW0jPZZT9sDD8GZMore8F6Awtq+dtYUofaQHXzZ7jlWjjRKZsdw3Dh2g+IxE
         t2elzGwk72yquOLz2H8Nf8F8aDdY/QXNg97hpAht+QkvcO93ZU7RHAZn/28ivbmhZkLX
         K0wYxoIJQBROlMxjWmeoWGizhXVghMeNNiuASLaHYbZpLQSU3qxe26dyN08ZMFQxPoul
         CTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707935310; x=1708540110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXG7T3GS6T6xydEvB7aK25Z8yMzmDQXeLDbtiaZDxqs=;
        b=IBtUn6nlICCxc0xktJ3Z1qqsT87ZRpXE2rHtA6kGno9aXQwWvuj66AOBR5DDVknCP1
         uwzFnXdFe7ElKvCC2o/RHd9AYDn6mYZhHQdixAay5iCJl//uUuhmZDa2NeykYxwWcceo
         mNf8fpd51PPOnUtCXKYepZ0OZ+CAAEBKvUk9Z/OsKMRGJTQb5skMHwi92YI65+Er1Vaa
         MYTY7sZl5YYEWSN3G/yKDWwRqmSFw8MwE+YGM/CJV1NL9zFr3IfxYJE2td2xe2QSThLM
         LoTI+aKHEgK/AZn5x4Jtltes43UUJpB0QJPVsIGTZNjLxUGlRaKCnWYorVXfnYNaHKtQ
         B1tA==
X-Forwarded-Encrypted: i=1; AJvYcCUy47/UlCNT62kfl/6UjlHk+nNx/nrv4YTnlpNAuqv/8gyL9KHakIGOQqxatRJpvOFu13d1byzBuwI2SQ1mj+AqhX6TzSQWN0+JgRj6blLJvqL0L/fqGpWKRMjHGq5y
X-Gm-Message-State: AOJu0Yzciw7y5qMPBSVnqDeV5jq4v15QjFsbqNBSZL2DsrKEFcvra5cT
	ayBbqWRPvHUe4sMO0tcWDRuvhYNb3Ix8CKerV0jGtZ7Znz7vGC5Rsfff/VgSjw==
X-Google-Smtp-Source: AGHT+IEiKlUZY2svl3CmYmFiwFlC+HtEN+d+i2JVJ8GIWshr6QOje2I94cpJFsJpFiYgYD/MtRPDGg==
X-Received: by 2002:a6b:6610:0:b0:7c4:3b9e:f766 with SMTP id a16-20020a6b6610000000b007c43b9ef766mr3533717ioc.20.1707935310529;
        Wed, 14 Feb 2024 10:28:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULDYdhHx0Tim9oaW2CeKEN3+wa2WE1J8k3qfIEDy1/Ves/fXZMA/ZWBlP5PgV1w0P8rIpJB1y6ffKeoDGwOZVUZd9CsF7FksR3Zxw3fhk4pPv7TxK25e1Mk0DB0fS0HcVRLqaAr9SfKgSAmZk5XVSXqECQnkBQf5U3Hgwvm7q+lIwy/QzTP4MK7A2h21mI+orjPXohcdbsIBwaRnqRmCoouz0GN7jHTnNnpvFj8fpoHQn7UL1ZT2xO0oOum7GXMFfQWpSYx8RxdpIycXZB0bB0ieQNAqcrYK4rdsIrlF6+fhJ9/CgR1KgpH2qSLp0PoZ3Ddwn6+n96sw9CDNWWUcBD7igadr0WKJliD2kf2Zf4EfbKxPk=
Received: from google.com (20.10.132.34.bc.googleusercontent.com. [34.132.10.20])
        by smtp.gmail.com with ESMTPSA id a22-20020a6b6d16000000b007c45ab3dc34sm2131730iod.29.2024.02.14.10.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 10:28:29 -0800 (PST)
Date: Wed, 14 Feb 2024 18:28:25 +0000
From: Justin Stitt <justinstitt@google.com>
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	masahiroy@kernel.org, morbo@google.com, nathan@kernel.org,
	ndesaulniers@google.com, nicolas@fjasle.eu,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v3 1/1] gen_compile_commands: fix invalid escape sequence
 warning
Message-ID: <20240214182825.ghe2rqux4mdkgh2f@google.com>
References: <CAFhGd8pvhzehMGh1XEHBct7CGEQuF0CZeneMH3D6cKSRj5UdHQ@mail.gmail.com>
 <20240214012439.879134-1-andrewjballance@gmail.com>
 <20240214012439.879134-2-andrewjballance@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240214012439.879134-2-andrewjballance@gmail.com>

Hi,

On Tue, Feb 13, 2024 at 07:23:05PM -0600, Andrew Ballance wrote:
> with python 3.12.1 '\#' results in this warning
>     SyntaxWarning: invalid escape sequence '\#'
>
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>

You probably don't need to send a patch series (with a cover letter) if
you're only sending a single patch to the list.

Really, though, who cares!

Reviewed-by: Justin Stitt <justinstitt@google.com>
> ---
>  scripts/clang-tools/gen_compile_commands.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> index 5dea4479240b..e4fb686dfaa9 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -170,7 +170,7 @@ def process_line(root_directory, command_prefix, file_path):
>      # escape the pound sign '#', either as '\#' or '$(pound)' (depending on the
>      # kernel version). The compile_commands.json file is not interepreted
>      # by Make, so this code replaces the escaped version with '#'.
> -    prefix = command_prefix.replace('\#', '#').replace('$(pound)', '#')
> +    prefix = command_prefix.replace(r'\#', '#').replace('$(pound)', '#')
>
>      # Return the canonical path, eliminating any symbolic links encountered in the path.
>      abs_path = os.path.realpath(os.path.join(root_directory, file_path))
> --
> 2.43.0
>

Thanks
Justin
