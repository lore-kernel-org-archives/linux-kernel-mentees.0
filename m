Received: from e240-7.smtp-out.eu-north-1.amazonses.com (e240-7.smtp-out.eu-north-1.amazonses.com [23.251.240.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D7A2BE643
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 26 Aug 2025 11:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.240.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756207736; cv=none; b=mdx95LKozapljz5nJh+8O1AhVpKKD7LUcUOSSuQ5roHwxRC5D37AYJ2kNm2lmOnCHw4feSoXZEV+3uFo/0r+yles/Z7TDxiH5PNFpssak/00gRbFG47vLYKUi7cyfuQkL43yx9fcc2WqlQHSxwbTbBjVE2FXINWWPuW25g04FoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756207736; c=relaxed/simple;
	bh=+sCEjvZjwWHmAvnr6eP4Tu5wpN+UC7c/dTzPNx88gro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QXwJCa6+CXddVefdgyZ6N0TBXDwUXvvS3Py5umS7NQAgonupzyGvKz+avPzogfEqQK7bz88rLkVvAydmgPxobnQ+q9HlHV0oEMfYaP9j04L99jperSVEHCy98RFAqK6ow1tjfaClGYBiRp6Q53pyKiFmOpeCn3drCpaBk8uDfdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zgur.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com; dkim=pass (2048-bit key) header.d=zgur.org header.i=@zgur.org header.b=ERFI+hUx; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=qXwz05tN; arc=none smtp.client-ip=23.251.240.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zgur.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zgur.org header.i=@zgur.org header.b="ERFI+hUx";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="qXwz05tN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=js6vst5vvqz7hona7jurhfnalcwue2xt; d=zgur.org; t=1756207732;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+sCEjvZjwWHmAvnr6eP4Tu5wpN+UC7c/dTzPNx88gro=;
	b=ERFI+hUxwBr7oTH/QXb4LlTgeVTE5jJcFtg2yJQpWCFOQg65LqaLQ7mU0RU5/NgL
	WF5Ifg6ZSlZLplqN316fOyifRyxr7UWb9Y9c0g4EFRX2sOdrTC+pqPrjdhKY42R8en6
	0BaV67x3M+vsextQxQqFj4bmF5CD/hMJyBsUH535aB9YcN5R5/EdTWBuuhy6v9xoODy
	ds+Dkso5+84f7/6p2GLb1BivNpOEpW8pgK8RAn2xW1kre4Vy86EBgMfQCyxgkZqgJMP
	Y9g3xTTFlbTD1p51ThrMVB4vR/3fjlb7YQwHtpvvaFmsJna98w8wCyhP/Ua+80evapv
	wfSVm+eQpw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bw45wyq3hkghdoq32obql4uyexcghmc7; d=amazonses.com; t=1756207732;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=+sCEjvZjwWHmAvnr6eP4Tu5wpN+UC7c/dTzPNx88gro=;
	b=qXwz05tNDrdq1Wc6R9Kq0v+fB7gwz9cq7hivuNCYsSUf2k2106T/GoUKMPXkTMpD
	Vw/eyHhcWb7jjVo3nhyq/N8VrXVnRQuCZbtXNJr05j3J2DnSXEEZU3PfdO0p/YnohPI
	DR1xjnqcugd9C6ZvIDV/aB2emh86oc2Qt5i8Fu4Q=
X-Gm-Message-State: AOJu0Yyec2vJyeTQBQXx1Qc0ToU7gdkBUXL0sjCoArKaMZZ/inUZd6Vr
	5Y4dToTcH+PwBaweaEHorfk7RHUOZo69sL8pY+FqpfliXi7k+MtpnKo9FzpSFudFdkKZIVF2U4a
	f/WeJV0cQIl4GlWnP2iZio8XNUmNyJJk=
X-Google-Smtp-Source: AGHT+IHTeVRj8xDeMu5l2U63+I2jFtM1AIax4ceIfaM3+elvtvYXyqdNoSN2L5n7iDlZs4IeMcX3gQqGh3gHryOEugo=
X-Received: by 2002:a17:902:ce81:b0:246:de5e:cecd with SMTP id
 d9443c01a7336-246de5ed9a6mr86899065ad.54.1756207730115; Tue, 26 Aug 2025
 04:28:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMB6jUGOMwxXe=-04hSF8BEro_SZdQXa3XuVvkrrzCWqeG7KXw@mail.gmail.com>
 <CAMB6jUEL7juRQ=sz=rXooMMduEedwb185k+1kXbcWRD-17sq_g@mail.gmail.com>
In-Reply-To: <CAMB6jUEL7juRQ=sz=rXooMMduEedwb185k+1kXbcWRD-17sq_g@mail.gmail.com>
From: Ozgur Karatas <o@zgur.org>
Date: Tue, 26 Aug 2025 11:28:52 +0000
X-Gmail-Original-Message-ID: <CADvZ6Erc4GS-D4bJ+102J95RvB1OE8xj5Hc099xbi=5zuYHUpg@mail.gmail.com>
X-Gm-Features: Ac12FXx4LrqQBd2oSI6Z8s1URVeKVoNbvKpEPE5hyhX1pZFqh6CWqXP5hU3SfSE
Message-ID: <01100198e62356e0-3705293f-8878-4162-9852-38012b374486-000000@eu-north-1.amazonses.com>
Subject: Re: Linux Kernel Mentorship Fall 2025
To: ally heev <allyheev@gmail.com>
Cc: linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	david.hunter.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Feedback-ID: ::1.eu-north-1.jZlAFvO9+f8tc21Z4t7ANdAU3Nw/ALd5VHiFFAqIVOg=:AmazonSES
X-SES-Outgoing: 2025.08.26-23.251.240.7

ally heev <allyheev@gmail.com>, 26 A=C4=9Fu 2025 Sal, 14:24 tarihinde =C5=
=9Funu yazd=C4=B1:
>
> Dear Linux Kernel Mentorship Team,
>
> I am writing to follow up on my application for the Linux Kernel
> Mentorship Program. I submitted the required evaluation tasks last
> week and also sent an email to skhan@linuxfoundation.org. However, I
> have not yet received any feedback regarding the status of my
> application.
>

Hello,

This pplications are now closed and evaluations have begun and the
team dealing with this will get back to you quickly, please be a
little patient.
The Linux Foundation evaluates applications and shares information
about your application after careful review.

> When I log into the portal, it still shows =E2=80=9CApplication Pending=
=E2=80=9D,
> while the Linux Kernel Mentorship website now indicates that
> applications are closed. I would appreciate it if you could clarify
> the current status of my application:
> - Is my application still being considered?
> - Has the mentorship program been temporarily shelved or finalized?
> - Should I interpret the lack of feedback as a rejection?
>
> Thank you for your time and support.
>

Regards,

Ozgur

> Best regards,
> Ally heev
>
