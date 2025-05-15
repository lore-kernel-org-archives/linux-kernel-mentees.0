Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5B41DFDAB
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 15 May 2025 14:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747319853; cv=none; b=ayc5lPp292L9cqqHZ9Kc0HOiVwsXN5e8XebKG7zPXMCgRYBIkcLkdWNFifAZ6ll3tSBFTMJizx0fi1ZUnfHPlsc8kZg/OdbWomLVOL9bXf6kb1UjhM4DotfStodNp7KJGUPyKQPp3gS9GPYdqw1AOFU7ge987F7vYreRReOwbsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747319853; c=relaxed/simple;
	bh=SQgbBL5RYcSAsngaHeGJNNqtuXZsSXNQ+yscYHWqeM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BKkEvGLfuhZVg5SOL/idnhnAWqfpJJh6hMRwhTr+5LOLkPxoqztSmYf4+Fj+DmnQKaDGdjnlfH/smcCl3cAJ3MyJNEwPFyu4vexmZMRxfCFI8ivhUsnZKjPWXz9Q1A+dfdZ+4HnPjyvZiObP/vrliufyV4HZ4gLbNBjuuIoCpx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gwCbs6p7; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gwCbs6p7"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b1276984386so104991a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 15 May 2025 07:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747319851; x=1747924651; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yhx/trwlq7m4oFPBZzH0TmWWvywnM8oewCNJl0cBG00=;
        b=gwCbs6p7fBCQH+sWsaUf0kumO02v0CNwKFsAYIRZ3cIo6cEC1Ddql1vZ1NVyWzUD/S
         PgCvEgH5qbyzBnRric/Q/t22o8QsVJY6QgKSeUoLVyM+ygz0EQmXyKjzCizkMAzkRtde
         lUTIzv3MDnzCxI8sUsqJ2RlUujaH4zQ9DGbfaC4al5IzaH3yVhrqptIGYFmlQO3NpjWl
         /10htWN7pmbGQBFh/j25tw3JipMbNNrfhZNVefpRjXqK/wEybJKZZ3NmmtByLUnm4WhU
         8A9YC7oalxyKtWNDq/fCqb5rVHPhKluUuYFsLcP8e4CGB03lvHZV0k0PLs1g2/EbDdWO
         k7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747319851; x=1747924651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yhx/trwlq7m4oFPBZzH0TmWWvywnM8oewCNJl0cBG00=;
        b=Oil6xg6M99VdtQAdlpq9VcYbF9dpwMCe9IROs+4bOs7IG5gn0rmK9eAxTY2X190EUD
         bvj812HGPNXAm1XrXfvjJ8IKY8umwS8QZMdB8MDAmBR4Vnttlh9K4VhohofBw7qhTvJJ
         0qzE999/E+iFFp6Uq/JWJsixRi1V6VMlfr4teLijvsoPUMiwZBjwt7gfXq2RwDsJmrh6
         XBd/l0AqGDsJoJ4PYC58HjxRf5WxXQwnOjtZ8ZYn8yIvVBPkXKdfLs5FQWL24I2uUWF4
         dgXWZ6fy69rY/mFGp3/EwajqO1SJmXMEZKz1vdmxfOdpvr9R7wHv9I3RDpUKnSd3oG7w
         zPCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsu6g0GsLDmt4strC+ZjAqbvwlNaJAWvVjTQ+kd46u44sxHfizre1/BZh7mbJtzNulWoMLKmgV3y7Vg+m2aCQmUXgpmg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWH3FlgOXdzFfTU/7omcvow7wUE6zYEt5+EL7Ba3J6/gD59e+z
	UnmfsjC1Bgi6GlnK7ufWMljgv05eECyBvauKtVCduvNE+z3zLjtTg8zSS5HgFolmNPOWYtf8LNK
	iBYmcf9+2s5g84UJMEGh+SeZinro=
X-Gm-Gg: ASbGnct4D9bQVcqT0axWvSbHvoxDntqo1AvTfDwJpqFmhZsWfzJYtakpv7LXEB2BExY
	ZDrYcNn2TFaKglCGAeEhso5D6a9uP2n3GZzjUwGr11cn38WSNMs6RVGGMrdrELbmk4IlQSE3JqS
	w5PG0Zjq7gGj0puz7GIpSnVVVZHGTSE1M8rw==
X-Google-Smtp-Source: AGHT+IE6YzckvATVsA8ojqUKzTuHbFQEbdpn6dyEbZwwrvVfuh9yZqbs6GMEM12xPFjFO+94qbP7aQBl2ClYYnEZHX0=
X-Received: by 2002:a17:902:dac9:b0:22f:a1b6:4495 with SMTP id
 d9443c01a7336-231980e4054mr41337035ad.5.1747319850679; Thu, 15 May 2025
 07:37:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250514213511.380890-1-rk0006818@gmail.com>
In-Reply-To: <20250514213511.380890-1-rk0006818@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 May 2025 10:37:19 -0400
X-Gm-Features: AX0GCFsggvZBkjWGjCTAgk5MrozCZH-a5UHDUJm9gsAKzfN3QltHqMR6QfX5QOI
Message-ID: <CADnq5_NNRfTM-Cb_bvtEQcLRE4LXh7Uf1Pp1+chCtfRmee0aug@mail.gmail.com>
Subject: Re: [PATCH] docs: fix doc warning for DC_HDCP_LC_ENABLE_SW_FALLBACK
 in amd_shared.h
To: Rahul Kumar <rk0006818@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
	simona@ffwll.ch, skhan@linuxfoundation.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 3:09=E2=80=AFAM Rahul Kumar <rk0006818@gmail.com> w=
rote:
>
> Fixes a kernel-doc warning by correctly documenting the enum value
> `DC_HDCP_LC_ENABLE_SW_FALLBACK` in the DC_DEBUG_MASK enum.
>
> The previous documentation was incorrectly formatted and incomplete.
> Updated to follow proper kernel-doc syntax with a full description.
>
> Verified fix using `make htmldocs`, and the warning is no longer present.
>
> Signed-off-by: Rahul Kumar <rk0006818@gmail.com>

Thanks for the patch.  This is already fixed.

Alex

> ---
>  drivers/gpu/drm/amd/include/amd_shared.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/a=
md/include/amd_shared.h
> index 4c95b885d1d0..ebe0caf1fda4 100644
> --- a/drivers/gpu/drm/amd/include/amd_shared.h
> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
> @@ -366,7 +366,7 @@ enum DC_DEBUG_MASK {
>         DC_HDCP_LC_FORCE_FW_ENABLE =3D 0x80000,
>
>         /**
> -        * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Chec=
k FW
> +        * @DC_HDCP_LC_ENABLE_SW_FALLBACK: Enables software fallback for =
HDCP locality check if the firmware fails.
>          * path failure, retry using legacy SW path.
>          */
>         DC_HDCP_LC_ENABLE_SW_FALLBACK =3D 0x100000,
> --
> 2.43.0
>
