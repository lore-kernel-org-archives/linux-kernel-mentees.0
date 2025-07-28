Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24AD220F34
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Jul 2025 05:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753681184; cv=none; b=HrM55hFMgZOaLWF4DUmuFCkV9uHLF4ArrVd5sIjVblCGNcGfvGrRt8rOwOWw3yV8GrfYsR77wSjrk8H7d935KZkmeYv8AlRF483se/Imqu69AgUExpoaTo+fwnYe+RZr3CLrFBob4Glm1YcWALX523KtvO1jxDCJpOyyFdV6QOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753681184; c=relaxed/simple;
	bh=X2bxsZlx5MDp5rTn5Ctwe1YI0HsO/qA41QXsv818O5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qMtlq9TSvJXVHbKahuV2KboPXOD9kuZnbohW3HXeBHJ1ebRyLws4FCecDk2VMp/iKGjut7XC7hAdamGOgukW01baTE9uK4IlXm3Isa1wg6Iwqk/p2uyNKxyMBEiftPu7ZtcjzDDLhSBpoUzxO9XEIvDPBtUkwn9WvsZ+2jZWuko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPk2pQK+; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPk2pQK+"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-302effd5978so1948093fac.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Jul 2025 22:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753681181; x=1754285981; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gaFBcY6PhjoQyS7AKQsTykSazBAoA4FN2Ql58j0Zd1k=;
        b=LPk2pQK+qiel64J45P0IpJzpNBq0f6kxggu4N6IHTH/cQtSo9S8JHBbuDcU8WeKsdS
         DzDQBHMG8nhywRzcxx00plz9Npot8um8R5AyhdAt5KNV+Bul2bm8RBAegZRs4xRMp9xk
         2nomo4TA5y9U4wbIS9e3NlS3DkOapytQ9CCpaBH02qUNqSWwL99G4e/vsacEKhu5tO2S
         hCT4LXoDET0vRvHfcKEKcQcW/n5F8KeMAFDgRJrlM95RrJbXxejX4wzA85EXbskaZRnm
         SbB+xG+NlSUXwkurDuE0XThImIUwvintZWFw1CqUErS5y/6g8vgAMdOjHOjG000GKvcM
         G2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753681181; x=1754285981;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gaFBcY6PhjoQyS7AKQsTykSazBAoA4FN2Ql58j0Zd1k=;
        b=OGqclwj9n5HZBPhsBLV5yqTZzT13UlkSgpjJ+DCir5SZMQ/MApi+Uq2JDqfG2SR7fJ
         J3V8uRw/w64OhS4bP6tOjw5d8ad1WGOVvGYaARux8IHPMNK2PG41B565OQpYmjSHx+i6
         sZ+zD35tE3rT2vQLIzwMZGDWWVGITmpjiJWFYdmBarIJP0PsSPnG0MGTovlzQLjY/GwC
         sIpV2zxpWu2YlsLhSYT0ylgRiDEjd+8t9PNd+EUUKN6wlkKhPtBAl6i5LM7wW3W03UR5
         qlHFvQfbudp1tjGXTpi70VVtDL1wE2CZnpm+9waz9HY3hUAsgr+l7JkmCVn6bFyXDIta
         vMEA==
X-Forwarded-Encrypted: i=1; AJvYcCU5I2Kr1iRwGEPEn5fjUhAISOKWzuryE0tMi2x2B88ngTd6CtliWD4Kybi6kyym3DuGJiiEJC8HvprMQ3vO6RweqxTNyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOp0E3X0SnnQ8NY4T5jBCCgrrEtcXE+AlffJBDRWP6Swt9N3AU
	LOy7sQxdPYJJiXHHO9K4dIE6iOWk8Ay1MMZC9O/X+iHVolj+f/qt+EEbQUgT6fY+t0seK7qTBH4
	gyBhUcPmubfDwKQBrsr8MDv2ac35EqPc=
X-Gm-Gg: ASbGncstYnC7dvjrMUnZ7+yWqsRO0DQkLgEhyt4bE0acT2rTxG9NhVAMT3Un3F0F0tZ
	oI4SCczQ6RL7T3zKSoWFlCvwiVMF2Gs0gGv+Hd+7dKys3XAEURBT/C8o6L1EP0LY/Kmu3pxp8ot
	nhII7JOlDtLEKLNxDlyKeEE0tjkYZdE0uizSF60pkg6jmZf03XihsavrZqrmQ4RZKsfN0v0TK1p
	e99qmbd
X-Google-Smtp-Source: AGHT+IEOQZX1TnyqFEysH5JWrVs+NdZCp4hQ6hPN27tb8Q3DoxM2fDOyldoc2nyIYWXXmhSrzBUlcKuXUODEcA/HxX8=
X-Received: by 2002:a05:6870:f21f:b0:2ff:a399:c0fc with SMTP id
 586e51a60fabf-30701f50aa2mr7883563fac.5.1753681181671; Sun, 27 Jul 2025
 22:39:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250727164433.203775-1-suchitkarunakaran@gmail.com>
 <2025072842-require-smokeless-f98f@gregkh> <CAO9wTFjuSch0Cc0yXV=PR9vkk+66i_4PSanrPqKYyXXhWjO-QA@mail.gmail.com>
 <2025072809-pursuit-hardwired-d894@gregkh> <CAO9wTFi+atf1vwMrDJBa-X4W5UcQ8K80spgiGhMyhZj4aRJ3Zw@mail.gmail.com>
In-Reply-To: <CAO9wTFi+atf1vwMrDJBa-X4W5UcQ8K80spgiGhMyhZj4aRJ3Zw@mail.gmail.com>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Mon, 28 Jul 2025 11:09:30 +0530
X-Gm-Features: Ac12FXwH01iH8tBLme1s9rlFzUYcbaVyzXI2-YL89UVDP9me8f7MB2yZF_f_AKE
Message-ID: <CAO9wTFi7ejkMbtT80EB2AAOQp7fi+GEf1eJWwfj4j6xU0iEhaQ@mail.gmail.com>
Subject: Re: [PATCH v3] kconfig/lxdialog: replace strcpy() with strncpy() in inputbox.c
To: Greg KH <gregkh@linuxfoundation.org>
Cc: masahiroy@kernel.org, nicolas.schier@linux.dev, 
	linux-kbuild@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Resending because I unknowingly disabled plain text mode. Sorry about that.

>
> Is strcpy() being deprecated in userspace?  I think it's a core part of
> the C language specification :)
>

My apologies. I was under the assumption that all folders within the
kernel repository adhered to the kernel coding guidelines, only to
realize that these guidelines primarily apply to kernel space code.
You're right, strcpy() isn't deprecated in userspace but as far as I
know some compilers emit warnings to replace it with other functions
since it's unsafe.

> Again, how can that buffer be "too large"?
>

Tbh I'm not sure. I was glancing through the code in mconf.c and there
were some calls to dialog_inputbox() with file names and a variable
length string being passed for the init argument. So, I thought there
might be some chance of overflowing.
