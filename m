Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4978C2AD37
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Apr 2026 13:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777297140; cv=none; b=CC0HJKI6Hou6QgxepUxqyhyHOTp5xrZjPJmXcwr2d+32Tu4LGDeSyPdo8BZFC8ltB90OmJNodsIQBRsQ6TF/MwwRP3Vrfxz7MJUvQzAxJey3f5gZZauFxFIzIHQ41HOV5JOXpq4OlWAIoXCWMsxqXyOMx7yYJdX+6ToyZuu3Ygw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777297140; c=relaxed/simple;
	bh=t3uohXcbm2Yzyewy7czvhskog9lWn+WVMgOyDMQg/Do=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=Q2d2ILIBMQCcaFoix+ADs7k+O2/ITauEwuMjCGmJTFS3FOgwDQCy4qcTYq2+viJVIANtOjbxU3SXmbKa9LugeiO4wUTYj0Bw+Wt0fiUR8bgW7BqcFuQ0BTJknVyr56ULPqcMfan8RQKCookvLF2b30MH7UwS4euxNC3jtFn8lzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=JftkuMjH; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="JftkuMjH"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E43BA6F69B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Apr 2026 13:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.791
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6OZPXFamrHa for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2026 13:38:58 +0000 (UTC)
X-Greylist: delayed 2700 seconds by postgrey-1.37 at util1.osuosl.org; Mon, 27 Apr 2026 13:38:57 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B1206F699
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B1206F699
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=JftkuMjH
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=57.103.87.41; helo=outbound.qs.icloud.com; envelope-from=dumanmehmetsamet@icloud.com; receiver=<UNKNOWN> 
Received: from outbound.qs.icloud.com (qs-2001d-snip4-8.eps.apple.com [57.103.87.41])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1B1206F699
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Apr 2026 13:38:57 +0000 (UTC)
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-1 (Postfix) with ESMTPS id 76DEC1800152;
	Mon, 27 Apr 2026 12:43:59 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQxWB1sZUgNeCEoBTVIPDxRMFVIDWg5aHVwMQAxaDkYwUBtfAkIPHBNWFRMLU1ZWBVQZXQBSA18VTQtSAFIfchlaFFwYU0VRH1RYQQ4KWBIYXBRcUFgeRhJWDV0JGRpBXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcKR3xNAi8PLR8zAT0GQANdCzEUOXVedUYCRAFIAiwPXQJJfEBzBFQHXQVdVlACWlUSBEAIVlBeCF4fTBw=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1777293841; x=1779885841; bh=t3uohXcbm2Yzyewy7czvhskog9lWn+WVMgOyDMQg/Do=; h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:To:x-icloud-hme; b=JftkuMjHKnbEiFaUDj4DLR8Q2RgTgyKdlKQfOxKKdJavpf2X4Xf05nMIhMp5h7croWGRkOecuWlfly5OPHB1a07XDeIa/SlbhI4dhmHu9u8kUgOdoCL90Jtuc6h+sVElWIjCiJQ+NYmDvDdqeIYSWMysIeaIoC3TtTMn0PMhod6zsN6P1XijZIt6TbkWVnKWH/6UzIxnzi9GbWYp2k/XozR3feZM3yaJ7lhOP6FDUFoH8kqwe3o0BtJmoKVA3+jzwiew/CPAu1yCE8MnF2blxZGnAkbEIvn4lfmdpmwnMUazI6IP0c3Fo0yorutghTOF8gG7SfVrsbZC/BtCdWB3ag==
Received: from smtpclient.apple (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-1 (Postfix) with ESMTPSA id 3D88D1801116;
	Mon, 27 Apr 2026 12:43:58 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: "M.samet Duman" <dumanmehmetsamet@icloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] kbuild: add custom EXTRAVERSION for LFX mentorship
Date: Mon, 27 Apr 2026 15:43:46 +0300
Message-Id: <87E51B8F-C8E5-469A-AF3B-04801A8609E8@icloud.com>
References: <0106019dcebb86ea-79eaa26b-e4e5-4b14-b6ef-0d546b49ee9b-000000@ap-northeast-1.amazonses.com>
Cc: skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, wendster@plos.edu.ci
In-Reply-To: <0106019dcebb86ea-79eaa26b-e4e5-4b14-b6ef-0d546b49ee9b-000000@ap-northeast-1.amazonses.com>
To: Xuanjun Wen <wendster@plos.edu.ci>
X-Mailer: iPhone Mail (23D8133)
X-Proofpoint-GUID: 0uWPhl4nbQbW8j2EdWcFpfWCGkOkdSWk
X-Proofpoint-ORIG-GUID: 0uWPhl4nbQbW8j2EdWcFpfWCGkOkdSWk
X-Authority-Info-Out: v=2.4 cv=ZfcQ98VA c=1 sm=1 tr=0 ts=69ef5a0f
 cx=c_apl:c_pps:t_out a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=x7bEGLp0ZPQA:10 a=aRhIMoA-k8UA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7xmnyIY6nRCZLTRB5yEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfX0EDuJD9WnPQs
 YQ/UFH26TLI3S7QQG0s56JYsGTRu/UbqksQEJb8PbWUomk2GmxJbfTnDPD8m/rHd5HkiOvkwXRu
 1T2IROY0ZpIyeBxkdMrva4NL/gZOVkNaEhkK5W8NQDUJs35Jq7UA0n8XZAqs4jLdgylTSec6H9s
 zXtzJmeMs4p2SqjyauwzcPQ23Mi9iWRAKVLOHNka2opPQxtPBMk6brGGmQGXjxwZh1vQEWyQY9d
 R2LEyByz6H5nooPRnBntWuL8kHFz+zsn5QVwz7Ku9i3S3IpjSGHWBsPJLkqgvWTeUIZwgelKfjX
 RC7MouAIEexKGPA9BECNnNfgr0+HGoXNqzJl4+SeJfD5UgZMXtTRjaCTQWTjGo=

Okay.

Samet

> 2026. 4. 27. =EC=98=A4=ED=9B=84 2:41, Xuanjun Wen <wendster@plos.edu.ci> =EC=
=9E=91=EC=84=B1:
>=20
> =EF=BB=BFModify the EXTRAVERSION field to include the '-wendster-lfx'
> suffix as a demonstration of the LFX mentorship application task.
>=20
> Signed-off-by: Xuanjun Wen <wendster@plos.edu.ci>
> ---
> Makefile | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Makefile b/Makefile
> index e27c91ea56fc..e398b043e822 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -2,7 +2,7 @@
> VERSION =3D 7
> PATCHLEVEL =3D 1
> SUBLEVEL =3D 0
> -EXTRAVERSION =3D -rc1
> +EXTRAVERSION =3D -rc1-wendster-lfx
> NAME =3D Baby Opossum Posse
>=20
> # *DOCUMENTATION*
> --
> 2.54.0
>=20
>=20
