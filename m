Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88C33043B4
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 30 Sep 2025 13:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759239226; cv=none; b=h2YEa9wtx1Q3xQI+OGauc6fio0EDEGM0PSXGpDhPEm/H1kvI16DDsmC4lcIMB9bSdxGsj9ev7R/CbWy4c5w+9ysVRyHXNdTd51s8sUMB0UQS1A++wP3UBhhg7R33NXydxfXDmuhTOOC1yg/WrooA8M0qPSKFNfC202djwzVPbcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759239226; c=relaxed/simple;
	bh=CUHSymEOsx6QYL2fbPXy3esCdme3Q/bVDiY03oECVro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQFSfGGHf+bIzjsb3EDbt/vmZV+jmgOlbG3aeNfLWtILZT6UCIOGUv+icplqOP5PrHFJ9Bz3s4TxX4wlPRDoikTeBy8mjdD6P6u8CCBDHHhxp9hAXr8nPPJvHC5TqRAXePMRVgNcagerTmYm+UkcVGD88VTbgM/f+WZkoMkajzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MdPUHGhT; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MdPUHGhT"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57f1b88354eso6269419e87.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 30 Sep 2025 06:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759239223; x=1759844023; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUHSymEOsx6QYL2fbPXy3esCdme3Q/bVDiY03oECVro=;
        b=MdPUHGhTMqP4gYK0Yc/5hekavruPAQkmDFI0fWw3DPkYHjdRpx0xKxiZ5XMQXnwETe
         Rxu/OorR+yi9Hr7ArTf7sHoAQcULxapdJvyqZMzkBssSRPlJ0/IPNqArljSuec9rEYHP
         jsqezsLhWdFH5dTE2+RmPzO10asbaCt3vV89vxWHjlX/qJFWJcs+fKh8nkHybBFhsoYY
         +U0ju6695fTLuvb5wmgUOiw7cLKM86+sTqM63v6wSwgr/swmF789YMPwVxzaUaQRmFH6
         QT3Jjnu/TkZ9wL5MKc92hV5AVgjc4iY3DoPhta+Oqdlj8Her4wmO2MyUq/r7j6rM3K2Y
         5OUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759239223; x=1759844023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUHSymEOsx6QYL2fbPXy3esCdme3Q/bVDiY03oECVro=;
        b=WUv9AG6c+9WFSkxl0O3DWd0FeBfl5+XpyW+sSf04CQWRfoTlUWk4LE5RRVHKO5vCz0
         XLS88OOduUEWae79oBQdZPkflUnnZLFtsi3FmTlX9USsqt2aSGqsOQkbH8LiLYQT5Amv
         pj9Xl/us/GYIECjtCmDUjczHYn+ivEhfSc30zUKHKlSfHVQsC0ISQLw3YjAP8o3YVYxl
         lIfwqprpiGBuH2E5LuHAbdj3ONntyWiMdtRDPhPu+ztYL148LbKCl77tbwc+r3nTlliJ
         R9Oh7X57dl789itz2ItE5KWnRM5YkxzIz8+TseeAlHPIEW62di5wLQOMS2Ll5q6wf65c
         1r4A==
X-Forwarded-Encrypted: i=1; AJvYcCVEIjf1F5aSbnl9oJ1fckg+fTq6MnyrFyexpnDgLqeDfcnf8majAOy2KHj7AoEUhndD5aituG2LXAaoHJ8ZMZ+DIe//Qg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwnaL4tW38PRuttP/ugCpOxh/P5SYzDhJW4L+CagBufgYtQKfkA
	9J/OwtWBqsmNoatFPS36FmUsqR/7xLe1pJYX4IHdUnP9NUSB7bTymQrHMoNt0s9xCOC/gGncATq
	3BzE8U6ECoqxTfAm2np7Lh6w6SZX+D7Y=
X-Gm-Gg: ASbGncvdaN2lDGYqHTyK3aqM8oymLX9Hga7KjLMR3Z6/Ln+Z0hrRFCZ1APyxjqaeLRo
	gHrxiqtTj9KCCbyEJts+M0HZN98afW29H+SXX3tOGHLuworxz+lO9CKJ5G7iDW9TsHPF3f4V6ZD
	UZ61shjeFRriucQ7LaPJiqWWvfOQ5k8B2q8Ova7QkP07J0LCy7fD5ltQ/tqajOK/T5wqdWsL5KA
	uhwOIIj4h1TX+4xF9OvG2hr64xm8GTrahDxEluctNbhY67WvQZ4LEXEAbAcYeVVYGDba8WMAmAD
X-Google-Smtp-Source: AGHT+IHklcHPlmAmlLHJfII82jQFE7nA1C/gtspMIjp1MvgO1gKErD/Bs5XD5EbGRk/fHn+Fmc9Tezs5wGtRpvXmEgo=
X-Received: by 2002:a05:6512:114a:b0:57e:6aef:3ffc with SMTP id
 2adb3069b0e04-582d073fab8mr7062564e87.4.1759239222574; Tue, 30 Sep 2025
 06:33:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250925204251.232473-1-deepak.sharma.472935@gmail.com> <54234daf-ace1-4369-baea-eab94fcea74b@redhat.com>
In-Reply-To: <54234daf-ace1-4369-baea-eab94fcea74b@redhat.com>
From: Deepak Sharma <deepak.sharma.472935@gmail.com>
Date: Tue, 30 Sep 2025 19:03:31 +0530
X-Gm-Features: AS18NWABMwr4GHfH6IVP_7STi5E4UNpJ7XZKnoK6x2LnyMMJxfQrcgjTzeg1wv8
Message-ID: <CABbzaOUQC_nshtuZaNJk48JiuYOY0pPxK9i3fW=SsTsFM1Sk9w@mail.gmail.com>
Subject: Re: [PATCH net v2] atm: Fix the cleanup on alloc_mpc failure in atm_mpoa_mpoad_attach
To: Paolo Abeni <pabeni@redhat.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	horms@kernel.org, pwn9uin@gmail.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	david.hunter.linux@gmail.com, skhan@linuxfoundation.org, 
	syzbot+740e04c2a93467a0f8c8@syzkaller.appspotmail.com, 
	syzbot+07b635b9c111c566af8b@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 2:15=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
> AFAICS the mpc_timer can rearm itself, so this the above is not enough
> and you should use timer_shutdown_sync() instead.

Hi,

As I understand it, `timer_shutdown_sync` will prevent any further
re-arming of the timer. I think this is not what we want here; since even i=
f
we somehow fail to allocate our first MPOA client object on our first
ioctl call,
and hence end up wanting to disarm the timer, maybe on next call we can
allocate it successfully, and we would want that caches are processed
(which are processed for every time out). So we still want it to be
possible that
we can re-arm it.

And as I understand, `timer_delete_sync` will wait for the callback to
finish, so
deleting the timer after that should do the job

Thanks,

Deepak
