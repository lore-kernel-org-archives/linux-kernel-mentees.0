Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B82A22D4C9
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 25 May 2025 18:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748197613; cv=none; b=csmdsZ/YGs4zougFcdWUxAnYs/VirWfGE+bK52+jqirQAYn1Aq5nHpW35qjMLarNV3w6qEOhnm72D+BHvJJPXhuPTHp2w1uwI8M4+bqzXpuMNAJ4t9PQiP1HVUdVG6A1J1LE/xbkjeu/D1njMarj5Z8GrGjLsSSkcN/B0tN7mbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748197613; c=relaxed/simple;
	bh=Lp4APZVxa0/0BiLlhBNI1ETmFXHx8UAVaUVMg6qM4oc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=loyKZ/IcyfKJ9pq46EtV/ovDskNNnQYB1AJaT19+bK70J3tRaLsS6AzQbXttq/NOqIbdQ1pHN9fuuffm6F8hzrHYioMcloHsk2S/4JDUk2fLoCxaTkjY5cGdMoHaOMI+jqJANUPKWQZquXq/khkveWk12EeelRhhYFbG2Q3ofpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfWmOFPU; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfWmOFPU"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6faa19e0661so11431996d6.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 25 May 2025 11:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748197610; x=1748802410; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3iQDuus6tHDjaYlJVgQfU6K3sGxod1e20Y6UqFJQz8E=;
        b=CfWmOFPUrc922WCjxfi7ohO5gAbmtmIxTjOkd2o32iAJLTM/dObOCmuiDUb5GrjO9n
         /zrduuTr6njIUY8jEXpHJ2ggkr9deSr19Vw7O38yZ4vRJTJ0hpOO4scRuzqMMUX2LC8x
         IvP0MbqhHyhOX2EpkvVyA8nKDEKAravlY2hW8EIgmu2h2NhhUFZHTSSZ0+CdFlc4dpqc
         H7e9SE+lCiwuSv/r7RV7QZhzM8Vi9857JCTNDaJpRMrkikSgsM1s0PdXg/idGHh0tW1Q
         Ed0acoK+uQy709Bs+wDwmLS//a4DT0kMHvUZyFEcEexPJgANX1eXzhlD3ylD8hsehe0i
         OC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748197610; x=1748802410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3iQDuus6tHDjaYlJVgQfU6K3sGxod1e20Y6UqFJQz8E=;
        b=ipYiP8UZY1oPd/39hb+S/YHv6cbV/V/44FSiXmCO18aF10jCzE/7O7FZslxWAmII7y
         1aY/DkB5mqLCcleo+GR4aEONUU2x+Mp/HB/rBgpDxGE2HBOPdEi5DpEh8oLZerKkINVp
         pf7blqvrzW1Cm+0i3GRJxsNcsWryc4/NAVjSYWObYjr8+xZ0SgjGe7vmK2CII1ZiftKh
         wYqVFuM7NNw73tiLbmK1SwrUmED+diuW4MqHg7wNcI9yjM/vPfNaBC2Az7MfhUUS6RlH
         9zI+GhJgHe240VWHQbz0k23AhkXC61ioursRfR/h6YVXLUneT3Cme7CEbDN9LYS7kiX6
         +IVA==
X-Forwarded-Encrypted: i=1; AJvYcCWtRwrZtql56vcRrVnvAiSSvH9XEsD6zxoeBIRGSN2np3Ca4W0AQvmaYBD7oGjnV17YKPpWVxFOGk5vj4BFADRDPIk+zQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOk5k2Jv9D0UGR4/3nqdaQYatCcKLtcYBYCqP1epZtVRmkJGQV
	RQ5pFxn8iF735zjM28SZSQQTM67C6qpM+0EJUTyB39v7BM/eWyq45QZkdGxWkzYXXPl/KcnUF0n
	ubE5otnmFdNmHEMU63dJ4By5nKmlD8Ac=
X-Gm-Gg: ASbGncvZUiiwz0RyjF72QOQ4XZ7eXNxM6TB7cfwGPrstgMIjVo6ieVOiYImKaKVWVDw
	pITm4p6Mbv/Mm0TErhL8RE5CMizhdVJFbLm8JKIv551S8EopM7jeOt9lHcdBMR7WbEPDjremlbl
	4x3/iuwbXMZ/2uDqM7cM2SPMKb6oaSpfNeIgHfKcv5PpxQitfTqikSRRQMDkz8oY0+
X-Google-Smtp-Source: AGHT+IH/ciCbn34OAJnjEtsVPXlZMxHLOCNYfrbDPIJVqMMgLW3oTWLp5LliA1ycngh+GRJSBBjNNa948wlOeUzbXBU=
X-Received: by 2002:a05:6214:c27:b0:6fa:980d:528 with SMTP id
 6a1803df08f44-6fa9d15983dmr111569806d6.23.1748197610414; Sun, 25 May 2025
 11:26:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250516153955.111815-1-embedkari167@gmail.com> <73a4b1c9-44b4-4f06-a766-ea7ed391c578@linuxfoundation.org>
