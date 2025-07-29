Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FF821B8E7
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 11:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753789515; cv=none; b=iXNRHkI2GiYmniNAPdnqLkCHeyZP3T8EtMIp2yu8IuePVtBmwNeHEd3lrD2UAaKZ/SGevUXlBNTpYWwykyxZBodO4z8Wk3/hxbPIr5B5ELRBaZ2rvjT5FjDsXH8uiE0X1e8tCz8SDW7ZVeHyU+/uYf65mjvf8bhqr7G4UFWVjtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753789515; c=relaxed/simple;
	bh=CwqCF9KkaIWYMXKQ2dUMouAu7sXBqSPywjtOjPo7Rpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V8e6QPsaxaUsdphLAdY00cCa/Tfdyqc9jb6ct13EXEQUaiONtfFRBrvzDd6iqdPfWJhEgvV4cWCF7dfnL1WCY3nmJgEbnvqEyF2HdSE1l45q0JSS0+mV6vfuks2o+JbVX+aHrwx3oFpZG7E26PIhODEX7nUAWrj+pzZ9wvgRRvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ph/5d7Oh; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ph/5d7Oh"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-301fb587dfeso2376230fac.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 04:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753789513; x=1754394313; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=54GN9RZCdtZRrIIoQCXnrksy4ko/oLl8VdGeEOdkMU8=;
        b=Ph/5d7Oh0qlV3vx4Y1q3hsvlcdFZ17vikyzaSwnBYItX1SDvnmgWXRJ62j2tpFDz0g
         gV6gUWPk6vRw2GrRmZruqbe6pyWzutlSQaOrq1Sub8D9Zc9ib+Te98rSK28Yg61HZG1B
         2WUoKUnMobAee4cwiRGpXhAUGk/oB+FH0aGFZtcX1OoELoU9KbKXJ0NGqyDXMhHfwu9m
         pPP/xXYDsDdKHF+ha2QPxjlm1xyRX9Bml6QGZz1Y4Dk8Cx8pg9wG+HCaqsEJQHJJzy+G
         yj6ULuOo0WlBk8ZWfRnfuk+9svKOd+RMcj70u4fQKZMVTGwj5GMeEkvOQm/2frPbC52B
         qtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753789513; x=1754394313;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54GN9RZCdtZRrIIoQCXnrksy4ko/oLl8VdGeEOdkMU8=;
        b=LceKKf5tiW7hgfOjXezcE425O+WN9JWm8Xe+iuIRQficUfroBV4w8fz0dkbeDNGx7f
         4LTfa8qWZUgMZP1iEIncNos77clXxz5IdG6IlXsxkk6N/LwVV6n8y3HCJiaD/OCHilF+
         WJoydUxhnDXhmS/3tbS/JuyP7wOyTV6gsb0ys+v2yMV/cM3GseGepBkVOPPXlIiJrgAu
         vn1QfBGESjNt5oEjtQ6vVELE9uNZbHdp4HJzKRjQLfsd0AtgYBG2zZsq1mKk0dqARnxG
         1NHU6DDj4l6XkPqDWL8O8IMUgipdF5/org8/CCbcunlwJ3d63IJZe3780nJoUXXRH037
         3kDA==
X-Forwarded-Encrypted: i=1; AJvYcCWh1W9GOc+2Hb5EtZr8z1aBCYXEZfHI1kqcQKhkJemPoauyBVdqKyaoHNOoC/MgRX3qZLx0lWvSNxvxS0dNX1VquBdxVg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxpJ/YJu1kiAKLagkMtvcT/6ZfHFjpSvTlz4eMeVKc0sqchw8D8
	14hWpvS906tVSjzME7pvw4EkPEyourL4AxbqqczHpSjZ8yF/VzBmRI3dL7T4H0VZ+VvcZqMidnt
	jKMvwNwsC2AhcvzYP+YmYqHTvNbnyBx8=
X-Gm-Gg: ASbGncuwkQ8LvSs86H4A/E+Ikd3dN8836iDWVAWoKkp0M8a721c+41tMJ3dKtUe1ArM
	JkUu0CVUgZXVFD3s51RSimaZMMCgbZeQ6okuXV/P1r72QcOoi2hpeCJmlowqsOro5yvpDLW1vNU
	GkHtv3tjvFc6uFPwSoAAadM1sMWRskDSUjSqGz94QL/r3Ul6GR4DdevpLzlz2wpDVQHkyGP1ulq
	0SWxxvS
X-Google-Smtp-Source: AGHT+IF2VoFtEHdUx8olCgcz5kNZJoRqhVc9zCXSwVNqqUEXR6iKIoAe/QSJEdIbOw0bojrHy/bqKCA89eJ36HEwMsE=
X-Received: by 2002:a05:6871:e604:b0:2ff:8bc7:44a0 with SMTP id
 586e51a60fabf-30701ac679dmr9014878fac.22.1753789512861; Tue, 29 Jul 2025
 04:45:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250727125044.101779-1-suchitkarunakaran@gmail.com> <61958a3cca40fc9a42b951c68c75f138cab9212e.camel@perches.com>
In-Reply-To: <61958a3cca40fc9a42b951c68c75f138cab9212e.camel@perches.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Tue, 29 Jul 2025 17:15:01 +0530
X-Gm-Features: Ac12FXxiNwEvOzCx9tNPZ0SRAhaKaDMzzgk3wtnJmBlGhi8OfuHQjhh1fBGgmJ4
Message-ID: <CAO9wTFhCb7gDEo+q2SAZcn2KdUyVe-fG1E4bR_+US9k2J9DOnw@mail.gmail.com>
Subject: Re: [PATCH v2] checkpatch: suppress strscpy warnings for userspace tools
To: Joe Perches <joe@perches.com>
Cc: apw@canonical.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Jul 2025 at 15:54, Joe Perches <joe@perches.com> wrote:
>
> On Sun, 2025-07-27 at 18:20 +0530, Suchit Karunakaran wrote:
> > The checkpatch.pl script currently warns against the use of strcpy,
> > strlcpy, and strncpy, recommending strscpy as a safer alternative.
> > However, these warnings are also triggered for code under tools/ and
> > scripts/, which are userspace utilities where strscpy is not available.
> > This patch suppresses these warnings for files in tools/ and scripts/.
> >
> > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> >
> > Changes since v1:
> > - Create is_userspace function to check if the file is in userspace
> >   directories
>
> the changelog bit should go below the --- line
>
> > ---
>
> This

Sorry I will change it in the next version.

> >  scripts/checkpatch.pl | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > @@ -7019,20 +7019,24 @@ sub process {
> >  #                    }
> >  #            }
> >
> > +        sub is_userspace {
> > +            my ($file) = @_;
> > +            return ($file =~ m@\btools/@ || $file =~ m@\bscripts/@);
>
> All other sub uses start in without indentation.
> Please move this next to other sub blocks.
>

Yup will do it.

> Please do a git ls-files -- '*tools/' and see if too many other
> files are matched, especially the Documentation/ ones.
>

I didn't quite understand this. Could you please elaborate?
