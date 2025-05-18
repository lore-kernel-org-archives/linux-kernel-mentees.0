Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E13972639
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 18 May 2025 12:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747570001; cv=none; b=RZC6Qy5kVh1jMADB0LdmxpKxGyzP72tHSR8TUsbuM3vTSv9T/1dU3vR9yy8KmRWpnrNLqdfGglfrxB+uc+XVsbHpKXcNJbGUGroex3D090ScX4+2dkUit9KX9bkJedI4GaHP0KpKymxofnaiu7Ds1CVnGS/tFR0wzGi+BBQC36c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747570001; c=relaxed/simple;
	bh=Z9sPuqChQojAWKg0fz4wkdvAY/+fmKjMSJBj97hXBxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VAlxO+mY2ebMFVWcnG+H0Kc6uRTyAbk4iqBBwNcSin4ACuGdltNRFeE3DFA0xEKn/OivFukbMqG8lUpCHAl/Bg7kQwn7NP1qPIaC9OGhOvkzq4FjoIuwL1JlnKexkKcsc3MKilxUwdLpEWOKvt7XWnIILFNlm4n282Nv9nhyMRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VRX2Di5h; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VRX2Di5h"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-30e57a373c9so3326106a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 18 May 2025 05:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747569999; x=1748174799; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9sPuqChQojAWKg0fz4wkdvAY/+fmKjMSJBj97hXBxs=;
        b=VRX2Di5hhkXbCaciCAKTo3AdgUAzrLy2MsRqTxt4D+wTQxRsPnQiKIHWdUNLFAxbm3
         JVVnJdvh+xataVQ1k4jlwLQxI0jtvdQ0ml3MM4a0BaA7eRn4TVamWyjNsgMsXpi3IbN6
         OdBHsQOAOGPzmSh7F0hVHrwQV09grOfmRUKu/2xRv9LPbOgz14WDt7/1Ia2Xq0cacUf2
         UBzakLbVbyR/qz13EzKJluD1muZRV33w0gEwG0in88Lo5CSR7yvTfE2scE3mHzgSPUA6
         ibOtWRlwYA0KxxK7/uexT16hAWJ+tWdU/P2FZYRitkbX2ozO3JwMp02NFi/1EDmC3aYo
         suew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747569999; x=1748174799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9sPuqChQojAWKg0fz4wkdvAY/+fmKjMSJBj97hXBxs=;
        b=dyDbowU5OACegURJ3WQMqus78MhoVDvnj1bHmfBDQU8ggxkcYLTYiiybBopnFCPyCN
         SXFh1I6HqF0S+c7dVfYIy3q8KxLoQoyQuKiDecdZvgeuuFwK/QehbUXqTm4mCJe4egMb
         AMpAb9X14JZdvXiyLqQiRJEBnmZ9/nvFV8c4Ig0X4iIODj1mQUdyrO/3CRHTUXFvjz6b
         BXU7YeTdqCe7di96y50djLKX0rpEbEDRdEuy3QQ6/GoXaZ1CfpQMHOa032tU9eoiytWU
         W+wBlPyRSxZZIJXtPK8brH9nDqFPch6vURc526zqRMr0D6AUse1izBjBhFdZQ+ljUF5q
         R6Fw==
X-Forwarded-Encrypted: i=1; AJvYcCXwxo2940JVx3VcKGEFz4fQVTkhtP4k5Bc4QNUhbEatX4Oxrjo/zy1eeRsNQ/DAP2PNkQNysovd+iD/CxaZzDLYcTIruQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzx/Co+7gTJydRrXW8HIV1lrsffcXCeetSEc3xWa1zmK1qF1h87
	0DI+YBcBmpYOo7QqDXJUcf7rQoeHcU5NClhK+5aFPqaRJecuy29nZ94xnOjKyZRtCm/F1oy+Gwi
	VE4tEXU+zl5vAbwPk4qzzyf9u3LjqwQ==
X-Gm-Gg: ASbGnct9C11lp1I9C+jpuy1Isbb84XIvCap5ZGjLcMP6eocSzr5o2iEfTuT66uQqinQ
	Kt9kdmINedoZS0ghaZJJrz1yLJsURJpeJb26bmsSQN3yN0weDLMrH0nq2PM5sH62HgTn3JN6QN9
	kd/U4pOQJH2or1q2rGlHz3KDyU0Z0R893u3hZaAdbIsP4H+GMWOwCv5Px99RBYMgs=
X-Google-Smtp-Source: AGHT+IE8Jj3CM/JmTKb2ASWpYNZZ62w/yVrXgUBmwdTYC8IuyZ/ZSj3++gk2EU+iZobraqih76E8olzgbMxd5+52uZs=
X-Received: by 2002:a17:90b:4b0f:b0:2fe:8a84:e033 with SMTP id
 98e67ed59e1d1-30e7d4ebdbcmr14696049a91.2.1747569998909; Sun, 18 May 2025
 05:06:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250517020552.737932-1-jihed.chaibi.dev@gmail.com>
 <62bd6757-c4d0-42c1-a76d-abea18a8a55e@kernel.org> <CANBuOYpRQNx+n6BjpAF0LufpUqRA3wU-GzSNygeWurohXYNF6A@mail.gmail.com>
 <5f7f8cbc-6501-459f-906a-250be5443d0e@kernel.org>
In-Reply-To: <5f7f8cbc-6501-459f-906a-250be5443d0e@kernel.org>
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Date: Sun, 18 May 2025 14:06:27 +0200
X-Gm-Features: AX0GCFuB2F8YdWG4M6QquX7RSLJifIP2KUvWmNy9H9sSlJ0n7sh9CbHxp2tuYXU
Message-ID: <CANBuOYohE0JofP6vnN_sLZrPkURDxRgOBCM2-NqtCPw1fZ24+A@mail.gmail.com>
Subject: Re: [PATCH 1/1] Fixing a minor typo in YAML document
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: heiko@sntech.de, briannorris@chromium.org, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 18, 2025 at 12:34=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 17/05/2025 14:05, Jihed Chaibi wrote:
> > Thanks for the feedback, this fix being kind of "trivial" I didn't
> > initially want to include everyone and thought it would end up to the
> > main maintainer after being reviewed by the reviewers/authors of the
> > file, sorry for that, I will make sure every maintainer is included in
> > future patches.
> >
> > On the other hand, I can confirm that I'm using the last kernel version=
.
>
>
> Please don't top post. If you do not Cc maintainers, how is it supposed
> to be picked up by these maintainers?
>
>
> Best regards,
> Krzysztof

My apologies again for not CC'ing the correct maintainers and for top
posting in my previous reply. I understand the importance of both for
the workflow and proper communication.

I've taken note of your feedback and will ensure I follow the
recommended procedures for future submissions.

As I'm still learning the contribution process, I appreciate the guidance.
Best regards,