In-Reply-To: <73a4b1c9-44b4-4f06-a766-ea7ed391c578@linuxfoundation.org>
From: Harshal Wadhwa <embedkari167@gmail.com>
Date: Sun, 25 May 2025 23:56:48 +0530
X-Gm-Features: AX0GCFvYMuOMlqQOBQdvGQ_5hOiN-rfQdg0Zgzfo8_JP-XwbcWnufmY5l3adJvQ
Message-ID: <CAPCCTVOXHUh7j6Vb=dmnY4wi37f4NMo+Pumuho-sA7jq1iH_fQ@mail.gmail.com>
Subject: Re: [PATCH] selftests: firmware: Add details in error logging
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 May 2025 at 03:49, Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> On 5/16/25 09:39, Harshal wrote:
> > Specify details in logs of failed cases
> >
> > Use die() instead of exit() when write to
> > sys_path fails
>
> Please explain why this change is needed?
>
> >
> > Signed-off-by: Harshal <embedkari167@gmail.com>
> > ---
> >   tools/testing/selftests/firmware/fw_namespace.c | 17 +++++++++--------
> >   1 file changed, 9 insertions(+), 8 deletions(-)
> >
> > diff --git a/tools/testing/selftests/firmware/fw_namespace.c b/tools/testing/selftests/firmware/fw_namespace.c
> > index 04757dc7e546..deff7f57b694 100644
> > --- a/tools/testing/selftests/firmware/fw_namespace.c
> > +++ b/tools/testing/selftests/firmware/fw_namespace.c
> > @@ -38,10 +38,11 @@ static void trigger_fw(const char *fw_name, const char *sys_path)
> >
> >       fd = open(sys_path, O_WRONLY);
> >       if (fd < 0)
> > -             die("open failed: %s\n",
> > +             die("open of sys_path failed: %s\n",
> >                   strerror(errno));
> >       if (write(fd, fw_name, strlen(fw_name)) != strlen(fw_name))
> > -             exit(EXIT_FAILURE);
> > +             die("write to sys_path failed: %s\n",
> > +                 strerror(errno));
>
> Hmm. Wrapper scripts key off of the EXIT_FAILURE - how does
> the output change with this change?

In the whole test file, all fail cases uses die() with the specified
error log and error code, so just wanted to add a error log for this
fault condition and maintain consistency.
> >       close(fd);
> >   }
> >
> > @@ -52,10 +53,10 @@ static void setup_fw(const char *fw_path)
> >
> >       fd = open(fw_path, O_WRONLY | O_CREAT, 0600);
> >       if (fd < 0)
> > -             die("open failed: %s\n",
> > +             die("open of firmware file failed: %s\n",
> >                   strerror(errno));
> >       if (write(fd, fw, sizeof(fw) -1) != sizeof(fw) -1)
> > -             die("write failed: %s\n",
> > +             die("write to firmware file failed: %s\n",
> >                   strerror(errno));
> >       close(fd);
> >   }
> > @@ -66,7 +67,7 @@ static bool test_fw_in_ns(const char *fw_name, const char *sys_path, bool block_
> >
> >       if (block_fw_in_parent_ns)
> >               if (mount("test", "/lib/firmware", "tmpfs", MS_RDONLY, NULL) == -1)
> > -                     die("blocking firmware in parent ns failed\n");
> > +                     die("blocking firmware in parent namespace failed\n");
> >
> >       child = fork();
> >       if (child == -1) {
> > @@ -99,11 +100,11 @@ static bool test_fw_in_ns(const char *fw_name, const char *sys_path, bool block_
> >                       strerror(errno));
> >       }
> >       if (mount(NULL, "/", NULL, MS_SLAVE|MS_REC, NULL) == -1)
> > -             die("remount root in child ns failed\n");
> > +             die("remount root in child namespace failed\n");
> >
> >       if (!block_fw_in_parent_ns) {
> >               if (mount("test", "/lib/firmware", "tmpfs", MS_RDONLY, NULL) == -1)
> > -                     die("blocking firmware in child ns failed\n");
> > +                     die("blocking firmware in child namespace failed\n");
> >       } else
> >               umount("/lib/firmware");
> >
> > @@ -129,8 +130,8 @@ int main(int argc, char **argv)
> >               die("error: failed to build full fw_path\n");
> >
> >       setup_fw(fw_path);
> > -
> >       setvbuf(stdout, NULL, _IONBF, 0);
> > +
> >       /* Positive case: firmware in PID1 mount namespace */
> >       printf("Testing with firmware in parent namespace (assumed to be same file system as PID1)\n");
> >       if (!test_fw_in_ns(fw_name, sys_path, false))
>
> The rest look fine.
>
> thanks,
> -- Shuah
>
