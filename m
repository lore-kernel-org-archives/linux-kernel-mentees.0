Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59166210F4A
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Jul 2025 12:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753445801; cv=none; b=U6unizrSUoVXT43HjAmj+bD4P8I7qSs0cDQw15X3PeeOBqHoCbFTHhz1iz71A++Jfa9g+dQqCI08jdXN50gZpC2h89+RpT3kq69C/gXBVDI4Pg6HTCaV5PJP9GL6YGV936s/yTe21rFNu534Z2U9FJQk/feQgmmlAiaQUgk4poo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753445801; c=relaxed/simple;
	bh=OuG1CTeRyKj1R4vzsa0DIZZsT/WphxujjGAB6utzPSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GL1HyGtu/eFA26X74UJ0G0lbAvcwuQhs5S20Apji4hOtOEMaaHw0GNhxeuKmO6M8KkUlMUeZgMXT2ooguZZOV8hofRhItVH8rLd38nKjdEasswRMAszR8uxfYzMjuUtXoZrfmlWaiQF1MempU7hdt4EioxN6Wd1LU7yOR7iUCS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cInWR+D4; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cInWR+D4"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32cdc9544ceso18091891fa.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Jul 2025 05:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753445797; x=1754050597; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWqM+C7auc61yVm1rsNVEwh3eE+ELNPdk6XGXZ1WIxc=;
        b=cInWR+D40RYknxOueEmvALYYry9krypoKbe7a74g604nGPoH/1d2XAdIcl+/1TfAN5
         055SeIS8ZtL+f66AkiL5wPHJPUZMcpyL2RQfa5a8nI4NrFoWjMdOYTUN+j2acvyaEvLC
         RChqwMOOQBgloC/nvE3cpMxjmqX1EUQquW+wDEAIL0JiukfMxtgDU0SleYwcWaYAP/Ky
         dX2okToXca6xfbAydUloxlKD+DCfsfv0log5F2NiM7GT5gUjYd+jxpeH5WcYQP8Diz0U
         +EjqLZkbKKqOUHTiDhX0Oo5ODGtEu+9ShIBMZNavygSkQjKArtMNWmc/MLX25YhoFYZo
         r6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753445797; x=1754050597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWqM+C7auc61yVm1rsNVEwh3eE+ELNPdk6XGXZ1WIxc=;
        b=n5Pwp+au5cTYLnMPgKHJiPwetnXMb8D3vwx+FIQKBZbH48LQXUpXIJDsYpYetHgIHf
         wiDx7n/25V6dvQTvMP+o4ti8XeHgv/hIX7o8luENwvcCii2RW7nkJIMKbY17fl8ayiTU
         +vs64zWGfbBQGTodH3ym1G3vD1QdgKhGrJ276hg/zkyUCOrdOIilpYd2kJLD12qdZSkU
         FuhRkMQnU/3MvENL06c9x1re60xwW2nmBWSBSWXPGYvp9tDLyrRZMV7nlfbqkCAfs7tt
         hXZIa+n1bztu45X0VBPO9sTBg/ctQLoUzEm81exvuOdXVvp/2pmhW7uL+Qg0pAyfg6Lx
         AjNg==
X-Forwarded-Encrypted: i=1; AJvYcCXJHwgU+h/hZbhkTPpP8vSw5IysocNrDPB7w+dEXPitSSRpBzs89dhp2VXv1B+aUz8oZvhHMXqjsPApsv88JQDThLQuiw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZRZcSY2wZcpJjTxBdmOPahaK8s+gtczaLvNoU4/qd9YeHREkT
	9RIafoYo5feMcdMUz/FNwpbWjpLmSZVqOnjVciZrCD++2Q3+KPabg3/GOnYucj4gUQb2oB442Vr
	FKFq5hnKNLQrgEr7OCXr+xBysE3AwqLN1sXbzcvj8dg==
X-Gm-Gg: ASbGncvM/p1rxRI6s3C7DEwVEOFbT4Fv91yMU3LTUk99I9zI33FGM2xHnqAGzfPxyBt
	oOLvRs3CtUmghMQnNFBofFptsViDhm/8WiVAjA51FOtf1h5NQdXNRtIBHxoLkdNuPK/KWCU3GOu
	DPUZzNdpoLhEGKoO2ofsjD7CufzbEajS31Fk2sRi1+DbCui4j6z1pZV4rsl9Y16/YGvk7leSIqm
	D6cQfCJyfCVgiEAjlqCqcsQb73+VD9mxNaztLlb8g==
X-Google-Smtp-Source: AGHT+IHyqCZRpQ3iwmGQDc1/6kxptmmlPmdgHw1lqiVZmo2HMouuishREQW96mVd4w6lxf84JBGVClbJXSwOIYFcvQ4=
X-Received: by 2002:a05:651c:3248:10b0:32b:75d7:fc62 with SMTP id
 38308e7fff4ca-331ee7aab3dmr3420251fa.38.1753445796930; Fri, 25 Jul 2025
 05:16:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250706092522.9298-1-pranav.tyagi03@gmail.com> <yq1bjp9rqh5.fsf@ca-mkp.ca.oracle.com>
In-Reply-To: <yq1bjp9rqh5.fsf@ca-mkp.ca.oracle.com>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Fri, 25 Jul 2025 17:46:24 +0530
X-Gm-Features: Ac12FXwul_qh-KD85e-MrQnYOfSIuco3toGb2OQLyA0Tzh4yRvOKtzf3etCfmig
Message-ID: <CAH4c4jKgPv-Mb1=WvOW+jvGMABXcEgaDMxV0Wit32LPgJitekQ@mail.gmail.com>
Subject: Re: [PATCH] target/core: replace strncpy with strscpy
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 7:22=E2=80=AFAM Martin K. Petersen
<martin.petersen@oracle.com> wrote:
>
>
> Pranav,
>
> > strncpy() is deprecated and its use is discouraged. Replace strncpy()
> > with safer strscpy() as the p_buf buffer should be NUL-terminated,
> > since it holds human readable debug output strings.
>
> If you must do this, please change all the similar occurrences of
> strncpy() in that file instead of just one of them.
>
> However, given the fixed size of the buffer and the length of all the
> defined static strings, what is the actual problem you are fixing?
>
> --
> Martin K. Petersen

Hi Martin,

As far as I looked, I could only find the following 4 instances of
strncpy() for the file target_core_transport.c:

target_core_transport.c:1115:           strncpy(p_buf, buf, p_buf_len);
target_core_transport.c:1165:           strncpy(p_buf, buf, p_buf_len);
target_core_transport.c:1225:           strncpy(p_buf, buf, p_buf_len);
target_core_transport.c:1279:           strncpy(p_buf, buf, p_buf_len);

And I have changed all of them in my patch. Kindly point me out to
other instances, if I am missing any.

Also, I intended this to be a cleanup patch for the deprecated
strncpy() function and wanted to replace it with strscpy()
which is encouraged. No functional changes were intended.

Regards
Pranav Tyagi
