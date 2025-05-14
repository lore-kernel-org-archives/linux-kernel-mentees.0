Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942021A28D
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 14 May 2025 01:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747185620; cv=none; b=k26seK1kTxEkIy+s1ywsHccnizk8PSlVo4MTlCCMasbap2wHroiIinsixIKmFuDZAz9Aa8JptScOQnlzlsXZbtroNQC9PNMNLgpdtIig9rHB7tiA62/FH0oE65JIj1C/18yYn5j7whRaOgyASTPezkAWKn4TpfN+eSHBOcSw3so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747185620; c=relaxed/simple;
	bh=6TH+CfOf8nH8p092bYaPHuPFIDKQno5bG+ApPzD2hCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pT96pwT/balaCjJsFgPTUA6ouHpcFgr3mNLJRSs//8yb5iOpyF2JoTk9sdOZTSPNKOrZH06yj5wKjdcqM87DmhZ6qN+8h5RTUjLOxH7u9UzfVg8fRuHI0lHeg43d7xJ9/MT6NvZfegKjeHgwmDQOV1Codnx62Ral3UNFiLZsFso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JeZ9BmWO; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JeZ9BmWO"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-72bd5f25ea6so1716487a34.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 May 2025 18:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747185617; x=1747790417; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kjhw+8R2L2eVYt9u5Zf9479vJ3/o77t8mJ9Bz83DtoQ=;
        b=JeZ9BmWOgdaeiwhG4UIYbtmPWEAfsLcTVkn4Er5n+huB6LtWflfxaBwEXSVf5drY+M
         EBDEC2QXXEkMRpbv/uFXrJ7uLjvjikt+7q0tYnicwQQM6mFok4uRoqI2AZ3iEN08khFL
         vYZPp7OLd5iMfG4kWa41VzG3zNCjFHE4Rxzv7zCiqZFpkK+vkw2UhPn2/RA72Y4k6K1G
         pcYmazJipUU9xrIWTNuWd/B0divTxV3aTI5uvcoVtLc+/OI54mu0iI4xhXCza5u/oCIm
         qF/gAHvXe20LsOgn4jA64KUEVkdS412Gv2P+2teIDye6OJDcSHQtQSZHD+4RXbg3T6cS
         tVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747185617; x=1747790417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjhw+8R2L2eVYt9u5Zf9479vJ3/o77t8mJ9Bz83DtoQ=;
        b=HKh9XQ9fXvzdGXQvmCE8T9SuMwPjfhHiHqLUVROgBR1R86i83VZUWhwUKIF5tINRsw
         57MQ105PGd59Tduh53bnqI5SqpqBdI/JV5VJ6aMTepm6GBI4d7h2mSIKLEk3o9fkYlBn
         hiLQiC3YDkGD/FilIOOLAqsPgpy8QocVICEWMKYaTqD0knaw6Y/YSL6hw/B4bapo4dwq
         UdonGly+pABzmESL3HBuMnpjHpIxgOAsePvx7bl796tzilPOIMkMjeEJ/K7vCMu4fdpb
         lKmScAqGbmvz2eu2aCpJpDd3tJXv0vmXsGtU3RyyJY5/DT8/nsegtwoVRLkWvo9GVGDm
         7roQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSf3rQWajWQPmYYSRLE9NGRnm3bVbbu1XqvFJrFfZmtiJKbxy0AP40NYW8Ak/r4yZ+ghqaJiiG7EribDlZrzKOoJjY2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzoNZaECAMTAh0oWrrCliBnb+bnmOhYNQH85jqfZil8DvylVvrt
	CoUBmRZE+u56bLgy8WPN8t+Sc+xOWij6PyMv5M6QxcxNcG0hMpzaDjHd2cvVSLikw3pI5KJtLIr
	MTb/1j0l5x+y498y2n5tzoYiHrKU=
