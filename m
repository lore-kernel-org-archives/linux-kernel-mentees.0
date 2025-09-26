Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7589D24DFF4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 26 Sep 2025 06:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758868951; cv=none; b=jCNH6gSQG4GrNd1HA9GssP31hmLJiMugpZH4cmL4BjcPsTVevrP/ngRgLZVGTUj1RGH1BLsTx76O/h5I7tRdlEkfXgYI0nWcR9thpyy9gxsRBvKYK658K4A6ihOfXKIootANadIUe8r4QkF5QUqH9OJu8L2x86456F1vjApKBjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758868951; c=relaxed/simple;
	bh=vMfY8Fz/H42PyHOYIgHzRanTHxLPTJItPJpih9yRYLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DpP8wl4VDCIQ3fSqlDas2F06NsgNIXandNY/BV3tpTw/y6vLa2DAZ4dAU/5JaoXKdePfaxyXejAP/E44SjpzMbwm8nIfB79nRYDPN/BI2Abo+e+4tQXurNSHxus3V1W0j981Kud6HFFwuTcRgam496e7aAui66ueTRrGOEZko4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SgpvIJpw; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SgpvIJpw"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07BA984A30
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 26 Sep 2025 06:42:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J5ih7UXKdLiy for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Sep 2025 06:42:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=lorenzo@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7327B84A31
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7327B84A31
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SgpvIJpw
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7327B84A31
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 26 Sep 2025 06:42:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C57840841;
	Fri, 26 Sep 2025 06:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC084C4CEF4;
	Fri, 26 Sep 2025 06:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758868946;
	bh=vMfY8Fz/H42PyHOYIgHzRanTHxLPTJItPJpih9yRYLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SgpvIJpw1M41ci3km2PHNLvc+FShJAXQOsar6tMGm+6ImxYR/peYg4ZLIGkvqlysH
	 bKF80A80jR3OqyPB79unkrfM5D4EvziebbFxDFSgixBG3zKwsFvspoMQ1XB8pXzeM+
	 ptRH/UcA9Ntzo4ayDB1bgnw8J5b10QDHiBT59mnLYhAC1NYX92E/Cc35WDZ1jJ7XXL
	 2Wl3ETluKfsT979yVzARdqGm8S+1efNptWvH/zjJkZWIYMcrSFbZ7BfUTG6247kZYN
	 kJkGs3gWNVtkciXoYNsPcw3RNuaOlX70yRCEbRt0tcURNX9eej+fCVLeYmHL6a2d/7
	 zccVGzsG+KwOg==
Date: Fri, 26 Sep 2025 08:42:23 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Cc: Stanislav Fomichev <stfomichev@gmail.com>, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	donald.hunter@gmail.com, andrew+netdev@lunn.ch, ast@kernel.org,
	daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
	matttbe@kernel.org, chuck.lever@oracle.com, jdamato@fastly.com,
	skhawaja@google.com, dw@davidwei.uk, mkarsten@uwaterloo.ca,
	yoong.siang.song@intel.com, david.hunter.linux@gmail.com,
	skhan@linuxfoundation.org, horms@kernel.org, sdf@fomichev.me,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH RFC 0/4] Add XDP RX queue index metadata via kfuncs
Message-ID: <aNY1z1GId4_-F4Jg@lore-desk>
References: <20250923210026.3870-1-mehdi.benhadjkhelifa@gmail.com>
 <aNMG2X2GLDLBIjzB@mini-arch>
 <f103da72-0973-4a45-af81-ec1537422433@gmail.com>
 <aNRxRRSfjOzSPNks@mini-arch>
 <9773fb16-d497-4d67-804d-0c6e70def886@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ewNFLKVIOKk5qNhW"
Content-Disposition: inline
In-Reply-To: <9773fb16-d497-4d67-804d-0c6e70def886@gmail.com>


--ewNFLKVIOKk5qNhW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 9/24/25 11:31 PM, Stanislav Fomichev wrote:
> > On 09/24, Mehdi Ben Hadj Khelifa wrote:
> > > On 9/23/25 9:45 PM, Stanislav Fomichev wrote:
> > > > On 09/23, Mehdi Ben Hadj Khelifa wrote:
> > > > > ---
> > > > > Mehdi Ben Hadj Khelifa (4):
> > > > >     netlink: specs: Add XDP RX queue index to XDP metadata
> > > > >     net: xdp: Add xmo_rx_queue_index callback
> > > > >     uapi: netdev: Add XDP RX queue index metadata flags
> > > > >     net: veth: Implement RX queue index XDP hint
> > > > >=20
> > > > >    Documentation/netlink/specs/netdev.yaml |  5 +++++
> > > > >    drivers/net/veth.c                      | 12 ++++++++++++
> > > > >    include/net/xdp.h                       |  5 +++++
> > > > >    include/uapi/linux/netdev.h             |  3 +++
> > > > >    net/core/xdp.c                          | 15 +++++++++++++++
> > > > >    tools/include/uapi/linux/netdev.h       |  3 +++
> > > > >    6 files changed, 43 insertions(+)
> > > > >    ---
> > > > >    base-commit: 07e27ad16399afcd693be20211b0dfae63e0615f
> > > > >    this is the commit of tag: v6.17-rc7 on the mainline.
> > > > >    This patch series is intended to make a base for setting
> > > > >    queue_index in the xdp_rxq_info struct in bpf/cpumap.c to
> > > > >    the right index. Although that part I still didn't figure
> > > > >    out yet,I m searching for my guidance to do that as well
> > > > >    as for the correctness of the patches in this series.
> > >=20
> > > >=20
> > I don't really understand what queue_index means for the cpu map. It is
> > a kernel thread doing work, there is no queue. Maybe whoever added
> > the todo can clarify?

Hi Mehdi,

IIRC it is the queue index of the NIC that received the packet from the wir=
e.

Regards,
Lorenzo

>=20
> Hi Lorenzo,
> Can you help us clarify the todo added in cpu_map_bpf_prog_run_xdp() in t=
his
> commit:
> github.com/torvalds/linux/commit/9216477449f33cdbc9c9a99d49f500b7fbb81702=
 ?
>=20
> Regards,
> Mehdi

--ewNFLKVIOKk5qNhW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaNY1zwAKCRA6cBh0uS2t
rPt3AQD8rreqdFPyBTg//o5zPgBPhc9+hojkcDCQLrCclGujnAD+LWwu3wofnmi3
BWIJDd24jUcS+3AK/3vv0ucDBI3+Ngo=
=e5sl
-----END PGP SIGNATURE-----

--ewNFLKVIOKk5qNhW--
