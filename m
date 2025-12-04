Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED669329377
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Dec 2025 08:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764837600; cv=none; b=SeXKpc5gtaqHTXVXFGOmFF3gvnkf6Wb0lMG6ZAIgxVXRrBRa0RKAkG5/JDUiBfqKeHSzOks3nOT9HKaBGHG6SF3kSUfIn9C++5aeehuj9tuUpnPBchT2AJ7c3nDpXSZeQJS9I7ByM4DCWQXeAjnAfm408vBMn3ZnklZA2IB8G94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764837600; c=relaxed/simple;
	bh=OxJcYZ/t0IbTZeUHzN5FgPnszKPCjA/MF1pi2URYe70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDCINhs49K/owM+HObhT3oV5grMVtHvFfU0lkOQ1WY92sSoRUUtTJGyGF+sPf2qXgSO0PNQIXpSYbiF2/jdsFpAfTyZBX6+IZ9OaIM+PfVLe778hfXOKzv45u/i42ZtEk2BRx3ZvnjbyqA4DN9odpIkX5y31cIde/MBPXlwCpgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJCAEqxf; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJCAEqxf"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A41A60ACA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Dec 2025 08:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GOrPJJ1KirCl for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Dec 2025 08:39:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE0C360A7F
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE0C360A7F
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kJCAEqxf
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EE0C360A7F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Dec 2025 08:39:57 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2958db8ae4fso7208745ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 04 Dec 2025 00:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764837597; x=1765442397; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d1JNxOjk33nzB6A4jXH2tWSnqUE8y1O3Ojrn7T5hKfk=;
        b=kJCAEqxf5qZqqrvVlipTIcgW5zhccgeSSWPxLkvpO86/sWbdXBu8CqWR3+V11n4tzr
         VO9m0aoNybZD+PIOSe39YXg3cBE4BW81cT0s15LggJP3ajcmzCnAKfxG1F9bLQM0Gew8
         SF7L++HQYyOEu3d3IirxCSQ4fNzsp5hnn28g4Q5NYawVVGxpxMpTLqHVtC6/EUCAi+WQ
         kcJ9TOhQXyPY4TWoJpWuUWuiIQp9vGsEqswKg11JxNCN6bF0Ry337NdIrbDFL4tDRiHH
         fjiYnVw1Ifn1z0vJ1yaPi5HNEMEh7JDguC6VdFl8p7rnvx1Q3ahj1Kb/mRLLwSmzviIZ
         2Urg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764837597; x=1765442397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d1JNxOjk33nzB6A4jXH2tWSnqUE8y1O3Ojrn7T5hKfk=;
        b=Yi6hHTd0qyYy0U4elR0+3rRvcR5huGavWiFlcOjZp5GpwEHeG1uIFo4Xv/a6hn0KX4
         ULps1cNQUELGPbVzhFr6Qv36h/aICDDqsNw20UnXQk8YqnSE9ZMK/TdbEeEjoxgJu4Xo
         kPIq6gDI43ySvgRZp6UcfhWZyVenSdQPIC3e5CNQZcAVijiAkiMSHd+fg9GFHtNi16p/
         qZhljNxCX+WXevLv86jitA0UvjalFZ9h/CkOGRmvH7HcPjTUueQFrcC+WUUZjxIC/C60
         8hKbTO8oUX+El2GbBHglPtYXCA91/sb77vO0A1lUOYss4ZfJQ6/7A/yelxPzNxXbJwOj
         IIzA==
X-Forwarded-Encrypted: i=1; AJvYcCUrSp+6/OYZUn2heb52INapDILOAAdTEGgI/LntKWp9QJKf7XscMDvsDaJqJMGS6+BDjG42JRPLLN3nnYuA+g9bmJ72Zw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyI5v1kwkmWxmjdvbYI3pzYgZEZ3+aqyIhX5c/C8LGaeoBVQDjk
	n7FtzPWny7/ClGRLHJXumzTek2dRVVlMm0fRBLuYRrgtsd3oM+I3ufpn