X-Gm-Gg: ASbGncsQV9DihGsRBXlS/AVFOWqBQTwpzVSVDPB4448UuuH7TmZO19BzaLkXwdPuu5T
	FrRzTTIhetW/bYTPxegsktUht1r5Kpsx4yDsXUy0dkWa1niP+aQGNahv5ludKMcW/58ik1MG1Js
	UkQ68Qn7ZbnPIdVe/8fU8/5OnDQyWsVoz4faTDTOiABpM/2p/dsgs2EeZv3ihi70jQ5g==
X-Google-Smtp-Source: AGHT+IHkZ/hgevBC9dQiqQ7Y9K8Hy5o5zbMHYNDgVh2fgORnUsRO27N4/XTRi5pSH9FtbfVkATvj1JiZs9S+RGqo4q8=
X-Received: by 2002:a05:6870:71cb:b0:2d4:d07c:7cb2 with SMTP id
 586e51a60fabf-2e32b1366a7mr696824fac.11.1747185617429; Tue, 13 May 2025
 18:20:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250510184709.44935-1-suchitkarunakaran@gmail.com> <09c7ad5e-4061-4c0b-b097-fa575c12a244@linuxfoundation.org>
In-Reply-To: <09c7ad5e-4061-4c0b-b097-fa575c12a244@linuxfoundation.org>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Wed, 14 May 2025 06:50:06 +0530
X-Gm-Features: AX0GCFtYZvMyu3LNA6tisPv-kVuwpVvfEoES84vyI6pfnQg2CB3GgUX9A07nmkk
Message-ID: <CAO9wTFjyEngVR10ixYj=G8udRBeKaxAQquPCdi0V638t3WqQfA@mail.gmail.com>
Subject: Re: [PATCH] tools/powercap: Implement powercap_set_enabled()
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: trenn@suse.com, shuah@kernel.org, jwyatt@redhat.com, jkacur@redhat.com, 
	linux-pm@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the suggestion, Shuah. And I did compile the kernel after
making the changes.


On Wed, 14 May 2025 at 03:33, Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> On 5/10/25 12:47, Suchit Karunakaran wrote:
> > The powercap_set_enabled() function previously returned a dummy value
> > and was marked with a TODO comment. This patch implements the function
> > by writing the desired mode (0 or 1) to /sys/class/powercap/intel-rapl/enabled
>
> The short summary should say cpupower: Implement powercap_set_enabled()
> >
> > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> > ---
> >   tools/power/cpupower/lib/powercap.c | 22 ++++++++++++++++++----
> >   1 file changed, 18 insertions(+), 4 deletions(-)
> >
> > diff --git a/tools/power/cpupower/lib/powercap.c b/tools/power/cpupower/lib/powercap.c
> > index 94a0c69e55ef..7947b9809239 100644
> > --- a/tools/power/cpupower/lib/powercap.c
> > +++ b/tools/power/cpupower/lib/powercap.c
> > @@ -70,6 +70,22 @@ static int sysfs_get_enabled(char *path, int *mode)
> >       return ret;
> >   }
> >
> > +static int sysfs_set_enabled(const char *path, int mode)
> > +{
> > +     int fd;
> > +     char buf[2] = { mode ? '1' : '0', '\n' };
> > +     ssize_t ret;
> > +
> > +     fd = open(path, O_WRONLY);
> > +     if (fd == -1)
> > +             return -1;
> > +
> > +     ret = write(fd, buf, sizeof(buf));
> > +     close(fd);
> > +
> > +     return ret == sizeof(buf) ? 0 : -1;
> > +}
> > +
> >   int powercap_get_enabled(int *mode)
> >   {
> >       char path[SYSFS_PATH_MAX] = PATH_TO_POWERCAP "/intel-rapl/enabled";
> > @@ -77,12 +93,10 @@ int powercap_get_enabled(int *mode)
> >       return sysfs_get_enabled(path, mode);
> >   }
> >
> > -/*
> > - * TODO: implement function. Returns dummy 0 for now.
> > - */
> >   int powercap_set_enabled(int mode)
> >   {
> > -     return 0;
> > +     char path[SYSFS_PATH_MAX] = PATH_TO_POWERCAP "/intel-rapl/enabled";
> > +     return sysfs_set_enabled(path, mode);
>
> Did you compile this?
>
> thanks,
> -- Shuah
