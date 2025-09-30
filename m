Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0D61D8A10
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 09:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759224323; cv=none; b=Nw+YqFk+e49uhurzeCdtKAJmCWAjM3meswkaVry/CnfAJJlolpEJaxgRDUF40/4qvcphkZInu8nRmJ2U6FQNKiM9Fz4/c4sgDEvikz4CpDvCgZ+M67s5qxWmKuxlinxiZz9LzhDkYDw7v8As2bjLDM9xgWF75b645HDoNbduMhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759224323; c=relaxed/simple;
	bh=TcYO3IK/wC/TJqxN7ktz4ZcLQtXphU1qke10cmGSDbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/0fh0LNa4ApkpwANYCVYQ7/bHOEbf5HD4jdOZMEV7jgsL61WwuxU6mSX/v4JxGQSq/ksPtJVNz0hFd5bJfrI3qkEjXtRSl/jdVXX8gbc3rJVjEMXVrl+zndnJtUwQ8LxbuGAzfkQv2KkcIoeJ3tNDCdwac1fQ2CwS1/BsTCDZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmx.com header.i=quwenruo.btrfs@gmx.com header.b=YNzwSriO; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=quwenruo.btrfs@gmx.com header.b="YNzwSriO"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61C6F40C3D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 09:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -6.488
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xnws98VLUSBw for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Sep 2025 09:25:20 +0000 (UTC)
X-Greylist: delayed 317 seconds by postgrey-1.37 at util1.osuosl.org; Tue, 30 Sep 2025 09:25:19 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D677240C35
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D677240C35
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.com header.i=quwenruo.btrfs@gmx.com header.a=rsa-sha256 header.s=s31663417 header.b=YNzwSriO
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=quwenruo.btrfs@gmx.com; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D677240C35
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 09:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1759224317; x=1759829117; i=quwenruo.btrfs@gmx.com;
	bh=xQbt2TkBRs+6mtzvctUXs/lWGc6GKpkrQFnf1KAG1fQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YNzwSriOj8wFB7Mqdw5DMHASj+Rv7kQtWZ7ogj8Mgt8j8Tnm/lmp0FypwHSUQot4
	 mEeJ2N0smU73qQOKey7G8ftJNrZx9lQJk4sa7GGzn66UiUeGSyfiafCgnqb3eh/q6
	 Ds5IRZR7covtaytpC1R15rI+3VXZZxJwMyh3+HOvn+TN8dgraU7+Rh5NZIq6ZZm/Z
	 1UI+ed+hLfrlqnZ7rIHH6GP+k+jhM2ZBpiuTQIMwxv0fe/O1HTVs5gXbNByR3hjyQ
	 pidM6LjKwJMN6UdWHGFfT3P3MVp6EvjYrp9szSPRIHfKrbBjCqtAbm2GTgWCukZIN
	 Su89I4t3EnnYb5iAbw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.229] ([159.196.52.54]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1N1Obb-1uIPTQ3xjn-00vbLW; Tue, 30
 Sep 2025 11:20:00 +0200
Message-ID: <76fa5e79-c7e8-4637-bf51-c0e6f4e04f51@gmx.com>
Date: Tue, 30 Sep 2025 18:49:55 +0930
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] btrfs: Refactor allocation size calculation in kzalloc()
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>, clm@fb.com,
 dsterba@suse.com
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20250930091440.25078-1-mehdi.benhadjkhelifa@gmail.com>
Content-Language: en-US
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
Autocrypt: addr=quwenruo.btrfs@gmx.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNIlF1IFdlbnJ1byA8cXV3ZW5ydW8uYnRyZnNAZ214LmNvbT7CwJQEEwEIAD4CGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4AWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1YAUJEP5a
 sQAKCRDCPZHzoSX+qF+mB/9gXu9C3BV0omDZBDWevJHxpWpOwQ8DxZEbk9b9LcrQlWdhFhyn
 xi+l5lRziV9ZGyYXp7N35a9t7GQJndMCFUWYoEa+1NCuxDs6bslfrCaGEGG/+wd6oIPb85xo
 naxnQ+SQtYLUFbU77WkUPaaIU8hH2BAfn9ZSDX9lIxheQE8ZYGGmo4wYpnN7/hSXALD7+oun
 tZljjGNT1o+/B8WVZtw/YZuCuHgZeaFdhcV2jsz7+iGb+LsqzHuznrXqbyUQgQT9kn8ZYFNW
 7tf+LNxXuwedzRag4fxtR+5GVvJ41Oh/eygp8VqiMAtnFYaSlb9sjia1Mh+m+OBFeuXjgGlG
 VvQFzsBNBFnVga8BCACqU+th4Esy/c8BnvliFAjAfpzhI1wH76FD1MJPmAhA3DnX5JDORcga
 CbPEwhLj1xlwTgpeT+QfDmGJ5B5BlrrQFZVE1fChEjiJvyiSAO4yQPkrPVYTI7Xj34FnscPj
 /IrRUUka68MlHxPtFnAHr25VIuOS41lmYKYNwPNLRz9Ik6DmeTG3WJO2BQRNvXA0pXrJH1fN
 GSsRb+pKEKHKtL1803x71zQxCwLh+zLP1iXHVM5j8gX9zqupigQR/Cel2XPS44zWcDW8r7B0
 q1eW4Jrv0x19p4P923voqn+joIAostyNTUjCeSrUdKth9jcdlam9X2DziA/DHDFfS5eq4fEv
 ABEBAAHCwHwEGAEIACYCGwwWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1gQUJEP5a0gAK
 CRDCPZHzoSX+qHGpB/kB8A7M7KGL5qzat+jBRoLwB0Y3Zax0QWuANVdZM3eJDlKJKJ4HKzjo
 B2Pcn4JXL2apSan2uJftaMbNQbwotvabLXkE7cPpnppnBq7iovmBw++/d8zQjLQLWInQ5kNq
 Vmi36kmq8o5c0f97QVjMryHlmSlEZ2Wwc1kURAe4lsRG2dNeAd4CAqmTw0cMIrR6R/Dpt3ma
 +8oGXJOmwWuDFKNV4G2XLKcghqrtcRf2zAGNogg3KulCykHHripG3kPKsb7fYVcSQtlt5R6v
 HZStaZBzw4PcDiaAF3pPDBd+0fIKS6BlpeNRSFG94RYrt84Qw77JWDOAZsyNfEIEE0J6LSR/
