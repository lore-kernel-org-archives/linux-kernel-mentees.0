Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9777DA8C
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 06:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747980601; cv=none; b=pYlbsAFuFFx113ezXBYGImWTLcub/DEohOMhkXeMmDyRHmOb410Jdd3c3y4NhTzf8P52+AwM9oJvh9me3tWfcA+UWeg3wR1Il7h8ZsiTJFsVpVDSSX6zmBujonDtXpNDy4pOPZJeHJ1jKJg7emyXqqN70wbcAukqFX1hPJ2NlO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747980601; c=relaxed/simple;
	bh=l7mVZhnA7UeGTT1CfpwQ38MXJvJ4doRi138QCVonhl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EwExLS3Cy2i7yk3kOczHe4fyTolI4fjA6Xk0TkYI0WNSvp1I1HJC+MVdXJwv0nE+s3/EHLVpd2GE4lf5R3RKEPx98CWndgXsvgh96MpgKJKgVmTL0NHxCDciQ9iDvG8WJQ/lmw7BPqkL9S0gL9aZ0ihAzm66lSSixw07YyuQqVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKYV2NHr; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKYV2NHr"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-231c86bffc1so89365305ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 23:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747980599; x=1748585399; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BLfWe8r/ZmGQSjoYBeqTxESsSaQlqdTgkljmUOXlCFw=;
        b=YKYV2NHr3WWcKbL6KM0E7QMx40Elnf983wVCuRuCEY6iEJvJL8i1Nto2JttpXRjjwp
         Em4nF8mMJSZ9VSVwEgu0/r+5DsGR2Veyg+f01oGS8SRW2zm/gluccv+K7B0aKg1U2KJE
         QgmX3DpgABC+PIVItrugt9niWoa4TN/D1guhDXyNhGcJGkDgz3ilPznsNZlF0aibGD3F
         +yDzVyOST3056JF54cDN8bedJ/z+OmUULLbT0hvXZcaL4hS4mcclbwJrWBI5HCpMPJYq
         bssgxb2Gog3LL+hshzh9Uapvwr0BZLvdPqvZ6byc8WqBWU5bbL7fQmuDoMmRa24eaIon
         1SKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747980599; x=1748585399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLfWe8r/ZmGQSjoYBeqTxESsSaQlqdTgkljmUOXlCFw=;
        b=HgXVlmIeG1W/ziNTQGbD2C8gnfv3VEeQo48csmVmIVkijkYwVFSiDkayN/1T2zgN8C
         n3v9yWlCYqGhRNb+tzHm8CEXFO865cqqtoc/XluBQx5dgbVZbIwdx2r4xelzsu59Ki4c
         E36Lh0kQZKJHHfw0AsDIAv4pPHan+6/wfR5dTF8t2UVkJDiGXGjQq03Jj2GF7Dxv70df
         nug2i6IP4e3G+Tq9GelaDPRrrPYrl6x1YKw+H8EmIuT7+9P3xXfQtJNF9gArKv/Yk+gz
         JHAVfaqDla8F2BLAcCC4EA7pEnCojZnANfD8O71e5NNSknLpsgjFSCDbFe8ybvyqIwog
         hoZA==
X-Forwarded-Encrypted: i=1; AJvYcCVf0QBlhO0vZzNibTPlH2uJb8fMukO0DxJ6Ae+MH2sKLlEz5J7sFIM0UP4Q6Zq1eGGvON+PK3Qp/2Mt3FK0pKMfl5xj7A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwmtVkO9S/hVwORv4HV3Pv8WuZfzVbnWBeFCGjID1dHsDsppnXE
	h+rzOhqisyyuXU6xX37CSwiv1a3TXwEFmCUEuSWv2YkHbRV0t5IXlYog
