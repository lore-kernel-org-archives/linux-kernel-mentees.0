Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5311E0DEA
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 26 Sep 2025 06:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758868431; cv=none; b=DNO25slsGGbc15o5yY1CtRVT1+swQCFAOMtkiiP+KCaTeOOET4+gyMOuOB1VKlYLQb2uG+MyNoca6J7PClGQlbWLO1AbLLzmd7boy56hwe02oUUpklEOMClmTLzbIwC6sgKNip4j06HfmDsXk7tBwh0Rskf0sqsq5YHmjGQyNxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758868431; c=relaxed/simple;
	bh=174L+H8kVDJsRS4TQ2VP/VcKaCyBSEO08UA9BTwVNws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzfxtkKKzK+4DdJzqYCAhnjHzZGHDNRzUVw4Vj5HoB7uMoI0uSCsMscI+RaV9U7LNbi37bxazHprZE5th+s02qYhRrk+ZHOMyAjsz5Lqlmk1/+PJ1b5Giwrz+3ecivnsQRhfLpbaPZ4xvl260w1ggaZSp+X8U8ktcNlp1yRv9PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbZdQtE6; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbZdQtE6"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b4fb8d3a2dbso1555765a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Sep 2025 23:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758868430; x=1759473230; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+NnL+BauktpgcQs087RtJ4g96feiVuu/zAj/7KT5F/M=;
        b=lbZdQtE6MpPwl2jV0DLFDQr59KR3meGqcKfnR9uf1qbpM+dIMklwKN/bfF1ebYoLEF
         r4VfBzjKAfYz24JUXflLFbfyH5WpT0iEhGcp85vNOdpaR3ZB3+AdDVbW9FpQHASwieHa
         vWZUckgKkGS2Xy6t3KGccz7xl6C5xOwvmRr2njQvU1oPV5znmzrU+0g5gGhtqdnK64cS
         deN+lXUIIg18NOtyPjHN56RbLAsFjEp3r/Ucty1kSoRELDJQJfKqCildX7W2GwzivhhM
         MbXe8hSe/SZD0FukMO4ALUenX7ugbJUsn3CJhfSyem4Z4cZ4BoLKpNxSuXrGm08ewAEx
         yNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758868430; x=1759473230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NnL+BauktpgcQs087RtJ4g96feiVuu/zAj/7KT5F/M=;
        b=rNVufsgS5zbt1OM4FUZ1jtfHhSi5dfnruAp4dW389I9Rg++l319c8JcpHgK7JunZqL
         4JoYfvTXY2IPAzFMxQ+9z+u4viYFkflNUC3223LgIEh56atR9awx/P3qs4Mb086S8psx
         D3EDp68YKp7rzemepHLWYvRqrGFFfVhC/x1OwxWBlJoSRkn9jbDQowW+gF59acYsBM+d
         BkO6iHNTmyc3UdwDl/YIgZDApgzMeXlEnRDCvCPaFTOR4A4aGF9nZm8PyjRwQlm6pSHe
         C+Fbbg4OkqlGzLSl5GKScg4YpAmf+RCmzoyrOGLDoW3SxDH9pbST+IklfeWNbFiOaMQw
         0kpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOlZ80tHi6FtEaWteLj0fAACjZAOhj4i/+yIXYXWxAyA80J/3LzjDohPbuRvQGAvwmDNo/ePzjB6ExQk5pP/FnfN0Qbg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxN+WYN51l8ffakLCDK3pvTkYaT6j1GIYAdf00FcjljpkCQyQas
	SucyVbm8lCKr14zSq+kJR62q81/f9yAwAP5oyKMAX9GNBxolAPaqQPCw
