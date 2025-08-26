Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546821514E4
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 26 Aug 2025 10:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756203856; cv=none; b=AIfr6uZz8srX1zkFdnCmLjMWZp7tTnt5Cp8QU9J1vJ3gDQ2Ii+iBwU4eAwSvQBGOaDw/CKYgkS1xPrCxbZOzUQ/sul0fXIMhfu5cr/CGtcFUI0iRHVeb5kktPbZ1xBO9TcLN9U6ZXkPn2vHZKfuoZuN473Sqe6bDmZHG5ZQP7WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756203856; c=relaxed/simple;
	bh=xIbaxcwpeK/r8xWcv+WGOVrjVHSvZdgMd3n3O+JWkjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LdUdmsJkrscHHu9MJqFynFmVhircCBIFl25BEyDnrdihNWhbYyu8h81UOTu8qJYgXW+5SoWeDM6Mw0pskTGqYiRnCMU+wCucsi+gSHXffUNUz/aMNN0LAqbaB+c1yqC2XctIu0vLH0J5An7HeYKQkkQhfqzBhJq3tPqrgmmvmeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFFwAruk; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFFwAruk"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6188b6f7f15so6405467a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 26 Aug 2025 03:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756203853; x=1756808653; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIbaxcwpeK/r8xWcv+WGOVrjVHSvZdgMd3n3O+JWkjs=;
        b=TFFwArukDJ4HwfQnyK+8K5sgm6wxHNT1swDIlLpj0FVNpIuBxwnsxW1CMfWx7/omye
         +9O99cbpbiVpgkouFgXGKJv8Mc7/deY5Tp2cJGBeK6gBFf52bqSPfgwDIKMT1h3gOENu
         c/cvOYS4PdG7sS3A1i8RwL6H9HiVuJ4V7QAozRorclrSShFfSdYzZ1N1g3K30Ty44PAf
         y4mZHiHlUFpZPum5ZN8mex36X0jQWz/hPIqivS5UqJtSCg8TIQT7rIhj3Lm6IrdLatlL
         s15YM3YxKxBq0gIWv6VMBp9MbFO2eHQxhlvgh6rCgGkUBI0h2SuhHtrIsp61gRpG1urY
         JU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756203853; x=1756808653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xIbaxcwpeK/r8xWcv+WGOVrjVHSvZdgMd3n3O+JWkjs=;
        b=scACsZQlT5AQVA5Khx0fEuWgPZ7wzXK+6YiTSvBNLNNkKCfp/X+HUvPIl25P8YLYkb
         Ck3OZn6WVdSzu8SSdK8H05/hK2LC4PsDRcc/g6ADksLd8RuOhYs5QMN5Nlj9XeNJGgvo
         L+Ec2clR11vwRs/AR2nErfps26pjxV5WNVD2qiCta3kM+GqWRIbbMnNFZGMaQvxQKbeQ
         2jqhEx8droLLighq6OX/+EEfNGs71qTlIE/eqtsSLek7kzjAwaQYPspaKSE45eoK0N/s
         OmXJZarJn7tLxBVbDT/ge+6q0FIU1jTebKgrBNA2HRpZngtq3Nzd0M92UgOKXRv8F+qw
         hzNQ==
X-Gm-Message-State: AOJu0YwAhHutChBT7bV7MZz+ZJ9hrsmCswyj8lmABRd6GKk7OUcCl4ry
	sNLjHxCRq2BxDzU8dgqT9P+lGdvQxW4y1H0CIDlH3rHgBnaflfv8HHrV+h9hWz8pkJTsZCjmztK
	pgLHX8RfE/C95/9frXUj9U4E7J7xtrEi8gR7J
X-Gm-Gg: ASbGncsVdykIXFn7Y2S1Xe6UNN1DYYaVxagZ+QSo3iV3dXgF2dnngR8YKX3h3cO/mfe
	6f4QuhWx88TBDiPuibIwiDzVHK/ZAQZp3YAfBKKXyKqFnWRVHPziQLivXxlIrknjLkKRMcFfP+Z
	bW68yAPcOOqD7gcdF+uT1gjKTCe+bolEqc6VIKYdFfVSKltFV0p39Jctsgp2TGPUp6ycqmGBKgj
	SUhTHpxsh75ssmehGb75plNVncs8ym4qGPFLrXxWNZom/zg8/19brROi+MbPe/34R+dwNl/hL3I
	QUvGSA==
X-Google-Smtp-Source: AGHT+IGCXvBsw7gVpfuGRfdLYOwju1Mbz4wTnUVsieDpFRUn4Mw2KCVOGS68XtBUYOEbMCrzyN3D1IxjhfTBmooK5YM=
X-Received: by 2002:a05:6402:3492:b0:61c:6ecf:79dc with SMTP id
 4fb4d7f45d1cf-61c6ecf9073mr5119979a12.26.1756203853090; Tue, 26 Aug 2025
 03:24:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMB6jUGOMwxXe=-04hSF8BEro_SZdQXa3XuVvkrrzCWqeG7KXw@mail.gmail.com>
In-Reply-To: <CAMB6jUGOMwxXe=-04hSF8BEro_SZdQXa3XuVvkrrzCWqeG7KXw@mail.gmail.com>
From: ally heev <allyheev@gmail.com>
Date: Tue, 26 Aug 2025 15:54:02 +0530
X-Gm-Features: Ac12FXwTEvvzoUlrdAdHDJaBrhX53ynVNPbBtUg-mEGbCIzRbbsAkV3kI0uW3eM
Message-ID: <CAMB6jUEL7juRQ=sz=rXooMMduEedwb185k+1kXbcWRD-17sq_g@mail.gmail.com>
Subject: Re: Linux Kernel Mentorship Fall 2025
To: linux-kernel-mentees@lists.linux.dev
Cc: skhan@linuxfoundation.org, david.hunter.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Linux Kernel Mentorship Team,

I am writing to follow up on my application for the Linux Kernel
Mentorship Program. I submitted the required evaluation tasks last
week and also sent an email to skhan@linuxfoundation.org. However, I
have not yet received any feedback regarding the status of my
application.

When I log into the portal, it still shows =E2=80=9CApplication Pending=E2=
=80=9D,
while the Linux Kernel Mentorship website now indicates that
applications are closed. I would appreciate it if you could clarify
the current status of my application:
- Is my application still being considered?
- Has the mentorship program been temporarily shelved or finalized?
- Should I interpret the lack of feedback as a rejection?

Thank you for your time and support.

Best regards,
Ally heev

On Wed, Aug 20, 2025 at 9:24=E2=80=AFAM ally heev <allyheev@gmail.com> wrot=
e:
>
> Hello,
> I have just started an application to Linux Kernel Bug Fixing Fall 2025. =
But, the prerequisite tasks have also passed the deadline(PFA). I want to u=
nderstand if the deadlines are hard. Is it okay if I complete the tasks by =
this weekend?
> PS: https://forum.linuxfoundation.org/discussion/869322/fall-2025-linux-k=
ernel-bug-fixing-application-deadline-and-late-submissions#latest
> Regards,
> Ally heev
