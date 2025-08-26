Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE85E20B22
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 26 Aug 2025 10:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756204768; cv=none; b=fvFNvw6uNWWRWuaf/mn+E8BcmLEFR8oKAS1Z7Ba5iWV3pGhJ/TMn9rYtIgi0JR89NEbdCiDobElbzsnYguswq1pnnW2Lud+7hAK8uXT/+ZqHLmvxTNl3nwur8pWzC0QVCByi49KSCHpB41myvNvE0QZkyJ8pXqPq/f/W1DqJmqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756204768; c=relaxed/simple;
	bh=rLstjHQ1oFE8XsF8DNE14R7qG/HVuryRMROa5krjU7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jecfLgOM9FFKxs63zOZZnnciiY8vzeUgKj+A6YBoRXobxtnGvaX39xcNedki95ZH+2ZCt562z0zzOPfsZCEsAB1C3QEsuOHN/RHJUponTWIdidNRWD0Lty3ZEhF0ChizlcJaODV2JTT/aLrSrd8R2zeNKbLXRNG7b77fn/xvxqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtXNZRjX; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtXNZRjX"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-61c26f3cf6fso7703259a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 26 Aug 2025 03:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756204765; x=1756809565; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLstjHQ1oFE8XsF8DNE14R7qG/HVuryRMROa5krjU7Q=;
        b=GtXNZRjXGTe/G2G7/8GXMuCD+U7tYV1Xylw2xZanRXfiq+6mgN7K6NDX5ZysgnE4Y1
         8x/FZ/d44pBtltcTPSl8/OaXSfA/6DXkbvymBmYoWLGaTHOzwEoVqjTGWTPOstCzWr2C
         2rSjNeRAQz1UB6d/uO9TQNhXHL/F1Y4yJsrih+lr3SpL+SN05dKdaZ5TyOp0zFkoh1wr
         jwrSKjE7IFLW8LzCU8nJkH7mJuuGIEnN1H2xZa8XFSJSihmMtS2s0MbfgUdcZk9uAas9
         Jufn4/hRNmyt1sjx0G6ZopGRBVNT7xWmXqQywehThSf8jKj4HTzcJrD0pAUoMAlJafUF
         fMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756204765; x=1756809565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLstjHQ1oFE8XsF8DNE14R7qG/HVuryRMROa5krjU7Q=;
        b=fgKpXeRunqhXqUV7fqYUJJgnTHvZIWv9bj3ZJx0+sde/wxuS6g0OYynwSAzLU/2jPc
         WNy52Sqdaacjybgp6fqJzNbDvaSNYKYNMiTP7ZN/Y7BwBSKEiq/pei5UVl67Z2lSK3+m
         R83KDacB47VKRYvHpv4nHuLG5RObzEb4nv5BRqQTyvU6JhehIB1tZwBw6qFNvyKgR1L2
         e1BlB5AxH1EV03Q2rNi3kXQMMCMp9O7S7EDEbOQEAd/O/dpSjOufNxmraFob5s7aPObi
         598na9Bj37PN7Sdnu/6oPiY18qRlyGb3BLckItmQiPOWgJjqT9q6bXrOnRmYn0lKAXz3
         kPPg==
X-Gm-Message-State: AOJu0YwkRBpU0rvlJDGmYDZNbUkeopdh2JOpWm0dZQA8C9LVZ+tz9Tzt
	SSKu75L4Ign3KY7002mE0iYKHshF3jDRkj6xyp3468746Al4rGrn7nHC5uO2hCkg6MPvUVDteTf
	Y/3UTKondD/zDPRaJrOXU3bEptoBuI48=
X-Gm-Gg: ASbGncsaJy+ml1iJDKFKaTNr6T/FrEqb/eZbYDuSue8S7GemhboObuAEYGc9RDS1Zct
	4fypZxc2OZjcE+sM9UC/KMI/tNx4MldIA0MM0Sy+KwdcjiUpoOwJ1QN2dXykrAY505PrrwSEwyf
	UsYf3r0xsmqI8hBA/Ay82LmUzvZUIbCCoqUf//qV8fFsipRKkAtLzf+cuMdQX+ZIn+NumPHZwx7
	fIGyeG09eMyy0wVxCB4dtSoQAFR2JjftagVy8wFQjxNuvbAyGCZNMbgEa/FnEY+yAICUvg=
X-Google-Smtp-Source: AGHT+IEQ7Edxc+oZQ4IwdQ03K74b1tsxWbjF22IOu4pYRsHjWAO0f3Yu0hLy18djWvoe4taFR5Pf/1UzdMgXwB30RCk=
X-Received: by 2002:a05:6402:524a:b0:61c:8fd0:4456 with SMTP id
 4fb4d7f45d1cf-61c8fd045dcmr1970662a12.16.1756204765062; Tue, 26 Aug 2025
 03:39:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMB6jUGOMwxXe=-04hSF8BEro_SZdQXa3XuVvkrrzCWqeG7KXw@mail.gmail.com>
 <CAMB6jUEL7juRQ=sz=rXooMMduEedwb185k+1kXbcWRD-17sq_g@mail.gmail.com> <2025082640-immortal-matted-e1b5@gregkh>
In-Reply-To: <2025082640-immortal-matted-e1b5@gregkh>
From: ally heev <allyheev@gmail.com>
Date: Tue, 26 Aug 2025 16:09:13 +0530
X-Gm-Features: Ac12FXyJ5gMXzrjdxhWeU1KiWEfCKgck8T4fKhC5Jlj_2rCJH-ZJ2y7_PQ4B7l4
Message-ID: <CAMB6jUENLT5Szb6L6h=ZjO6rFqXVoSOxo_GeUev1=7YFxpwKiA@mail.gmail.com>
Subject: Re: Linux Kernel Mentorship Fall 2025
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	david.hunter.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for your response

On Tue, Aug 26, 2025 at 4:04=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Tue, Aug 26, 2025 at 03:54:02PM +0530, ally heev wrote:
> > Dear Linux Kernel Mentorship Team,
> >
> > I am writing to follow up on my application for the Linux Kernel
> > Mentorship Program. I submitted the required evaluation tasks last
> > week and also sent an email to skhan@linuxfoundation.org. However, I
> > have not yet received any feedback regarding the status of my
> > application.
> >
> > When I log into the portal, it still shows =E2=80=9CApplication Pending=
=E2=80=9D,
> > while the Linux Kernel Mentorship website now indicates that
> > applications are closed. I would appreciate it if you could clarify
> > the current status of my application:
> > - Is my application still being considered?
> > - Has the mentorship program been temporarily shelved or finalized?
> > - Should I interpret the lack of feedback as a rejection?
>
> Applications are still being considered, please give the reviewers some
> patience in selecting them.
>
> thanks,
>
> greg k-h