X-Gm-Gg: ASbGncuALRGUKESAh0/1+Epg5vTsnbME4V/sFDJH4ndTpzaXRRRoA4iIwZ0cg6JSGti
	G3J8R75+MzCKDh5nUmg0nUhi5pftCYXN+/Egi7q9Cbr77QTjMsAHvKeRx7nalO5L8O6SsdSYB9R
	DcHK3UZ7jKkX5NxBujTc7/KuhjDkU/M87uiYvI5Tk7vCS6Ui2A4D7aT6Y+t2mpXT7jrC4cALEnr
	HF9pvJEeuMAYxyOm5M2+IVQp/GvFRhZNO/aPvQJ1YPg8GxLjmgiKxEiy4qX9vUFavyfnntf4CMI
	bV6CCQOHUSlW4XhXt9WVsMfFAdfneIX/v5jMDcBsvfcfdrCwtTiIYgHmgdmTnb5zUYM23N95oFi
	FLLrAkS84RTmTdT7UT7F4G8uZQA==
X-Google-Smtp-Source: AGHT+IE0W5KQPINQ9maEbC4Ovq+fa2iuSq15k4zps/1QAKqt1SuUwSmW8vclNmWC+/aXcFppv6YVgQ==
X-Received: by 2002:a17:902:d487:b0:267:a8d0:7ab3 with SMTP id d9443c01a7336-27ed4ad03femr63641485ad.61.1758868429354;
        Thu, 25 Sep 2025 23:33:49 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69bc273sm43196235ad.124.2025.09.25.23.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 23:33:48 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 10BC74206928; Fri, 26 Sep 2025 13:33:44 +0700 (WIB)
Date: Fri, 26 Sep 2025 13:33:44 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, corbet@lwn.net,
	will@kernel.org, yangyicong@hisilicon.com, fj2767dz@fujitsu.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3] docs: perf: Fujitsu: Fix htmldocs build warnings and
 errors
Message-ID: <aNYzyJuuHHNvXM-9@archie.me>
References: <61aace07-890a-4b55-8e84-935ebc4a3be1@infradead.org>
 <20250926043748.3785-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NbO0R4EJyzKSY1Br"
Content-Disposition: inline
In-Reply-To: <20250926043748.3785-1-krishnagopi487@gmail.com>


--NbO0R4EJyzKSY1Br
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 10:06:12AM +0530, Gopi Krishna Menon wrote:
> diff --git a/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst b/Docu=
mentation/admin-guide/perf/fujitsu_uncore_pmu.rst
> index 46595b788d3a..2ec0249e37b6 100644
> --- a/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst
> +++ b/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst
> @@ -15,15 +15,19 @@ The driver provides a description of its available ev=
ents and configuration
>  options in sysfs, see /sys/bus/event_sources/devices/mac_iod<iod>_mac<ma=
c>_ch<ch>/
>  and /sys/bus/event_sources/devices/pci_iod<iod>_pci<pci>/.
>  This driver exports:
> +
>  - formats, used by perf user space and other tools to configure events
>  - events, used by perf user space and other tools to create events
> -  symbolically, e.g.:
> +  symbolically, e.g.::
> +
>      perf stat -a -e mac_iod0_mac0_ch0/event=3D0x21/ ls
>      perf stat -a -e pci_iod0_pci0/event=3D0x24/ ls
> +
>  - cpumask, used by perf user space and other tools to know on which CPUs
>    to open the events
> =20
>  This driver supports the following events for MAC:
> +
>  - cycles
>    This event counts MAC cycles at MAC frequency.
>  - read-count
> @@ -77,6 +81,7 @@ Examples for use with perf::
>    perf stat -e mac_iod0_mac0_ch0/ea-mac/ ls
> =20
>  And, this driver supports the following events for PCI:
> +
>  - pci-port0-cycles
>    This event counts PCI cycles at PCI frequency in port0.
>  - pci-port0-read-count

LGTM, thanks!

Fixes: bad11557eed2 ("perf: Fujitsu: Add the Uncore PMU driver")
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--NbO0R4EJyzKSY1Br
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaNYzwwAKCRD2uYlJVVFO
o6N7AQDryZCN3xwFGEM7qlOOqBj76vCAWmEtkmo3TmPrjKyyYwEA49RtoROV15Bl
tuPYAUCrgFJsY2X1cHM56Ht54/EymgE=
=Fjiw
-----END PGP SIGNATURE-----

--NbO0R4EJyzKSY1Br--