X-Gm-Gg: ASbGncv4kFCh8+C6NfAgyn1MudODgPe0AC3MdnHHG5bos5J4l05BEsdg1xfBv9d/5vS
	3mNdQcyHqWoO2ttM0VkFfEwxpCe+3PiQlOvIhz0T/1GCDnRqx7f0v/vl2g8jivtRytY2oOkLwNf
	eXFSQUQ8Y2PiyMEOc1vPzJ/CbP7EhNooMhlx5QjNfJiyawx9d8bW9sGYEUrVPaPKImn5AgCOsNV
	HvZCo+5SkReAGgQqGR0hiZikqh3wA9i7bhR3NGbrCF0vRbhOIXgV2n9fe1EsST+XKGzPXZi4bQU
	Y1VRXDpEXYwCfRfpZJ5oa+uAaHcNopyE/kicZrQ/YMruy4DcXlSve28dSzgVh358/59vXHu4wK9
	k8GzQT73Pj9AhZOwbRdz4wShiMZgGMrjSlFMHygqjA5t1UfLq94roSi2XI/g5yMZ1ioIRSaS/za
	sID/7fhWzUgFw=
X-Google-Smtp-Source: AGHT+IGPazSTtY6VVQpikAdMDTf95Vk0b10d8Tb5c077iSAqlm03M0R68qba9fqHpOhAjsCCk1ni5A==
X-Received: by 2002:a17:903:246:b0:295:7453:b580 with SMTP id d9443c01a7336-29d683f077dmr69081945ad.58.1764837596595;
        Thu, 04 Dec 2025 00:39:56 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf6a14f40f5sm1096665a12.21.2025.12.04.00.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 00:39:55 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id C893441E4822; Thu, 04 Dec 2025 15:39:52 +0700 (WIB)
Date: Thu, 4 Dec 2025 15:39:52 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Soham Metha <sohammetha01@gmail.com>,
	linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org, skhan@linuxfoundation.org, rostedt@goodmis.org,
	namcao@linutronix.de, gmonaco@redhat.com,
	mathieu.desnoyers@efficios.com, mhiramat@kernel.org,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] Documentation/rv: Fix dead link to
 monitor_synthesis.rst
Message-ID: <aTFI2LDNLmC1osiG@archie.me>
References: <20251204032452.9523-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Aa2dCrHsQWzPoz9c"
Content-Disposition: inline
In-Reply-To: <20251204032452.9523-1-sohammetha01@gmail.com>


--Aa2dCrHsQWzPoz9c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 04, 2025 at 08:54:52AM +0530, Soham Metha wrote:
> diff --git a/Documentation/trace/rv/da_monitor_instrumentation.rst b/Docu=
mentation/trace/rv/da_monitor_instrumentation.rst
> index 6c67c7b57811..9eff38a4ad1f 100644
> --- a/Documentation/trace/rv/da_monitor_instrumentation.rst
> +++ b/Documentation/trace/rv/da_monitor_instrumentation.rst
> @@ -162,10 +162,10 @@ For example, from the wip sample model::
> =20
>  The probes then need to be detached at the disable phase.
> =20
> -[1] The wip model is presented in::
> +[1] The wip model is presented in:
> =20
>    Documentation/trace/rv/deterministic_automata.rst
> =20
> -The wip monitor is presented in::
> +The wip monitor is presented in:
> =20
> -  Documentation/trace/rv/da_monitor_synthesis.rst
> +  Documentation/trace/rv/monitor_synthesis.rst

Looks good, thanks!

Fixes: f40a7c06020709 ("Documentation/rv: Prepare monitor synthesis documen=
t for LTL inclusion")
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--Aa2dCrHsQWzPoz9c
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaTFI1AAKCRD2uYlJVVFO
owDWAPsFTN02CmAMNm5Y8waldi4Tx2eTHjk62BbuOuMDQZvphwD/eRHkMXjpOZM0
s9c3nDzj2FIK8I2TpfDNUaAhIJ6fpwo=
=/qR7
-----END PGP SIGNATURE-----

--Aa2dCrHsQWzPoz9c--
