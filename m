Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A227DA62
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  4 Dec 2024 03:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733283939; cv=none; b=JK1ibpcNp7GORPTHWjtt6XKXkabi/y0AjxEQVwz0/IE/CCYW4YqN3S8nJPKDwcoCou0PziACq+OqGgdc9T1s4JpWbetUnIH2mWZmmoSBPQ6dAgkBX/vuD3JXqF7Tm1YnVk2IEHdcIYSA2sBBJXZ+14VFmv4u0KcFHwIJQKIf0/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733283939; c=relaxed/simple;
	bh=z1XbbGsUJBtc2zHLxA0NJaY+IxjwSMN+nIlUbS9g7z0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cBFzvMEIwMbko4gnq0TbKMJXkBiezG67aBVOdKW6TC7ESDAaR/ZFJgpONSM33NEZjlblzxO85KwrSGlNHt67fw+rcsY/EHiOP2qDSwRVT+jZ+TI5XsTYUaSPCpwtei/L/df+C1++/Gi6/69apQwChFRFHKm8vI17cW4EAOB92fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=B8Py8SUC; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="B8Py8SUC"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e39841c8fd6so4817117276.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 03 Dec 2024 19:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1733283937; x=1733888737; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1XbbGsUJBtc2zHLxA0NJaY+IxjwSMN+nIlUbS9g7z0=;
        b=B8Py8SUC8J2iXiuocPdL7EVm/Dv/0r5GUkTlNLWeZ70ArTOIo+JUTTjIe+9t1vm9le
         lrUwDCVSlaOSVzCeQIDUuw8mjHkF8GefUXg9GaUoeiJJC50GyODdsc/8fIgbT3++3ATt
         0d5BYql3u+zWyIPB+lsa5hNiNsQ8u3RvfotDbQQjpgB9CfafNoW4EL6TLmqEzwJ+DISU
         t7rXOKa7ZjASQRs7yMRu8IKx46hpbqVv3LHouGwEGx/CfzrUdHCPhKnUj3KGIwFyRru4
         E5zkz8ekMbIBzLhfsibtmZQD2YJS5hVh4zoMXedBrSurP2LYjzt6u9W93XReRRVkol1E
         tNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733283937; x=1733888737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1XbbGsUJBtc2zHLxA0NJaY+IxjwSMN+nIlUbS9g7z0=;
        b=Lt7COk1gd7UpmRfQ9NEbBa5B1FQwqKnfFfqi3bIG916EZExCvz1b3mgMfDs0aDOpSc
         26yxohAMKb5hn3ka0rq12ZcpAfth9G7MEEibEE6KHl2jmt5V90f7mTpWkgFa+SLk9xmI
         bxbGyd9kBJ0N/ZtyCmbEtHqaNr37NlNqyCtegRKL/Zkht+InDk+vToWEio0u2znp6Mg/
         RXwI2XZTBCQ1oitMUwvKojiKXrOZYwv4VY/gfXY3PW2Nd2Qf2p9E0ne2Lg8jhH5LJtRW
         L9b5rB890k+Okfeyur1umo38EABbh1eF9vzoFdTfsOLTWJbwcYPtDMTKmyJk0dxfITw/
         s4iw==
X-Forwarded-Encrypted: i=1; AJvYcCXQTJ8FQlc+3oZLyUHzeBKX00HXH5yPpEmC35m0LzyIclBsQmpYSRi62W1kBhHPuHzZDT7Bpr1qgsieoK2NJ7lS0LVcag==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWccAD8uRbkoYRvPFys5KRrIG8iRocO9Y6cpfVeJ9JjPGELECl
	26bGyTXTPjZ46GYCZcHt+KQnUAlwJUoOI69yoiaavLvjDjP+UfYPYKgPlD9AquOnPQ8e7aDQxL6
	QgbPvDaREUkGS2V253ahOK2iTHEBaaCZqoJ8m
X-Gm-Gg: ASbGnctIV6B42AkliJgdIfQDqfaIUxNO6FIPsBkcFodc8cHxoz3cS1LTZBmBXQjGJlJ
	x0mNGvI5WhGATFxpu5mQwy1QV5uKNqg==
X-Google-Smtp-Source: AGHT+IEnXWo1p3qjR3U8AU/4Sw7qLma2QQ0LRrci3nJqI5tWuNU5cRLLQ8tXAXSK+umt83Aaiyni6AwdQeANpibv2VY=
X-Received: by 2002:a05:6902:340a:b0:e39:6c6a:f2de with SMTP id
 3f1490d57ef6-e39d438d9bbmr4803300276.47.1733283937166; Tue, 03 Dec 2024
 19:45:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241112182810.24761-1-av2082000@gmail.com> <52cc8e51-9e85-465b-8ee3-63a7a0a42951@linuxfoundation.org>
 <CAHC9VhTJERn54qNDDOwNrJ09VWrmq5Qn+sPQV__LyeEUgSi5pw@mail.gmail.com> <e8e6824c-61d4-48f9-8547-628bbbd3063a@linuxfoundation.org>
In-Reply-To: <e8e6824c-61d4-48f9-8547-628bbbd3063a@linuxfoundation.org>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 3 Dec 2024 22:45:26 -0500
Message-ID: <CAHC9VhR5NVHOz84RBzi9L+h=kqpe3RfaEXDa+87BCLPAt+Qskg@mail.gmail.com>
Subject: Re: [PATCH] selftests: lsm: Refactor `flags_overset_lsm_set_self_attr`
 test
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Amit Vadhavana <av2082000@gmail.com>, jmorris@namei.org, serge@hallyn.com, 
	casey@schaufler-ca.com, shuah@kernel.org, ricardo@marliere.net, 
	linux-kernel-mentees@lists.linux.dev, linux-security-module@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 7:00=E2=80=AFPM Shuah Khan <skhan@linuxfoundation.or=
g> wrote:
>
> kselftest patches usually go through subsystem trees because of the
> merge problems you mentioned. I take them through kselftest tree
> if subsystem maintainers want me to. Some do and I pick them up.
>
> I pick up patches if I don't see response from subsystem maintainers.

Thanks for the clarification.

--=20
paul-moore.com
