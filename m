Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F9E277CBE
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  2 Jul 2025 16:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751472469; cv=none; b=FpBZxrC69R0ZG614MoKNXCHXKTleaLDjDdPfdIbcTMM6hxbhdZrc2pi2+XZso1LN3kEnhMYgU+jykOuBRjdFBoGIds3FelYVy8EG0cScM/Ev/mQ1O98Tm/bgJLuTjEoM9Zb+uMjyUMYt2p/SbYOqrqoh6hHDqnxZnZyBDEVnK9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751472469; c=relaxed/simple;
	bh=HD+xgnYDji4Msf7wrsJXB90TJgJt6pJI4Z6MoS60Mb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kKZr/K1tvFyiwEWt4J4EtcQ5W+845G0dVhWCdOpipw3yZjtRSZantyNysbGuzeQbvAhUPg2XUGKhs+UMqg/J9PoVqxlpiL35yKU6YFkD3vTfM62B4uSabI02f5Os8Rol+80sX1kikEzUvj2gE0pvmcagfuYDF2RwBAHY0OKArQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RP3mZvxU; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RP3mZvxU"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e7311e66a8eso4305472276.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 02 Jul 2025 09:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751472466; x=1752077266; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HD+xgnYDji4Msf7wrsJXB90TJgJt6pJI4Z6MoS60Mb4=;
        b=RP3mZvxUmCiQCIxT/G95j+WKfkbkh/DINH7Tl8u0Yv5/VEoV2dHsOL4CgOMuXdhJby
         jx6pnZxye92C3Y8O96s89ICUbLMEaqn2yta8z39ZPpRCbtWfVZ/oWhXBw/kRtRFshlEr
         +9DK26eP9gdUWqCzMtlhmS40I4tkHOkzp5ep/vCVSg/W6mOx9iiy/URHqc85M1alzEGU
         iYOJK/6ScjTOdULof44h9MCSh25ICyB0YIjlFYapbRDyCmJ0NtDIEonAGRHYkGVkiCAj
         RlpoK0neSierfk0uwZBgEei0G3s75SJ2ikYvzf4PoRlTHdeq/XdqMFJP2iVuPZneZpdn
         XOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751472466; x=1752077266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HD+xgnYDji4Msf7wrsJXB90TJgJt6pJI4Z6MoS60Mb4=;
        b=SY18hvBk21i4CA168PNT2AqhQaq3Bec0g1i1omyAhB80erdLSVuPcVR2wR1RabE4W7
         2eQY7fZ1XQSuNSKozWs5ZaSwzHg6wYT/hfBii+vDdVnFe8prp0O4Uo7D0b+7Z3z837uv
         tqFveKt03ZugxX5N4jzB9svQuEKmocThEvoGHd3G6CDrBFcB7PZE/W8yVgfEWucVE5OV
         /4+0CjNsgBNw7O+cYEC5CMoR/HoytCY9ae0j0oz7s9qfghgThf+hbj6sIkcY2MQ7sknj
         aVVTiLqM6flmi6yQ8P7cM3f11ScEY8Rr3BPE/5NgPhxhaqXCzuiP+vWNRw/Rg9X6yA4r
         R4vw==
X-Forwarded-Encrypted: i=1; AJvYcCVSOc/baaX4unb/u9Ui5KEn9zAJka289wS+SNuMsAj1DwoJiWPYaTp1mk1dCQBW7VKk3qwigSHM7zoU/reLb5tYsEFaXg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwtYDouA2hcDEhhGbWRsgs5qvY7RBZ3VO4HuWyRdbAoP/olAI28
	YhETN4JKigIIQ6ywM7dA5EiumU+T/lTVWU7csnFeI+iJ85u+/2EzeibyeSnV9ugYsajYAwHq/Qn
	UcGfr/7+taMC9u6DDlmmgvwmvEbtxd5U=
X-Gm-Gg: ASbGncupPpdXiqDucSH1DMhhSSrQEcbfJN3vpVr6pmxSCGTs3tyOH8b5cKUikP0Rj8p
	04DZPCOoRwcLsKtJd07vJRZqURdcNFDOSd/jD73A/NNGjxHYww+y+eP6sI/UCfUrYnsXeZDk2Tm
	sd7hREk+lL1Mv/CA9AtxzWqIgZFxpPgrjG6j1D9p9kRJAEQUrtgiLdBpEBeFNvTf0ccY+dA1noa
	DcyS2Z8dc+q66E=
X-Google-Smtp-Source: AGHT+IGJlgMebHeafPhpvXNEnuwrkCWG7XoVPlNbjrpQZw1BfOjYrG9vvzbLo5wAqGetaoboXNjnvUJBf0NJewO55f8=
X-Received: by 2002:a05:690c:fcc:b0:709:197d:5d3c with SMTP id
 00721157ae682-7164d2c7e12mr49580597b3.11.1751472466302; Wed, 02 Jul 2025
 09:07:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250624201438.89391-1-moonhee.lee.ca@gmail.com> <744bd439-2613-45d7-8724-5959d25100aa@linuxfoundation.org>
In-Reply-To: <744bd439-2613-45d7-8724-5959d25100aa@linuxfoundation.org>
From: Moonhee Lee <moonhee.lee.ca@gmail.com>
Date: Wed, 2 Jul 2025 09:07:35 -0700
X-Gm-Features: Ac12FXwoDxTwwqAXE8JcpNRXiozFERVYFVPE9rjvlkt3rV15dPoHwueD88FdyYo
Message-ID: <CAF3JpA72DWF8=2HF+_HMsH4DuOg5aVYZdgyhmJisDG-WxL=uYw@mail.gmail.com>
Subject: Re: [PATCH] selftests/kexec: fix test_kexec_jump build and ignore
 generated binary
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: kexec@lists.infradead.org, dwmw@amazon.co.uk, mingo@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shuah,

On Tue, Jul 1, 2025 at 12:53=E2=80=AFPM Shuah Khan <skhan@linuxfoundation.o=
rg> wrote:
> The change looks good to me.
>
> Acked-by: Shuah Khan <skhan@linuxfoundation.org>

Thank you, Shuah. I'll carry your Acked-by tag in v2.

> There is another patch that adds the executable to .gitignore
> https://lore.kernel.org/r/20250623232549.3263273-1-dyudaken@gmail.com
>

I missed that patch. Thank you for pointing it out.
I'll drop this change in v2.

> I think you are missing kexec@lists.infradead.org - added it

Thanks, I=E2=80=99ll add kexec@lists.infradead.org manually in future patch=
es since
get_maintainer.pl didn=E2=80=99t include it.

$ ./scripts/get_maintainer.pl --scm tools/testing/selftests/kexec
Shuah Khan <shuah@kernel.org> (maintainer:KERNEL SELFTEST FRAMEWORK)
David Woodhouse <dwmw@amazon.co.uk> (commit_signer:1/1=3D100%,authored:1/1=
=3D100%)
Ingo Molnar <mingo@kernel.org> (commit_signer:1/1=3D100%)
linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
linux-kernel@vger.kernel.org (open list)
git git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git
git git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

Regards,
Moonhee