In-Reply-To: <20250930091440.25078-1-mehdi.benhadjkhelifa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8vCNASodUDSflGQyBKXnxF1U1ZhBNgWPJ15/1nhk0jZ/M3LE7+U
 7Pdr2G9D3EIlBIRgEbGiH8uyMeZeM/9zi/8cW9OwV8px9NyTjNYaWCg7nnthiIcOIGqvYym
 FjECDUNdDGZQHoifL9Fq4vo4fwiYHGdgfWicDIslv+fc+H+xFhL3sqp4uCoId/5EtfWzpux
 TIqsUjj0Powkb5KzhfEwg==
UI-OutboundReport: notjunk:1;M01:P0:ixFS3dO+OG4=;YgaF6Y5UlJCI36W3GBeJOBSs16q
 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



=E5=9C=A8 2025/9/30 18:44, Mehdi Ben Hadj Khelifa =E5=86=99=E9=81=93:
> Wrap allocation size calculation in size_add() and size_mul() to avoid
> any potential overflow.
>=20
> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
> ---
>   fs/btrfs/volumes.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
> index c6e3efd6f602..3f1f19b28aac 100644
> --- a/fs/btrfs/volumes.c
> +++ b/fs/btrfs/volumes.c
> @@ -6076,12 +6076,11 @@ struct btrfs_io_context *alloc_btrfs_io_context(=
struct btrfs_fs_info *fs_info,
>   {
>   	struct btrfs_io_context *bioc;
>  =20
> -	bioc =3D kzalloc(
> -		 /* The size of btrfs_io_context */
> -		sizeof(struct btrfs_io_context) +
> -		/* Plus the variable array for the stripes */
> -		sizeof(struct btrfs_io_stripe) * (total_stripes),
> -		GFP_NOFS);
> +	/* The size of btrfs_io_context */
> +	/* Plus the variable array for the stripes */
> +	bioc =3D kzalloc(size_add(sizeof(struct btrfs_io_context),

Please use struct_size() instead.

And if you're using struct_size() there iwll be no need for any comments.
> +				size_mul(sizeof(struct btrfs_io_stripe),
> +						total_stripes)), GFP_NOFS);
>  =20
>   	if (!bioc)
>   		return NULL;

