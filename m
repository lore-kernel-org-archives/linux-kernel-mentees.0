Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61ECD2BAE2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 10 Jun 2024 07:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718006016; cv=none; b=YJMK7P0I0iNdUIhdTq1L3FfOSi1n3ipLsQJU7WeF6UzN897IZhHqHyFRwOs+ovdzCnnP2qPYSvaz2PLYmZA029MqmOQq4HjsxWQ0RcaxUOm5Mgc3RGHH/rIoa5Av2/Y3huyr1DYa9HIyRXb91sAu1g24a6HICj2W9xmmo7HJp/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718006016; c=relaxed/simple;
	bh=yIFJhJlqUEmhDJ796KYs+GXtVDOefUkAE15z5R9Yo5Q=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=S6riFtGHfJsbud6LxDbyYUj3+uxx/gYd1tGAZAxP929p3m1PeVE1rzenUirNdCBid7Vs5fWmY7bhC7SpQDrvH9Z5VcvPGCfDl1pxW6Bhi7k4jV3oIJB+W5i96Ix9WjQQ23hG16W9LZ3zmIj0sCAaPhRx9mqL9xXRXtLmir4ZxBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=tIiZzymN; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="tIiZzymN"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71C0C40142
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 10 Jun 2024 07:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.238
X-Spam-Level: *
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OF5l9eIrOFPZ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jun 2024 07:53:32 +0000 (UTC)
X-Greylist: delayed 310 seconds by postgrey-1.37 at util1.osuosl.org; Mon, 10 Jun 2024 07:53:30 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE490400D6
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE490400D6
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=tIiZzymN
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.12; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=<UNKNOWN> 
Received: from mout.web.de (mout.web.de [212.227.17.12])
	by smtp2.osuosl.org (Postfix) with ESMTPS id AE490400D6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 10 Jun 2024 07:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718006009; x=1718610809; i=markus.elfring@web.de;
	bh=9dz+LpUwqzpAR1PcrgVqI/vrt3YGcppl4SfjD+L/sbQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tIiZzymNTwZObazyz2sa2ESgNYx2cOBadG2PTIM4cKKu54rmXxJ//FHSmd+B8TJf
	 CFNGuf0yPq9PNPZZPfVSxSTaReCLY7FlLuw8eXaMkkfErD6Kxoacg47lKci0RQJIx
	 r0CB94qsg8E3Fe3suGIrXTYF7K12IjaTVnxJYt4AXuyTQXZuZox4gTdwN29eZ+OxC
	 Uvh3g0JFBSsTAPzFzgPhEV5ApefzQveO6OnHGqUDyyPlAtJP1j3yUBny/6afvazZG
	 gtHT4KmBvfM0qbZlnTATPay5gg3MyAsoV7u51RMjFhyW7IWLt4BXgwQufmJPzcHPS
	 A3vSOuCBW9WPFtmGlg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N8Vop-1sTxjW20fJ-00xUce; Mon, 10
 Jun 2024 09:48:11 +0200
Message-ID: <0485dd2d-488a-40e9-b0f7-24236b9c00ab@web.de>
Date: Mon, 10 Jun 2024 09:48:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Evgeniy Dushistov <dushistov@mail.ru>, Shuah Khan <skhan@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240610034219.14711-1-luis.hernandez093@gmail.com>
Subject: Re: [PATCH] fs/ufs: Use LUT for dir entry types
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240610034219.14711-1-luis.hernandez093@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9EpwbBoA8M65Cv2LAnjdv99MJe5RQMoHiyf5Cqk6SK1M0h53dTL
 kcz45yHLWYfYKEm9ANT+hiM2WAgSse68YAJ2iHvAR/GFB8SOQRkGcmDk3D0xrhF5O+qQXeU
 7QfJ2MloBtVDrzUt+vhifRWk8PQbpdVyGaPXipgCloKBlPgozRB6R0IAdeLDrnrRSPIrsBl
 2u1ExIp/WpLDZD/wgADyw==
UI-OutboundReport: notjunk:1;M01:P0:v0x0YX05mOQ=;aKm0+JcioTvlEPSKoM+icuoG5Ea
 opR3WwubciQpNGDkCYIpAuiw+Gqe8T0QCZUamcNDaobCXUr3Klf+cLKe9WduxIqM+bvJgHvk5
 jbaduqbx83ew0c/vgoFkWAvW748RKBseR2Igb7AazV0SzVfyhewdk54NG3St0D3B6RdONs9Kh
 +h7yZfPR1o/Akt8d3d6oiTBSM2zurhcDBwtybhzv7aRwJscg9YB+iosWSEHvoP7g2Ii3zrRxk
 CumMVaKMO9fGt9DdpQcPWwgdcICcl4pdXWoSFZFQZdFZj3Kqbygpxtbp9aP97l60XFTYrcrmK
 FjImR4oqhdr21vfVnvvoV0MhoghW5km2R1h9tQmJxqs7+xNETF9b/gCVIupgY5QZPvYMlveSz
 rpgIwz3dfh7yBUETA7XW8jPwwN/9FJXdyU6n/tNjqM3W/9AvNpSLG992D+WmqfbBJi73iq34k
 r22PPiPVxVIPlU/R06eVs4WiHE/DYY5YBeioZPzJxBMv9FY3y7qoiBgIp/GJIQIf3/jdo0j64
 lS5H4gnVvBxUnFbiHhvSqmwNWasH98CkMlMNs7s6uHIkEztuWD1fMKy2n9DK2OC+5arpbhhC4
 01IdMo6FkpeORzYjSb3T6GEfyoZKlOX2sNOZbdoXHIwqPeZY1z/GWZB/7OP/yMikiXOKIYdG/
 00PH5ikYcpgCo73sT2yfVeAoqMUp52pe8PYN1yDUf+5rtwBVNBrFQaan0r5siUwLSZdtCPhI6
 nxNYPntDQHNGuQ0QrPyywR+sidexGz5y4Q9kR8C9ElRPTSim5UkAM4JJDtMCYWriFiNcQasI9
 Y8Im2eq9I0vvcQHM6dtEBeF8VybBUBYORcrKA0xQWRYDE=

> As per the original TODO, replacing the switch statement with a lookup
> table results in more concise mapping logic and improved performance.
=E2=80=A6

Can imperative wordings be relevant for another improved change descriptio=
n?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.10-rc2#n94


=E2=80=A6
> +++ b/fs/ufs/util.h
=E2=80=A6
>  static inline void
>  ufs_set_de_type(struct super_block *sb, struct ufs_dir_entry *de, int m=
ode)
=E2=80=A6
> +	if (mode_index < ARRAY_SIZE(ufs_mode_to_dt))
> +		de->d_u.d_44.d_type =3D ufs_mode_to_dt[mode_index];
> +	else
>  		de->d_u.d_44.d_type =3D DT_UNKNOWN;
=E2=80=A6

May a conditional operator expression be applied at this source code place=
?

Regards,
Markus
