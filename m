Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697022248B3
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 10 Jul 2025 13:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752154162; cv=none; b=dNn/cP1jsgxAuTTSlPR//YLCsCArAx/Xg7EQeDRQsPGZADnOP5ZWDBjpiEzPEI87I2wtpraxecbnXkTyQHIKlEDER2dpCKtRPvc0SgF+J4nxDXoMm89j6mTcNaEnVhZRBcKpHnYS/W4yOR0u+6mNwC8+DXelUDHfCzxke8fs8DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752154162; c=relaxed/simple;
	bh=QT4uJs+tWZcw1TbR3zjG7l7Y/uCgIXWvWRNm9KUxxkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aquzEGsLm40RFwPoY7i7LAIg/xRXy0jHQope2iynbMi1TjyjKOkhp0GJnIJ+1YBZjtsNmQGiNHdebLwLTGaIYjo+IyW+L2nNeZfiTcVkFXbRK8hPVtd0AwpLXoZL0LNtGPmHuIRy86P9z64OHP/BarlZ7rgrkszSO2N6GHuURm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlhyTbEK; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlhyTbEK"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54d98aa5981so1353536e87.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 10 Jul 2025 06:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752154158; x=1752758958; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=piqCxXsuVfG+cbp1axCZg3t9wi+Ugx0SKEh/NShY52o=;
        b=TlhyTbEKDEbXPc4lA6mfnMiT2I3TG3Rmo0rY91tNsjkQZ6Cdp5Nqh3PfcPiDm2POZm
         F4/AXpzIx//kHRyOaFcL8Pkw3tAVzQ5by9N+toiWYYsG56UG/nkAqW5iYMsgqLh4YUcv
         JN4kR+CLGfbDVMjQXj9p/FnHAYZJa+SEuOjoBEow6KvP6p+5mZaP8BOzxKVeAsN0R0Yk
         ZKbdb1pGlKpKIi6OBIcj5wrUV1ZaahQzXl/ZGMgxkSKBoK60e4uH8bLv/RmtZskVErPT
         uaNqFU8FUTl0SUDx6umN2MLWeizDq8l3ORCY8mec1s6Bk+JqO9U1MuMsxqHfnoH10XZH
         CgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752154158; x=1752758958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=piqCxXsuVfG+cbp1axCZg3t9wi+Ugx0SKEh/NShY52o=;
        b=dVepvmEUJk9Dlhjj8qdBDF1Gj6nev1fU038V7VMifLtjqK3A9RoqktcKhTM+P0cMek
         ple+zsIszH2+p2zWGEI5080bnA9GJXFqSU82t3UztPsPXmXX2BtST3CRTZqk3TVdUCOb
         9JBy4NWCdQX1mVGuUP4QA7P7rY9k/7AVANqwx8yN24lJjud/ZX+t3ONxEv+9YEV4vm7g
         W2pqb/OkMtUJC8Gv7+aYrRGkmTTn1a/akVhij+6vSk9mtcb0IPmxsAGda9oxWrFVo6rY
         +nSyKbQWOyqGVRFf1J4QARF72A48f77nhjvdk6YX68ILMx34YWT2M6CGAFRg/mWE+msR
         lq+w==
X-Forwarded-Encrypted: i=1; AJvYcCVDrVUE+6z5Qx2fcA8GU68HAQCf5z+Ufloe7rRb8tk/k39NtqYZkbOsIUDquNI1rLWSs2riVMJTnl5hE2I+VwSNVE3zJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzk5rG3x9zkbXEqzvU9cNg/dk5OuQyjzAv/pOgGKnGMfTY0Us9E
	OcT5hwSOQ4P4QQMdGmMjMyCdkQJxwOjgwwjqjiJD4Yl1+kxMw4gmsI9jBdd39T+81b4vFoZsNHL
	M4yQsXBCLkEC/xzIdVglM/9TbI0/eKPY=
