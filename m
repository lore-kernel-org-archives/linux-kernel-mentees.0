Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2FD1DB346
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 15 Feb 2025 18:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739643828; cv=none; b=mDo7RjWj56IRh8m4QSEK9zTZIfjSG0xLN+cM9lacy2X4FadGFYbbKfI6zKWOlHmmauZ0SfSSGFW9bmhMiB47lZFDWX6j9fxCVFiJ2W8tfO8Amup1tOdFr6GPhgp1Iu4tA5X9CaMnY5F6S2EeVpLu26wBexn03aNtOg0F3nzP8Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739643828; c=relaxed/simple;
	bh=yXz9BMtnIeh2cYnnafIof4ENCXpFDWb399mH0nb+ve4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s08Em9lFaZrCu41BAudcWkXI6EHxizoqGWbH3O14+tk+Jt56y7vzgaB4B8orFhgTrjSCs+OZxX8rE/6C1RuPvjlkLQ/nAEU5TlmfEbAGRcGklZEYefF6j17LD6O3wXDRxwc3W5YyYaJQjqh8nJqw755IYhBXne5HPx1wSHyZaHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COA3graC; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COA3graC"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-543d8badc30so3671803e87.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 15 Feb 2025 10:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739643825; x=1740248625; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXz9BMtnIeh2cYnnafIof4ENCXpFDWb399mH0nb+ve4=;
        b=COA3graC+TMSLTwrj8g+f8yZcI+T+V4RqbdjSOmYjeNkP0/aG6dh5Vru+E3DoiyFds
         PAidDn6r4Hc4ri6rVgd82TGsVUjFMDXiGiwrkU4AJl4zsGsiqh1A+dFcv/+r1GOmNs1F
         43IWORCdcKOcg+TQ660kFtGATsCavPm8/PGFaRCm9TqDeOyMSULSFhF/fbH2/djfbaQH
         L8OsiX4ZoPgAt+nfyUPN218rM+lTDvH+p9Wfl0Zk68LTlHd6Ox0yTJ7P70737KS4Tmgx
         WzX+hUEOeaTZuAHA8jfdt24SVZppuwGK2/lrkid2dTzJADEYP8S1acnUTwRgvT5X8I4g
         Nu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739643825; x=1740248625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yXz9BMtnIeh2cYnnafIof4ENCXpFDWb399mH0nb+ve4=;
        b=cVf9LGAO8mv6r9CGpod0ZJpLC0EMDci0TrxIC3YZU5w9aFLMoO20h3AOXqEWqzvlgf
         TjgclKxd4pFBvbnn6ATuumDnxITsxxYDopsK5tshHnA3tZdNm1yoOLge58vml9cnlANv
         /15/GmTcM9nSKcGM3aO7HoeLEid8Aj8QGXsRUTS1tx4a2i9tumGY/uFMh0l2LOQ98x6z
         +7WZIFr4/oSrMuzUG2cvUg/jeixcgzl2e9ptASKwFmCBaT7ZfiBmgznAx00UHnktg221
         lboZxDRIaxnIHpJ7Oet4+z1LK1pWzJNr4KhojRf46IFAgseFNElbxbz2k4VG9loFkpsJ
         gJTA==
X-Forwarded-Encrypted: i=1; AJvYcCXcoz8rwVqNNIy5d+RkmlbZN65hu62KLSJYdWzz9y/AbD0bBlsqWMgYs3Dx4y7k8ArnNNvQGUT8F1CUt/vnMXGX0iRkfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2ePs1faGE0VpC6tG/4NfKHyqszjC8yKh8Dpig3iNG6GzDX61Z
	fHyFTa1Me+f336s++wtpsgb9iUwzIAQ/LXU/kNSE4f72izyp/6b0DrYyeSun3fxp285Z6awxu4a
	35QHW4rlD53Fkz76fp98wuzuv1e8=
X-Gm-Gg: ASbGnctAt8ch2rFvQsPe98bTomOybxPtXHCHMqVXBE+QvVLqMeBgb+M5MV0Ra24/gYM
	bft0w8mvhv3GSih0XtKhXYVQVtUb/IF29+Ii0mpQ1KOqVTBIVMA4CF8KcgihbgBQP2yvGDsfAyQ
	SEiomS+H9R0jGvGvBkT5UsrRJB9Vdm+A==
X-Google-Smtp-Source: AGHT+IGkPLpkbOWRdDXK2Jc8vrk6HB4rsWHM0rSzO2KCPDOZUKvFUG/3dyylZ0wfBoySThdEnpWvvDFrHZb8rQ19vG0=
X-Received: by 2002:a05:6512:398a:b0:545:a2f:22ba with SMTP id
 2adb3069b0e04-5452fe86880mr1086451e87.37.1739643824301; Sat, 15 Feb 2025
 10:23:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250213152612.4434-1-pranav.tyagi03@gmail.com> <20250215134548.GN1615191@kernel.org>
In-Reply-To: <20250215134548.GN1615191@kernel.org>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Sat, 15 Feb 2025 23:53:33 +0530
X-Gm-Features: AWEUYZkqEglGxnuD4hfoZlo6EhAXR8mvgF2jK9fhAUgseVm5WteQe88BQw2Y01s
Message-ID: <CAH4c4j+9aXmFTym_uU-RtQtNhPBMeWnEE-mZaAceQTmuL3QCTg@mail.gmail.com>
Subject: Re: [PATCH net-next] selftests: net: fix grammar in
 reuseaddr_ports_exhausted.c log message
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

Thank you for reviewing my patch and for the guidance on the submission pro=
cess.

I sincerely apologize for the duplicate posting=E2=80=94I=E2=80=99ll make s=
ure to
follow the correct versioning and reposting guidelines moving forward.
I=E2=80=99m still new to the community and getting familiar with the workfl=
ow,
so I really appreciate your feedback. I=E2=80=99ll keep these best practice=
s
in mind for future submissions.

Regards,
Pranav Tyagi

On Sat, Feb 15, 2025 at 7:15=E2=80=AFPM Simon Horman <horms@kernel.org> wro=
te:
>
> On Thu, Feb 13, 2025 at 08:56:11PM +0530, Pranav Tyagi wrote:
> > This patch fixes a grammatical error in a test log message in
> > reuseaddr_ports_exhausted.c for better clarity as a part of lfx
> > application tasks
> >
> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
>
> Thanks Pranav,
>
> This change looks good to me.
>
> Reviewed-by: Simon Horman <horms@kernel.org>
>
>
> A note on process to keep in mind for next time:
>
> This patch seems to have been posted to netdev twice, about 20 hours apar=
t.
> Please don't do that as it can be quite confusing to reviewers.
>
> If you need to update a patch, please version it (e.g. [PATCH v2 net-next=
).
> If you need to repost a patch, say because there has been no response for=
 a
> long time, please label it accordingly (e.g. [PATCH REPOST net-next]) and
> include some explanation of why it is being reposted, e.g. below the
> scissors ("---").
>
> And regardless, when posting a patch to netdev, please don't post it more
> than once every 24h.
