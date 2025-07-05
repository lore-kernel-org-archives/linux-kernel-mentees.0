Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15281B85FD
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  5 Jul 2025 14:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751725363; cv=none; b=HUCPRwF03GIEz2ipoApCp4PJk1kzBC/LQ4v47TuXZrrIQmYRV79RFektwSU/EqqHEN4lwFdNmGMBhhgjiA5/JoHPD8GqLWnN8nHKW7ZLjvip2l60HNm+IV0sZEyXxP5O2gcvF5ol2XXQreAfIkCevvKuAJlLM+JU2mHzxlbUBJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751725363; c=relaxed/simple;
	bh=EKnvJSsHM8ulrLq2cUyRJJRTRCaqjDuz6/x0xf/Ok1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nCCgJVW2bvdOwIU9HxAcmKGQjjts7IHpDVTy3QhmaGZFS4M6aEPoAjVFpZclcQZXviCBPIb/6nTgB8Cm7BdUB0ZXB1nquMy839G9W1uatHKE9pgCOr8pvfN11B4HxuCRDWGsvBDRjzKzkBYIm4tQsd4DlzSOeMJ2s6pHdmsuBK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZzU9iz/; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZzU9iz/"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32b3b250621so15971611fa.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 05 Jul 2025 07:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751725360; x=1752330160; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKnvJSsHM8ulrLq2cUyRJJRTRCaqjDuz6/x0xf/Ok1o=;
        b=BZzU9iz/ALwIxY6w69CMyHbNKxRV1lFd+H6WH1KeuepjjXQyDHjXPEM5VnxvmJq9Dv
         fleRb3UZUNSYGXG1af7AuXcyo/MQDmiNo6BJDYIAJjpet0/IddqOXkMmkUvlRD1x08Uf
         VgYnIr567Oc7yfBHtyHLIldpyNRuD34WoImnaHQeGD57cfaPTxFATinNNbMVMOD+61rd
         /qzhTtgBVWZ746HLCEOFp9Jjfs+9uuASaAJnqGvKfD7QNnH1cg/97JqkHbtBeQCbJHel
         oIXcph+SDxbKYXF2xEC4TvwwQ/h7WQFq+/YZ5ExIlbD0gS6kfjQ5cyB8JJGECx/+48zS
         Jz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751725360; x=1752330160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EKnvJSsHM8ulrLq2cUyRJJRTRCaqjDuz6/x0xf/Ok1o=;
        b=RqEp8cF99VKCUl3aOz0K2qa6tWy8NBzVF8FlPH5lbYw7g7zTdCrI/va967iGjJqJEm
         BV/ib9662FOZ7wpUNKAgGlHVebrMygk+bSEUcpDeN2wfIEuik7HhgfqfrK6vvq2RPxsm
         FGX0DBAz9SkLaQQw+xwz5cWGgD4icsu1HV3Nf6kc+UD8+bYGwWje56hQpdNFcHgw35ls
         K69rFj8bncHNrDNsvnZi3/KgdgrskgRt8Owp9yUaBjlgOaqIK6LeQXpB3zq5LkJxLUjs
         SnQRb8NaSsYaFD7r/cyKghgWvqnqRXvVV1YDTBC1TXHaTGSTdO+4VYkO1Gopiaz+rGVh
         XoFA==
X-Forwarded-Encrypted: i=1; AJvYcCXXMp0RXGvLEJ/kBTSCRSNWhpBAu467ke3dddwvFPP1fxhBhtLedH+Cgg6L81ZXpTyRzFMG20KlQ2cupQ3G+/nqbY6GGw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJFVhz4dNS+2j5gThbZtYqaS+rM+EU18csUADsAtPNxNATEfEB
	/VtMifT2z8QAufBjUxaxBXp4Mlh4M+hFII9cjcqQ0sEYhxERf+lMSe5nnk5NJi0pDPxEock3y6e
	aN3j3TgJ8Z/O74N+qEBSWb92ZCgmE0wg=
X-Gm-Gg: ASbGncv9bFJkItiKcIYVSEYJ/t2lrM/XTkiLMpMr3Cilfe0OFYG85KlDyhynQbEDlTG
	91IT6/05iclYa8GD4vanmmUcgvf8dsGVpYZ2l/Xyuc26NwaxF5WF+xva1O9XFrT8KV55VdaGWAU
	zkvKuzoiVMGwoVD/auo6bRmSrj6naL6g4vaI2Ki9Vn9YoGGnHJIkZt5aibwAYRUDPxtPWF76XMr
	siJ
X-Google-Smtp-Source: AGHT+IGuIQlSO3797vvLGrll9LAZKYQKZplapMq9u69AfgtSc7RATXdK57f65U7ENb+iG1b1TyqYhaomusbYbquohcc=
X-Received: by 2002:a05:651c:889:b0:32b:3ca0:dbe3 with SMTP id
 38308e7fff4ca-32f199c75f9mr4452501fa.15.1751725359675; Sat, 05 Jul 2025
 07:22:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250612114859.2163-1-pranav.tyagi03@gmail.com> <20250613181624.5684fc0b@kernel.org>
In-Reply-To: <20250613181624.5684fc0b@kernel.org>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Sat, 5 Jul 2025 19:52:28 +0530
X-Gm-Features: Ac12FXym_sLRKnvpL4ehI5Xa8tsBnF156fVik9VwPt420tw7zcBjXtJXW6zf9Q8
Message-ID: <CAH4c4jJHiacPDWSS_S17WpAqkRNKBi7P=9f_QJdc8Cs=A4Zhhw@mail.gmail.com>
Subject: Re: [PATCH v2 net-next] net: ipconfig: replace strncpy with strscpy
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	pabeni@redhat.com, horms@kernel.org, skhan@linuxfoundation.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 14, 2025 at 6:46=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 12 Jun 2025 17:18:59 +0530 Pranav Tyagi wrote:
> > Replace the deprecated strncpy() with strscpy() as the destination
> > buffer is NUL-terminated and does not require any
> > trailing NUL-padding. Also increase the length to 252
> > as NUL-termination is guaranteed.
>
> Petr is making functional changes to this code:
> https://lore.kernel.org/all/20250610143504.731114-1-petr.zejdl@cern.ch/
> Please repost once his work is merged to avoid unnecessary conflicts
> --
> pw-bot: defer

Hi,

I hope you're doing well.

I noticed that Petr=E2=80=99s patch has not seen any updates for some time =
now.
I wanted to kindly ask if it would be appropriate to repost my patch
at this point
or if I should continue to wait until his changes are merged.

Thank you for your time and guidance.

Regards
Pranav Tyagi
