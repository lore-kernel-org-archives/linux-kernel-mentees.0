Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFBF21D00A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Dec 2025 01:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764811418; cv=none; b=pm6cVFxWVLgUp0pC+izploGyy3TkuxvcctxyxP7rapjtuZe4sfNVwyyXkAh11mpQrWuUuJ0n0WrKSDj4QUtrPN/fnqwlEFRD3zI+nptmhe6vYILw8n+VzbSkNoyTRoP8nfrdYT29uNcyeXtvu/DiUrbx78uipxqg1QbD/Jz3oJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764811418; c=relaxed/simple;
	bh=Uvh0yZY15GEtzECgHRv5Oh5uDOtYGTU0PpHMlDzRVdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CsW/InIQtEGye20CdG8UPv2vt/QhJQYuWQo0aemg9Hma279HMNlkQjfQC12oud9AmcWgfKArMRllmWGZzkeLr+V7BAKaCl1hvU9mFbx491eAGPz2FKn4roPLww6qDgGW+QhmQQ0JOmL55yHkNujgGnRJCv95Oe51oRyjtm+cBJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cm7laBDC; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cm7laBDC"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8E5A407BE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Dec 2025 01:23:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SK_CMwqmj7Ug for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Dec 2025 01:23:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 09538407AA
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09538407AA
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Cm7laBDC
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 09538407AA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Dec 2025 01:23:35 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-297dc3e299bso3588805ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 03 Dec 2025 17:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764811415; x=1765416215; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J7S+3a6m2SRWGZPl86oDbuprI5NM42FY1cIZzP35vOQ=;
        b=Cm7laBDCegXuGaOAKA3hRF2aZX8IMfDC0dNCFOz1DuTabnHMR3KUSsT/axhcBIgnS3
         7t12k6LNXX5asNFElWZwUqngG+WUX/hf+gZj/M6DbRVInLVKuQa7AkMS2Vcpm4gNo4ST
         9FbjkvtzDDHKDhmKyiQHijsII/PEIdjUhXjsIVMTk6WYTI/6FE5UPguuMNpwC2t6Va93
         LZFkZdVyJoVtYFRmCeuady3OM/zAark4jn9Ug8w9QgQuzojpSjkj8T1b3mKBHGP0KmAN
         6T8ieFfWaFNAkQ+Zrj8ibf6ALWQFp3oDiur6D2zq8OJjoWLOyDftGV7C+ctiHm5rXtlK
         zEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764811415; x=1765416215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J7S+3a6m2SRWGZPl86oDbuprI5NM42FY1cIZzP35vOQ=;
        b=VyDHJaxpM9FxtB1HNb2C3ol8TgpbOJsmUoVA3d/NBpzq7tCWbhZGdaY3B0ynyQoqox
         FpNR0RrPs8mVFal/BZ0rKziKypxG8xuM5mo0xsb99WYAhRgRy559k/z59AL0/Z0zv0zv
         VskwMEfryOjdROZuWOU+NUKczBOVGvVKdwQKVI3pXRRGiosWEfo97kycz2D8VlAYhiVh
         VRkIHmLK3K9H3YYiwBEsV6LYHz4nAtRzvMaLt2lliyg+AueYAbqmjKzyvuShyN2FP5rc
         2bI7diKR3viKBqtjQGATx3cdfiKOhHPHBR1E3x4MWNmBlIYmLcfybdiWpHkOQXlIs/U9
         qeDA==
X-Forwarded-Encrypted: i=1; AJvYcCX1QvYw80la+sBywEhGKCkXkkhyFs902uxSMSr+c3tN4NF4VIOxG0jifAYeppoiyvy/iMb5+65qW3AVAKiKuA3PyrfwqQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzZCHj4kPsRgDpQ4iuty+s+NzWl82/6SjI4EmfizZhPEEUyNNPg
	ZRgtTpfU0pwKUpopH+FPLmvY42qOVV2L7pj5fcjo2u+nxbttjPj4MU6Y
