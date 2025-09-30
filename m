Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C312236EB
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 30 Sep 2025 15:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759245206; cv=none; b=ZnpdXPNH3I61GK9nYhStRdgp+4oavjQmJXZgMNFRU+sjbegq/v+xtThYSZ/l7x3ewRxMuupjy54+7qAE4FwWj0JeEK/uY4YEZvDDbbgMdTeJOg/rramp0rfwErLIOtnVrftl1+oRuR8kr/cCU0eWX3gSLdqQVxhWQElhbrEIV3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759245206; c=relaxed/simple;
	bh=BSewBfFWhJBl490BIH5OZ5knEj952tmRcHjCLHNd3ws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eNAhVPoOJVS/iQiq+TFX/L88ENFaOFgkDSq3ZKNeHMdZgODHsZpCsIIM+4nHdcAyfKUhQv4s3hfW4Xt2XUpa0w4KL/oaW9tQtyfDQdpVOP5g4h+lLRFGPM3gVeTSPhf8SPE8SeqRX3jaW9HpXiFhnKWzMhyl4jr9V0a4wGM5kHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmENx1mH; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EmENx1mH"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3717780ea70so46830451fa.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 30 Sep 2025 08:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759245203; x=1759850003; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSewBfFWhJBl490BIH5OZ5knEj952tmRcHjCLHNd3ws=;
        b=EmENx1mH2pokfC9CQCqsHuPhhW6+CUTOAcKL+YpqtMDyUyZnjaJfU5VJMnVtFfqKbk
         JUx8nt4h9xbaScOyno8KZ1CqZ3s38jU2As4Isxf18/JGixNKe2vM1IJat9YldeYxjqug
         ADY+aYnB6PrixhSPiDhwHUPqILQ0MxnUBpzPlirhE9LKVkaM/OYHnO87+1P98wVoYLq9
         yk7Xv2VDkiIlqN56a8Mfq633DUwpN6Ui8dHZbRGDr6MwWLmYHvKXRHwX0lQgpmL6I1mW
         AE+ZhnmxB2vLGD/4v5olluK3eOVJSipJqSBK9dp9Yh015maTlXYawTOpD6TyGu/iMGfR
         8VjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759245203; x=1759850003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BSewBfFWhJBl490BIH5OZ5knEj952tmRcHjCLHNd3ws=;
        b=BG+CHYqPi/wmGG7nsXNxcckkxeKRimAMBiAtNH2/VvfAycoXGVLeJal2j/LjISYOm2
         cfh8BBPdZ+U2NXc4j22Ii3klrod9WE0N5U9rqirIR5Zj9vzOjWHHcXzOmL7XD1utrmus
         c/tk3+VMS5CHijkIYZw2XPT17BaGDalaeiTi1BhFttnbwhJ5N8QPL+JaAnd9faBgNLox
         7e8A+qZ8gkEKbSGfyTiqnnoAficK2pOZwW5Ow1Bmb/nibu9HtBDHK/XFvdD5+t8ivuk3
         V637fFxil/01kzkjM+RXiTFtTCrg3cV9iSHMUIQtUOdjaFar56Zmr44oKh8+GoGIqUWL
         +O8w==
X-Forwarded-Encrypted: i=1; AJvYcCUL6Xra14LA9n8pZv9bFD/V14hrv2eLRiV2ydhy6GYNtCAqrWEzRxKXn8eTOQqNTbZMRRoQi+VHqpQ4imbRKs0jHn5ThA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/HbJcXldm0wKsYzzmhnroN2bDb1qjW+x3xyK73L3JV3JdpkjP
	DGGslUzyCxdaX3ujAzF/CxJ/rdvIKwOD2BpMb0VR1ZfvyXpsvUg3Hy+++PtG3S7XZMrKQIJlYX+
	0UJqjEBx7WrVtSPc62lgXKeZml57u8go=
