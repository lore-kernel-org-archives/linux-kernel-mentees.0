Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD361FCFDA
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 14 Feb 2025 23:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577554; cv=none; b=IVS0Mpl9FN3v7gakUPPHXSrT3Z6mKoVr96RR4uC16C1xTlbt6RxS81iHW1HENuvz0C+lwQY8D8ZlxIF04Idwrk6lqdzZowyb5HaOSByKYFIr9QoMFEMgITJXH7R8Pho81bc21uy10JjGLnSOSjHG5nn2nsAJAUSBzlxfhQPShnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577554; c=relaxed/simple;
	bh=IKcfaSOrlMa6rik07ZTuSV19i8nzB/MkDugkDm7vSQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WED5liTSvpTHglzlCRWJObRmEswULsXjnB9esXg9p0GMF/lHDfVTbTvvZxSsLL5jhRx9vs2zWuYwKu3OHoDDoEAuhDoCJvyKCnnU2LfuP6UoqvY0/+9xweF5JYofarJjhuKNeU5DdwCZ9Z5AUURzB2+WBQLN5KTKNj5lKOZn4wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmZZXIoa; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmZZXIoa"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5fcad6dbce0so1320351eaf.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 14 Feb 2025 15:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577551; x=1740182351; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsZMzchGA3QydeH+K1fYzv4GOzw024lMC2SpfQz9ljU=;
        b=GmZZXIoabffp0jEeyLy32AA2FnGOpWoRwHmK17tmWnRuc/4PS2fIJGZvOP5kmvd7kJ
         N3ZETkEgVAH4rLQzR0EPzZQyP1coxqgT8f0zYY+I6ApqCdz2U5XxpFkqO9APO41udDuc
         wRmaoBkz5HQ3nfUk2UazU0ZdpZ0TQK+aLOHIKXX4yVbU8A0JJbskhoMX73zCNnlxMf5W
         czSLnD1y1EUJMnIIlCpkA77z9L0auIZeL2OFimzEM2rWnvJG4T3T1hHGsK9BsRYISW3A
         uGPjZz7sybgb2eLP60hd6vR6FauWa98ZZy0Ln90jXxc+Jk+CkZcDY9q3DXNyXHZ+VH1B
         wtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577551; x=1740182351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VsZMzchGA3QydeH+K1fYzv4GOzw024lMC2SpfQz9ljU=;
        b=crJysaIuhnKSY++YG+CjYfeoKCcaSoeVun5koDyC71ol2SZLEfz7fC8E1S3Xh66037
         IcpL0+/2cz6emnM93gnPd9zMH709S5ihH32eF62u2p7t4aAV3noDbiF4rsgbBiBzuuor
         b3YjmepEkeN/g2T+IPfr1120yspC3puSRV92oKuyFTh8Sf4YyAUKpl4Npi/fFcxJ7fz9
         Ly0y36GLaJKA6C8bqXbpVRYE7vcP91ryg6ceurPWahJCElbXwOALfH7j9t8dBoPskxGn
         Bn95hOMwFdtzpZfjLgszJjdIFwzYAdZH3lqbAa2XoJVynhxC1QT5+vhuO3uIRkArGtLs
         OpHg==
X-Forwarded-Encrypted: i=1; AJvYcCU9gJaQQfN0Yb3/FuGuclz/8l6m5XHGXnb2qKpOZGzTjZ5vqBpAgPBlc98oIJgXEV49ZcUiX+16uwWo2pdwJ9inSgBvEw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0nc5qakIiMNNFtjnQbcWTtURE90OpHC94UPUXRMu59EVSO931
	qX5WRInKgBpULbgaDCpaYw2eZPYyPPAUF1QvxJq4Xo56EqKR0htd7RVOsz+3KhwW4iVBGAWSXv3
	V+/+lMd/v/QHmKC0p9BEJBOU9T2o=
X-Gm-Gg: ASbGncume4w9v7dvu6wxOQL48VwsYTWB+gMgFxMNQ/D/63FGHOQdA9VOLRKXyGpodqS
	e0mzwfOdMa6jibP4iS4vTu9qhrp+wLBlvxfW897WtkPN1qbxpAY4IMDP9el8SkyHvPXH+dobxXu
	IxKn1+nMO1