X-Gm-Gg: ASbGncvKgLTQryBTDG8faDqZGjQPh1hLcloUCdLljEcATuhgdFOYN1JiBlB+JBLyaC8
	rvt0IUgORFNclehAvkfXrlAxMyhqvtppAKyPyJsTez60w83hZns/urU7mbSZVGyqZOOXkkkuEm2
	d0qtIrXDNlT1tynNvNeEq34gOJffJ3JS/FMIsnOskS6EUo3ITyd5Qut6wzb5F6EZ1dAf7l6fMx9
	DfDsvV8fJDWqML/2v2Q/LxlTwLul+agH+3jr207hKVZ4JE+koZ9q2CzaDE8rPiDexhVDC0vzzQJ
	nJraVN091WewJQrIo7oUsxVzqWylTG6VQqiIDK0RAUQZBb/k4cxnZKIcrwEvN1smCqJn+ZWRF+r
	s5wxz859zg6nnrEeJTN6/urMjzuQESYEC3JFcJcuimJN3M1KtvDsgucgPOwIkE8kvRymKs4JRFe
	1r93o7MFTMU2I=
X-Google-Smtp-Source: AGHT+IFO7v+xzv9ChUChipH5utZ+kiuQ/BxDExY4ttC5HF2DSTum5pVPJ5bvBYUxIBOnKh910HxSJg==
X-Received: by 2002:a17:903:1105:b0:297:dfae:1524 with SMTP id d9443c01a7336-29d9fb658bcmr15363485ad.16.1764811415111;
        Wed, 03 Dec 2025 17:23:35 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cf9d0sm1674715ad.29.2025.12.03.17.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 17:23:33 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id B8348422D89E; Thu, 04 Dec 2025 08:23:31 +0700 (WIB)
Date: Thu, 4 Dec 2025 08:23:31 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Soham Metha <sohammetha01@gmail.com>,
	linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org, skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Nam Cao <namcao@linutronix.de>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH v2] Documentation/rv: Fix dead link to
 monitor_synthesis.rst
Message-ID: <aTDik5tn_5TR_-9B@archie.me>
References: <20251203182121.52759-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ExQ7Ve6pZdT2zuD7"
Content-Disposition: inline
In-Reply-To: <20251203182121.52759-1-sohammetha01@gmail.com>


--ExQ7Ve6pZdT2zuD7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2025 at 11:51:21PM +0530, Soham Metha wrote:
> The file 'da_monitor_synthesis.rst' was renamed to 'monitor_synthesis.rst=
' in
> commit f40a7c060207090f41998025fcd1cfad06ea2780
> ("Documentation/rv: Prepare monitor synthesis document for LTL inclusion"=
).

[also Cc: people in the commit's SoB chain]

Nit: For commit references, please use abbreviated commit hash (at least 12
characters; I personally prefer 14).

>=20
> Update the reference to point to the new filename.
>=20
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>

Fixes: f40a7c06020709 ("Documentation/rv: Prepare monitor synthesis documen=
t for LTL inclusion")

>  The wip monitor is presented in::
> =20
> -  Documentation/trace/rv/da_monitor_synthesis.rst
> +  Documentation/trace/rv/monitor_synthesis.rst

Thanks for the catch! Can you also unwrap the references (which are in
literal code blocks) so that these can be linked? Like:

---- >8 ----
diff --git a/Documentation/trace/rv/da_monitor_instrumentation.rst b/Docume=
ntation/trace/rv/da_monitor_instrumentation.rst
index 6c67c7b5781118..9eff38a4ad1ff4 100644
--- a/Documentation/trace/rv/da_monitor_instrumentation.rst
+++ b/Documentation/trace/rv/da_monitor_instrumentation.rst
@@ -162,10 +162,10 @@ For example, from the wip sample model::
=20
 The probes then need to be detached at the disable phase.
=20
-[1] The wip model is presented in::
+[1] The wip model is presented in:
=20
   Documentation/trace/rv/deterministic_automata.rst
=20
-The wip monitor is presented in::
+The wip monitor is presented in:
=20
-  Documentation/trace/rv/da_monitor_synthesis.rst
+  Documentation/trace/rv/monitor_synthesis.rst

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--ExQ7Ve6pZdT2zuD7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaTDijwAKCRD2uYlJVVFO
o/hyAQCZTtG+Npjdwceg3B2fWEbRK/dfQs5AlrpJpTI4YvX0SAEA3EOr9AbpAW68
ivyGkRfmr5ezDnFob0+1riZRH8AzDgQ=
=SD/G
-----END PGP SIGNATURE-----

--ExQ7Ve6pZdT2zuD7--