X-Gm-Gg: ASbGncuOFB5v0jcPbj7hlUqCGnNd92SC3jRdD7c2kxD5Mt8U43HtF5fd0QO4PRBbAoB
	L4Od06Ccb5FV5+GHLf3I0x8Qd0UmYV60Knlib03zEk6fEx5q4N6e9xn/EGsuVyBmfqQRzO0C550
	t85JmmAD3ixb7Dpi54MgAl6KvIIkdcmLDLd9ikjAgcBvp/XvmfggO2QLxQQsKhQsZrn3xcjkBvg
	Iahwx4JCjHXtD/aQNeVsO8/BH7N8zRJqqm/yPxQFk345s/ewOnci4CQdMmaPXCwPyuZLg0jkkJJ
	eJx1VnP8i42OSCl2gI32Fw==
X-Google-Smtp-Source: AGHT+IF4toYIrIqD3kiLsHfmm4JRYPSghmYhxXGwVPbDmOVVXAkp72RxcbXIqWOsLeoh54cMOZe90BiMurhEoL3Goy4=
X-Received: by 2002:a05:651c:2542:10b0:372:90ab:8bfa with SMTP id
 38308e7fff4ca-37290ab904bmr26694711fa.37.1759245202296; Tue, 30 Sep 2025
 08:13:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250925204251.232473-1-deepak.sharma.472935@gmail.com>
 <54234daf-ace1-4369-baea-eab94fcea74b@redhat.com> <CABbzaOUQC_nshtuZaNJk48JiuYOY0pPxK9i3fW=SsTsFM1Sk9w@mail.gmail.com>
 <377697dd-15bc-4a2d-be19-1d136adb351c@redhat.com>
In-Reply-To: <377697dd-15bc-4a2d-be19-1d136adb351c@redhat.com>
From: Cortex Auth <deepak.takumi.120@gmail.com>
Date: Tue, 30 Sep 2025 20:43:11 +0530
X-Gm-Features: AS18NWCPx3KYKK3cvUH6TSzAvXHruvjzP3zvXDvzd6ohqBVPIRDoOlk-IyqoDss
Message-ID: <CAC_ur0rRtuVS7GTxUuEU=yOfrsTRZH0dcGwgoQCy9wB_b6pE2A@mail.gmail.com>
Subject: Re: [PATCH net v2] atm: Fix the cleanup on alloc_mpc failure in atm_mpoa_mpoad_attach
To: Paolo Abeni <pabeni@redhat.com>
Cc: Deepak Sharma <deepak.sharma.472935@gmail.com>, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, horms@kernel.org, pwn9uin@gmail.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com, 
	skhan@linuxfoundation.org, 
	syzbot+740e04c2a93467a0f8c8@syzkaller.appspotmail.com, 
	syzbot+07b635b9c111c566af8b@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 8:01=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 9/30/25 3:33 PM, Deepak Sharma wrote:
> > On Tue, Sep 30, 2025 at 2:15=E2=80=AFPM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> >> AFAICS the mpc_timer can rearm itself, so this the above is not enough
> >> and you should use timer_shutdown_sync() instead.
> >
> > Hi,
> >
> > As I understand it, `timer_shutdown_sync` will prevent any further
> > re-arming of the timer. I think this is not what we want here; since ev=
en if
> > we somehow fail to allocate our first MPOA client object on our first
> > ioctl call,
> > and hence end up wanting to disarm the timer, maybe on next call we can
> > allocate it successfully, and we would want that caches are processed
> > (which are processed for every time out). So we still want it to be
> > possible that
> > we can re-arm it.
>
> Ah, I missed the goal here is just being able to rearm the timer (i.e.
> there is no related UaF).
>
> Given the above, I think you could instead simply replace add_timer()
> with mod_timer().
>
> /P
>

I think yeah we could do that.

I have just been going with what code seems to have wanted to do;
Arm the timer if `mpcs` was NULL (no MPOA client existed)
And if there's any error, delete it as (was done in case of error by
the `_notifier` call, where we have no MPOA client yet).

I just extended it to the `alloc_mpoa` failure too, because
in that case too `mpcs` remains NULL

`mod_timer` would still work, because the timer callback will not do much
if it finds the `mpcs` to be NULL

If it sounds good, I can go ahead with it

Thanks,

Deepak