X-Google-Smtp-Source: AGHT+IFDXsqXU7nxemKQ8UIjtO9+R4SjmrFn6EBErejTxGhpg2uKqfKRuG7esuN5AHZPiwJLPxeD8KGNq9/4re5xzHM=
X-Received: by 2002:a05:6871:8792:b0:2b8:69:6016 with SMTP id
 586e51a60fabf-2bc99d3fd2bmr612329fac.28.1739577551458; Fri, 14 Feb 2025
 15:59:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250213212858.710884-1-marcelomoreira1905@gmail.com> <MW5PR13MB56323A7DE07549AC6F7664AAFDFF2@MW5PR13MB5632.namprd13.prod.outlook.com>
In-Reply-To: <MW5PR13MB56323A7DE07549AC6F7664AAFDFF2@MW5PR13MB5632.namprd13.prod.outlook.com>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Fri, 14 Feb 2025 20:59:00 -0300
X-Gm-Features: AWEUYZkx1Vcgg2RvapSKHjauHh61L03etyMd--xgqDolH7S2Fg0OS24Srv-QYhM
Message-ID: <CAPZ3m_japqSAMG8svC4JWd8UAHRVnJ7ujCsSxZe0i+4b69c8mA@mail.gmail.com>
Subject: Re: [PATCH] Adds colors to kselftest output
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, 
	"linux-kernel-mentees@lists.linux.dev" <linux-kernel-mentees@lists.linux.dev>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"martineau@kernel.org" <martineau@kernel.org>, 
	"~lkcamp/patches@lists.sr.ht" <~lkcamp/patches@lists.sr.ht>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Guys, sorry about that. For some reason when I run sudo make kselftest
the colors don't show up, but if I run the test alone, the colors do
show up, like this: sudo
tools/testing/selftests/net/mptcp/mptcp_join.sh

I've tried sudo TERM=3Dxterm-256color make kselftest ; sudo make kselftest =
| cat ;

but it didn't work.

Anyway, thanks a lot for the feedback, time and patience :D


Em qui., 13 de fev. de 2025 =C3=A0s 20:31, Bird, Tim <Tim.Bird@sony.com> es=
creveu:
>
> > -----Original Message-----
> > From: Marcelo Moreira <marcelomoreira1905@gmail.com>
> > This commit improves the readability of kselftest results by adding
> > ANSI color codes to the [ OK ] and FAIL messages.
> >
> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> > ---
> >  tools/testing/selftests/net/mptcp/mptcp_lib.sh | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/testing/selftests/net/mptcp/mptcp_lib.sh b/tools/tes=
ting/selftests/net/mptcp/mptcp_lib.sh
> > index 051e289d7967..7b55855ff788 100644
> > --- a/tools/testing/selftests/net/mptcp/mptcp_lib.sh
> > +++ b/tools/testing/selftests/net/mptcp/mptcp_lib.sh
> > @@ -83,7 +83,7 @@ mptcp_lib_print_err() {
> >
> >  # shellcheck disable=3DSC2120 # parameters are optional
> >  mptcp_lib_pr_ok() {
> > -     mptcp_lib_print_ok "[ OK ]${1:+ ${*}}"
> > +     mptcp_lib_print_ok "\033[32m[ OK ]\033[0m${1:+ ${*}}"
> >  }
>
> This should not be done unconditionally, but based on the controlling
> and COLOR variables for this library.  You should also re-used the existi=
ng
> color print helper function.
>
> IOW, why is this not using MPTCP_LIB_COLOR_GREEN?
> or the helper function mptcp_lib_print_color()?
>
> >  mptcp_lib_pr_skip() {
> > @@ -97,7 +97,7 @@ mptcp_lib_pr_fail() {
> >               title=3D"IGNO"
> >               cmt=3D" (flaky)"
> >       else
> > -             title=3D"FAIL"
> > +             title=3D"\033[31mFAIL\033[0m"
>
> Why not use the helper function and the MPTCP_LIB_COLOR_RED here?
>
>  -- Tim
>
