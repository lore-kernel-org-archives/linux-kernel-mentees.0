Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6002FE31F
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 17:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752771604; cv=none; b=u7rpCgu43hC4ZIzCKRzuuasVHcfc023Lb1Ig06/ofCqL5T6YWYzDkOI/PMZCvInITp1zVGAidbLYmYCEQ8ec8gqeeN88JghLK5X6NFn0aJALGaiRAwcY1xh83LZ8U1F8/x+XWGamDT/jaY1hV1GbwZJ1w5dyoknsRs96pCfh94o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752771604; c=relaxed/simple;
	bh=ewb+FIZz4kwCsl1j25xta8JzmAG2AEj7KxN2meRe0Kk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V2P+96JOsx3lhno2LyHoSF6Z+pnbdkz6z4e2YUwlxmWJMG4kDUB3j1H8JvKOjas0VvJAPnenU7hBWn8i6Tvlf8mAroMjlm+qoTFhSX6VSKAG7SbNk3MmNLsPjMv6g96ygZ/xf8fB2Rcul875xQE2q3QByqk3VAZDFF2Xtd8xjLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drDpGx7b; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drDpGx7b"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2cc89c59cc0so1545684fac.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 10:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752771602; x=1753376402; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ewb+FIZz4kwCsl1j25xta8JzmAG2AEj7KxN2meRe0Kk=;
        b=drDpGx7b7tA4q1U2+xLrltb7sTNyl/U2z4zFNMlFlWacQAFjOUQPikapaBqSXzWpXl
         JtIozuEPfaei4zg3wFAbLlgEAd6rrUq7xl0Egl+JkHSyx2YvB4+Ty8UPJhMJq+YC6Syd
         NUSGoYRIiu2oJvlTr7PBjYRWhs+BgpOa0bDALDRNvx8K/GYXDL4813Gs7lP2zKCuPb3/
         uAT4yDtrsB6+uq8/jY9jMph158udk3tKYT/ibp6xAfqiXl6idJ54QbAUDSf29pV1t/dL
         QLd69v9erJlY/E9qdV5zpHVy9997Wy0rDvlkK0Q/v1v21j9JYXTn+rAD+2BZ0UsvrM86
         fA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752771602; x=1753376402;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewb+FIZz4kwCsl1j25xta8JzmAG2AEj7KxN2meRe0Kk=;
        b=SU9lbzIX9BFAylL4uLNL0SgWmCfuypf4eUwCOtRgUD0uzoXdQB/OH8eXe11NOODRme
         BD/rvDuB+Qal1Ims3yK6/0OXMGVvxQrx1oLngfBwMESDs51VnuSsyZvPFmO48S66SL+n
         fw/iHfUXFeFp2xzqPavw3mHOUCk2lBoklkhyKOVlPHeDX3Qdthkj0CUbgxY5MBIvHUjJ
         R40ROQ4HXTUpVDGspD5Rmoh5pftga3YAwOmti0i2JBODsB4OuYjKVEyMuJ/dMN/YGz1r
         RxljxU4lsVXoatsNfUAR25N0pZiYmNTntjZ9hSpRd9IASGdAC+nky7y0elgkUoCGoMQC
         AQuA==
X-Forwarded-Encrypted: i=1; AJvYcCWnLk8aT3fgZ/jlV/ZabszWunlNOCaQlzTNNzcEJqh0SlUK6T8fHW33r+CN3deaCoVoDrJ5F1Cnsb1242hYWRuQKgH6Bg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+oOQP308ybB42+sl+fmfOGKQKxOGkeEEyDShlnfm67rdNTBxU
	r6DmNNf3W4RGwJinZbuArjjGCO1ye8L6QWRwu1B8Ku6c6hJPwtwJBN7+eZn05XclPDvU5pZUAmg
	E/mnvKh4eewQgmXMC91FCMclglfWnAR8=
X-Gm-Gg: ASbGncuRZWwfcXnXBFTT41LNoJ++G413rXikdBbo/6UpHALftt5QQbcul2m6JpfMLQp
	35LDnSibi13qu9KpGMlfQ446qFbMyhFyvQof9j6/QIppztYN3u4r8aL04co/L50onTzT2usp1pO
	/KQPPYM4QztiRbLCUbju1/CH+jsL58c6CMFu2ThBRVCAElvy0KYOErkLNW1sNwr4efSxfmN1j/O
	ZYYw8mp
X-Google-Smtp-Source: AGHT+IHYBhYyFCO7kIhIJXgTO3z867nKb992R6AyR0gE9NGM9WDzDbHkdUMO0+XjlDg9KIzr1gOchlwer9OVKvMXqJU=
X-Received: by 2002:a05:6871:e281:b0:2d5:2dfd:e11c with SMTP id
 586e51a60fabf-2ffcc181093mr2710454fac.7.1752771601492; Thu, 17 Jul 2025
 10:00:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250717115936.7025-1-suchitkarunakaran@gmail.com> <f6c4944d-c6c2-4a7e-8dd3-791d0c29022b@linux.dev>
In-Reply-To: <f6c4944d-c6c2-4a7e-8dd3-791d0c29022b@linux.dev>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Thu, 17 Jul 2025 22:29:50 +0530
X-Gm-Features: Ac12FXyTF7cN_d1c5mELIt20EHp_Qy3GriUYaqZEKLzGqZAStvwqLcaBbeQocBw
Message-ID: <CAO9wTFjEJOfF7krFuV=DkZFzRU3FpRXtnq93UaX8=_Y=wnwbHw@mail.gmail.com>
Subject: Re: [PATCH] libbpf: Replace strcpy() with memcpy() in bpf_object__new()
To: Yonghong Song <yonghong.song@linux.dev>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, bpf@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Jul 2025 at 22:19, Yonghong Song <yonghong.song@linux.dev> wrote:
>
>
>
> On 7/17/25 4:59 AM, Suchit Karunakaran wrote:
> > Replace the unsafe strcpy() call with memcpy() when copying the path
> > into the bpf_object structure. Since the memory is pre-allocated to
> > exactly strlen(path) + 1 bytes and the length is already known, memcpy()
> > is safer than strcpy().
>
> I don't understand in this particular context why strcpy()
> is less safer than memcpy(). Both of them will achieve the
> exactly same goal.
>

Sorry, I meant that strcpy() is generally considered unsafe because it
doesn't perform bounds checking. Its use is deprecated and
discouraged, as noted in Documentation/process/deprecated.rst. I made
this change with that in mind, although I'm not entirely certain
whether it's actually unsafe in this specific context.