X-Gm-Gg: ASbGncuplyrUEtNznooJ9wxIfg6BHOaqxV/5QnsnZfIjEOK0i3wAACre4Ce8TDe2PWH
	MNxAPVpOYo+sIxwCdN6e4CQAqwAuLisU8Wjl2shkjAPf37gFObj9muoFakl/QYbRQPkOODZIEaL
	Kcz7z/FY3k3m0zvoZgUwgC3R6cLR9/m8PKzWY1VtgIpKioNYtD4UC/Z5JytmyZwvTSQCSyUj5qH
	iG9
X-Google-Smtp-Source: AGHT+IGjNgUJ/H9riNAilbUH8PcKjpUwWpLd+w7gGSVY7R1BBXUiEdy2K06vfMxch2Md2cDv6Xa8DdeQP24hUJnC9hU=
X-Received: by 2002:a05:6512:3055:b0:553:2e42:fffb with SMTP id
 2adb3069b0e04-5592e3e10c9mr968505e87.33.1752154158148; Thu, 10 Jul 2025
 06:29:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250706092522.9298-1-pranav.tyagi03@gmail.com>
In-Reply-To: <20250706092522.9298-1-pranav.tyagi03@gmail.com>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Thu, 10 Jul 2025 18:59:05 +0530
X-Gm-Features: Ac12FXwmXCqGKG1PpHjcwsfz2aUtwCdpqzLfV1sJRe4M5S2L69rvhq9nulNa-ME
Message-ID: <CAH4c4j+XskhzM-Kuv+gTAaBL8o+63kbOPGS6xqQYQ3_Fd0UMCA@mail.gmail.com>
Subject: Re: [PATCH] target/core: replace strncpy with strscpy
To: martin.petersen@oracle.com, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 6, 2025 at 2:55=E2=80=AFPM Pranav Tyagi <pranav.tyagi03@gmail.c=
om> wrote:
>
> strncpy() is deprecated and its use is discouraged. Replace strncpy()
> with safer strscpy() as the p_buf buffer should be NUL-terminated, since
> it holds human readable debug output strings.
>
> Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> ---
>  drivers/target/target_core_transport.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/target/target_core_transport.c b/drivers/target/targ=
et_core_transport.c
> index 0a76bdfe5528..9c255ed21789 100644
> --- a/drivers/target/target_core_transport.c
> +++ b/drivers/target/target_core_transport.c
> @@ -1112,7 +1112,7 @@ void transport_dump_vpd_proto_id(
>         }
>
>         if (p_buf)
> -               strncpy(p_buf, buf, p_buf_len);
> +               strscpy(p_buf, buf, p_buf_len);
>         else
>                 pr_debug("%s", buf);
>  }
> @@ -1162,7 +1162,7 @@ int transport_dump_vpd_assoc(
>         }
>
>         if (p_buf)
> -               strncpy(p_buf, buf, p_buf_len);
> +               strscpy(p_buf, buf, p_buf_len);
>         else
>                 pr_debug("%s", buf);
>
> @@ -1222,7 +1222,7 @@ int transport_dump_vpd_ident_type(
>         if (p_buf) {
>                 if (p_buf_len < strlen(buf)+1)
>                         return -EINVAL;
> -               strncpy(p_buf, buf, p_buf_len);
> +               strscpy(p_buf, buf, p_buf_len);
>         } else {
>                 pr_debug("%s", buf);
>         }
> @@ -1276,7 +1276,7 @@ int transport_dump_vpd_ident(
>         }
>
>         if (p_buf)
> -               strncpy(p_buf, buf, p_buf_len);
> +               strscpy(p_buf, buf, p_buf_len);
>         else
>                 pr_debug("%s", buf);
>
> --
> 2.49.0
>
Hi,

This is a gentle follow-up on this patch. I would like to
know if there is any update on its state.

Regards
Pranav Tyagi
