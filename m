Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EDB2940B
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  8 Oct 2025 00:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759882136; cv=none; b=gvLrN1I1almp3nWt+hcuo5OR4Z3Qgnxvm6OLrOZs5juCnvTDOxJFAUAKC4Mp6qog6sjxukqLOXtqAWosyBiheh4DWvIacHSkiXRfgg+Sw1guwrFpZViB5xrSHp3UCAG/YKPZB8+daLzgUEe3NMaNLTsWyVRoDidInMK+t6V4BPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759882136; c=relaxed/simple;
	bh=TzNbj5F09hehstERxCAIDX4BS8a4whqVaxlUmycH1V0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jeyEGIstTg7oUwppsoi2aLQ2LlHaymCzIvpP98+U1yUUIPa9o41sdogcj0DeDejWmh/YYXNowndBRCEY/ocX12GPVNqY6cv685uAhu1NJjOVqWWoCJAnNpAzaNmvyK9QZlDn6KfQII72vqqtvWpJjZsCqWltSbZdv0XviusBBiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZz8oR5S; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZz8oR5S"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b6271ea39f4so4225348a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Oct 2025 17:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759882133; x=1760486933; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TzNbj5F09hehstERxCAIDX4BS8a4whqVaxlUmycH1V0=;
        b=bZz8oR5SQE2B0jc1PY3s5kXDrLtKEoY8r0H5UtQUPFxr/bEsntBDUcw9kX6Bn/QoDC
         yHNcQGQAlGV2HLDQgVxs1iipJkMJiZaDS0pw+e+Nks6B42SZEj2Xsk/5CgIya5LmVC9w
         JujKqND7nw6b3h5bX7r0+/HDdEYlqudT8WVIR1Bc1wOA1IU5OsiTLPeBH9+MY5BfWlHR
         oyrgGXTBEjDa+9xI2Mhh3HeY+jOqQFFT/0cMQhuMFvFf1qb+JBCmZEmSjLPlJedQBKce
         2CjOPqemxDEFONrFxi8iCNyxjhv9W6sCD9QR40hpAJuKskM8rK2tIMXnq6MF3VwooIpE
         jGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759882133; x=1760486933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzNbj5F09hehstERxCAIDX4BS8a4whqVaxlUmycH1V0=;
        b=ElU/eGeuLrwmh1NxdmhQBBMS9J/bTp64gL0J7umAMGi4NxfRUUGg7eor7s+E6pgNxF
         skvtkze00J4NRfAebSwkZlA2VfUImn2bNc1vPyjAJkYacTZB1ItFX8at8ZfmMTVAbCaX
         f0qd5e/NTJ0peaUwu1/84dVk+pYmkPTPiX2lu9Cd4RMXyXGAxS3DoRsCx899KwuRDSW0
         ROrfqB26QzWnJSHF+HkEsDnnbaHp8330esbmgJoP7A5FHDLSJmFfsstr+WACIpldylb8
         W6H2kYIGpZx9l78kuylxROzQ0bESxWWOOe0BdeviVYxPSxxnXb7/qN02hJcvuvEhHEsH
         d8VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEw7++zjnBlSzyGUdRKxCx8n6Vy/R+ykOVH/oPCi6ooPVCCIh6f6II1zeTYHz87dxjxV1WJeUyeEMtWFtb/lfhly0dIw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0biuWU9FYhp6ctoF+0VMJpK/eKn1pUcHRnx4ZfPx75utlSgaW
	au/Y8egO3zJdchxGfnFrU/l/f+ETM6BAc/Dvlx52iJ4XgSlr4QG4HQ+i
X-Gm-Gg: ASbGncspXphGhiOm20H2i26SIkK1mMR7jQ2klKO+qTb5zlBOUjA5mfOv6zJf6lkwDkX
	YuFqmobNQMk4V34x02+MZdDKBxBTIPTtcfYf3f7sC1T4LjwCNgi3KDvFEuEmm4nzXOsPXcRgJpz
	1hGGpQHkXC0uBJ93Nxyd7XsuSIjJiHsVMzT3NpWOvyRTloxvUYo5+pH4bJShY21PhaLlDO34oJg
	FxnAWIwGmxu6hQAObUYI28CmjYrLgnakykgwWcpI6ObwzbEMx9azq7F4NZfnsuF0dAdW4t5DlAy
	ErxDZLmlzqrdUPz3bXRYUaJhrKuAljYMZhOnW/BS8/xlAYYQOO/YDUkOKTeOO9ctUobr2FDbqFx
	Kc7HkVwvCIMAaIisM3GJ63+yodZdGBnacaZyKPzqTcad/OQK/Fw==
X-Google-Smtp-Source: AGHT+IFz4iqQnGC++UNb9avJGyf7WNgIxVS5Iniz0mvnqB7gDtzJOUwL4fBGjQJWpj0aVrcA8Elc1Q==
X-Received: by 2002:a17:903:2302:b0:263:ac60:fc41 with SMTP id d9443c01a7336-290274030a0mr16042285ad.48.1759882133374;
        Tue, 07 Oct 2025 17:08:53 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1267d7sm178391575ad.49.2025.10.07.17.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 17:08:52 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id A68294233430; Wed, 08 Oct 2025 07:08:50 +0700 (WIB)
Date: Wed, 8 Oct 2025 07:08:50 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, rostedt@goodmis.org,
	corbet@lwn.net
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev, crwood@redhat.com,
	tglozar@redhat.com, costa.shul@redhat.com, jkacur@redhat.com
Subject: Re: [PATCH 4/8] Documentation/rtla: rename common_timerlat_aa.rst
Message-ID: <aOWrkhlBoKDH4fRi@archie.me>
References: <aOUMyGvkibvOV0IS@archie.me>
 <20251007185508.40908-1-krishnagopi487@gmail.com>
 <20251007185508.40908-5-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UKApmRWlee9TbfyG"
Content-Disposition: inline
In-Reply-To: <20251007185508.40908-5-krishnagopi487@gmail.com>


--UKApmRWlee9TbfyG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 12:24:53AM +0530, Gopi Krishna Menon wrote:
> common_timerlat_aa.rst is intended to be included by other rtla documents
> and is not meant to be built as a standalone document.
>=20
> Rename common_timerlat_aa.rst to common_timerlat_aa.txt to maintain
> consistency with other common_*.txt files and prevent Sphinx from
> building it as a standalone document. Update all include references
> accordingly.
>=20

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--UKApmRWlee9TbfyG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaOWrkgAKCRD2uYlJVVFO
o15NAP9cMZH7s50QpPUQSGh96FcYFqRpcCt7ov3hAmYqpMrSTQD/ZF0oz7pf16FU
vZKihKt7nGCu8ziutqKJOZ38dw3sEQg=
=whcv
-----END PGP SIGNATURE-----

--UKApmRWlee9TbfyG--