X-Gm-Gg: ASbGncs8wAGSLVU5XzoBME8zxxcTuIurX76T3CZIqvPRFMYuxUdtmJdBwCoIIcxCLhe
	7V5p+mIPZS7M4ZKAIrkIhAnWlc/7S8agf5eHcMT+uJq562BVw5oXC6qDtr4v4xDo16+4vPvlovJ
	q1qIDFpk/L86b2aus1eZFfL0FMMkkJraFmHQpDqfieNBDlpblcI//PhHyu8fNDp+5ljZ0XcYbTt
	TA9LEtu0XYbYn4HtY2XPrS3X0QVODU2Qx2HEZt3E/sNNVI3N9AAfKFXuEcw/oEv5FtaMSKVsg4d
	L+spNz1oLGkwYTkrurIi+u00PYnTuD/U3zkx1RUvQ70Uj/D+1bc=
X-Google-Smtp-Source: AGHT+IHwPwZKNBQOk7/x+z4DLM8bexBIdQhHmlpxJeY0yh3X8U/K+6tMe60rYS3xWYSakT8L9M18eg==
X-Received: by 2002:a17:903:228d:b0:224:191d:8a79 with SMTP id d9443c01a7336-231de36c2b8mr339006365ad.27.1747980598644;
        Thu, 22 May 2025 23:09:58 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4aca130sm116700565ad.18.2025.05.22.23.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 23:09:57 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id DF82442439C3; Fri, 23 May 2025 13:09:55 +0700 (WIB)
Date: Fri, 23 May 2025 13:09:55 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Hanne-Lotta =?utf-8?B?TcOkZW5ww6TDpA==?= <hannelotta@gmail.com>,
	mchehab@kernel.org, ribalda@chromium.org, hverkuil@xs4all.nl,
	sebastian.fricke@collabora.com, hljunggr@cisco.com,
	dave.jiang@intel.com, jgg@ziepe.ca, saeedm@nvidia.com,
	Jonathan.Cameron@huawei.com, corbet@lwn.net,
	ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
	W_Armin@gmx.de, mpearson-lenovo@squebb.ca,
	skhan@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2 3/4] docs: Improve grammar in Userspace API/fwctl
Message-ID: <aDARM0De6eTuAVL1@archie.me>
References: <20250522115255.137450-1-hannelotta@gmail.com>
 <20250522115255.137450-3-hannelotta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WVbEkApi40HYAEEw"
Content-Disposition: inline
In-Reply-To: <20250522115255.137450-3-hannelotta@gmail.com>


--WVbEkApi40HYAEEw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 02:52:54PM +0300, Hanne-Lotta M=C3=A4enp=C3=A4=C3=
=A4 wrote:
> diff --git a/Documentation/userspace-api/fwctl/fwctl.rst b/Documentation/=
userspace-api/fwctl/fwctl.rst
> index fdcfe418a83f..a74eab8d14c6 100644
> --- a/Documentation/userspace-api/fwctl/fwctl.rst
> +++ b/Documentation/userspace-api/fwctl/fwctl.rst
> @@ -54,7 +54,7 @@ operated by the block layer but also comes with a set o=
f RPCs to administer the
>  construction of drives within the HW RAID.
> =20
>  In the past when devices were more single function, individual subsystem=
s would
> -grow different approaches to solving some of these common problems. For =
instance
> +grow different approaches to solving some of these common problems. For =
instance,
>  monitoring device health, manipulating its FLASH, debugging the FW,
>  provisioning, all have various unique interfaces across the kernel.
> =20
> @@ -87,7 +87,7 @@ device today may broadly have several function-level sc=
opes:
>   3. Multiple VM functions tightly scoped within the VM
> =20
>  The device may create a logical parent/child relationship between these =
scopes.
> -For instance a child VM's FW may be within the scope of the hypervisor F=
W. It is
> +For instance, a child VM's FW may be within the scope of the hypervisor =
FW. It is
>  quite common in the VFIO world that the hypervisor environment has a com=
plex
>  provisioning/profiling/configuration responsibility for the function VFIO
>  assigns to the VM.
> @@ -105,19 +105,19 @@ some general scopes of action (see enum fwctl_rpc_s=
cope):
> =20
>   3. Write access to function & child debug information strictly compatib=
le with
>      the principles of kernel lockdown and kernel integrity protection. T=
riggers
> -    a kernel Taint.
> +    a kernel taint.
> =20
> - 4. Full debug device access. Triggers a kernel Taint, requires CAP_SYS_=
RAWIO.
> + 4. Full debug device access. Triggers a kernel taint, requires CAP_SYS_=
RAWIO.
> =20
>  User space will provide a scope label on each RPC and the kernel must en=
force the
>  above CAPs and taints based on that scope. A combination of kernel and F=
W can
>  enforce that RPCs are placed in the correct scope by user space.
> =20
> -Denied behavior
> ----------------
> +Disallowed behavior
> +-------------------
> =20
>  There are many things this interface must not allow user space to do (wi=
thout a
> -Taint or CAP), broadly derived from the principles of kernel lockdown. S=
ome
> +taint or CAP), broadly derived from the principles of kernel lockdown. S=
ome
>  examples:
> =20
>   1. DMA to/from arbitrary memory, hang the system, compromise FW integri=
ty with
> @@ -138,8 +138,8 @@ examples:
>  fwctl is not a replacement for device direct access subsystems like uacc=
e or
>  VFIO.
> =20
> -Operations exposed through fwctl's non-taining interfaces should be fully
> -sharable with other users of the device. For instance exposing a RPC thr=
ough
> +Operations exposed through fwctl's non-tainting interfaces should be ful=
ly
> +sharable with other users of the device. For instance, exposing a RPC th=
rough
>  fwctl should never prevent a kernel subsystem from also concurrently usi=
ng that
>  same RPC or hardware unit down the road. In such cases fwctl will be less
>  important than proper kernel subsystems that eventually emerge. Mistakes=
 in this
> @@ -225,12 +225,12 @@ subsystems.
> =20
>  Each device type must be mindful of Linux's philosophy for stable ABI. T=
he FW
>  RPC interface does not have to meet a strictly stable ABI, but it does n=
eed to
> -meet an expectation that userspace tools that are deployed and in signif=
icant
> +meet an expectation that user space tools that are deployed and in signi=
ficant
>  use don't needlessly break. FW upgrade and kernel upgrade should keep wi=
dely
>  deployed tooling working.
> =20
>  Development and debugging focused RPCs under more permissive scopes can =
have
> -less stabilitiy if the tools using them are only run under exceptional
> +less stability if the tools using them are only run under exceptional
>  circumstances and not for every day use of the device. Debugging tools m=
ay even
>  require exact version matching as they may require something similar to =
DWARF
>  debug information from the FW binary.
> @@ -261,7 +261,7 @@ Some examples:
>   - HW RAID controllers. This includes RPCs to do things like compose dri=
ves into
>     a RAID volume, configure RAID parameters, monitor the HW and more.
> =20
> - - Baseboard managers. RPCs for configuring settings in the device and m=
ore
> + - Baseboard managers. RPCs for configuring settings in the device and m=
ore.
> =20
>   - NVMe vendor command capsules. nvme-cli provides access to some monito=
ring
>     functions that different products have defined, but more exist.
> @@ -269,15 +269,15 @@ Some examples:
>   - CXL also has a NVMe-like vendor command system.
> =20
>   - DRM allows user space drivers to send commands to the device via kern=
el
> -   mediation
> +   mediation.
> =20
>   - RDMA allows user space drivers to directly push commands to the device
> -   without kernel involvement
> +   without kernel involvement.
> =20
>   - Various =E2=80=9Craw=E2=80=9D APIs, raw HID (SDL2), raw USB, NVMe Gen=
eric Interface, etc.
> =20
>  The first 4 are examples of areas that fwctl intends to cover. The latte=
r three
> -are examples of denied behavior as they fully overlap with the primary p=
urpose
> +are examples of disallowed behavior as they fully overlap with the prima=
ry purpose
>  of a kernel subsystem.
> =20
>  Some key lessons learned from these past efforts are the importance of h=
aving a

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--WVbEkApi40HYAEEw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaDARMwAKCRD2uYlJVVFO
o/I+AQCdeNPV/DNKktOuarD+Q/RnQgG7OQyKLqB3pl41foJoQwD/ajuK15t0YAp5
zo141GejI3iaTlLsbImfpoDWWw5MDA8=
=/VPk
-----END PGP SIGNATURE-----

--WVbEkApi40HYAEEw--
